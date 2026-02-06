# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.1)
project(OHImageEffectNDK)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
    ${NATIVERENDER_ROOT_PATH}/utils
)
add_library(imageEffect SHARED
    napi_init.cpp
    utils/CommonUtilsTest.cpp
    utils/PixelmapHelperTest.cpp
    utils/GlUtilsTest.cpp
    OHEffectBufferInfoSetTimestampTest.cpp
    OHEffectBufferInfoGetTimestampTest.cpp
    OHEffectBufferInfoSetTextureIdTest.cpp
    OHEffectBufferInfoGetTextureIdTest.cpp
    OHEffectFilterInfoSupplementTest.cpp
    ImageEffectFilterSuppTest.cpp
    OHImageErrorSuppTest.cpp
    ImageEffectSuppTest.cpp
    ImageEffectFilterRenderSuppTest.cpp
    ImageFrameworkPixelMapNativeCreateSuppTest.cpp
    ImageSourceNativeCreateTest.cpp
    InitNativePixelMapTest.cpp
    ImagePackerCreateTest.cpp
    ImageInitImageNativeSuppTest.cpp
    ImageReceiverNativeTest.cpp
    PixleMapNativeTest.cpp
    ImageEffectsSuppTest.cpp
    AccessPixelsTest.cpp
    OHEffectBufferInfoSetInfoTest.cpp
    OHImageEffectRestoreTest.cpp
    OHImageSizeTest.cpp
    OHPixelmapNativeCreatePixelmapNativeTest.cpp
    OHImageEffectErrcodeSuppTest.cpp
    OHPixelMapSupplementTest.cpp
    ImagePixelMapTest.cpp
    ImageEffectSuppTest.cpp
    OHPixelMapGetBytesNumberPerRowTest.cpp
    OHPixelMapGetIsEditableTest.cpp
    OHPixelMapIsSupportAlphaTest.cpp
    OHPixelMapSetAlphaAbleTest.cpp
    OHPixelMapSetDensityTest.cpp
    OHImageEffectSetOutputTextureIdTest.cpp
    OHImageEffectStartTest.cpp
    OHPictureMetadataTest.cpp
    ImageSourceTest.cpp
    IRNdkErrCodeSupplementTest.cpp
    ImageResultIRNdkErrCodeTest.cpp
    ImageNdkErrCodeTest.cpp
    ImageReceiverNativeReadTest.cpp
    OHImageNdkFrameworkTest.cpp
    ImageSourceNativeGetImagePropertyTest.cpp
    ImageSourceNativeModifySuppTest.cpp
    PixelmapNativeCropTest.cpp
    ImagePackerNativeTest.cpp
    ImagePictureNativeTest.cpp
    OHImageSourceNativeSupplementTest.cpp
    ImageOHImageSourceInfoCreateTest.cpp)


find_library(
    # Sets the name of the path variable.
    EGL-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    EGL
)

find_library(
    # Sets the name of the path variable.
    GLES-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    GLESv3
)


target_link_libraries(imageEffect PUBLIC
    libnative_color_space_manager.so
    libimage_ndk.z.so
    libimage_receiver_ndk.z.so
    libhilog_ndk.z.so
    libimage_effect.so
    libpixelmap.so
    libnative_window.so
    libnative_buffer.so
    libpixelmap_ndk.z.so
    libimage_packer.so
    libimage_source.so
    libimage_receiver_ndk.z.so
    libimage_common.so
    libimage_packer_ndk.z.so
    libimage_source_ndk.z.so
    libpicture.so
    libimage_receiver.so
    ${EGL-lib}
    ${GLES-lib}
    libmedia_asset_manager.so
    libohcamera.so
    libohimage.so
    librawfile.z.so
    libace_napi.z.so
)