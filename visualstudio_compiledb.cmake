include(FetchContent)

FetchContent_Declare(
    clang-power-tools
    GIT_REPOSITORY https://github.com/JYLeeLYJ/clang-power-tools.git
    GIT_TAG noclear-console
)
FetchContent_MakeAvailable(clang-power-tools)

macro(generate_compiledb_in_visualstudio_build) 
    if(CMAKE_GENERATOR MATCHES "Visual Studio")
        execute_process(
            COMMAND powershell.exe ${clang-power-tools_SOURCE_DIR}/ClangPowerTools/ClangPowerToolsShared/Tooling/v1/clang-build.ps1 -export-jsondb -dir ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.sln 
            WORKING_DIRECTORY  ${PROJECT_BINARY_DIR}
            COMMAND_ECHO STDOUT
            OUTPUT_FILE clang-power-tools.log
            COMMAND_ERROR_IS_FATAL ANY
        )
    else()
        message(STATUS "skip generate compiledb on None-VS build") 
    endif()
endmacro()