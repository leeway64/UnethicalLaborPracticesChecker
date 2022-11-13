# UnethicalLaborPracticesChecker


```text

```


[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/leeway64/UnethicalLaborPracticesChecker)

UnethicalLaborPracticesChecker is a tool that checks if a given company takes advantage of forced
labor from East Turkistan, based on [research](https://www.aspi.org.au/report/uyghurs-sale)
conducted primarily by the [Australian Strategic Policy Institute](https://www.aspi.org.au/).


## Installation

```bash
git clone https://github.com/leeway64/UnethicalLaborPracticesChecker.git
bash build/create-venv.sh
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

Serialize the input into MessagePack format:
```bash
python lib/serialize_input.py
```

Then, run UnethicalLaborPracticesChecker:
```bash
julia src/UnethicalLaborPracticesChecker.jl | jq '.'
```

The UnethicalLaborPracticesChecker will print out a JSON containing whether each company in the
input uses forced labor from East Turkstan.

```json

```

## Unit Tests

To run unit tests, run the following command:
```
julia test/test-suite.jl
```


## Third-Party Tools

- [msgpack](https://pypi.org/project/msgpack/) (Apache Software License (Apache 2.0)): Python
library for writing and reading [MessagePack](https://msgpack.org/).
- [jq](https://stedolan.github.io/jq/) (MIT License): Command-line JSON processor.
- []() ():
