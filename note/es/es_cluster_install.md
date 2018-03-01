# 安装ES-2.4
## 安装文件
- elasticsearch-2.4.1  (跳板机/data/test下有一份)
https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.4.1/elasticsearch-2.4.1.tar.gz
-  master|client节点配置 [es_master_client.yml](/uploads/cf6f06e262d36cca243195b848a9112a/es_master_client.yml)
    - master启动脚本[es_master.sh](/uploads/119ebf449ff33048686d0a971b546485/es_master.sh)
- node节点配置[es_node.yml](/uploads/45713c124b5e4e550adb79350b1f8844/es_node.yml)
    - node启动脚本[es_node.sh](/uploads/3c27b9e78501ebeb3ea84c55226e623e/es_node.sh)

##  安装步骤
- 解压elasticsearch-2.4.1.tar.gz, /home/admin/es 作为elasticsearch程序根目录
- master|client节点
    - 替换es_master_client.yml到/home/admin/es/config/elasticsearch.yml
    - 拷贝es_master.sh到/home/admin/es/es.sh, chmod +x es.sh 
-  node节点
    - 替换es_node.yml到/home/admin/es/config/elasticsearch.yml
    - 拷贝es_node.sh到/home/admin/es/es.sh, chmod +x es.sh 
- 若admin用户启动，则修改/etc/security/limits.conf 添加admin - memlock unlimited

## 启停
- ./es.sh start|stop
- /data/es/log/weike.log 查看日志

## 负载均衡
- 目前3台master同时作为client节点，故用一个负载均衡ip代理3个master，master的http端口9200
