actions :tarball, :git

attribute :version, :kind_of => String, :default => "2.6.7"
attribute :tarball_location, :kind_of => String, :default => "http://redis.googlecode.com/files/"
attribute :git, :kind_of => Hash, :default => {"uri" => "https://github.com/antirez/redis.git", "reference" => "2.6.7" }

def initialize(*args)
  super
  @action = :nothing
  @run_context.include_recipe ["build-essential"]
end
