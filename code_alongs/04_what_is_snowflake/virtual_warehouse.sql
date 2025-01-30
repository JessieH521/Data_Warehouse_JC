show warehouses;


-- 创建一个 Snowflake 虚拟仓库（Warehouse），Snowflake 都是虚拟仓库 virtual_warehouse

-- with 后面配置参数：  X-Small-- T-shirt size
-- 如果仓库 300 秒（即 5 分钟）没有被使用，就会自动暂停（Suspend），以节省计算成本。
-- 当有新的查询请求时，Snowflake 会自动恢复（启动）这个仓库。仓库创建后，默认是暂停状态。
create warehouse demo_warehouse
with
warehouse_size = 'X-Small'
AUTO_SUSPEND = 300
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = 'Demo warehouse created through a worksheet';

show warehouses;

alter warehouse compute_wh
set auto_suspend = 60;
-- 调整自动暂停时间， 60 秒（1 分钟）内没有查询运行，它将自动暂停

alter warehouse demo_warehouse
set max_cluster_count = 3;
-- 设置最大集群数量，水平扩展-- scaling out  
-- 允许这个仓库最多扩展到 3 个计算集群（Cluster）。Enterpise edition 版本才可以设置， Standard 版本下不可以。

drop warehouse demo_warehouse;
show warehouses;













