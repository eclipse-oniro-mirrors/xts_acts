# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(keyCodeNdk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(nativexcomponent SHARED
    component/NativeXComponentTest.cpp
    component/ComponentTest.cpp
    component/XComponentTest.cpp
    touch/TouchPointTest.cpp
    mouse/XComponentMouseTest.cpp
    node/NodeAttributeTest.cpp
    node/NodeDetachTest.cpp
    common/CommonTest.cpp
    componentapi/AnimateOptionFinishCallbackTest.cpp
    componentapi/CommonAttrsAccessibilityActionTest.cpp
    componentapi/ComponentApiTest.cpp
    componentapi/UiStatesTest.cpp
    componentapi/ListItemGroupAreaTest.cpp
    componentapi/ListItemSwipeActionStateTest.cpp
)

add_library(uiinputeventndk SHARED
    uiinputevent/UIInputEventTest.cpp
    common/CommonTest.cpp)

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

target_link_libraries(nativexcomponent PUBLIC
    ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib} libudmf.so libace_napi.z.so libability_base_want.so)

add_library(accessibilityndk SHARED accessibilitytest/AccessibilityTest.cpp
                                    accessibilitytest/Accessibility1Test.cpp
                                    accessibilitytest/Accessibility2Test.cpp
                                    accessibilitytest/Accessibility3Test.cpp
                                    accessibilitytest/Accessibility4Test.cpp
                                    accessibilitytest/Accessibility5Test.cpp
                                    accessibilitytest/Accessibility6Test.cpp
                                    common/CommonTest.cpp
)
target_link_libraries(accessibilityndk PUBLIC libace_napi.z.so libhilog_ndk.z.so libos_account_ndk.so libohinput.so
                            libace_ndk.z.so)

add_library(animatendk SHARED animateoptiontest/AnimatorOptionTest.cpp
                              animateoptiontest/KeyframeAnimateOptionTest.cpp
                              animateoptiontest/AnimatorOption1Test.cpp
                              animateoptiontest/AnimatorOption2Test.cpp
                              common/CommonTest.cpp
                              animateoptiontest/AnimatorTest.cpp)
target_link_libraries(animatendk PUBLIC libace_napi.z.so libhilog_ndk.z.so libos_account_ndk.so libohinput.so
                            libace_ndk.z.so)

add_library(keyeventndk SHARED arkuikeyeventtest/ArkUIKeyEventTest.cpp
                               arkuikeyeventtest/ArkUIKeyEventTypeTest.cpp
                               arkuikeyeventtest/ArkUIKeyIntensionTest.cpp
                               arkuikeyeventtest/ArkUIKeySourceTypeTest.cpp
                               common/CommonTest.cpp)
target_link_libraries(keyeventndk PUBLIC libace_napi.z.so libhilog_ndk.z.so libos_account_ndk.so libohinput.so
                          libace_ndk.z.so)

add_library(nativedialog SHARED nativedialog/NativeDialogTestcaseExportTest.cpp
                                nativedialog/NativeDialogTest.cpp
                                common/CommonTest.cpp)
target_link_libraries(nativedialog PUBLIC libace_napi.z.so libhilog_ndk.z.so libace_ndk.z.so)

add_library(nativegesturendk SHARED nativegesture/NativeGestureTest.cpp
                                    nativegesture/NativeGesture1Test.cpp
                                    nativegesture/NativeGesture2Test.cpp
                                    nativegesture/NativeGestureTypeTest.cpp
                                    common/CommonTest.cpp)
target_link_libraries(nativegesturendk PUBLIC libace_napi.z.so libhilog_ndk.z.so libace_ndk.z.so)

add_library(noderenderndk SHARED
    nodeevent/NapiRenderInitTest.cpp
    focuscontrol/FocusControlTest.cpp
    nodeevent/NodeEventTest.cpp
    keyevent/KeyEventTest.cpp
    nodeadapter/NodeAdapterTest.cpp
    nodecontent/NodeContentTest.cpp
    snapshot/SnapShotTest.cpp
    scope/RunTaskInScopeTest.cpp
    nodenapi/NodeNapiTest.cpp
    nodenapi/NodeNapi1Test.cpp
    nodenapi/NodeNapi2Test.cpp
    nodenapi/NodeNapi3Test.cpp
    nodenapi/NodeNapi4Test.cpp
    nodenapi/NavigationTest.cpp
    nodeutilstest/NodeUtils1Test.cpp
    nodeutilstest/NodeUtilsTest.cpp
    nodeutilstest/NodeUtils2Test.cpp
    common/CommonTest.cpp
    textinputcontenttype/TextInputContentTypeTest.cpp
    textinputcontenttype/ScrollStateTest.cpp
    textinputcontenttype/AccessibilityTypeTest.cpp
    textinputcontenttype/NodeEventTypeTest.cpp
    nodenapi/NapiEnvTest.cpp
)

target_link_libraries(noderenderndk PUBLIC libace_napi.z.so libhilog_ndk.z.so libos_account_ndk.so libohinput.so
libace_ndk.z.so libpixelmap.so)

target_link_libraries(uiinputeventndk PUBLIC libace_napi.z.so libhilog_ndk.z.so libohinput.so libace_ndk.z.so)

add_library(nativetype SHARED
    nativetype/NativeTypeTest.cpp
    nativetype/NativeTypeInitTest.cpp
    common/CommonTest.cpp
)

target_link_libraries(nativetype PUBLIC
    libace_napi.z.so
    libhilog_ndk.z.so
    libos_account_ndk.so
    libohinput.so
    libace_ndk.z.so)

add_library(osaccountndk SHARED
    ArkuiNdkTest.cpp
    DialogTest.cpp
    DragAndDropTest.cpp
    DragAndDrop1Test.cpp
    DragAndDrop2Test.cpp)
target_link_libraries(osaccountndk PUBLIC libace_napi.z.so libhilog_ndk.z.so libos_account_ndk.so
                      libace_ndk.z.so libace_ndk.z.so libnative_display_manager.so libace_ndk.z.so
                      libpixelmap.so libudmf.so)
add_library(displaymanager SHARED displaymanager/DisplayManagerTest.cpp displaymanager/DisplayTest.cpp)
target_link_libraries(displaymanager PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_display_manager.so libace_ndk.z.so)