cmake_minimum_required(VERSION 2.8.11)

# A C project
project(C)

set(CMAKE_VERBOSE_MAKEFILE ON)

add_executable(nc_full getopt.c doexec.c netcat.c)

if(WIN32)
  target_link_libraries(nc_full user32 wsock32 kernel32)
  add_definitions(-DGAPING_SECURITY_HOLE)
  add_definitions(-Dstrcasecmp=_stricmp)
endif()

# Force static linking on Windows
set(CompilerFlags
        CMAKE_CXX_FLAGS
        CMAKE_CXX_FLAGS_DEBUG
        CMAKE_CXX_FLAGS_RELEASE
        CMAKE_C_FLAGS
        CMAKE_C_FLAGS_DEBUG
        CMAKE_C_FLAGS_RELEASE
        )
foreach(CompilerFlag ${CompilerFlags})
  string(REPLACE "/MD" "/MT" ${CompilerFlag} "${${CompilerFlag}}")
endforeach()
