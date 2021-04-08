cd mysql
sh ./run.sh
echo mysql start
cd ../nginx
sh ./run.sh
echo nginx start
cd ../redis
sh ./run.sh
echo redis start
cd ../nacos
sh ./run.sh
echo nacos start
cd ../blade-env
sh ./run.sh
echo blade-env start
echo start finish