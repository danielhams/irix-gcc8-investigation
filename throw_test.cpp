#include <iostream>

class destroyable_object {
private:
  int internal_int_;
public:
  destroyable_object(int a) : internal_int_(a) {
    std::cout << "EXE destrobj create" << std::endl;
  }
  ~destroyable_object() {
    std::cout << "EXE destrobj cleanup" << std::endl;
  }
};

class test_exception {
private:
  const char *str_;
public:
  test_exception(const char *str) : str_(str) {
  };

  const char * get_str() const { return str_; };
};

void somefunc( destroyable_object & deo ) {
  std::cout << "EXE somefunc enter" << std::endl;
  destroyable_object copy = deo;
  std::cout << "EXE somefunc about to throw" << std::endl;
  throw test_exception("blah");
}

int main(int argc, char** argv) {
  std::cout << "EXE Starting main" << std::endl;
  std::cout << "EXE Before try" << std::endl;
  try {
    std::cout << "EXE Before doe construct" << std::endl;
    destroyable_object doe(2);
    std::cout << "EXE Before somefunc call" << std::endl;
    somefunc(doe);
    // Shouldn't get here
    std::cout << "EXE After somefunc" << std::endl;
  }
  catch( const test_exception & te ) {
    std::cout << "EXE In catch - string is " << te.get_str() << std::endl;
  }
  std::cout << "EXE Leaving main" << std::endl;
  return 0;
}
