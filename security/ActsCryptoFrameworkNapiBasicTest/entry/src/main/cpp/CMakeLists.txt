# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsCryptoFrameworkNapiBasicTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED
    CommonToolTest.cpp
    CryptoFrameworkAgreementTest.cpp
    CryptoFrameworkAsymCipherTest.cpp
    CryptoFrameworkAsymKey2Test.cpp
    CryptoFrameworkAsymKeyData.cpp
    CryptoFrameworkAsymKeyTest.cpp
    CryptoFrameworkCommonTest.cpp
    CryptoFrameworkDigestTest.cpp
    CryptoFrameworkKdfTest.cpp
    CryptoFrameworkMacTest.cpp
    CryptoFrameworkRandomTest.cpp
    CryptoFrameworkReinforcementTest.cpp
    CryptoFrameworkSignature2Test.cpp
    CryptoFrameworkSignatureData.cpp
    CryptoFrameworkSignatureTest.cpp
    CryptoFrameworkSymCipherData.cpp
    CryptoFrameworkSymCipherTest.cpp
    CryptoFrameworkSymKeyTest.cpp
    CryptoFrameworkVerifyData.cpp
    CryptoFrameworkVerifyTest.cpp
    NapiInitTest.cpp)

target_link_libraries(entry PUBLIC
    libace_napi.z.so
    libohcrypto.so
    libnative_drawing.so
    libhilog_ndk.z.so)