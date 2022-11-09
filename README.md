# UnethicalLaborPracticesChecker

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/leeway64/UnethicalLaborPracticesChecker)

UnethicalLaborPracticesChecker is a tool that checks if a given company takes advantage of forced
labor from East Turkistan, based on [research](https://www.aspi.org.au/report/uyghurs-sale)
conducted primarily by the [Australian Strategic Policy Institute](https://www.aspi.org.au/).


## Installation

```bash
git clone https://github.com/leeway64/UnethicalLaborPracticesChecker.git
```

## Usage
All user input is entered into [input.txt](include/input.txt). Let's assume that your input.txt file looks like this:

```text
# User input file. Entries should be separated by a newline.
Apple
Microsoft
Samsung
Facebook
Amazon
Google
```

Then, run the following command:

```bash
run/UnethicalLaborPracticesChecker.sh | jq '.'
```

The previous command will print out a JSON containing whether or not each company in the input

```json

```

## Unit Tests

To run unit tests, run the following commands:

```
julia
```


## Third-Party Tools

- [msgpack](https://pypi.org/project/msgpack/) (Apache Software License (Apache 2.0)): Python
library for writing and reading [MessagePack](https://msgpack.org/).
- [jq](https://stedolan.github.io/jq/) (MIT License): Command-line JSON processor.
- []() ():
