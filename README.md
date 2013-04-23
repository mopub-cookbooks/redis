Description
====

This cookbook provides the ability to install and configure redis without any implementation details beyond that.

Requirements
====

## Cookbooks

Opscode cookbooks:

* build-essential
* runit - *due to test-kitchen testing with runit*

Resources and Providers
=======================

This cookbook provides two resources and corresponding providers.

`install.rb`
-------------

Actions:

* `tarball` - installs redis using a tarball.
* `git` - installs redis using git to obtain the source code.

Attribute Parameters:
----------

#### redis_development::install
<table>
  <tr>
    <th>Attribute</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>version</tt></td>
    <td>String</td>
    <td>Version of Redis to install</td>
    <td><tt><code>2.6.7</code></tt></td>
  </tr>
  <tr>
    <td><tt>tarball_location</tt></td>
    <td>String</td>
    <td>Base URI of where to fetch the tarball</td>
    <td><tt>http://redis.googlecode.com/files/</tt></td>
  </tr>
  <tr>
    <td><tt>git</tt></td>
    <td>Hash</td>
    <td>Git repository to install redis from</td>
    <td><tt><code>{"uri" => "https://github.com/antirez/redis.git", "reference" => "2.6.7" }</code></tt></td>
  </tr>
</table>
#### redis_development::conf
<table>
  <tr>
    <th>Attribute</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>template_source</tt></td>
    <td>String</td>
    <td>If you want to specify an alternate erb template to be processed, you would specify it here</td>
    <td><tt><code>redis.conf.erb</code></tt></td>
  </tr>
  <tr>
    <td><tt>cookbook</tt></td>
    <td>String</td>
    <td>If you want to specify an alternate erb template in a different cookbook, you would specify it here</td>
    <td><tt><code>redis_development</code></tt></td>
  </tr>
  <tr>
    <td><tt>filename</tt></td>
    <td>String</td>
    <td>Specifies the redis configuration filename</td>
    <td><tt><code>/etc/redis.conf</code></tt></td>
  </tr>
  <tr>
    <td><tt>daemonize</tt></td>
    <td>String</td>
    <td>If you need to have redis run daemonized you would specify it here</td>
    <td><tt><code>no</code></tt></td>
  </tr>
  <tr>
    <td><tt>pidfile</tt></td>
    <td>String</td>
    <td>When running daemonized, Redis writes a pid file if you want to specify a filename other than <code>/var/run/redis.pid</code>specify it here</td>
    <td><tt><code>/var/run/redis.pid</code></tt></td>
  </tr>
  <tr>
    <td><tt>port</tt></td>
    <td>Fixnum</td>
    <td>Specifies what port redis should be configured to listen on</td>
    <td><tt><code>6379</code></tt></td>
  </tr>
  <tr>
    <td><tt>bind</tt></td>
    <td>String</td>
    <td>Specifies what <strong>IP</strong>address for redis to listen on</td>
    <td><tt><code>0.0.0.0</code></tt></td>
  </tr>
  <tr>
    <td><tt>unixsocket</tt></td>
    <td>String</td>
    <td>Specify the path for the unix socket that will be used to listen for incoming connections.  There is no default, so Redis will not listen on a unix socket when not specified.</td>
  </tr>
  <tr>
    <td><tt>unixsocketperm</tt></td>
    <td>Fixnum</td>
    <td>Specifies the permissions of the unix socket</td>
    <td><tt><code>755</code></tt></td>
  </tr>
  <tr>
    <td><tt>timeout</tt></td>
    <td>Fixnum</td>
    <td>Close the connection after a client is idle for N seconds</td>
    <td><tt><code>300000</code></tt></td>
  </tr>
  <tr>
    <td><tt>loglevel</tt></td>
    <td>String</td>
    <td>Specify the server verbosity level.</td>
    <td><tt><code>notice</code></tt></td>
  </tr>
  <tr>
    <td><tt>logfile</tt></td>
    <td>String</td>
    <td>Specify the log file name.</td>
    <td><tt><code>/var/log/redis/redis.log</code></tt></td>
  </tr>
  <tr>
    <td><tt>syslog_enabled</tt></td>
    <td>String</td>
    <td>To enable logging to the system logger set this to <strong>yes</strong></td>
  </tr>
  <tr>
    <td><tt>syslog_ident</tt></td>
    <td>String</td>
    <td>Specify the syslog identity</td>
  </tr>
  <tr>
    <td><tt>syslog_facility</tt></td>
    <td>String</td>
    <td>Specify the syslog facility</td>
  </tr>
  <tr>
    <td><tt>databases</tt></td>
    <td>Fixnum</td>
    <td>Set the number of databases</td>
    <td><tt><code>16</code></tt></td>
  </tr>
  <tr>
    <td><tt>save</tt></td>
    <td>Array</td>
    <td>Will save the DB if both the given number of seconds and the given number of write operations against the DB occurred.</td>
    <td><tt><code>[ ["3600", "1"] ]</code></tt></td>
  </tr>
  <tr>
    <td><tt>stop_writes_on_bgsave_error</tt></td>
    <td>String</td>
    <td>Stop accepting writes if bgsave fails, writes will resume once bgsave completes successfully</td>
    <td><tt><code>yes</code></tt></td>
  </tr>
  <tr>
    <td><tt>rdbcompression</tt></td>
    <td>String</td>
    <td>Compress string objects using LZF when dump .rdb databases</td>
    <td><tt><code>yes</code></tt></td>
  </tr>
  <tr>
    <td><tt>dbfilename</tt></td>
    <td>String</td>
    <td>the filename where to dump the DB</td>
    <td><tt><code>dump.rdb</code></tt></td>
  </tr>
  <tr>
    <td><tt>dir</tt></td>
    <td>String</td>
    <td>Specifies the working directory for redis-server</td>
    <td><tt><code>/var/lib/redis</code></tt></td>
  </tr>
  <tr>
    <td><tt>slaveof</tt></td>
    <td>Hash</td>
    <td>Use slaveof to make a Redis instance a copy of another Redis server.</td>
  </tr>
  <tr>
    <td><tt>masterauth</tt></td>
    <td>String</td>
    <td>Specifies the master is password protected (using the "requirepass" attribute)</td>
  </tr>
  <tr>
    <td><tt>slave_server_stale_data</tt></td>
    <td>String</td>
    <td>If the slave has lost the connection to the master, should we still serve data even if it's possibly stale?</td>
    <td><tt><code>yes</code></tt></td>
  </tr>
  <tr>
    <td><tt>slave_read_only</tt></td>
    <td>String</td>
    <td>Disable writes to a redis instance that is a slave</td>
    <td><tt><code>yes</code></tt></td>
  </tr>
  <tr>
    <td><tt>repl</tt></td>
    <td>Hash</td>
    <td>Exposes repl- based configuration parameters</td>
    <td><tt><code>{"ping_slave_period" => 10, "timeout" => 60}</code></tt></td>
  </tr>
  <tr>
    <td><tt>slave_priority</tt></td>
    <td>Fixnum</td>
    <td>The slave priority is an integer number published by Redis in the INFO output.  It is used by Redis Sentinel in order to select a slave to promote into a master if the master is no longer working correctly.</td>
    <td><tt><code>100</code></tt></td>
  </tr>
  <tr>
    <td><tt>requirepass</tt></td>
    <td>String</td>
    <td>Require clients to issue AUTH <code>PASSWORD</code>> before processing any other commands. This might be useful in environments in which you do not trust others with access to the host running redis-server.</td>
  </tr>
  <tr>
    <td><tt>rename_command</tt></td>
    <td>Hash</td>
    <td>It is possible to change the name of dangerous commands in a shared environment. For instance the CONFIG command may be renamed into something hard to guess so that it will still be available for internal-use tools but not available for general clients.</td>
  </tr>
  <tr>
    <td><tt>maxclients</tt></td>
    <td>Fixnum</td>
    <td>Set the max number of connected clients at the same time. By default this limit is set to 10000 clients, however if the Redis server is not  able to configure the process file limit to allow for the specified limit  the max number of allowed clients is set to the current file limit minus 32 (as Redis reserves a few file descriptors for internal uses).</td>
  </tr>
  <tr>
    <td><tt>maxmemory</tt></td>
    <td>Fixnum</td>
    <td>Don't use more memory than the specified amount of bytes.  When the memory limit is reached Redis will try to remove keys accordingly to the eviction policy selected (see maxmemmory-policy).</td>
  </tr>
  <tr>
    <td><tt>maxmemory_policy</tt></td>
    <td>String</td>
    <td>how Redis will select what to remove when maxmemory is reached.</td>
  </tr>
  <tr>
    <td><tt>maxmemory_samples</tt></td>
    <td>Fixnum</td>
    <td>LRU and minimal TTL algorithms are not precise algorithms but approximated algorithms (in order to save memory), so you can select as well the sample size to check.</td>
  </tr>
  <tr>
    <td><tt>appendonly</tt></td>
    <td>String</td>
    <td>The Append Only File is an alternative persistence mode that provides much better durability. For instance using the default data fsync policy (see later in the config file) Redis can lose just one second of writes in a dramatic event like a server power outage, or a single write if something wrong with the Redis process itself happens, but the operating system is still running correctly.</td>
    <td><tt><code>no</code></tt></td>
  </tr>
  <tr>
    <td><tt>appendfilename</tt></td>
    <td>String</td>
    <td>The name of the append only file</td>
    <td><tt><code>appendonly.aof</code></tt></td>
  </tr>
  <tr>
    <td><tt>appendfsync</tt></td>
    <td>String</td>
    <td>The fsync() call tells the Operating System to actually write data on disk instead to wait for more data in the output buffer.</td>
    <td><tt><code>eversec</code></tt></td>
  </tr>
  <tr>
    <td><tt>no_appendfsync_on_rewrite</tt></td>
    <td>String</td>
    <td>When the AOF fsync policy is set to always or everysec, and a background saving process (a background save or AOF log background rewriting) is performing a lot of I/O against the disk, in some Linux configurations  Redis may block too long on the fsync() call. Note that there is no fix for this currently, as even performing fsync in a different thread will block our synchronous write(2) call.</td>
    <td><tt><code>no</code></tt></td>
  </tr>
  <tr>
    <td><tt>autoaof</tt></td>
    <td>Hash</td>
    <td>Automatic rewrite of the append only file.  Redis is able to automatically rewrite the log file implicitly calling BGREWRITEAOF when the AOF log size grows by the specified percentage.</td>
    <td><tt><code>{"rewritepercentage" => 100, "rewriteminsize" => "64mb"}</code></tt></td>
  </tr>
  <tr>
    <td><tt>luatimelimit</tt></td>
    <td>Fixnum</td>
    <td>Max execution time of a Lua script in milliseconds.</td>
    <td><tt><code>5000</code></tt></td>
  </tr>
  <tr>
    <td><tt>slowlog</tt></td>
    <td>Hash</td>
    <td>The Redis Slow Log is a system to log queries that exceeded a specified execution time. The execution time does not include the I/O operations like talking with the client, sending the reply and so forth, but just the time needed to actually execute the command (this is the only stage of command execution where the thread is blocked and can not serve other requests in the meantime).</td>
    <td><tt><code>{"slowerthan" => 10000, "max-len" => 128}</code></tt></td>
  </tr>
  <tr>
    <td><tt>hash_max_ziplist</tt></td>
    <td>Hash</td>
    <td>Hashes are encoded using a memory efficient data structure when they have a small number of entries, and the biggest entry does not exceed a given threshold.</td>
    <td><tt><code>{"entries" => 512, "value" => 64}</code></tt></td>
  </tr>
  <tr>
    <td><tt>list_max_ziplist</tt></td>
    <td>Hash</td>
    <td>Similarly to hashes, small lists are also encoded in a special way in order to save a lot of space.</td>
    <td><tt><code>{"entries" => 512, "value" => 64}</code></tt></td>
  </tr>
  <tr>
    <td><tt>set_max_intset</tt></td>
    <td>Fixnum</td>
    <td>Sets have a special encoding in just one case: when a set is composed of just strings that happens to be integers in radix 10 in the range of 64 bit signed integers.</td>
    <td><tt><code>512</code></tt></td>
  </tr>
  <tr>
    <td><tt>zset_max_ziplist</td>
    <td>Hash</td>
    <td>Similarly to hashes and lists, sorted sets are also specially encoded in order to save a lot of space</td>
    <td><tt><code>{"entries" => 128, "value" => 64}</code></tt></td>
  </tr>
  <tr>
    <td><tt>activerehashing</tt></td>
    <td>String</td>
    <td>Active rehashing uses 1 millisecond every 100 milliseconds of CPU time in order to help rehashing the main Redis hash table (the one mapping top-level keys to values). The hash table implementation Redis uses (see dict.c) performs a lazy rehashing: the more operation you run into an hash table that is rehashing, the more rehashing "steps" are performed, so if the server is idle the rehashing is never complete and some more memory is used by the hash table.</td>
    <td><tt><code>yes</code></tt></td>
  </tr>
  <tr>
    <td><tt>client_output_buffer_limit</tt></td>
    <td>Hash</td>
    <td>The client output buffer limits can be used to force disconnection of clients that are not reading data from the server fast enough for some reason (a common reason is that a Pub/Sub client can't consume messages as fast as the publisher can produce them).</td>
    <td><tt><code>{"normal" => [0,0,0], "slave" => ["256mb","64mb",60], "pubsub" => ["32mb", "8mb", 60] }</code></tt></td>
  </tr>
  <tr>
    <td><tt>include</tt></td>
    <td>Array</td>
    <td>Include one or more other config files here. This is useful if you have a standard template that goes to all Redis server but also need to customize a few per-server settings. Include files can include other files, so use this wisely.</td>
  </tr>
</table>

Usage
-----
#### redis_development


Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github



License and Author
-------------------

Author::                Scott M. Likens (<scott@likens.us>)
Copyright::             2013, Scott M. Likens

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
