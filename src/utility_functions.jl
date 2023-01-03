# Utility functions for UnethicalLaborPracticesChecker

using JSON
using MsgPack
using DataStructures


"""
Read the file containing companies that take advantage of forced labor from East Turkistan and
return the contents of that file as an array.
companies_file_path: Path to the companies file (a text file, with each company separated by a new line)
"""
function read_companies_file(companies_file_path)
    companies = readlines(companies_file_path)
    companies = [company for company in companies if !startswith(lstrip(company), "#") && !startswith(lstrip(company), "\n")]
    
    return companies
end


"""
Print every company in companies_list (the list of companies that take advantage of forced
labor from East Turkistan)
"""
function print_companies(companies_list)
    # ASCII message created from http://www.network-science.de/ascii/; the font used is the "big" font.
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
    
    println("The following companies, according to the Australian Strategic Policy Institute,")
    println("use forced Uyghur labor:\n")
    
    companies_per_line = 5
    print("\t")
    for (index, company) in enumerate(companies_list)
        if index != length(companies_list)
            print("$company, ")
        else
            print("$company")
        end
        if (index - 1) % companies_per_line == companies_per_line - 1
            println()
            print("\t")
        end
    end
    println()
end


"""
Check if the companies in the input list take advantage of forced labor by checking each company
with a reference list. Returns a dictionary containing string keys and boolean values representing
if each company uses forced labor.
input_companies: A list of strings (companies)
companies_list: A list of companies that use forced labor from East Turkistan
"""
function check_for_unethical_labor(input_companies, companies_list)
    lowercase_to_original_case_companies_list_dict = Dict(lowercase(company) => company for company in companies_list)
    lowercase_to_original_case_input_companies_dict = Dict(lowercase(company) => company for company in input_companies)
    
    companies_list_set = Set(lowercase(company) for company in companies_list)
    
    unethical_labor_results = DataStructures.OrderedDict()
    input_companies_lowercase = [lowercase(company) for company in input_companies]
    for company in input_companies_lowercase
        if company in companies_list_set
            unethical_labor_results[lowercase_to_original_case_companies_list_dict[company]] = true
        else
            unethical_labor_results[lowercase_to_original_case_input_companies_dict[company]] = false            
        end
    end

    return unethical_labor_results
end


"""
Convert the results dictionary into a JSON string.
unethical_labor_results_dict: Dictionary containing string keys and boolean values representing if
each company uses forced labor
"""
function to_json(unethical_labor_results_dict)
    return JSON.json(unethical_labor_results_dict)
end


"""
Deserialize the serialized input into a list of companies.
path_binary_input: Path to MessagePack binary file
"""
function deserialize_input(path_binary_input)
    msgpack_binary = read(path_binary_input)
    input_companies = unpack(msgpack_binary)
    return input_companies
end
