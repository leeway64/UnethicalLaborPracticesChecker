using Test

include("../src/utility_functions.jl")


companies_list = read_companies_file()

@testset "check_for_unethical_labor" begin
    dict1 = check_for_unethical_labor(["Apple"], companies_list)
    
    @test length(dict1) == 1
    @test dict1["Apple"] == true
end
