file(GLOB_RECURSE HEADER_LIST
  RELATIVE
  "${CMAKE_CURRENT_SOURCE_DIR}/include"
  CONFIGURE_DEPENDS
  "${CMAKE_CURRENT_SOURCE_DIR}/include/*.hpp"
)
file(GLOB_RECURSE SOURCE_LIST
  RELATIVE
  "${PROJECT_SOURCE_DIR}/src"
  "${PROJECT_SOURCE_DIR}/src/*.cpp"
)

add_library(${APP_NAME_LIBRARY_NAME} ${SOURCE_LIST} ${HEADER_LIST})


target_link_libraries (${APP_NAME_LIBRARY_NAME} PUBLIC leaf)
target_include_directories(${APP_NAME_LIBRARY_NAME} PUBLIC ../include)

target_compile_features(${APP_NAME_LIBRARY_NAME} PRIVATE cxx_std_20)
