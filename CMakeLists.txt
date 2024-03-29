## #################################################################
## Root CMakeLists.txt
## #################################################################

# >= 2.8.12 to be able to use the target variant of commands.
# >= 3.3 to have access to IN_LIST operator.
cmake_minimum_required(VERSION 3.12)

project(Graphics)


## #################################################################
## Setup CMake Modules
## #################################################################

# Where to look for custom FindXXX.cmake files and custom includes
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# Definitions of custom macros
include (cmc-macros)
include (cmc-cpp)

# Definition of custom variables
cmc_define_option_variables()

set(CMAKE_CXX_STANDARD 14)

## #################################################################
## Setup output paths
## #################################################################

# Setups the debug postfix, and populates *_OUTPUT_DIRECTORY variables.
cmc_setup_output()


## #################################################################
## Build options
## #################################################################

# Doxygen documentation generation
option(BUILD_DOCUMENTATION "Build doxygen's documentation" false)
conditional_add_subdirectory(cmake/doc OPTIONS BUILD_DOCUMENTATION)

# CMake automatically checks this variable value when calling add_library command.
option(BUILD_SHARED_LIBS "Build shared libraries" false)

#
# Control modules to build
#

# TODO : list optional components here, assigning one variable each
#option (BUILD_xxx "Build xxx application" true)


## #################################################################
## Resolve dependencies
## #################################################################

# TODO : find all your dependencies packages

#
# Internal dependencies
#
include(cmc-import)                    
#cmc_find_internal_package(__   NAMESPACE __::)


#
# 3rd party dependencies
#

#find_package(__)


## #################################################################
## Add targets
## #################################################################

# Start recursive crawling of the sources
add_subdirectory(src)
