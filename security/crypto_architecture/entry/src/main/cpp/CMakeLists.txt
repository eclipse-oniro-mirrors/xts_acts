# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication9)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(cryptoarchitecture SHARED ExportApiTest.cpp
                                      CryptoAsymCipherTest.cpp
                                      CryptoAsymCipher2Test.cpp
                                      CryptoAsymCipher3Test.cpp)
target_link_libraries(cryptoarchitecture PUBLIC libace_napi.z.so libhilog_ndk.z.so libohcrypto.so)