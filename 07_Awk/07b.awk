BEGIN {
    pwd = ""
}

{
    if ($1 == "$") {
        if ($2 == "cd") {
            if ($3 == "..")
                pwd = parent[pwd]
            else {
                oldpwd = pwd
                pwd = pwd $3 "/"
                parent[pwd] = oldpwd
            }
        }
    }
    else if ($1 != "dir") {
        pwditer = pwd
        while (pwditer != "") {
            space[pwditer] += $1
            pwditer = parent[pwditer]
        }        
    }   
}

END {
    needed = 30000000 - (70000000 - space["//"])
    min = 70000000
    for (dir in space) {
        if (space[dir] >= needed && space[dir] < min)
            min = space[dir]
    }
    print min
}