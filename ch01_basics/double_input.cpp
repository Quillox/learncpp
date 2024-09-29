#include <iostream>

int double_num(int x)
{
    return 2 * x;
}

int triple_num(int x)
{
    return 3 * x;
}

int main(int argc, char const *argv[])
{
    int x{};
    std::cout << "Enter an integer: ";
    std::cin >> x;
    std::cout << "Double that number is: " << double_num(x) << '\n';
    std::cout << "Triple that number is: " << triple_num(x) << '\n';
    return 0;
}
