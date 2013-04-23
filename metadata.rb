name "redis_development"
maintainer       "Scott M. Likens"
maintainer_email "scott@likens.us"
license          "Apache 2.0"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "5.0.2"

description      "Redis: a fast, flexible datastore offering an extremely useful set of data structure primitives"

depends "build-essential"
depends "runit"

%w[ debian ubuntu ].each do |os|
  supports os
end
