# /bin/bash
echo 'Checking for CMakeLists.md5'

NAME="raylib_cpp_example"
CACHE=$(cat CMakeLists.md5)
GENERATED=$(md5sum CMakeLists.txt | cut -d' ' -f1)

if [ $CACHE = $GENERATED ]
then
    echo CMakeLists.txt same, continuing
else
    echo CMakeLists.txt changed. Rerunning CMake
    cmake -B build
fi

cd build
make
./$NAME
cd ..

echo 'Generating CMakeLists.md5'
md5sum CMakeLists.txt | cut -d' ' -f1 > CMakeLists.md5