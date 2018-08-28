1.进入redis-4.0.6源码目录make clean；make -j;make install;
2.创建/home/mesasoft/redis/reids-node目录；
3.将安装目录下的redis-node中文件拷贝到/home/mesasoft/redis/reids-node；
4.创建节点执行./run_redis.sh 16 		//默认16个节点，可依据需要更改
5.添加守护执行./redis_protect 16 		//默认16个节点，可依据需要更改
6.创建集群执行./build_cluster.sh 16 	//默认16个节点，可依据需要更改创建集群
7.验证是否创建成功，执行: redis-cli -h 127.0.0.1 -p 9001 cluster info //输出cluster_state:ok 表示创建成功