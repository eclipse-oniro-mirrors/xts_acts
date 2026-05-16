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
    setKeyProcessingMode/key_processing_mode.cpp
    scroll/scroll_backtotop_test.cpp
    component/component.cpp
    component/grid_component.cpp
    component/list_component.cpp
    component/scroll_component.cpp
    component/waterflow_component.cpp
    component/button_component.cpp
    component/text_component.cpp
    focusControl/focus_control.cpp
    getGestureParam/getGestureParam.cpp
)

add_definitions("-DLOG_DOMAIN=0x0000")
add_definitions("-DLOG_TAG=\"testTag\"")
target_link_libraries(entry PUBLIC libpixelmap.so libnative_drawing.so libace_ndk.z.so libhilog_ndk.z.so)