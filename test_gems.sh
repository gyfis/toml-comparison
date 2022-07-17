#!/bin/sh

echo "======\n"
echo "Testing 'toby'..."
time ./toml-test/toml-test "testers/decoder-toby.rb" 1>/dev/null 2>/dev/null

echo "======\n"
echo "Testing 'toml'..."
time ./toml-test/toml-test "testers/decoder-toml.rb" 1>/dev/null 2>/dev/null

echo "======\n"
echo "Testing 'toml-rb'..."
time ./toml-test/toml-test "testers/decoder-toml-rb.rb" 1>/dev/null 2>/dev/null

echo "======\n"
echo "Testing 'tomlrb'..."
time ./toml-test/toml-test "testers/decoder-tomlrb.rb" 1>/dev/null 2>/dev/null

echo "======\n"
echo "Testing 'perfect_toml'..."
time ./toml-test/toml-test "testers/decoder-perfect_toml.rb" 1>/dev/null 2>/dev/null
