# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(XComponent)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
add_definitions(-DOHOS_PLATFORM)

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
    PUBLIC component
)

function(getAllCpp path parentDir exclude)
    set(LOCAL_LIST)
    file(GLOB ALL_DIR RELATIVE ${parentDir} ${parentDir}/*)
    foreach(ITEM ${ALL_DIR})
        set(ITEM_DIR ${parentDir}/${ITEM})
        set(FIND_BOOL FALSE)
        foreach(dir ${exclude})
            if("${dir}" STREQUAL "${ITEM}")
                set(FIND_BOOL TRUE)
                break()
            endif()
        endforeach()
        if ("${FIND_BOOL}" STREQUAL "FALSE")
            if(EXISTS ${ITEM_DIR})
                file(GLOB ALL_FILE ${ITEM_DIR}/*.cpp)
                list(APPEND LOCAL_LIST ${ALL_FILE})
            endif()
        endif ()
    endforeach()
    set(path ${LOCAL_LIST} PARENT_SCOPE)
endfunction()

set(path)
set(exclude "types")
set(CMAKE_CXX_STANDARD 17)
getAllCpp("${path}" ${PROJECT_SOURCE_DIR} "${exclude}")

add_library(entry SHARED AniTest.cpp
    calendarpicker/calendarpicker_hintradius_test.cpp
    calendarpicker/calendarpicker_edgealign_test.cpp
    calendarpicker/calendarpicker_textstyle_test.cpp
    calendarpicker/calendarpicker_width_test.cpp
    calendarpicker/calendarpicker_selecteddate_test.cpp
    calendarpicker/calendarpicker_onchange_test.cpp
    calendarpicker/calendarpicker_enabled_test.cpp
    textarea/textarea_onpaste_test.cpp
    textinput/textinput_oncut_test.cpp
    textinput/textinput_onpaste_test.cpp
    textinput/textinput_method_test.cpp
    manager/plugin_manager.cpp

#    ${path}
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
