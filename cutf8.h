#ifndef CUTF8
#define CUTF8

#include <stddef.h>
#include <stdint.h>

typedef struct utf8_string {
  uint8_t *u_string;
  size_t u_bytes;
  size_t u_codepoints;
} utf8_string;

#endif // !CUTF8
