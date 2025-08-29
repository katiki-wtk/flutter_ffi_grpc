#ifndef PERSON_HPP
#define PERSON_HPP

#include <string>
#include <vector>


/**
 * @brief A basic Person struct
 */
struct Person {
  std::string firstName;
  std::string lastName;
  int age{};
};


/**
 * @brief A custom PersonModel based on 'Qt Model'
 * 
 */
class PersonModel {
public:
  static PersonModel* from_csv(const char* path);

  size_t count() const { 
    return m_persons.size(); 
  }

  size_t index() const { 
    return m_persons.empty() ? 0 : m_index; 
  }

  bool next() { 
    if (m_index + 1 < m_persons.size()) { 
      ++m_index; 
      return true; 
    } 
    return false; 
  }
  
  bool prev() { 
    if (m_index > 0 && !m_persons.empty()) { 
      --m_index; 
      return true; 
    } 
    
    return false; 
  }
  
  const Person* current() const {
    if (m_persons.empty()) return nullptr;
    return &m_persons[m_index];
  }

private:
  std::vector<Person> m_persons;
  size_t m_index{0};
};

#endif //!PERSON_HPP
