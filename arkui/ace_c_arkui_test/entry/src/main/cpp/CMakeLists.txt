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
    button/button_onclick_test.cpp
    checkbox/checkbox_onchange_test.cpp
    commonattrs/commonattrs_enabled_test.cpp
    commonattrs/commonattrs_focusable_test.cpp
    commonevent/commonevent_onappear_test.cpp
    commonevent/commonevent_onareachange_test.cpp
    commonevent/commonevent_onblur_test.cpp
    commonevent/commonevent_ontouch_test.cpp
    commonevent/pointevent_ontouch_test.cpp
    commonevent/commonevent_onfocus_test.cpp
    commonevent/commonevent_onclick_test.cpp
    commonattrs/commonattrs_hittestbehavior_test.cpp
    commonattrs/commonattrs_id_test.cpp
    customcomponent/customcomponent_onmeasure_test.cpp
    customcomponent/customcomponent_onlayout_test.cpp
    customcomponent/customcomponent_ondraw_test.cpp
    image/image_hittestbehavior_test.cpp
    image/image_id_test.cpp
    image/image_oncomplete_test.cpp
    image/image_onerror_test.cpp
    list/list_hittestbehavior_test.cpp
    list/list_nodeadapter_test.cpp
    list/list_nodeadapterevent_test.cpp
    listitem/listitem_hittestbehavior_test.cpp
    toggle/toggle_onchange_test.cpp
    toggle/toggle_enabled_test.cpp
    scroll/scroll_nestedscroll_test.cpp
    scroll/scroll_onscroll_test.cpp
    scroll/scroll_onscrollframebegin_test.cpp
    scroll/scroll_onscrollstart_test.cpp
    scroll/scroll_onscrollstop_test.cpp
    scroll/scroll_onappear_test.cpp
    scroll/scroll_onscrolledge_test.cpp
    scroll/scroll_scrolledge_test.cpp
    scroll/scroll_hittestbehavior_test.cpp
    scroll/scroll_scrollto_test.cpp
    scroll/scroll_currentoffset_test.cpp
    stack/stack_hittestbehavior_test.cpp
    stack/stack_onareachange_test
    stack/stack_ontouch_test.cpp
    text/text_enabled_test.cpp
    calendarpicker/calendarpicker_onchange_test.cpp
    textpicker/textpicker_onchange_test.cpp
    datepicker/datepicker_ondatechange_test.cpp
    timepicker/timepicker_onchange_test.cpp
    customcomponent/customcomponent_enabled_test.cpp
    customcomponent/customcomponent_focusable_test.cpp
    customcomponent/customcomponent_onappear_test.cpp
    customcomponent/customcomponent_onareachange_test.cpp
    customcomponent/customcomponent_onblur_test.cpp
    customcomponent/customcomponent_ontouch_test.cpp
    customcomponent/customcomponent_onfocus_test.cpp
    customcomponent/customcomponent_onclick_test.cpp
    customcomponent/customcomponent_hittestbehavior_test.cpp
    customcomponent/customcomponent_id_test.cpp
    textarea/textarea_enabled_test.cpp
    textinput/textinput_enabled_test.cpp
    textinput/textinput_onchange_test.cpp
    calendarpicker/calendarpicker_enabled_test.cpp
    datepicker/datepicker_enabled_test.cpp
    slider/slider_enabled_test.cpp
    checkbox/checkbox_enabled_test.cpp
    refresh/refresh_onstatechange_test.cpp
    refresh/refresh_onrefreshing_test.cpp
    textarea/textarea_onfocus_test.cpp
    textarea/textarea_onblur_test.cpp
    textarea/textarea_key_test.cpp
    textinput/textinput_key_test.cpp
    textarea/textarea_onchange_test.cpp
    slider/slider_onchange_test.cpp
    textinput/textinput_onfocus_test.cpp
    textinput/textinput_onblur_test.cpp
    textinput/textinput_onsubmit_test.cpp
    textinput/textinput_oncut_test.cpp
    textinput/textinput_onpaste_test.cpp
    arkApi/arkApi.cpp
    gesture/gesture_test.cpp
    gestureScroll/gesture_interfaceTest.cpp
    customcomponent/customcomponent_event_test.cpp
    text/text_CustomSpan_test.cpp
    system/system_ColorFontChange_test.cpp
    drag/drag_disableDefaultDropAnimation.cpp
    drag/drag_getPreDragStatus.cpp
    drag/drag_setSuggestedDropOperation.cpp
    drag/drag_setDragResult.cpp
    drag/drag_getDataTypesCount.cpp
    drag/drag_getDragResult.cpp
    drag/drag_getDropOperation.cpp
    drag/drag_getXY.cpp
    drag/drag_getWidthHeight.cpp
    drag/drag_getModifierKeyStates.cpp
    drag/dragAction_createDragAction.cpp
    drag/dragAction_setPointerId.cpp
    drag/dragAction_setTouchPointXY.cpp
    drag/dragAction_setDragPreviewOption.cpp
    drag/dragAction_registerStatusListener.cpp
    animation/animator_event_test.cpp
)

add_library(nativefunc SHARED
    napi_func_init.cpp
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