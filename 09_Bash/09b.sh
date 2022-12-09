#!/usr/bin/env bash

IFS=$'\n'

declare -A seen=( [_0_0]=1 )

declare -A DX=( [L]=-1 [R]=1 [U]=0 [D]=0 )
declare -A DY=( [L]=0 [R]=0 [U]=-1 [D]=1 )

X=(0 0 0 0 0 0 0 0 0 0)
Y=(0 0 0 0 0 0 0 0 0 0)

for line in `cat input.txt`; do
    dir=${line:0:1}
    len=${line:2}
    dx=${DX[$dir]}
    dy=${DY[$dir]}
    for ((i=0;i<$len;++i)); do
        let X[0]+=$dx
        let Y[0]+=$dy
        for cur in {1..9}; do
            let prev=$cur-1
            if [ $((${X[$prev]}-${X[$cur]})) -eq 2 ]; then
                if [ ${Y[$prev]} -gt ${Y[$cur]} ]; then
                    let Y[$cur]+=1
                elif [ ${Y[$prev]} -lt ${Y[$cur]} ]; then
                    let Y[$cur]-=1
                fi
                let X[$cur]+=1
            elif [ $((${X[$prev]}-${X[$cur]})) -eq -2 ]; then
                if [ ${Y[$prev]} -gt ${Y[$cur]} ]; then
                    let Y[$cur]+=1
                elif [ ${Y[$prev]} -lt ${Y[$cur]} ]; then
                    let Y[$cur]-=1
                fi
                let X[$cur]-=1
            elif [ $((${Y[$prev]}-${Y[$cur]})) -eq 2 ]; then
                if [ ${X[$prev]} -gt ${X[$cur]} ]; then
                    let X[$cur]+=1
                elif [ ${X[$prev]} -lt ${X[$cur]} ]; then
                    let X[$cur]-=1
                fi
                let Y[$cur]+=1
            elif [ $((${Y[$prev]}-${Y[$cur]})) -eq -2 ]; then
                if [ ${X[$prev]} -gt ${X[$cur]} ]; then
                    let X[$cur]+=1
                elif [ ${X[$prev]} -lt ${X[$cur]} ]; then
                    let X[$cur]-=1
                fi
                let Y[$cur]-=1
            else
                break
            fi
        done
        key=_${X[9]}_${Y[9]}
        seen["${key/-/_}"]=1
    done
done

echo ${#seen[@]}
