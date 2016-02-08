#include "panic.h"
#include "k_memory.h"
#include "scheme.h"

void kernel_init() {
  k_malloc_init();

  scheme *sc = scheme_init_new_custom_alloc(&k_malloc, &k_free);
  if(!sc) {
    panic("Failed to initialize scheme interpreter");
  }

  panic("Done");
}
