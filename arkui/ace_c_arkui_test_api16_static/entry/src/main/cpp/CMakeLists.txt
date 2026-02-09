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

add_library(entry SHARED
    AniTest.cpp
    postFrame/post_frame_callback_test.cpp
    swiper/swiper_common.cpp
    swiper/swiper_onselect_test.cpp
    swiper/swiper_test.cpp
    component/component.cpp
    component/swiper_component.cpp
    component/text_component.cpp
    text/text_immutablf_font_weight.cpp
    textArea/textArea_letter_spacing.cpp
    textpicker/textpicker_columnwidths_test.cpp
    drag/drag_test.cpp
    move/node_util_move_test.cpp
    timePicker/time_picker_test.cpp
)

add_definitions("-DLOG_DOMAIN=0x0000")
add_definitions("-DLOG_TAG=\"testTag\"")
target_link_libraries(entry PUBLIC
    libnative_drawing.so libpixelmap.so libace_napi.z.so libace_ndk.z.so libhilog_ndk.z.so libudmf.so)