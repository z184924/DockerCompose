#!/bin/bash

# 获取当前的年
year=$(date +"%Y")

# 获取当前的月
month=$(date +"%m")

# 获取当前的日
day=$(date +"%d")

# 获取当前的小时
hour=$(date +"%H")

# 获取当前的分钟
minute=$(date +"%M")

# 获取当前的秒
second=$(date +"%S")

mv access.log access_${year}-${month}-${day}_${hour}-${minute}-${second}.log
mv error.log error_${year}-${month}-${day}_${hour}-${minute}-${second}.log
bash ../reloadConf.sh

tar -czvf nginx_log_${year}-${month}-${day}_${hour}-${minute}-${second}.tar.gz access_${year}-${month}-${day}_${hour}-${minute}-${second}.log error_${year}-${month}-${day}_${hour}-${minute}-${second}.log
rm -rf access_${year}-${month}-${day}_${hour}-${minute}-${second}.log
rm -rf error_${year}-${month}-${day}_${hour}-${minute}-${second}.log