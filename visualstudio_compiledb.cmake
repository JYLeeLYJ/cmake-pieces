include(FetchContent)

FetchContent_Declare(
    clang-power-tools
    GIT_REPOSITORY https://github.com/Caphyon/clang-power-tools.git 
    GIT_TAG master
)

FetchContent_MakeAvailable(clang-power-tools)

function(generate_compiledb_in_visualstudio_build) 
    if(CMAKE_GENERATOR MATCHES "Visual Studio")
        execute_process(
            COMMAND "powershell.exe ${clang-power-toolsSOURCE_DIR}/ClangPowerTools/ClangPowerToolsShared/Tooling/v1/clang-build.ps1 -export-jsondb"
            WORKING_DIRECTORY  ${PROJECT_BINARY_DIR}
            COMMAND_ECHO STDOUT
        )    
    endif()
endfunction()