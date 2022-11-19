using Test

include("../src/utility_functions.jl")


companies_list = read_companies_file()

@testset "check_for_unethical_labor" begin
    @testset "Empty list" begin
        dict1 = check_for_unethical_labor([], companies_list)

        @test length(dict1) == 0
    end

    @testset "Single-element list" begin
        dict1 = check_for_unethical_labor(["Apple"], companies_list)

        @test length(dict1) == 1
        @test dict1["Apple"] == true
    end

    @testset "Multiple-element list" begin
        dict1 = check_for_unethical_labor(["Huawei", "LG", "Lenovo", "Tesla"], companies_list)

        @test length(dict1) == 4
        @test dict1["Huawei"] == true
        @test dict1["LG"] == true
        @test dict1["Lenovo"] == true
        @test dict1["Tesla"] == false
    end
end
