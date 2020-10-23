# README

## SQL

* 创建表

```sql
CREATE TABLE IF NOT EXISTS wx_bracelet_history(row_uuid TEXT PRIMARY KEY, uid TEXT, likecount INTEGER, step INTEGER, title TEXT, wxdatetime TEXT, createdatetime real);
```

* 查询数据

```sql
select row_uuid, uid, step, datetime(createdatetime, 'unixepoch', 'localtime'), strftime('%Y-%m-%d', wxdatetime) from wx_bracelet_history order by wxdatetime desc, createdatetime desc limit 50;
```

* 插入数据

```sql
insert into wx_bracelet_history (row_uuid, uid, likecount, step, title, wxdatetime, createdatetime) values('0x0f', 'wxid_xxxxx', 0, 2206, '步数', '2020-10-22 00:00:00', strftime('%s','2020-10-22 23:26:00', 'utc'));
```