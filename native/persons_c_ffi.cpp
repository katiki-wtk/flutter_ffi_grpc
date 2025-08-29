#include "persons_c_ffi.hpp"
#include "persons.hpp"

#include <cstring>

extern "C" 
{

static int copy_string(const std::string& s, char* buffer, int buffer_size) 
{
  const int needed = static_cast<int>(s.size());
  if (!buffer || buffer_size <= 0) return needed;
  const int to_copy = std::min(needed, buffer_size - 1);
  if (to_copy > 0) std::memcpy(buffer, s.data(), to_copy);
  buffer[to_copy] = '\0';
  return needed;
}

// Path must is expected to be in UTF-8 (provided by flutter)
PersonsHandle persons_create_from_csv(const char* path_utf8) 
{
  return reinterpret_cast<PersonsHandle>(PersonModel::from_csv(path_utf8));
}

void persons_free(PersonsHandle h) 
{
  delete reinterpret_cast<PersonModel*>(h);
}

int persons_count(PersonsHandle h) 
{
  auto* p = reinterpret_cast<PersonModel*>(h);
  return p ? static_cast<int>(p->count()) : 0;
}

int persons_index(PersonsHandle h) 
{
  auto* p = reinterpret_cast<PersonModel*>(h);
  return p ? static_cast<int>(p->index()) : 0;
}

int persons_next(PersonsHandle h) 
{
  auto* p = reinterpret_cast<PersonModel*>(h);
  return (p && p->next()) ? 1 : 0;
}

int persons_prev(PersonsHandle h) 
{
  auto* p = reinterpret_cast<PersonModel*>(h);
  return (p && p->prev()) ? 1 : 0;
}

int persons_get_age(PersonsHandle h) 
{
  auto* p = reinterpret_cast<PersonModel*>(h);
  auto* cur = p ? p->current() : nullptr;
  return cur ? cur->age : -1;
}

int persons_get_firstname(PersonsHandle h, char* buffer, int buffer_size) 
{
  auto* p = reinterpret_cast<PersonModel*>(h);
  auto* cur = p ? p->current() : nullptr;
  return cur ? copy_string(cur->firstName, buffer, buffer_size) : -1;
}

int persons_get_lastname(PersonsHandle h, char* buffer, int buffer_size) 
{
  auto* p = reinterpret_cast<PersonModel*>(h);
  auto* cur = p ? p->current() : nullptr;
  return cur ? copy_string(cur->lastName, buffer, buffer_size) : -1;
}

} // extern "C"
