# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(XComponent)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
add_definitions(-DOHOS_PLATFORM)

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
)

add_library(nativerender SHARED
    manager/PluginManagerTest.cpp
    NapiRenderInitTest.cpp
    framework/NodeXtsTest.cpp
    swiper/SwiperTest.cpp
    publicAttribute/XtsTestCaseTest.cpp
    publicAttribute/PublicAttributeTest.cpp
    xcomponent/XcomponentTextureTest.cpp
    xcomponent/XcomponentTest.cpp
    xcomponent/NodeXtsTest.cpp
    button/ButtonTest.cpp
    checkbox/CheckboxTest.cpp
    checkboxgroup/CheckboxgroupTest.cpp
    radio/RadioTest.cpp
    slider/SliderTest.cpp
    toggle/ToggleTest.cpp
)

add_library(nativefunc SHARED
    NapiFuncInitTest.cpp
)

find_library(
    # Sets the name of the path variable.
    hilog-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    hilog_ndk.z
)

find_library(
    # Sets the name of the path variable.
    libace-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    ace_ndk.z
)

find_library(
    # Sets the name of the path variable.
    libnapi-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    ace_napi.z
)

find_library(
    # Sets the name of the path variable.
    libuv-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    uv
)

target_link_libraries(nativerender PUBLIC
    libnative_drawing.so libpixelmap.so libace_napi.z.so ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib} libudmf.so)
target_link_libraries(nativefunc PUBLIC
libnative_drawing.so libpixelmap.so libace_napi.z.so libudmf.so ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib})