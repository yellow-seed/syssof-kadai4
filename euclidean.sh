#!/bin/sh

# 10進数の自然数のみ引数として受け付ける
# 入力可能な引数の最大値は9223372036854775807(2**63 - 1)

MAX_BIGINT=9223372036854775807

if [ $# -ne 2 ]; then
  echo "input 2 argments"
  exit 1
fi

if [ $1 != "$MAX_BIGINT" ]; then # bigintの最大値は加算するとオーバーフローする
  expr "$1" + 1 > /dev/null 2>&1
  if [ $? -ge 2 ]; then
    echo "input natural number"
    exit 1
  fi
fi

if [ $2 != "$MAX_BIGINT" ]; then
  expr "$2" + 1 > /dev/null 2>&1
  if [ $? -ge 2 ]; then
    echo "input natural number"
    exit 1
  fi
fi

if [ $1 -lt 1 -o $2 -lt 1 ]; then
  echo "input natural number"
  exit 1
fi

tmp=0
a=$1
b=$2

if [ $a -lt $b ]; then
  tmp=$a
  a=$b
  b=$tmp
fi

r=$(($a % $b))

while [ $r -ne 0 ];
do
  a=$b
  b=$r
  r=$(($a % $b))
done

echo "$b"