# Checks if a company takes advantage of forced labor from East Turkistan and prints out a list of
# guilty companies.

include("utility_functions.jl")


if abspath(PROGRAM_FILE) == @__FILE__
    companies = read_companies_file()

    if false
        print_companies(companies)
    end

    input_companies = deserialize_input("lib/serialized_input.bin")
    labor_results = check_for_unethical_labor(input_companies, companies)
    
    println(to_json(labor_results))
end
