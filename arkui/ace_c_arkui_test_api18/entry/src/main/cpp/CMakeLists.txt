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
    manager/plugin_manager.cpp
    napi_render_init.cpp
    component/component.cpp
    component/datepicker_component.cpp
    datepicker/datepicker_test.cpp
    textpicker/textPicker_enableHapticFeedback_test.cpp
    datepicker/datePicker_enableHapticFeedback_test.cpp
    swiper/swiper_indicator_test.cpp
    component/swiper_component.cpp
    component/text_component.cpp
    component/button_component.cpp
    ExpectedFrameRateRange/ExpectedFrameRateRange_callback_test.cpp
    visibleAreaEventOptions/visibleAreaEventOptions.cpp
    gestureRecognizer/GestureInterrupterTest.cpp
    render/EGLRender.cpp
    XComponent/xcomponent_lifecycle_test.cpp
    button/button_font_scale_Test.cpp
)

add_library(nativefunc SHARED
    manager/plugin_manager.cpp
    napi_func_init.cpp
    swiper/swiper_dot_indicator_test.cpp
    swiper/swiper_arrowStyle_test.cpp
)

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

find_library(
    # Sets the name of the path variable.
    libwindow-lib
    native_window
)

target_link_libraries(nativerender PUBLIC
    libnative_drawing.so libace_napi.z.so ${EGL-lib} ${GLES-lib} ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib} libudmf.so libnative_window.so libpixelmap.so)
target_link_libraries(nativefunc PUBLIC
libnative_drawing.so libpixelmap.so libace_napi.z.so libudmf.so ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib})