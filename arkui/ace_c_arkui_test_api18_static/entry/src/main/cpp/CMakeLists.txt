# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ani_test)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_CXX_STANDARD 17)
if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED AniTest.cpp
    gestureRecognizer/GestureInterrupterTest.cpp
    datepicker/datepicker_test.cpp
    datepicker/datePicker_enableHapticFeedback_test.cpp
    component/swiper_component.cpp
    component/text_component.cpp
    component/button_component.cpp
    component/component.cpp
    component/datepicker_component.cpp
    ExpectedFrameRateRange/ExpectedFrameRateRange_callback_test.cpp
    swiper/swiper_dot_indicator_test.cpp
    swiper/swiper_arrowStyle_test.cpp
    swiper/swiper_indicator_test.cpp
    textpicker/textPicker_enableHapticFeedback_test.cpp
    visibleAreaEventOptions/visibleAreaEventOptions.cpp
)

add_definitions("-DLOG_DOMAIN=0x0000")
add_definitions("-DLOG_TAG=\"testTag\"")
target_link_libraries(entry PUBLIC libpixelmap.so libnative_drawing.so libace_ndk.z.so libhilog_ndk.z.so)