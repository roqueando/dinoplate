# Leaf cmake example of a third party package
FetchContent_Declare(
  leaf
  GIT_REPOSITORY "https://github.com/boostorg/leaf.git"
  GIT_TAG "boost-1.82.0"
)

set(TESTS OFF)

FetchContent_MakeAvailable(leaf)

if (leaf_POPULATED)
    add_library(leaf INTERFACE IMPORTED)
    target_include_directories(leaf INTERFACE "${leaf_SOURCE_DIR}/include")
endif()
