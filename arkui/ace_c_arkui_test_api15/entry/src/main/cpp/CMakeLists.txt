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
    keyDisPatchTest/keyEventDispatch_test.cpp
    progress/progress_linear_style_test.cpp
	focusControl/focus_control.cpp
    textArea/textArea_letter_spacing.cpp
    list/list_test.cpp
    listScrollTo/list_scroll_to_test.cpp
    node/node_handle_by_id_test.cpp
    window/get_window_info_test.cpp
    lazyForEach/lazyforeach_expand_mode_test.cpp
    gesturetouchcancel/gesture_cancel.cpp
    snapShot/snap_shot.cpp
    snapShot/container.cpp
    scroll/scroll_backtotop_test.cpp
    checkboxgroup/checkboxgroup_group_test.cpp
    checkboxgroup/checkboxgroup_selectall_test.cpp
    checkbox/checkbox_group_test.cpp
    component/component.cpp
    component/grid_component.cpp
    component/list_component.cpp
    component/scroll_component.cpp
    component/waterflow_component.cpp
    component/button_component.cpp
    component/text_component.cpp
    gestureRecognizer/gestureRecognizer.cpp
    eventInfo/eventInfo.cpp
)

add_library(nativefunc SHARED
    napi_func_init.cpp
    listItemGroup/list_item_group_test.cpp
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
    libnative_drawing.so libace_napi.z.so ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib})
target_link_libraries(nativefunc PUBLIC
libnative_drawing.so libpixelmap.so libace_napi.z.so libudmf.so ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib})