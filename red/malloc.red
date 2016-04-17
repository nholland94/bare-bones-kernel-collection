Red/System [
  Purpose: "Memory allocation interface"
  Author:  "Nathan Holland"
  License: "GNU General Public License (GNU GPL)"
]

free-zone-top: HEAP_START
free-zone-bottom: HEAP_END

free-zone!: alias struct! [
  base-address: [pointer! [integer!]]
  next-free-zone: [free-zone!]
  zone-size: [integer!]
]

intialize-heap: [
  /local
    p: [pointer! [integer!]]
    zone: [free-zone!]
] [
  p: HEAP_START
  p/value: size? [free-zone!]

  zone: HEAP_START + size? [integer!]
  zone/base-address: as [pointer! [integer!]] zone + 1
  zone/next-free-zone: null
  zone/zone-size: HEAP_END - HEAP_START - size? [free-zone!]
]

malloc: func [
  size [integer!]
  return [pointer! [integer!]]
  /local
    zone [free-zone!]
    required-size [integer!]
    heap-base [pointer! [integer!]]
    old-free-zone-top [free-zone!]
] [
  either size <= 0 [
    null
  ] [
    zone: free-zone-top
    parent-zone: null
    require-size: size + size? [integer!]

    while [
      either zone <> null [
        not zone/zone-size/value >= required-size
      ] [ false ]
    ] [
      parent-zone: zone
      zone: zone/next-free-zone
    ]

    either zone = null [
      null
    ] [
      if zone/zone-size = require-size [
        old-free-zone-top: zone
        heap-base: old-free-zone-top/base-address

        if parent-zone <> null [
          parent-zone/next-free-zone: zone/next-free-zone
        ] [
          free-zone-top: zone/next-free-zone
        ]

        free old-free-zone-top
      ] [
        heap-base: zone/base-address
        zone/base-address: zone/base-address + required-size
        zone/zone-size: zone/zone-size - require-size
      ]

      heap-base/value: size
      heap-base + size? [integer!]
    ]
  ]
]

free: func [
  p [pointer! [integer!]]
  /local
    size-ptr: [pointer! [integer!]]
    size: [integer!]
    new-free-zone: [free-zone!]
    zone-size: [integer!]
] [
  size-ptr: p - size? [integer!]
  size: size-ptr/value

  new-free-zone: as [free-zone!] malloc size? [free-zone!]
  zone-size: size + 1
  if new-free-zone = null [
    if size < size? free-zone [
      ;-- error
    ] [
      size-ptr/value: size? [free-zone!]
      new-free-zone: p
      p: p + size? [free-zone!]
      zone-size: zone-size - (size? [free-zone!] - size? [integer!])
    ]
  ]

  new-free-zone/base-address: p
  new-free-zone/next-free-zone: null
  new-free-zone/zone-size: zone-size

  if free-zone-bottom <> null [
    free-zone-bottom/next-free-zone: new-free-zone
  ]

  free-zone-bottom: new-free-zone
]
