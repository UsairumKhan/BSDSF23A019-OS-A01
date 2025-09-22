## Dynamic Library Project

In this version, the utility functions were compiled into a **dynamic library** (`libmyutils.so`) using `-fPIC` and `--shared`.  
The driver (`client_dynamic`) is smaller since it doesn’t embed the functions but loads them at runtime.  

To run the program, I had to set `LD_LIBRARY_PATH=./lib` so the dynamic loader could find my custom library.  
Using `ldd`, I confirmed that the executable links to `libmyutils.so` from my project.  

### Git Tag & Release
- Tag: `v0.3.1-dynamic`  
- Release: **Version 0.3.1: Dynamic Library Build**  
- Assets: `lib/libmyutils.so` and `bin/client_dynamic`  

### Key Learning
Dynamic libraries reduce executable size and allow easier updates, but require proper loader configuration (LD_LIBRARY_PATH). This step taught me the role of the OS dynamic loader.
