# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(PerformanceAnalysisKit)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED PerformanceAnalysisKitTest.cpp ImagepixelmapmdkTest.cpp ImagereceivermdkTest.cpp ImageKitSuccesTest.cpp ImagepictureTest.cpp ImageframeworkTest.cpp ImageReceiverMdk1Test.cpp ImagePixelMapMdk1Test.cpp ImagePackerNativeTest.cpp ImagePackerNative1Test.cpp ImageSourceNativeErrorCodeTest.cpp ImageEffectErrorCodeTest.cpp ImageKitErrorCodeTest.cpp ImageProcessingTest.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libhilog_ndk.z.so libos_account_ndk.so libpixelmap_ndk.z.so libimage_receiver_ndk.z.so libimage_source_ndk.z.so libimage_source.so
                    libace_ndk.z.so libace_ndk.z.so libnative_display_manager.so libace_ndk.z.so libhiappevent_ndk.z.so libohhicollie.so libimage_packer_ndk.z.so libimage_common.so libpixelmap.so libimage_receiver.so libpicture.so libimage_processing.so libimage_effect.so libnative_drawing.so libimage_ndk.z.so libimage_packer.so libohimage.so libuv.so libnative_image.so libimage_processing.so)