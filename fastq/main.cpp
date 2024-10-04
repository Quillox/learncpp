#include <fstream>
#include <iostream>
#include <string>

struct fastq_record
{
    std::string id{};
    std::string sequence{};
    std::string quality{};
};

void print_record(const fastq_record &record)
{
    std::cout << "ID: " << record.id << '\n';
    std::cout << "Sequence: " << record.sequence << '\n';
    std::cout << "Quality: " << record.quality << '\n';
}

int main(int argc, char const *argv[])
{
    std::ifstream file_in{argv[1]};
    if (!file_in)
    {
        std::cerr << "Error: cannot open file " << argv[1] << '\n';
        return 1;
    }

    std::string line{};
    int record_count{0};
    while (std::getline(file_in, line))
    {
        // Read each record into the struct
        fastq_record record{};
        record.id = line;
        std::getline(file_in, record.sequence);
        std::getline(file_in, line); // Skip the '+' line
        std::getline(file_in, record.quality);

        record_count++;

        // Print the record
        print_record(record);
        if (record_count == 3)
        {
            break;
        }

    }
    return 0;
}
