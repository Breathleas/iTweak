# README

## SQL

* 创建表

```sql
CREATE TABLE IF NOT EXISTS wx_bracelet_history(row_uuid TEXT PRIMARY KEY, uid TEXT, likecount INTEGER, step INTEGER, title TEXT, wxdatetime TEXT, createdatetime real);
```

* 查询数据

```sql
select uid, step, datetime(createdatetime, 'unixepoch', 'localtime'), strftime('%Y-%m-%d', wxdatetime) from wx_bracelet_history order by wxdatetime desc, createdatetime desc;
```

* 插入数据

```sql
insert into wx_bracelet_history (row_uuid, uid, likecount, step, title, wxdatetime, createdatetime) values('0x06', 'wxid_xxxx', 0, 831, '步数', '2020-10-22 00:00:00', 1603338720);
```