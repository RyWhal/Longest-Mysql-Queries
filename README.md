Longest-Mysql-Queries
=====================

Simple bash script that grabs the longest running MySQL queries on a server. The MySQL query filters out queries in a "Sleep" state, replication threads, binlog threads, and the this query itself. It leaves the top 5 longest running queries, sorted by the longest running.


USAGE
=====

The script requires Hostname, Port, and MySQL Username. With No values, Hostname defaults to "Localhost" and Port defaults to "3306". Username is a required field.

```
 % ./longQueries.sh --help
Usage: ./longQueries.sh -h HOSTNAME -p PORT -u USERNAME
```


example:
```
% ./longQueries.sh -h localhost -p 3306 -u admin
Enter password:
+------+------+-----------+------+---------+------+-----------+----------------------------------------------------------+
| ID   | USER | HOST      | DB   | COMMAND | TIME | STATE     | INFO                                                     |
+------+------+-----------+------+---------+------+-----------+----------------------------------------------------------+
| 1061 | ryan | localhost | NULL | Query   |    0 | executing | SELECT * FROM INFORMATION_SCHEMA.PROCESSLIST Limit 1     |
+------+------+-----------+------+---------+------+-----------+----------------------------------------------------------+
| 1063 | ryan | localhost | NULL | Query   |    0 | executing | SELECT username,id FROM USERS.TEST Limit 10              |
+------+------+-----------+------+---------+------+-----------+----------------------------------------------------------
| 1067 | ryan | localhost | NULL | Query   |    0 | executing | SELECT url,short,id FROM SHORTENED.URLS where ID=86345   |
+------+------+-----------+------+---------+------+-----------+----------------------------------------------------------+
```
