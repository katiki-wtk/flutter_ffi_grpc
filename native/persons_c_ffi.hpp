
#ifndef PERSONS_C_FFI_HPP
#define PERSONS_C_FFI_HPP

#ifdef _WIN32
  #define API __declspec(dllexport)
#else
  #define API
#endif


#ifdef __cplusplus
extern "C" {
#endif

// Wrapper aaround the PersonModel c++ backend file
// Obliged to through a void * pointer to easily cast the class
// AFAIK, only C function call are supported

typedef void* PersonsHandle;

API PersonsHandle persons_create_from_csv(const char* path_utf8);
API void persons_free(PersonsHandle h);

API int persons_count(PersonsHandle h);
API int persons_index(PersonsHandle h);
API int persons_next(PersonsHandle h);
API int persons_prev(PersonsHandle h);
API int persons_get_age(PersonsHandle h);

API int persons_get_firstname(PersonsHandle h, char* buffer, int buffer_size);
API int persons_get_lastname (PersonsHandle h, char* buffer, int buffer_size);

#ifdef __cplusplus
}
#endif

#endif