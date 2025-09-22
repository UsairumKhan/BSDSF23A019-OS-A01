## Multi-file Project

In this version, all `.c` files (string, file, and main) were compiled directly into one executable using a Makefile.  
The rule `$(TARGET): $(OBJECTS)` links object files together. Unlike linking with a library, here each object file is compiled separately and then combined.  

### Git Tag & Release
- Tag: `v0.1.1-multifile`  
- Release: **Version 0.1.0: Multi-file Build**  
- Assets: Compiled `bin/client` executable  

### Key Learning
I learned how to structure projects into multiple files and automate builds using Makefiles. Git tags mark stable checkpoints, and annotated tags add descriptions for clarity.
