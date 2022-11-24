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
cd UnethicalLaborPracticesChecker
source build/create-venv.sh
```

Using source instead of bash activates the virtual environment in the current active shell. 


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
Huawei
Nintendo
ZTE
Xiaomi
Toshiba
Uniqlo
Japan Display Inc.
Oppo
Tsinghua Tongfang
Mitsubishi
Lenovo
LG
Tesla
```

Serialize the input into MessagePack format:

```bash
python3 lib/serialize_input.py
```

Then, run UnethicalLaborPracticesChecker:

```bash
julia --project=. src/UnethicalLaborPracticesChecker.jl | jq '.'
```

`jq '.'` pretty-prints the input JSON without changing its contents.

UnethicalLaborPracticesChecker will print out a JSON containing whether each company in the
input uses forced labor from East Turkstan.

```json
{
  "Apple": true,
  "Microsoft": true,
  "Samsung": true,
  "Facebook": false,
  "Amazon": true,
  "Google": true,
  "Huawei": true,
  "Nintendo": true,
  "ZTE": true,
  "Xiaomi": true,
  "Toshiba": true,
  "Uniqlo": true,
  "Japan Display Inc.": true,
  "Oppo": true,
  "Tsinghua Tongfang": true,
  "Mitsubishi": true,
  "Lenovo": true,
  "LG": true,
  "Tesla": false
}
```

Refer to [jq's downloads page](https://stedolan.github.io/jq/download/) for more information on how
to install jq for your particular Linux distro.


## Unit Tests

To run unit tests, run the following command:

```bash
julia --project=. test/test_suite.jl
```


## Printing the project header and viewing the companies list

To print the project header ("Freedom for East Turkistan") and also to print out a list of companies
who use forced labor from East Turkistan, run:

```bash
julia --project=. src/UnethicalLaborPracticesChecker.jl print-companies
```

Alternatively, to view the list of companies, you can also view
[unethical-labor-companies.txt](doc/unethical-labor-companies-list.txt).


## Further Reading

To support a free and independent East Turkistan, check out the following resources:

- [East Turkistan Government-in-Exile](https://east-turkistan.net/)
- [Uyghur Human Rights Project](https://uhrp.org/)


## Third-Party Tools

- [msgpack](https://pypi.org/project/msgpack/) (Apache Software License (Apache 2.0)): Python
library for writing and reading [MessagePack](https://msgpack.org/) messages.
- [jq](https://stedolan.github.io/jq/) (MIT License): Command-line JSON processor.
- [MsgPack](https://github.com/JuliaIO/MsgPack.jl) (MIT Expat License): Julia library for writing
and reading  [MessagePack](https://msgpack.org/) messages.
- [JSON](https://github.com/JuliaIO/JSON.jl) (MIT Expat License): Julia library for reading and
writing JSON.
- [DataStructures](https://github.com/JuliaCollections/DataStructures.jl) (MIT License):
Collection of data structures for Julia.
- [ASCII Generator](http://www.network-science.de/ascii/): ASCII generator used to create the
project header.
