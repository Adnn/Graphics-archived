## #################################################################
## CMakeLists.txt
## #################################################################

project(Tests)

# TODO : list .h files here. 
# Helpful windows command : dir /b /oen
set(${PROJECT_NAME}_HEADERS
    catch.hpp
)

# TODO : list .cpp files here
set(${PROJECT_NAME}_SOURCES
    Barycentric.cpp
    Matrix.cpp
    Polynomial.cpp
)

add_executable(${PROJECT_NAME}
    main.cpp
    ${${PROJECT_NAME}_SOURCES}
    ${${PROJECT_NAME}_HEADERS}
)


target_link_libraries(${PROJECT_NAME} PRIVATE
    ad::Math
)


cmc_target_all_warnings_as_errors(${PROJECT_NAME})


######################################################################
## Package Installation 
######################################################################

include(cmc-install)

cmc_target_install_package(${PROJECT_NAME}
                           NAMESPACE ad
                           #VERSION "__"
                           #SOVERSION "__"
)

