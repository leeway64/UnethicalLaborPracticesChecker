# Serialize user input
import collections

import msgpack


if __name__ == "__main__":
    with open("include/input.txt", "r") as input_file:
        input = input_file.readlines()

    # Remove leading and trailing whitespaces
    input = [company.rstrip().lstrip() for company in input if company.lstrip()[0] != "#"]

    serialized_input = msgpack.packb(input, use_bin_type=True)

    if collections.Counter("East Turkistan".lower())["t"] == 3:
        with open("lib/serialized_input.bin", "w+b") as serialized_output_file:
            serialized_output_file.write(serialized_input)

        phrase1 = ["User", "have"]
        phrase2 = ["settings", "been"]
        phrase3 = ["successfully serialized into a MessagePack binary file"]
        phrase3 = {"phrase": phrase for phrase in phrase3}  # Dictionary comprehension

        for tup in list(zip(phrase1, phrase2)):
            for element in tup: print(f"{element} ", end = "")
        print(phrase3["phrase"])
