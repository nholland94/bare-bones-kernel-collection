#include <stdint.h>
#include "panic.h"
#include "k_memory.h"

#define MAX_K_HEAP_SIZE 0x40000000

// extern "C" void _BSS_END_;

static uint8_t k_heap[MAX_K_HEAP_SIZE];

struct free_zone {
  void *base_address;
  struct free_zone *next_free_zone;
  size_t zone_size;
};

struct free_zone *free_zone_top;
struct free_zone *free_zone_bottom;

void k_malloc_init() {
  *(size_t *)k_heap = sizeof(struct free_zone);
  struct free_zone *initial_free_zone = (struct free_zone *)(&k_heap + sizeof(size_t));

  initial_free_zone->base_address = initial_free_zone + sizeof(struct free_zone);
  initial_free_zone->next_free_zone = NULL;
  initial_free_zone->zone_size = MAX_K_HEAP_SIZE - sizeof(struct free_zone);

  free_zone_top = initial_free_zone;
  free_zone_bottom = initial_free_zone;
}

void *k_malloc(size_t size) {
  void *k_heap_base;
  size_t required_size = size + sizeof(size_t);
  struct free_zone *zone = free_zone_top;
  struct free_zone *parent_zone = NULL;

  while(zone != NULL && !(zone->zone_size >= required_size)) {
    parent_zone = zone;
    zone = zone->next_free_zone;
  }

  if(zone == NULL) {
    return NULL;
  }

  if(zone->zone_size == required_size) {
    struct free_zone *old_free_zone_top = zone;
    k_heap_base = old_free_zone_top->base_address;

    if(parent_zone != NULL) {
      parent_zone->next_free_zone = zone->next_free_zone;
    } else {
      free_zone_top = zone->next_free_zone;
    }

    k_free(old_free_zone_top);
  } else {
    k_heap_base = zone->base_address;
    zone->base_address += required_size;
    zone->zone_size -= required_size;
  }

  *(size_t *)k_heap_base = size;
  return (void *)(k_heap_base + sizeof(size_t));
}

// Does not validate whether or not a pointer being free'd is valid... be careful
void k_free(void *ptr) {
  size_t *size_ptr = ptr - sizeof(size_t);
  size_t size = *size_ptr;
  *size_ptr = 0;

  // Does not attempt to combine contiguous free_zones
  struct free_zone *new_free_zone = (struct free_zone *)k_malloc(sizeof(struct free_zone));
  size_t zone_size = size + 1;
  if(new_free_zone == NULL) {
    if(size < sizeof(struct free_zone)) {
      panic("INTERNAL HEAP ERROR: cannot allocate free_zone in heap");
    } else {
      *size_ptr = sizeof(struct free_zone);
      new_free_zone = ptr;
      ptr += sizeof(struct free_zone);
      zone_size -= sizeof(struct free_zone) + sizeof(size_t);
    }
  }

  new_free_zone->base_address = ptr;
  new_free_zone->next_free_zone = NULL;
  new_free_zone->zone_size = zone_size;

  if(free_zone_bottom != NULL) {
    free_zone_bottom->next_free_zone = new_free_zone;
  }

  free_zone_bottom = new_free_zone;
}
