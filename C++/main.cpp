#include <iostream>
#include <string>
#include <iterator>
#include <algorithm>

int main() {
  std::cout << "Enter string to encode: ";

  const std::string inp {
    []{
      std::string inp;
      std::getline(std::cin, inp);

      return inp;
    }()
  };

  std::cout << "Encoded string: ";
  std::transform(inp.cbegin(), inp.cend(), std::ostream_iterator<char> { std::cout }, [](char c) {
    return isalpha(c) ? ((c - (islower(c) ? 'a' : 'A') + 13) % 26 + (islower(c) ? 'a' : 'A')) : c;
  });
  std::cout << std::endl;

  return 0;
}
