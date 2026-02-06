# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication9)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED   camera_manager.cpp camera_manager_ndk.h image_receiver_mdk_test.cpp image_receiver_mdk_test.h image_receiver_module_test.cpp image_receiver_module_test.h image_receiver_test.cpp image_receiver_test.h module_test.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libohcamera.so libimage_receiver_ndk.z.so libimage_receiver.so libimage_source.so libimage_ndk.z.so libnative_image.so libohimage.so libhilog_ndk.z.so libuv.so)
add_library(ArriveOnNdk SHARED ImageReceiverArriveOnTest.cpp)
target_link_libraries(ArriveOnNdk PUBLIC libace_napi.z.so libohcamera.so libimage_receiver_ndk.z.so libimage_receiver.so libimage_source.so libimage_ndk.z.so libnative_image.so libohimage.so libhilog_ndk.z.so libuv.so libnative_buffer.so)