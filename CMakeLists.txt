cmake_minimum_required(VERSION 3.22)

set(PROJECT_NAME_PROJECT_NAME project_name)
set(PROJECT_NAME_SOURCE_DIR src)
set(PROJECT_NAME_PROJECT_VERSION 0.1)
set(PROJECT_NAME_LIBRARY_NAME core)
set(PROJECT_NAME_BINARY_NAME project_name)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


include(cmake/UniversalAppleBuild.cmake)

project(
  ${PROJECT_NAME_PROJECT_NAME}
  VERSION ${PROJECT_NAME_PROJECT_VERSION}
  DESCRIPTION "PROJECT_DESCRIPTION"
  LANGUAGES CXX)

include(cmake/StandardProjectSettings.cmake)

add_executable(${PROJECT_NAME_BINARY_NAME} src/main.cpp)
target_link_libraries(${PROJECT_NAME_BINARY_NAME} PUBLIC ${PROJECT_NAME_LIBRARY_NAME})
target_compile_features(${PROJECT_NAME_BINARY_NAME} PRIVATE cxx_std_20)

include(packages/main.cmake)

add_subdirectory(src)

install(TARGETS ${PROJECT_NAME_BINARY_NAME} RUNTIME DESTINATION bin)
include(cmake/packing.cmake)
