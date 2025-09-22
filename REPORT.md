## Static Library Project

Here, I refactored the project so that string and file functions were compiled into a **static library** (`libmyutils.a`).  
The driver program (`client_static`) was then linked against this library.  

The `ar` command bundles object files into a `.a` archive, and `ranlib` creates an index for faster linking.  
When running `nm` on the final executable, the function symbols are visible, which shows that static linking copies code directly into the binary.  

### Git Tag & Release
- Tag: `v0.2.1-static`  
- Release: **Version 0.2.1: Static Library Build**  
- Assets: `lib/libmyutils.a` and `bin/client_static`  

### Key Learning
I learned how static libraries work, their benefits (simplicity, independence) and drawbacks (larger executables, harder updates).
