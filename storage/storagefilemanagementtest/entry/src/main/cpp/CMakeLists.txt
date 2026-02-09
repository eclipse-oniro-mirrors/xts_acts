# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(filemanagement_test)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(filemanagement SHARED FileManagementTest.cpp
                                  FileManagementEnviromentTest.cpp
                                  FileManagementFileIOTest.cpp
                                  FileManagementFileShareTest.cpp
                                  FileManagementFileUriTest.cpp)

target_link_libraries(filemanagement PUBLIC libace_napi.z.so libohenvironment.so libohfileuri.so
                                            libhilog_ndk.z.so libohfileio.so libohfileshare.so)