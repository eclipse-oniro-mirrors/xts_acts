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
    component/ComponentTest.cpp
    component/TextComponentTest.cpp
    component/ContainerPickerComponentTest.cpp
    containerPicker/ContainerPickerOnChangeTest.cpp
    containerPicker/ContainerPickerOnScrollStopTest.cpp
    chainWeight/ChainWeightTest.cpp
    border/BorderTest.cpp
    border/BorderRadiusTest.cpp
    layout/IgnoreLayoutSafeAreaTest.cpp
    layout/LayoutGravityTest.cpp
    flex/FlexSpaceTest.cpp
    column/ColumnSpaceTest.cpp
    row/RowSpaceTest.cpp
    column/ColumnReverseTest.cpp
    row/RowReverseTest.cpp
    text/TextCompressLeadingPunctuationTest.cpp
    textArea/TextAreaCompressLeadingPunctuationTest.cpp
    textInput/TextInputCompressLeadingPunctuationTest.cpp
    distance/DistanceTest.cpp
    hoverEffect/HoverEffectTest.cpp
    monopolize/MonopolizeTest.cpp
    textSelection/TextSelectionTest.cpp
    node/ConvertPositionToWindowTest.cpp
    node/IsInRenderStateTest.cpp
    node/ConvertPositionFromWindowTest.cpp
    ScrollToVisible/ScrollToVisibleTest.cpp
    deleteBackward/DeleteBackwardTest.cpp
    deleteBackward/TextAreaDeleteBackwardTest.cpp
    textTest/TexeTest.cpp
    textTest/TextInputTest.cpp
    textTest/TextAreaTest.cpp
)

add_library(nativefunc SHARED
    NapiFuncInitTest.cpp
    component/ComponentTest.cpp
    containerPicker/ContainerPickerCanLoopTest.cpp
    containerPicker/ContainerPickerEnableHapticFeedbackTest.cpp
    containerPicker/ContainerPickerSelectedIndexTest.cpp
    containerPicker/ContainerPickerSelectionIndicatorTest.cpp
    containerPicker/ContainerPickerSubComponentTest.cpp
    TextMarqueeOptions/TextMarqueeOptionsTest.cpp
    TextMarqueeOptions/ControllerBaseCreatTest.cpp
    image/ImageAntialiasedTest.cpp
)

add_library(nativeNode SHARED 
    InitTest.cpp 
    SelectedDragPreviewStyle/SelectedDragPreviewStyleTest.cpp 
    SelectedDragPreviewStyle/ContainerTest.cpp
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
target_link_libraries(nativeNode PUBLIC libace_napi.z.so)
target_link_libraries(nativeNode PUBLIC libace_napi.z.so)
target_link_libraries(nativeNode PUBLIC libace_ndk.z.so)
target_link_libraries(nativeNode PUBLIC libnative_drawing.so)
target_link_libraries(nativeNode PUBLIC libhilog_ndk.z.so)
target_link_libraries(nativeNode PUBLIC libhilog_ndk.z.so libpixelmap.so)
target_link_libraries(nativeNode PUBLIC libudmf.so)