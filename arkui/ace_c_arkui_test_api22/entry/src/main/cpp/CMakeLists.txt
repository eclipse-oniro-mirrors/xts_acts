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
    image/ImageAltTest.cpp
    textMinLines/MinLinesTest.cpp
    hasAxisTest/HasAxisTest.cpp
    InteractiveFramework/RegionListTest.cpp
    list/CoastingAxisTest.cpp
    component/ButtonComponentTest.cpp
    component/ComponentTest.cpp
    component/ListComponentTest.cpp
    component/TextComponentTest.cpp
    list/SnapSpeedTest.cpp
    list/LanesValueTest.cpp
    component/WaterFlowComponentTest.cpp
    waterFlow/WaterFlowFillPolicyTest.cpp
    image/ImageDrawableDescriptorTest.cpp
    image/ImageErrorTest.cpp
    textLineHeight/LineHeightTest.cpp
    textArea/TextAreaBarStateTest.cpp
    scrollbarTest/ScrollBarTest.cpp
    showCounterTest/ShowCounterTest.cpp
    component/SwiperComponentTest.cpp
    swiper/FinishAnimationTest.cpp
    imageSpanTest/ImageSpanTest.cpp
    customKeyboard/CustomKeyboardTest.cpp
    image/AnimationControllerTest.cpp
    component/GridComponentTest.cpp
    grid/GridFillPolicyTest.cpp
    grid/GridEventTest.cpp
    clipShape/ClipShapeTest.cpp
    CustomComponent/CustomMarkDirtyTest.cpp
    LayoutManager/LayoutManagerTest.cpp
    grid/GridAbilityTest.h
    grid/GridAbilityTest.cpp
    component/ScrollComponentTest.h
    component/ScrollComponentTest.cpp
    grid/GridDragTest.h
    grid/GridDragTest.cpp
)

add_library(nativefunc SHARED
    NapiFuncInitTest.cpp
    image/ImageDrawableErrorTest.cpp
    drag/DragReturnNullTest.cpp
    drag/DragReturnNullTest.h
    InteractiveFramework/NativeGestureBooleanTest.cpp
    InteractiveFramework/UiInputEventBooleanTest.cpp
    InteractiveFramework/LongPressGestureTest.cpp
    InteractiveFramework/LongPressGestureTest.h
    InteractiveFramework/EnumTest.cpp
    grid/GridAttrsTest.cpp
    component/ComponentTest.cpp
    component/GridComponentTest.cpp
    component/TextComponentTest.cpp
    BindSelectionMenu/BindSelectionMenuTest.cpp
    TextEditMenuOptions/TextEditMenuOptionsTest.cpp
    grid/GridAbilityTest.h
    grid/GridAbilityTest.cpp
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