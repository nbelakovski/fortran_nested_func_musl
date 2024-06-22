rm a.out main_shared main_static libalgorithm.so lib.o main.o 2>/dev/null

gfortran -g -fPIC -Wno-trampolines  -c algorithm.f90 -o algorithm.o
gfortran -g -fPIC -shared -Wl,-soname,libalgorithm.so -Wl,--no-warn-execstack  -o libalgorithm.so algorithm.o

gfortran -g -c main.f90 -o main.o

# Compile statically
gfortran -g -Wl,--no-warn-execstack main.o -o main_static algorithm.o
# Compile with shared lib
gfortran -g main.o -o main_shared -Wl,-rpath,/prima/temp libalgorithm.so

# Run the program
echo "Running statically compiled program..."
./main_static
echo "Running statically compiled program...done"
echo "Running program compiled with shared lib..."
./main_shared
echo "Running program compiled with shared lib...done"
