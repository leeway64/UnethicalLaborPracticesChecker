using Test

include("../src/utility_functions.jl")


companies_list = read_companies_file()

# TODO how to check if dictionary is empty
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

    @testset "Case-insensitivity in input list" begin
        dict1 = check_for_unethical_labor(["IflyteK", "JapaN diSplaY INC.", "OPPO", "tsinghua tongfang", "miTsUbiShi"], companies_list)

        @test length(dict1) == 5
        @test dict1["iFlyTek"] == true
        @test dict1["Japan Display Inc."] == true
        @test dict1["Oppo"] == true
        @test dict1["Tsinghua Tongfang"] == true
        @test dict1["Mitsubishi"] == true
    end
end
