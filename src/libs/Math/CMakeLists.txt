## #################################################################
## CMakeLists.txt
## #################################################################

project(Math)

set(${PROJECT_NAME}_DOXYGEN
    #mainpage.dox
)

set(${PROJECT_NAME}_HEADERS
    commons.h

    Barycentric.h
    Matrix.h
    MatrixBase.h
    MatrixBase-impl.h
    Range.h
    Utilities.h
    Vector.h
    Vector-impl.h
)

cmc_source_group() ## For IDE generators, groups files based on the subfolder organisation

add_library(${PROJECT_NAME} INTERFACE)

# To have the files show up in the IDE
add_custom_target(${PROJECT_NAME}_IDE
    SOURCES
        ${${PROJECT_NAME}_HEADERS}
        ${${PROJECT_NAME}_DOXYGEN}
)

## Adds the library headers themselves to the interface include directory
## Adds the parent folder to the header search path used when building *this* library.
## It allows this library's as well as client code to include headers from this library using <${PROJECT_NAME}/file.h>
## (eg. instead of relying on potentially backtracing relative paths inside this library)
## Drawback: this is making the other libraries in the lib/ folder visible for inclusion.
target_include_directories(${PROJECT_NAME} 
                            INTERFACE
                                $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/..>
)


######################################################################
## Package Installation 
######################################################################

include(cmc-install)

# TODO: Allow the generated Config file to autonomously find the dependencies of the target,
# giving -for each dependency- a string equivalent to the arguments that would be given to find_package.
#cmc_target_depends(${PROJECT_NAME} "Boost COMPONENT filesystem")
#cmc_target_depends(${PROJECT_NAME} "OtherLib")

#cmc_target_install_package(${PROJECT_NAME}
#                           NAMESPACE ad
#                           PUBLIC_HEADER ${${PROJECT_NAME}_HEADERS}
#                           GENERATE_EXPORT_HEADER
#                           #VERSION "__"
#                           #SOVERSION "__"
#                           #COMPATIBILITY SameMajorVersion
#)

