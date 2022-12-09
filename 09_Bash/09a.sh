#!/usr/bin/env bash

IFS=$'\n'

declare -A seen=( [_0_0]=1 )

HX=0
HY=0
TX=0
TY=0

for line in `cat input.txt`; do
    dir=${line:0:1}
    len=${line:2}
    case $dir in
        L)
            let HX-=$len
            let dx=$TX-$HX
            if [ $dx -gt 1 ]; then
                let TY=$HY
                for ((i=1;i<$dx;++i)); do
                    let TX-=1
                    key=_${TX}_${TY}
                    seen["${key/-/_}"]=1
                done
            fi
        ;;
        R)
            let HX+=$len
            let dx=$HX-$TX
            if [ $dx -gt 1 ]; then
                let TY=$HY
                for i in $(seq 1 $(($dx-1))); do
                    let TX+=1
                    key=_${TX}_${TY}
                    seen["${key/-/_}"]=1
                done
            fi
        ;;
        U)
            let HY-=$len
            let dy=$TY-$HY
            if [ $dy -gt 1 ]; then
                let TX=$HX
                for i in $(seq 1 $(($dy-1))); do
                    let TY-=1
                    key=_${TX}_${TY}
                    seen["${key/-/_}"]=1
                done
            fi
        ;;
        D)
            let HY+=$len
            let dy=$HY-$TY
            if [ $dy -gt 1 ]; then
                let TX=$HX
                for i in $(seq 1 $(($dy-1))); do
                    let TY+=1
                    key=_${TX}_${TY}
                    seen["${key/-/_}"]=1
                done
            fi
        ;;
    esac
done

echo ${#seen[@]}
