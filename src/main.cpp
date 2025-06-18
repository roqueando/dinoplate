#include <iostream>
#include <core/hello.hpp>

int main() {
  hello::world w;
  w.greet();

  std::cout << "---\n";
  return 0;
}
