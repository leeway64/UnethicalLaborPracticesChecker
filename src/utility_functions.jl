# Utility functions for UnethicalLaborPracticesChecker

"""
Read the file containing companies that take advantage of forced labor from East Turkistan and
return the contents of that file as an array.
"""
function read_companies_file()
    companies_file_path = "doc/unethical-labor-companies-list.txt"
    companies = readlines(companies_file_path)
    
    companies = [company for company in companies if !startswith(lstrip(company), "#")]
    
    return companies
end


"""
Print every company in the companies list (the list of companies that take advantage of forced
labor from East Turkistan)
"""
function print_companies(companies_list)
    # ASCII message created from http://www.network-science.de/ascii/
    free_east_turkistan = raw"""
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
    
    """
    
    println(free_east_turkistan)
    
    companies_per_line = 5
    print("\t")
    for (index, company) in enumerate(companies_list)
        if index != length(companies_list)
            print("$company,")
        else
            print("$company")
        end
        #println(index % companies_per_line)
        if (index - 1) % companies_per_line == companies_per_line - 1
            println()
            print("\t")
        end
    end
    
    println()
end


"""

"""
function check_for_unethical_labor(input_companies, companies_list)
    # if company in list of companies that use forced labor, return true
    
    return true
end
