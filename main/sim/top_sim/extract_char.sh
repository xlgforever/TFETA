#!/bin/bash

# 检查参数数量
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file> <string>"
    exit 1
fi

# 读取文件路径和要查找的字符串
file=$1
search_string=$2
result_type=imagenet_classes
# 检查文件是否存在
if [ ! -f "$file" ]; then
    echo "File not found: $file"
    exit 1
fi

# 初始化行号变量
line_number=0

# 读取文件并查找字符串
while IFS= read -r line
do
    ((line_number++))
    if [[ "$line" == *"$search_string"* ]]; then
        #echo "Found string at line: $line_number"
        # 计算需要获取的行号
        for (( i=2; i<=10; i+=2 )); do
            # 检查行号是否超出文件范围
            if [ $((line_number + i)) -le $line_number ]; then
                echo "Error: Line number $((line_number + i)) is out of range."
                exit 1
            fi
            # 获取特定行的特定字符
            target_line=$(sed -n "$((line_number + i))p" "$file")
            substr=${target_line:6:4}
            decimal_string=$(printf "%d" "0x$substr")
            sed -n "${decimal_string}p" "$result_type"
            #echo "Line $((line_number + i)), chars 7-10: $decimal_string"
        done
        break
    fi
done < "$file"
