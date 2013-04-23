#!/usr/bin/env bats

@test "/usr/local/bin/redis-cli exists" {
[ -x "/usr/local/bin/redis-cli" ]
}

@test "/usr/local/bin/redis-server exists" {
[ -x "/usr/local/bin/redis-server" ]
}
@test "redis-cli info should work" {
/usr/local/bin/redis-cli info
}
@test "set the counter to 100" {
/usr/local/bin/redis-cli set counter 100
}
@test "incr counter" {
/usr/local/bin/redis-cli incr counter
}
@test "set mykey" {
/usr/local/bin/redis-cli set mykey 'foobar'
}
@test "get mykey" {
/usr/local/bin/redis-cli get mykey
}
