# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(XComponent)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/common
                    ${NATIVERENDER_ROOT_PATH}/napi
                    ${NATIVERENDER_ROOT_PATH}/render
                    )

add_library(nativerender SHARED
            render/egl_core.cpp
            render/plugin_render.cpp
            render/native_xcomponent.cpp
            plugin_manager.cpp
            napi/napi_init.cpp
            )

#target_link_libraries(teststring PUBLIC libhilog_ndk.z.so libace_napi.z.so libc++.a)

find_library( # Sets the name of the path variable.
              EGL-lib
              # Specifies the name of the NDK library that
              # you want CMake to locate.
              EGL )
find_library( # Sets the name of the path variable.
              GLES-lib
              # Specifies the name of the NDK library that
              # you want CMake to locate.
              GLESv3 )

find_library( hilog-lib
              hilog_ndk.z )

find_library( libace-lib
              libace_ndk.z )

#find_library( # Sets the name of the path variable.
#              zgraphic.z-lib
              # Specifies the name of the NDK library that
              # you want CMake to locate.
#              zgraphic.z )

target_link_libraries(nativerender PUBLIC uv ${EGL-lib} ${GLES-lib} ${hilog-lib} ${zgraphic.z-lib} libace_napi.z.so libace_ndk.z.so libc++.a)
#target_link_libraries(nativerender PUBLIC ${EGL-lib} ${GLES-lib} ${hilog-lib} ${libace-lib} ${libnapi-lib} libc++.a)