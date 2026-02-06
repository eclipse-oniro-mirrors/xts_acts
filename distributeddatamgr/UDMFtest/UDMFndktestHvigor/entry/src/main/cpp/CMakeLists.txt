# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(udmfNdktestHvigor)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED napi_init.cpp)

target_link_libraries(entry PUBLIC
     libace_napi.z.so
     libhilog_ndk.z.so
     libudmf.so
     libpixelmap.so
     libpixelmap_ndk.z.so
)

add_library(UtdNdk SHARED utd_ndk_test.cpp)

target_link_libraries(UtdNdk PUBLIC
     libace_napi.z.so
     libhilog_ndk.z.so
     libudmf.so
)

add_library(UdsNdk SHARED uds_ndk_test.cpp)

target_link_libraries(UdsNdk PUBLIC
     libace_napi.z.so
     libhilog_ndk.z.so
     libudmf.so
)

add_library(UdmfNdk SHARED udmf_ndk_test.cpp)

target_link_libraries(UdmfNdk PUBLIC
     libace_napi.z.so
     libhilog_ndk.z.so
     libudmf.so
)

add_library(UdsConetformNdk SHARED conetform_ndk_test.cpp)

target_link_libraries(UdsConetformNdk PUBLIC
     libace_napi.z.so
     libhilog_ndk.z.so
     libudmf.so
)

add_library(UdsNdkex SHARED uds_ndk_ex_test.cpp)

target_link_libraries(UdsNdkex PUBLIC
     libace_napi.z.so
     libhilog_ndk.z.so
     libudmf.so
)

add_library(UdmfNdkex SHARED udmf_ndk_ex_test.cpp)

target_link_libraries(UdmfNdkex PUBLIC
     libace_napi.z.so
     libhilog_ndk.z.so
     libudmf.so
)
