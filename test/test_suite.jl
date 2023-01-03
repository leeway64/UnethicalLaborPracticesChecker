using Test

include("../src/utility_functions.jl")


@testset "check_for_unethical_labor" begin
    companies_list = read_companies_file("doc/unethical-labor-companies-list.txt")
    @testset "Empty list" begin
        dict1 = check_for_unethical_labor([], companies_list)
        
        @test isempty(dict1)
        @test length(dict1) == 0
    end

    @testset "Single-element list" begin
        dict2 = check_for_unethical_labor(["Apple"], companies_list)

        @test length(dict2) == 1
        @test dict2["Apple"] == true
    end

    @testset "Multiple-element list" begin
        dict3 = check_for_unethical_labor(["Huawei", "LG", "Lenovo"], companies_list)

        @test length(dict3) == 3
        @test dict3["Huawei"] == true
        @test dict3["LG"] == true
        @test dict3["Lenovo"] == true
    end

    @testset "Case-insensitivity in input list" begin
        dict4 = check_for_unethical_labor(["IflyteK", "JapaN diSplaY INC.", "OPPO", "tsinghua tongfang", "miTsUbiShi"], companies_list)

        @test length(dict4) == 5
        @test dict4["iFlyTek"] == true
        @test dict4["Japan Display Inc."] == true
        @test dict4["Oppo"] == true
        @test dict4["Tsinghua Tongfang"] == true
        @test dict4["Mitsubishi"] == true
    end
    
    @testset "Companies that don't use forced labor from East Turkistan" begin
        dict5 = check_for_unethical_labor(["MSI", "TeSLa", "Boeing", "Valve"], companies_list)
        
        @test length(dict5) == 4
        @test dict5["MSI"] == false
        @test dict5["TeSLa"] == false
        @test dict5["Boeing"] == false
        @test dict5["Valve"] == false
    end
end
