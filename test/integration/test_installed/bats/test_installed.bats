#!/usr/bin/env bats

@test "/usr/local/bin/redis-cli exists" {
[ -x "/usr/local/bin/redis-cli" ]
}

@test "/usr/local/bin/redis-server exists" {
[ -x "/usr/local/bin/redis-server" ]
}
