#include "persons.hpp"

#include <fstream>
#include <sstream>

////////////////////////////////////////////////////////////////////////////////////////////////////
static bool split_csv_line(const std::string& line, std::string& a, std::string& b, int& age) 
{
    std::stringstream ss(line);
    std::string first, last, ageStr;

    if (!std::getline(ss, first, ',')) 
        return false;
    if (!std::getline(ss, last,  ',')) 
        return false;
    if (!std::getline(ss, ageStr))     
        return false;
    
    try 
    { 
        age = std::stoi(ageStr); 
    } 
    catch (...) 
    { 
        return false; 
    }

    a = first; b = last;
    return true;
}



////////////////////////////////////////////////////////////////////////////////////////////////////
PersonModel* PersonModel::from_csv(const char* path) 
{
  auto* p = new PersonModel();
  std::ifstream f(path);
  if (!f) 
    return p; // vide mais valide

  std::string line;
  while (std::getline(f, line)) 
  {
    if (line.empty()) continue;
    // skip header if any...
    if (line.find("first") != std::string::npos && line.find("age") != std::string::npos) 
        continue;

    std::string first, last; int age = 0;
    if (split_csv_line(line, first, last, age)) {
        p->m_persons.push_back(Person{first, last, age});
    }
  }
  return p;
}
