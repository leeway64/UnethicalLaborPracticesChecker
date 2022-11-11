function read_companies_file()
    # read list of companies that use forced labor
    # return list
end

"""
Print every company in the companies list (the list of companies that take advantage of forced
labor from East Turkistan)
"""
function print_companies(companies_list)
    companies_per_line = 5
    for (index, company) in enumerate(companies_list)
        print("$company")
        if index % companies_per_line
            println()
        end
    end
end


function check_for_unethical_labor(input_companies, companies_list)
    # if company in list of companies that use forced labor, return true
    return true
end
