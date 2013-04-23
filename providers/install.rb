action :tarball do
  remote_file Chef::Config[:file_cache_path] + "/redis-#{new_resource.version}.tar.gz" do
    source new_resource.tarball_location + "redis-#{new_resource.version}.tar.gz"
    backup false
    mode 0655
    action :create_if_missing
  end
  
  execute "unarchive redis version #{new_resource.version}" do
    cwd Chef::Config[:file_cache_path]
    command "tar zxf redis-#{new_resource.version}.tar.gz"
    not_if { ::File.directory?(Chef::Config[:file_cache_path] + "/redis-" + new_resource.version) }
  end

  execute "install redis version #{new_resource.version}" do
    cwd Chef::Config[:file_cache_path] + "/redis-" + new_resource.version
    command "make install"
    not_if { ::File.exists?("/usr/local/bin/redis-server") }
  end
  directory Chef::Config[:file_cache_path] + "/redis-" + new_resource.version do
    action :delete
    recursive true
  end
  node.set[new_resource.name]=new_resource.to_hash
  new_resource.updated_by_last_action(true)
end
action :git do
  git Chef::Config[:file_cache_path] + "/redis" do
    repository new_resource.git["uri"]
    reference new_resource.git["reference"]
    action :checkout
    not_if { ::File.exists?("/usr/local/bin/redis-server") }
  end
  
  execute "install redis" do
    cwd Chef::config[:file_cache_path] + "/redis"
    command "make install"
    not_if { ::File.exists("/usr/local/bin/redis-server") }
  end
  directory Chef::Config[:file_cache_path] + "/redis" do
    action :delete
    recursive true
  end
  node.set[new_resource.name]=new_resource.to_hash
  new_resource.updated_by_last_action(true)
end

