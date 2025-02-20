 use role useradmin;

select current_role();
select current_user();

create role ice_cream_reader comment = 'Able to read ice_cream database';
create role ice_cream_writer comment = 'Able to CRUD operations on ice_cream database';
create role ice_cream_analyst comment = 'Able to create views on ice_cream database';

-- 建和管理 role 用 useradmin; securityadmin 是管理授权的 grants，要换到securityadmin。
use role securityadmin;

-- 授权 ice_cream_reader 可用这个 warehouse， database
grant usage on warehouse dev_wh to role ice_cream_reader;
grant usage on database ice_cream_db to role ice_cream_reader;

-- 授权 ice_cream_reader 可用这个 database 下面所有 schema
grant usage on all schemas in database ice_cream_db to role ice_cream_reader;

-- 查看 role ice_cream_reader 都有哪些授权
show grants to role ice_cream_reader;

-- 授权他可以 select 在 schema public 下面的 访问当前已有的所有表（未来创建的不可以），所以和下面语句一起用
grant select on all tables in schema ice_cream_db.public to role ice_cream_reader;

-- 授权他可以 select 在 schema public 下面的 未来的所有表角色都会自动获得 SELECT 权限。（不能访问已有的）
grant select on future tables in schema ice_cream_db.public to role ice_cream_reader;

show grants to role ice_cream_reader;
show future grants in schema ice_cream_db.public;

-- 授予 ice_cream_writer 和 ice_cream_reader 一样的权限。 writer 继承了 reader
grant role ice_cream_reader to role ice_cream_writer;

show grants to role ice_cream_writer;
grant insert, update, delete on all tables in schema ice_cream_db.public to role ice_cream_writer;
grant insert, update, delete on future tables in schema ice_cream_db.public to role ice_cream_writer;

grant create table on schema ice_cream_db.public to role ice_cream_writer;

show future grants in schema ice_cream_db.public;
show grants to role ice_cream_writer;

-- role 还需要和 user 关连起来才能进入这个角色
use role ice_cream_writer;    -- 没有关联 user 会报错
grant role ice_cream_writer to user JESSIE;
use role ice_cream_writer;  















