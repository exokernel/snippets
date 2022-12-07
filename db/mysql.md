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

## Concepts

### Locks

* FLUSH TABLES WITH READ LOCK

  <https://dev.mysql.com/doc/refman/8.0/en/flush.html#flush-tables-with-read-lock>

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
