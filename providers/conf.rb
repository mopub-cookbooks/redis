action :create do
  template new_resource.filename do
	source new_resource.template_source || "redis.conf.erb"
	mode 0644
	owner "root"
	group "root"
	cookbook new_resource.cookbook || "redis_development"
	variables({
				:daemonize => new_resource.daemonize,
				:pidfile => new_resource.pidfile,
				:port => new_resource.port,
				:bind => new_resource.bind,
				:unixsocket => new_resource.unixsocket,
				:unixsocketperm => new_resource.unixsocketperm,
				:timeout => new_resource.timeout,
				:loglevel => new_resource.loglevel,
				:logfile => new_resource.logfile,
				:syslog_enabled => new_resource.syslog_enabled,
				:syslog_ident => new_resource.syslog_ident,
				:syslog_facility => new_resource.syslog_facility,
				:databases => new_resource.databases,
				:save => new_resource.save,
				:stop_writes_on_bgsave_error => new_resource.stop_writes_on_bgsave_error,
				:rdbcompression => new_resource.rdbcompression,
				:rdbchecksum => new_resource.rdbchecksum,
				:dbfilename => new_resource.dbfilename,
				:slaveof => new_resource.slaveof,
				:masterauth => new_resource.masterauth,
				:slave_server_stale_data => new_resource.slave_server_stale_data,
				:slave_read_only => new_resource.slave_read_only,
				:repl => new_resource.repl,
				:slave_priority => new_resource.slave_priority,
				:requirepass => new_resource.requirepass,
				:rename_command => new_resource.rename_command,
				:maxclients => new_resource.maxclients,
				:maxmemory => new_resource.maxmemory,
				:maxmemory_policy => new_resource.maxmemory_policy,
				:maxmemory_samples => new_resource.maxmemory_samples,
				:appendonly => new_resource.appendonly,
				:appendfilename => new_resource.appendfilename,
				:no_appendfsync_on_rewrite => new_resource.no_appendfsync_on_rewrite,
				:aof => new_resource.autoaof,
				:appendfsync => new_resource.appendfsync,
				:luatimelimit => new_resource.luatimelimit,
				:dir => new_resource.dir,
				:slowlog => new_resource.slowlog,
				:hash_max_ziplist => new_resource.hash_max_ziplist,
				:list_max_ziplist => new_resource.list_max_ziplist,
				:set_max_intset => new_resource.set_max_intset,
				:zset_max_ziplist => new_resource.zset_max_ziplist,
				:activerehashing => new_resource.activerehashing,
				:client_output_buffer_limit => new_resource.client_output_buffer_limit,
				:include => new_resource.include,
				:name => new_resource.name
			  })
  end
  node.set["#{new_resource.name}"]=new_resource.to_hash
  new_resource.updated_by_last_action(true)
end
