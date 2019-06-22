#include <iostream>

class test_exception {
private:
  const char *str_;
public:
  test_exception(const char *str) : str_(str) {
  }
};

int main(int argc, char** argv) {
  std::cout << "EXE Starting main" << std::endl;
  std::cout << "EXE Before try" << std::endl;
  try {
    std::cout << "EXE Before throw" << std::endl;
    throw test_exception("blah");
    std::cout << "EXE After throw" << std::endl;
  }
  catch( const test_exception & te ) {
    std::cout << "EXE In catch" << std::endl;
  }
  std::cout << "EXE Leaving main" << std::endl;
  return 0;
}
