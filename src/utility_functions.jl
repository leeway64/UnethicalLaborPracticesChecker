# Utility functions for UnethicalLaborPracticesChecker

"""
Read the file containing companies that take advantage of forced labor from East Turkistan and
return the contents of that file as an array.
"""
function read_companies_file(companies_file_path)
    companies = readlines(companies_file_path)
    return companies
end


"""
Print every company in the companies list (the list of companies that take advantage of forced
labor from East Turkistan)
"""
function print_companies(companies_list)
    companies_per_line = 5
    for (index, company) in enumerate(companies_list)
        if index != length(companies_list)
            print("$company,")
        else
            print("$company")
        end
        if index % companies_per_line
            println()
        end
    end
end


"""

"""
function check_for_unethical_labor(input_companies, companies_list)
    # if company in list of companies that use forced labor, return true
    
    return true
end
