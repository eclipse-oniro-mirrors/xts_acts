cmake_minimum_required(VERSION 3.5)

project(napitest)
set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(OPENHARMONY_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../../../..)

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/include
)

aux_source_directory(${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/ SECUREC_SRCS)
add_library(securec SHARED ${SECUREC_SRCS})

add_library(napitest SHARED ./napi/napi_test.cpp)

target_link_libraries(napitest PUBLIC securec libace_napi.z.so libuv.so libhilog_ndk.z.so libc++.a)