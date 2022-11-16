# UnethicalLaborPracticesChecker


```text
     ______                 _                    __           
    |  ____|               | |                  / _|          
    | |__ _ __ ___  ___  __| | ___  _ __ ___   | |_ ___  _ __ 
    |  __| '__/ _ \/ _ \/ _` |/ _ \| '_ ` _ \  |  _/ _ \| '__|
    | |  | | |  __/  __/ (_| | (_) | | | | | | | || (_) | |   
    |_|  |_|  \___|\___|\__,_|\___/|_| |_| |_| |_| \___/|_|  
    
     ______          _     _______         _    _     _              
    |  ____|        | |   |__   __|       | |  (_)   | |             
    | |__   __ _ ___| |_     | |_   _ _ __| | ___ ___| |_ __ _ _ __  
    |  __| / _` / __| __|    | | | | | '__| |/ / / __| __/ _` | '_ \ 
    | |___| (_| \__ \ |_     | | |_| | |  |   <| \__ \ || (_| | | | |
    |______\__,_|___/\__|    |_|\__,_|_|  |_|\_\_|___/\__\__,_|_| |_|
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

Refer to [jq's downloads page](https://stedolan.github.io/jq/download/) for more information on how
to install jq for your particular Linux distro.


## Unit Tests

To run unit tests, run the following command:

```bash
julia test/test-suite.jl
```


## Printing the project header and viewing the companies list

To print the project header ("Freedom for East Turkistan") and also to print out a list of companies
who use forced labor from East Turkistan, run:

```bash
julia
```

Alternatively, to view the list of companies, you can also view
[unethical-labor-companies.txt](doc/unethical-labor-companies.txt).


## Third-Party Tools

- [msgpack](https://pypi.org/project/msgpack/) (Apache Software License (Apache 2.0)): Python
library for writing and reading [MessagePack](https://msgpack.org/).
- [jq](https://stedolan.github.io/jq/) (MIT License): Command-line JSON processor.
- [ASCII Generator](http://www.network-science.de/ascii/): ASCII generator used to create the project header.
