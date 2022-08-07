#!/bin/sh

ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error"

# case: 1
# description: 正常動作の場合
echo "3" > ${ans}
./euclidean.sh 3 6 > ${result}
diff ${ans} ${result} || echo "error in case1-1" >> ${err}

echo "3" > ${ans}
./euclidean.sh 6 3 > ${result}
diff ${ans} ${result} || echo "error in case1-2" >> ${err}

echo "3" > ${ans}
./euclidean.sh 3 3 > ${result}
diff ${ans} ${result} || echo "error in case1-3" >> ${err}

echo "1" > ${ans}
./euclidean.sh 9223372036854775807 1 > ${result}
diff ${ans} ${result} || echo "error in case1-4" >> ${err}

echo "1" > ${ans}
./euclidean.sh 1 9223372036854775807 > ${result}
diff ${ans} ${result} || echo "error in case1-5" >> ${err}

echo "1" > ${ans}
./euclidean.sh 1 1 > ${result}
diff ${ans} ${result} || echo "error in case1-6" >> ${err}

echo "9223372036854775807" > ${ans}
./euclidean.sh 9223372036854775807 9223372036854775807 > ${result}
diff ${ans} ${result} || echo "error in case1-7" >> ${err}

# case: 2
# description: 引数が2より少ない場合
echo "input 2 argments" > ${ans}
./euclidean.sh 3 > ${result}
diff ${ans} ${result} || echo "error in case2" >> ${err}

# case: 3
# description: 引数が2より多い場合
echo "input 2 argments" > ${ans}
./euclidean.sh 3 6 9 > ${result}
diff ${ans} ${result} || echo "error in case3" >> ${err}

# case: 4
# description: 引数に0が含まれている場合
echo "input natural number" > ${ans}
./euclidean.sh 3 0 > ${result}
diff ${ans} ${result} || echo "error in case4-1" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 0 3 > ${result}
diff ${ans} ${result} || echo "error in case4-2" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 0 0 > ${result}
diff ${ans} ${result} || echo "error in case4-3" >> ${err}

# case: 5
# description: 引数に負数が含まれている場合
echo "input natural number" > ${ans}
./euclidean.sh 3 -6 > ${result}
diff ${ans} ${result} || echo "error in case5-1" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh -3 6 > ${result}
diff ${ans} ${result} || echo "error in case5-2" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh -3 -6 > ${result}
diff ${ans} ${result} || echo "error in case5-3" >> ${err}

# case: 6
# description: 引数に小数が含まれている場合
echo "input natural number" > ${ans}
./euclidean.sh 3 0.6 > ${result}
diff ${ans} ${result} || echo "error in case6-1" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 0.3 6 > ${result}
diff ${ans} ${result} || echo "error in case6-2" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 0.3 0.6 > ${result}
diff ${ans} ${result} || echo "error in case6-3" >> ${err}

# case: 7
# description: 引数にbashで扱えない2**63以上の数が含まれている場合
echo "input natural number" > ${ans}
./euclidean.sh 2 9223372036854775808 > ${result}
diff ${ans} ${result} || echo "error in case7-1" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 9223372036854775808 2 > ${result}
diff ${ans} ${result} || echo "error in case7-2" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 9223372036854775808 9223372036854775810 > ${result}
diff ${ans} ${result} || echo "error in case7-3" >> ${err}

# case: 8
# description: 引数に文字が含まれている場合
echo "input natural number" > ${ans}
./euclidean.sh 3 a > ${result}
diff ${ans} ${result} || echo "error in case8-1" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh a 6 > ${result}
diff ${ans} ${result} || echo "error in case8-2" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh a b > ${result}
diff ${ans} ${result} || echo "error in case8-3" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 3 あ > ${result}
diff ${ans} ${result} || echo "error in case8-3" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh あ 6 > ${result}
diff ${ans} ${result} || echo "error in case8-5" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh あ い > ${result}
diff ${ans} ${result} || echo "error in case8-6" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 3 + > ${result}
diff ${ans} ${result} || echo "error in case8-7" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh + 6 > ${result}
diff ${ans} ${result} || echo "error in case8-8" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh + - > ${result}
diff ${ans} ${result} || echo "error in case8-9" >> ${err}

# case: 9
# description: 引数に16進数が含まれている場合
echo "input natural number" > ${ans}
./euclidean.sh 10 16#AA > ${result}
diff ${ans} ${result} || echo "error in case9-1" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 16#AA 10 > ${result}
diff ${ans} ${result} || echo "error in case9-2" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 16#AA 16#AA > ${result}
diff ${ans} ${result} || echo "error in case9-3" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 10 0xAA > ${result}
diff ${ans} ${result} || echo "error in case9-4" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 0xAA 10 > ${result}
diff ${ans} ${result} || echo "error in case9-5" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 0xAA 0xAA > ${result}
diff ${ans} ${result} || echo "error in case9-6" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 10 0XAA > ${result}
diff ${ans} ${result} || echo "error in case9-7" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 0XAA 10 > ${result}
diff ${ans} ${result} || echo "error in case9-8" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 0XAA 0XAA > ${result}
diff ${ans} ${result} || echo "error in case9-9" >> ${err}

# case: 10
# description: 引数に8進数が含まれている場合
echo "input natural number" > ${ans}
./euclidean.sh 10 8#252 > ${result}
diff ${ans} ${result} || echo "error in case10-1" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 8#252 10 > ${result}
diff ${ans} ${result} || echo "error in case10-2" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 8#252 8#252 > ${result}
diff ${ans} ${result} || echo "error in case10-3" >> ${err}

# case: 11
# description: 引数に2進数が含まれている場合
echo "input natural number" > ${ans}
./euclidean.sh 10 2#10101010 > ${result}
diff ${ans} ${result} || echo "error in case11-1" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 2#10101010 10 > ${result}
diff ${ans} ${result} || echo "error in case11-2" >> ${err}

echo "input natural number" > ${ans}
./euclidean.sh 2#10101010 2#10101010 > ${result}
diff ${ans} ${result} || echo "error in case11-3" >> ${err}

if [ -f ${err} ]; then
  cat ${err}
  rm /tmp/$$-*
  exit 1
fi

echo "test succeded"