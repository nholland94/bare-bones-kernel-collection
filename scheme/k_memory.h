#ifndef _K_MEMORY_H_
#define _K_MEMORY_H_
#include <stddef.h>

extern void k_malloc_init();
extern void *k_malloc(size_t size) __attribute__((malloc));
extern void k_free(void *ptr);

#endif
