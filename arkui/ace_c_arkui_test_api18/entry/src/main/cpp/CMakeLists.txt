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
    textpicker/text_picker_range_test.cpp
    textpicker/textPicker_enableHapticFeedback_test.cpp
    datepicker/datePicker_enableHapticFeedback_test.cpp
    swiper/swiper_indicator_test.cpp
    component/swiper_component.cpp
    component/text_component.cpp
    component/button_component.cpp
    ExpectedFrameRateRange/ExpectedFrameRateRange_callback_test.cpp
    visibleAreaEventOptions/visibleAreaEventOptions.cpp
    gestureRecognizer/GestureInterrupterTest.cpp
)

add_library(nativefunc SHARED
    manager/plugin_manager.cpp
    napi_func_init.cpp
    customdialog/customdialog_background.cpp
    customdialog/customdialog_test.cpp
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
    libnative_drawing.so libace_napi.z.so ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib} libudmf.so)
target_link_libraries(nativefunc PUBLIC
libnative_drawing.so libpixelmap.so libace_napi.z.so libudmf.so ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib})