#/bin/bash
if [ $# -lt 1 ];then
	echo -e "usage:\n\trun_redis.sh redis_instance_num\nexample:\n\trun_redis.sh 6"
	exit 1
fi

killall redis-server
sleep 1
n=$1
echo $n
s=9001
dir=/home/mesasoft/redis/redis-node/
deldir=$dir"9*"
rm -rf $deldir 
echo 16384 >> /proc/sys/net/core/somaxconn
echo 'ulimit -n 16384' >> /etc/profile
for((i=0;i<$n;i++));
do
	((p=$s+$i))
	mkdir $p
	node_dir=${dir}${p}
	cd $node_dir
	echo "include "$dir"redis_comm.conf" >> redis.conf
	port="port "${p}
	echo $port >> redis.conf
	pidfile="pidfile "${node_dir}"/redis.pid"
	echo $pidfile >> redis.conf
	work_dir="dir "${node_dir}
	echo $work_dir >> redis.conf
	log="logfile "${node_dir}"/redis.log"
	echo $log >> redis.conf
	redis-server redis.conf 
	cd ..
done

