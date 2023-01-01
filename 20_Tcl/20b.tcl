set f [open "input.txt" r]
set lst [split [read $f] "\n"]
close $f

set lst_len [llength $lst]

for {set i 0} {$i < $lst_len} {incr i} {
    lset lst $i [expr [lindex $lst $i] * 811589153]
}

set next {}
set prev {}
lappend prev [expr {$lst_len - 1}]
for {set i 1} {$i < $lst_len} {incr i} {
    lappend next $i
    lappend prev [expr {$i - 1}]
}
lappend next 0

for {set mix 0} {$mix < 10} {incr mix} {
    for {set i 0} {$i < $lst_len} {incr i} {
        set v [lindex $lst $i]
        set v_mod [expr {$v % ($lst_len - 1)}]
        if {$v_mod == 0} {
            continue
        }
        lset next [lindex $prev $i] [lindex $next $i]
        lset prev [lindex $next $i] [lindex $prev $i]
        set ii $i
        for {set j 0} {$j < $v_mod} {incr j} {
            set ii [lindex $next $ii]
        }
        lset next $i [lindex $next $ii]
        lset prev [lindex $next $ii] $i
        lset next $ii $i
        lset prev $i $ii
    }
}

set head 0
while {1} {
    if {[lindex $lst $head] == 0} {
        break
    }
    set head [lindex $next $head]
}

set sum 0
for {set i 1} {$i <= 3000} {incr i} {
    set head [lindex $next $head]
    if {[expr {$i % 1000}] == 0} {
        set sum [expr {$sum + [lindex $lst $head]}]
    }
}

puts $sum
