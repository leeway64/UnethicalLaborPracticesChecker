# Checks if a company takes advantage of forced labor from East Turkistan and prints out a list of
# guilty companies.

include("utility_functions.jl")


if abspath(PROGRAM_FILE) == @__FILE__
    companies = read_companies_file()
    print_companies(companies)
    print(check_for_unethical_labor(["Apple", "Microsoft"], companies))
    print()
end
