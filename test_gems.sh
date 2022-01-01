#!/bin/sh

echo "======\n"
echo "Testing 'toby'..."
time ./toml-test/toml-test "testers/decoder-toby.rb"

echo "======\n"
echo "Testing 'toml'..."
time ./toml-test/toml-test "testers/decoder-toml.rb"

echo "======\n"
echo "Testing 'toml-rb'..."
time ./toml-test/toml-test "testers/decoder-toml-rb.rb"

echo "======\n"
echo "Testing 'tomlrb'..."
time ./toml-test/toml-test "testers/decoder-tomlrb.rb"
