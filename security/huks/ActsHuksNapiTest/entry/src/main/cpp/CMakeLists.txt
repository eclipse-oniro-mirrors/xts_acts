# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsHuksNapiTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(huks SHARED
    NapiInitTest.cpp
    HuksAgreeDhTest.cpp
    HuksAgreeEcdhTest.cpp
    HuksAgreeX25519Test.cpp
    HuksAttestTest.cpp
    HuksCipherAesTest.cpp
    HuksCipherRsaTest.cpp
    HuksCipherSm4Test.cpp
    HuksDeriveHkdfTest.cpp
    HuksDerivePbkdfTest.cpp
    HuksHmacTest.cpp
    HuksMiscTest.cpp
    HuksNullptrTest.cpp
    HuksSignVerifyDsaTest.cpp
    HuksSignVerifyEccTest.cpp
    HuksSignVerifyEd25519Test.cpp
    HuksSignVerifyRsaTest.cpp
    HuksSignVerifySm2Test.cpp
    HuksWrappedTest.cpp
)

target_link_libraries(huks PUBLIC
    libace_napi.z.so
    libhilog_ndk.z.so
    libhuks_ndk.z.so
)
