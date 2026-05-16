# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(XComponent)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
add_definitions(-DOHOS_PLATFORM)

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
)

add_library(entry SHARED AniTest.cpp
    accessibilityValue/accessibilityValue.cpp
    arkuiXComponent/arkuiXComponent.cpp
    calendarPicker/calendarPicker_date_test.cpp
    customDialog/customDialog.cpp
    getGestureParam/getGestureParam.cpp
    dragEndPending/dragEndPending.cpp
    layoutCallbackOnNodeHandle/layoutCallbackOnNodeHandle.cpp
    pointerEvent/pointerEvent.cpp
    slider/slider_test.cpp
    surfaceHolder/surfaceHolder.cpp
    swiperArrowStyle/swiperArrowStyle.cpp
    swiperDigitIndicator/swiperDigitIndicator.cpp
    swiperIndicator/swiperIndicator.cpp
    textPickerCascade/textPickerCascade.cpp
    component/component.cpp
    component/calendarPicker_component.cpp
#    manager/plugin_manager.cpp
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

target_link_libraries(entry PUBLIC
    libnative_drawing.so libace_napi.z.so libpixelmap.so libudmf.so ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib})



