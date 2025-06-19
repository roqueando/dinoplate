cmake_minimum_required(VERSION 3.22)

set(APP_NAME_PROJECT_NAME app_name)
set(APP_NAME_SOURCE_DIR src)
set(APP_NAME_PROJECT_VERSION 0.1)
set(APP_NAME_LIBRARY_NAME core)
set(APP_NAME_BINARY_NAME app_name)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


include(cmake/UniversalAppleBuild.cmake)

project(
  ${APP_NAME_PROJECT_NAME}
  VERSION ${APP_NAME_PROJECT_VERSION}
  DESCRIPTION "project_description"
  LANGUAGES CXX)

include(cmake/StandardProjectSettings.cmake)

add_executable(${APP_NAME_BINARY_NAME} src/core/ui/app.cpp)
target_link_libraries(${APP_NAME_BINARY_NAME} PUBLIC ${APP_NAME_LIBRARY_NAME})
target_compile_features(${APP_NAME_BINARY_NAME} PRIVATE cxx_std_20)

include(packages/main.cmake)

add_subdirectory(src)

install(TARGETS ${APP_NAME_BINARY_NAME} RUNTIME DESTINATION bin)
include(cmake/packing.cmake)
