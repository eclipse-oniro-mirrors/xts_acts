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
    customcomponent/CustomComponentOndrawBehindTest.cpp
    customcomponent/CustomComponentOndrawFrontTest.cpp
    onIdle/post_on_idle_test.cpp
    EmbeddedComponentOption/EmbeddedComponentOptionTest.cpp
    uiState/UiStatesTest.cpp
)

add_definitions("-DLOG_DOMAIN=0x0000")
add_definitions("-DLOG_TAG=\"testTag\"")
target_link_libraries(entry PUBLIC libpixelmap.so libnative_drawing.so libace_ndk.z.so libhilog_ndk.z.so)