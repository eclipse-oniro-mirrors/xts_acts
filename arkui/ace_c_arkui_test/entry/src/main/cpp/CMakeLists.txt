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

add_library(nativerender SHARED
    napi_render_init.cpp
    ${path}
)

add_library(nativefunc SHARED
    manager/plugin_manager.cpp
    napi_func_init.cpp
    ${path}
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
