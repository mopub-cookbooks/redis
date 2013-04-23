actions :create, :start, :stop, :delete

attribute :template_source, :kind_of => String, :default => "redis.conf.erb"
attribute :cookbook, :kind_of => String, :default => "redis_development"

# Redis Configuration variables
attribute :filename, :kind_of => String, :default => "/etc/redis.conf"
attribute :daemonize, :kind_of => String, :default => "no"
attribute :pidfile, :kind_of => String, :default => "/var/run/redis.pid"
attribute :port, :kind_of => Fixnum, :default => 6379
attribute :bind, :kind_of => String, :default => String.new
attribute :unixsocket, :kind_of => String, :default => String.new
attribute :unixsocketperm, :kind_of => Fixnum, :default => 755
attribute :timeout, :kind_of => Fixnum, :default => 300000
attribute :loglevel, :kind_of => String, :default => "notice"
attribute :logfile, :kind_of => String, :default => "/var/log/redis/redis.log"
attribute :syslog_enabled, :kind_of => String, :default => String.new
attribute :syslog_ident, :kind_of => String, :default => String.new
attribute :syslog_facility, :kind_of => String, :default => String.new
attribute :databases, :kind_of => Fixnum, :default => 16
attribute :save, :kind_of => Array, :default => [ ["3600", "1"] ]
attribute :stop_writes_on_bgsave_error, :kind_of => String, :default => "yes"
attribute :rdbcompression, :kind_of => String, :default => "yes"
attribute :rdbchecksum, :kind_of => String, :default => "yes"
attribute :dbfilename, :kind_of => String, :default => "dump.rdb"
attribute :dir, :kind_of => String, :default => "/var/lib/redis"
attribute :slaveof, :kind_of => Hash, :default => Hash.new
attribute :masterauth, :kind_of => String, :default => String.new
attribute :slave_server_stale_data, :kind_of => String, :default => "yes"
attribute :slave_read_only, :kind_of => String, :default => "yes"
attribute :repl, :kind_of => Hash, :default => {"ping_slave_period" => 10, "timeout" => 60}
attribute :slave_priority, :kind_of => Fixnum, :default => 100
attribute :requirepass, :kind_of => String, :default => String.new
attribute :rename_command, :kind_of => Hash, :default => Hash.new
attribute :maxclients, :kind_of => Fixnum
attribute :maxmemory, :kind_of => Fixnum
attribute :maxmemory_policy, :kind_of => String, :default => String.new
attribute :maxmemory_samples, :kind_of => Fixnum
attribute :appendonly, :kind_of => String, :default => "no"
attribute :appendfilename, :kind_of => String, :default => "appendonly.aof"
attribute :appendfsync, :kind_of => String, :default => "everysec"
attribute :no_appendfsync_on_rewrite, :kind_of => String, :default => "no"
attribute :autoaof, :kind_of => Hash, :default => {"rewritepercentage" => 100, "rewriteminsize" => "64mb"}
attribute :luatimelimit, :kind_of => Fixnum, :default => 5000
attribute :slowlog, :kind_of => Hash, :default => {"slowerthan" => 10000, "max-len" => 128}
attribute :hash_max_ziplist, :kind_of => Hash, :default => {"entries" => 512, "value" => 64}
attribute :list_max_ziplist, :kind_of => Hash, :default => {"entries" => 512, "value" => 64}
attribute :set_max_intset, :kind_of => Fixnum, :default => 512
attribute :zset_max_ziplist, :kind_of => Hash, :default => {"entries" => 128, "value" => 64}
attribute :activerehashing, :kind_of => String, :default => "yes"
attribute :client_output_buffer_limit, :kind_of => Hash, :default => {"normal" => [0,0,0], "slave" => ["256mb","64mb",60], "pubsub" => ["32mb", "8mb", 60] }
attribute :include, :kind_of => Array, :default => Array.new

def initialize(*args)
  super
  @action = :nothing
end
