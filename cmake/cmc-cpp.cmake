## CMAKE_DOCUMENTATION_START cmc_all_warnings_as_errors
##
## If the function is invoked, all compilation warnings are treated as errors
##
## CMAKE_DOCUMENTATION_END
function(cmc_target_all_warnings_as_errors target)

    cmake_policy(SET CMP0057 NEW)

    set(gnuoptions "AppleClang" "Clang" "GNU")
    if (CMAKE_CXX_COMPILER_ID IN_LIST gnuoptions)
        set(option "-Werror")
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        set(option "-WX")
    endif()

    # Enables all warnings
    # Except on Windows, where all warnings create too many problems with system headers
    if (NOT WIN32)
        target_compile_options(${target} PRIVATE -Wall)
    endif()

    target_compile_options(${target} PRIVATE ${option})
    target_link_libraries(${target} PRIVATE ${option})

endfunction()

