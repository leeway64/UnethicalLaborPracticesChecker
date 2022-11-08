# Serialize user input
import msgpack


with open("../include/input.txt", "r") as input_file:
    input = input_file.readlines()

# Remove leading and trailing whitespaces
input = [company.rstrip().lstrip() for company in input if company.lstrip()[0] != "#"]

serialized_input = msgpack.packb(input, use_bin_type=True)

with open("serialized_input.bin", "w+b") as serialized_output_file:
    serialized_output_file.write(serialized_input)
