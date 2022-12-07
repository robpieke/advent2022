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
    for (dir in space) {
        if (space[dir] <= 100000)
            total += space[dir]
    }
    print total
}