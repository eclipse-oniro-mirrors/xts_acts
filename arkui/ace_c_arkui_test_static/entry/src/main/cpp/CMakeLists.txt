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

add_library(entry SHARED
    AniTest.cpp
    ${path}
)

add_definitions("-DLOG_DOMAIN=0x0000")
add_definitions("-DLOG_TAG=\"testTag\"")
target_link_libraries(entry PUBLIC libudmf.so libpixelmap.so libnative_drawing.so libace_ndk.z.so libhilog_ndk.z.so)