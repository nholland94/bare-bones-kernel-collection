# Scheme Bare Bones Kernel

This bare bones kernel contains a stripped down version of tinyscheme 1.41. In this stripped down version, the main entry point for the tinyscheme executable is removed, as well as any logic that used stdlib functions (like scheme\_init\_new, which uses malloc to allocate a scheme interpreter environment).

Custom malloc and free functions are written and passed in to the scheme interpreter. Since this malloc and free are internal to the kernel, I have just done a very simple first pass implementation at having a staticly sized heap that is represented as a byte array. This is not a great implementation, but the point of this is just to set up the basics.


