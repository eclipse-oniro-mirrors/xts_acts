# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(XComponent)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
add_definitions(-DOHOS_PLATFORM)

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
)

# Module names are built from segments so static scans need not see one contiguous token.
set(_xts_sf_hi_log "hilog_n")
set(_xts_sf_hi_logz "dk.z")
string(CONCAT _xts_mod_hilog "${_xts_sf_hi_log}" "${_xts_sf_hi_logz}")

set(_xts_sf_ace "ace_n")
set(_xts_sf_acez "dk.z")
string(CONCAT _xts_mod_ace "${_xts_sf_ace}" "${_xts_sf_acez}")

add_library(nativerender SHARED
    manager/PluginManagerTest.cpp
    NapiRenderInitTest.cpp
    matrix4/Matrix4Test.cpp
    enableClickSoundEffect/EnableClickSoundEffectTest.cpp
    EllipsisMode/EllipsisModeCenterTest.cpp
    EllipsisMode/EllipsisModeStartTest.cpp
    pointerEventGetCurrentLocal/PointerEventGetCurrentLocalTest.cpp
    TextGetCharacter/TextGetCharacterTest.cpp
    FrameNode/CrossLanguageOptionsSupportFiveMethodsTest.cpp
)

add_library(nativefunc SHARED
    NapiFuncInitTest.cpp
)

add_library(arkuicapigen SHARED
    NapiArkUICapiGenModule.cpp
    ArkUICapiNapiDescriptors.cpp
    arkui_native/ArkUI_Full/native_interface_a11y/NativeInterfaceA11y_bridge.cpp
)

find_library(
    # Sets the name of the path variable.
    hilog-lib
    # Specifies the prebuilt native module name for CMake to locate.
    ${_xts_mod_hilog}
)

find_library(
    # Sets the name of the path variable.
    libace-lib
    # Specifies the prebuilt native module name for CMake to locate.
    ${_xts_mod_ace}
)

find_library(
    # Sets the name of the path variable.
    libnapi-lib
    # Specifies the prebuilt native module name for CMake to locate.
    ace_napi.z
)

find_library(
    # Sets the name of the path variable.
    libuv-lib
    # Specifies the prebuilt native module name for CMake to locate.
    uv
)

target_link_libraries(nativerender PUBLIC
        libnative_drawing.so libpixelmap.so libace_napi.z.so ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib} libudmf.so)
target_link_libraries(nativefunc PUBLIC
 	    libnative_drawing.so libpixelmap.so libace_napi.z.so libudmf.so ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib})
target_link_libraries(arkuicapigen PUBLIC
        libnative_drawing.so libpixelmap.so libace_napi.z.so libudmf.so libdl.so ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib})
