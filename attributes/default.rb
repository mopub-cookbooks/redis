#
# Locations
#

default[:redis][:conf_dir]          = "/etc/redis"
default[:redis][:log_dir]           = "/var/log/redis"
default[:redis][:data_dir]          = "/var/lib/redis"
default[:redis][:bin_location]      = "/usr/local/bin/redis-server"

default[:redis][:home_dir]          = "/usr/local/share/redis"
default[:redis][:pid_file]          = "/var/run/redis.pid"

default[:redis][:db_basename]       = "dump.rdb"

default[:redis][:user]              = 'redis'
default[:users][:redis][:uid]      = 335
default[:groups][:redis][:gid]      = 335

#
# Server
#

default[:redis][:server][:addr]     = "0.0.0.0"
default[:redis][:server][:port]     = "6379"

#
# Install
#

default[:redis][:installation_preference] = "upstream"
default[:redis][:version]           = "2.4.13"
default[:redis][:release_url]       = "http://redis.googlecode.com/files/redis-#{default[:redis][:version]}.tar.gz"

#
# Tunables
#

default[:redis][:server][:timeout]  = "300000"
default[:redis][:glueoutputbuf]     = "yes"

default[:redis][:saves]             = [["3600", "1"]]
default[:redis][:shareobjects]      = "no"
if (node[:redis][:shareobjects] == "yes")
  default[:redis][:shareobjectspoolsize] = 1024
end
