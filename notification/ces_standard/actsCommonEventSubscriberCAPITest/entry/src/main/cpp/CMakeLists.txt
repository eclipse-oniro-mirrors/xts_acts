# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsCommonEventSubscriberCAPITest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(subscribe SHARED
    napi_init.cpp
    commonevent/commonevent_ordered_test.cpp
    commonevent/commonevent_parameters_test.cpp
    commonevent/commonevent_publish_test.cpp
    commonevent/commonevent_publishinfo_test.cpp
  )
target_link_libraries(subscribe PUBLIC libace_napi.z.so libhilog_ndk.z.so libohcommonevent.so)