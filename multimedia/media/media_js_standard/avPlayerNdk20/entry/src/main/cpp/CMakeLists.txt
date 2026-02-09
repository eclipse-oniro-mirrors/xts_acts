# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(memory)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(avplayerndk SHARED AVPlayerNdkTest.cpp)
target_link_libraries(avplayerndk PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_media_core.so libnative_media_codecbase.so libnative_media_venc.so libnative_window.so libavplayer.so libnative_image.so libGLESv3.so libEGL.so)

add_library(avscreencapturendk SHARED AVScreenCaptureNdkTest.cpp)
target_link_libraries(avscreencapturendk PUBLIC
    libace_napi.z.so
    libhilog_ndk.z.so
    libnative_avscreen_capture.so
    libGLESv3.so
    libEGL.so
    libohinput.so
    libace_ndk.z.so
    libnative_buffer.so
    libnative_media_codecbase.so
    libnative_media_core.so
    libnative_media_venc.so
    libnative_window.so
    libnative_media_avdemuxer.so
    libnative_media_avsource.so
    libnative_image.so
    librawfile.z.so
    libnative_media_avmuxer.so
    libnative_media_adec.so
    libnative_media_aenc.so
    libnative_media_vdec.so
)

add_library(avrecorderndk SHARED AVRecorderNdkTest.cpp)
target_link_libraries(avrecorderndk PUBLIC
    libace_napi.z.so
    libavrecorder.so
    libnative_media_core.so
    libnative_media_codecbase.so
    libnative_media_venc.so
    libnative_window.so
    libavplayer.so
    libnative_image.so
    libGLESv3.so
    libEGL.so
    libnative_buffer.so
    libhilog_ndk.z.so
    librawfile.z.so
)

add_library(avtranscoderconfigndk SHARED AVTranscoderConfigTest.cpp)
target_link_libraries(avtranscoderconfigndk PUBLIC
    libace_napi.z.so
    libavrecorder.so
    libnative_media_core.so
    libnative_media_codecbase.so
    libnative_media_venc.so
    libnative_window.so
    libavplayer.so
    libnative_image.so
    libGLESv3.so
    libEGL.so
    libnative_buffer.so
    libhilog_ndk.z.so
    librawfile.z.so
    libavtranscoder.so
    libnative_media_avsource.so
    libnative_media_core.so
    libnative_media_aenc.so
    libnative_media_codecbase.so
    libnative_media_adec.so
)


add_library(lowpoweraudiosinkndk SHARED LowPowerSinkTest.cpp)
target_link_libraries(lowpoweraudiosinkndk PUBLIC
    libace_napi.z.so
    libavrecorder.so
    libnative_media_core.so
    libnative_media_core.so
    libnative_media_codecbase.so
    libnative_media_venc.so
    libnative_window.so
    libavplayer.so
    libnative_image.so
    libGLESv3.so
    libEGL.so
    libnative_buffer.so
    libhilog_ndk.z.so
    librawfile.z.so
    libavtranscoder.so
    libnative_media_avsource.so
    libnative_media_core.so
    libnative_media_aenc.so
    libnative_media_codecbase.so
    libnative_media_adec.so
    liblowpower_avsink.so
    libnative_media_avsource.so
    libnative_media_avdemuxer.so
    libnative_buffer.so
    libnative_media_venc.so
)

add_library(lowpoweraudiosinktwondk SHARED LowPowerSinkTwoTest.cpp)
target_link_libraries(lowpoweraudiosinktwondk PUBLIC
    libace_napi.z.so
    libavrecorder.so
    libnative_media_core.so
    libnative_media_core.so
    libnative_media_codecbase.so
    libnative_media_venc.so
    libnative_window.so
    libavplayer.so
    libnative_image.so
    libGLESv3.so
    libEGL.so
    libnative_buffer.so
    libhilog_ndk.z.so
    librawfile.z.so
    libavtranscoder.so
    libnative_media_avsource.so
    libnative_media_core.so
    libnative_media_aenc.so
    libnative_media_codecbase.so
    libnative_media_adec.so
    liblowpower_avsink.so
    libnative_media_avsource.so
    libnative_media_avdemuxer.so
    libnative_buffer.so
    libnative_media_venc.so
)

add_library(avimagemetadatndk SHARED AVImageMetadatTest.cpp)
target_link_libraries(avimagemetadatndk PUBLIC
    libace_napi.z.so
    libavrecorder.so
    libnative_media_core.so
    libnative_media_codecbase.so
    libnative_media_venc.so
    libnative_window.so
    libavplayer.so
    libnative_image.so
    libGLESv3.so
    libEGL.so
    libnative_buffer.so
    libhilog_ndk.z.so
    librawfile.z.so
    libavtranscoder.so
    libnative_media_avsource.so
    libnative_media_aenc.so
    libnative_media_adec.so
    liblowpower_avsink.so
    libavimage_generator.so
    libpixelmap.so
    libavmetadata_extractor.so
    libvideo_processing.so
    liblowpower_avsink.so
)
