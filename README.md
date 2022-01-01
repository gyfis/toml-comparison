# Ruby TOML comparison

This repository contains the scripts used to compare some of the more popular/promising Ruby TOML implementations.


## How to run?

1. Clone the repo with submodules:

```bash
git clone --recurse-submodules
```

2. Fix `tomlrb` to work with decoder tester

```bash
sed -i '' -e 's#require "tomlrb#require_relative "tomlrb#g' 'implementations/tomlrb/lib/tomlrb.rb'
sed -i '' -e "s#require 'tomlrb#require_relative 'tomlrb#g" 'implementations/tomlrb/lib/tomlrb.rb'
sed -i '' -e 's#require "tomlrb/generated_parser"#require_relative "generated_parser"#g' 'implementations/tomlrb/lib/tomlrb/parser.rb'
```

3. Build the toml-test binary

```bash
cd toml-test
go build ./cmd/toml-test
```

4. Run the tests

```bash
./test_gems.sh
```

## Sample results

I run this on my Macbook Air (M1, 2020):


There are 306 test cases in `toml-test`. Here are the comparison results:

| Gem | Failed cases | Duration* |
|-|-|-|
| [`toby`](https://github.com/joe-p/toby) | 89 | 121.9s |
| [`toml`](https://github.com/jm/toml) | 89 | 58.97s |
| [`toml-rb`](https://github.com/emancu/toml-rb) | 80 | 134.45s |
| [`tomlrb`](https://github.com/fbernier/tomlrb) | **23** | **41.1s** |

*I averaged three test runs for each gem.

Based on these test runs, `tomlrb` comes on the top when comparing both v1.0.0 TOML spec compliance as well as speed performance.
