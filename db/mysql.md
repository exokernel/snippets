# Mysql

## Useful Commands

* Check if schema exists

```sql
SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '$db'
```

* Check for user

```sql
SELECT USER FROM mysql.user WHERE USER = '$username';
```

* super_read_only

```sql
SET GLOBAL super_read_only = 1;
```

  read_only has a historical issue: users with the SUPER privilege can override the setting and could still run DML queries. Since Percona Server 5.6.21 and MySQL 5.7.8, however, you can use the super_read_only feature to extend the read_only  option and apply it to users with SUPER privileges.

  <https://www.percona.com/blog/2016/09/27/using-the-super_read_only-system-variable/>

## Concepts

### Locks

* FLUSH TABLES

  <https://dev.mysql.com/doc/refman/8.0/en/flush.html#flush-tables>

  Closes all open tables, forces all tables in use to be closed, and flushes the prepared statement cache.

  This operation requires the FLUSH_TABLES or RELOAD privilege.

* FLUSH TABLES WITH READ LOCK

  <https://dev.mysql.com/doc/refman/8.0/en/flush.html#flush-tables-with-read-lock>

  <https://www.percona.com/blog/2012/03/23/how-flush-tables-with-read-lock-works-with-innodb-tables/>

  Closes all open tables and locks all tables for all databases with a global read lock.

  This operation requires the FLUSH_TABLES or RELOAD privilege.

  This operation is a very convenient way to get backups if you have a file system such as Veritas or ZFS that can take snapshots in time. Use UNLOCK TABLES to release the lock.

### Tablespaces

What is a tablespace?

"A data file that can hold data for one or more InnoDB tables and associated indexes."

<https://stackoverflow.com/questions/37805316/what-is-a-tablespace-and-why-is-it-used>

### Replication

#### Replication Threads

<https://dev.mysql.com/doc/refman/8.0/en/replication-implementation-details.html>

* Binary log dump thread.

  The source creates a thread to send the binary log contents to a replica when the replica connects. This thread can be identified in the output of `SHOW PROCESSLIST` on the source as the Binlog Dump thread.

  The binary log dump thread acquires a lock on the source's binary log for reading each event that is to be sent to the replica. As soon as the event has been read, the lock is released, even before the event is sent to the replica.

* Replication I/O receiver thread.

  When a START REPLICA statement is issued on a replica server, the replica creates an I/O (receiver) thread, which connects to the source and asks it to send the updates recorded in its binary logs.

  The replication receiver thread reads the updates that the source's Binlog Dump thread sends (see previous item) and copies them to local files that comprise the replica's `relay log`.

  The state of this thread is shown as Slave_IO_running in the output of `SHOW SLAVE STATUS`.

* Replication SQL applier thread.

  The replica creates an SQL (applier) thread to read the relay log that is written by the replication receiver thread and execute the transactions contained in it.

### Isolation Level

  <https://dev.mysql.com/doc/refman/8.0/en/glossary.html#glos_isolation_level>

  One of the foundations of database processing. Isolation is the I in the acronym ACID; the isolation level is the setting that fine-tunes the balance between performance and reliability, consistency, and reproducibility of results when multiple transactions are making changes and performing queries at the same time.

  From highest amount of consistency and protection to the least, the isolation levels supported by InnoDB are: SERIALIZABLE, REPEATABLE READ, READ COMMITTED, and READ UNCOMMITTED.

  With InnoDB tables, many users can keep the default isolation level (REPEATABLE READ) for all operations. Expert users might choose the READ COMMITTED level as they push the boundaries of scalability with OLTP processing, or during data warehousing operations where minor inconsistencies do not affect the aggregate results of large amounts of data. The levels on the edges (SERIALIZABLE and READ UNCOMMITTED) change the processing behavior to such an extent that they are rarely used.


## Misc

### Transparent Huge Pages and MySQL

On occasions, transparent huge pages are behind bloated memory usage in dedicated database servers, making the overall memory usage unstable. In cases where you are experiencing memory leak-like issues, you can consider disabling THP and checking if the memory usage stabilizes. Note that even if these changes can be made dynamically, they are not taken into account for processes that were already running with THP enabled. If your database service was started while THP were enabled, you will have to manually restart it after dynamically disabling THP. We will also show how to make these changes to be persistent across server-wide reboots.

<https://percona.service-now.com/percona?id=kb_article&sys_id=d4e75f491b24f010ff8499b4bd4bcb6a>

<https://www.percona.com/blog/2019/03/06/settling-the-myth-of-transparent-hugepages-for-databases/>

<https://archive.fosdem.org/2019/schedule/event/hugepages_databases/>

# Percona Tools

```bash
pt-mysql-summary | grep -A5 -i "memory management"
```
