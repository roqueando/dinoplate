#include <iostream>
#include <core/hello.hpp>

void hello::world::greet() const {
  std::cout << "Hello world!" << std::endl;
}
