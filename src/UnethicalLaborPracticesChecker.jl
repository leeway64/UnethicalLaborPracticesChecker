# Checks if a company takes advantage of forced labor from East Turkistan and prints out a list of
# guilty companies.

include("utility_functions.jl")


# Similar to if __name__ == "__main__" in Python
if abspath(PROGRAM_FILE) == @__FILE__
    if length(ARGS) > 1
        println("Too many arguments. Either enter print-companies as an argument or no arguments.")
    else if length(ARGS) == 1 && ARG[1] != "print-companies"
        println("Either enter print-companies as an argument or no arguments")
    else if length(ARGS) == 1 && ARG[1] == "print-companies"
        print_companies(companies)
    else
        companies = read_companies_file()

        input_companies = deserialize_input("lib/serialized_input.bin")
        labor_results = check_for_unethical_labor(input_companies, companies)

        println(to_json(labor_results))
    end
end
