# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(MyApplication)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(OPENHARMONY_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../../../../..)

set(src_sec
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/memset_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/secureprintoutput_a.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/sprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strcpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/fscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/fwscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/gets_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/memcpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/memmove_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/scanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/securecutil.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/secureinput_a.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/secureinput_w.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/secureprintoutput_w.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/snprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/sscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strcat_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strncat_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strncpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/strtok_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/swprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/swscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vfscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vfwscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vsnprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vsprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vsscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vswprintf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vswscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/vwscanf_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcscat_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcscpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcsncat_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcsncpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wcstok_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wmemcpy_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wmemmove_s.c
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/wscanf_s.c
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall  -g3 -Wunused-variable -DOHOS_JSVMTEST_XTS -DTEST_WASM -DTEST_ARRAY_BUFFER_BACKING_STORE -DTEST_TRACE -DTEST_DEFINE_CLASS_WITH_OPTIONS -DTEST_TRIGGER_EXCEPTIONS -DTEST_TRIGGER_GC -DTEST_WRAPPER_OBJECT -DTEST_WELL_KNOWN_SYMBOLS -Wunused-command-line-argument")
if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()
include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include
                    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/include
                    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src
                    ${OPENHARMONY_ROOT_PATH}/arkcompiler/jsvm/interface/kits
                    jsvmtest
                    jsvmtest/unittests/wasm-def)
add_library(entry2 SHARED ${src_sec}
    napi/napi_string_test.cpp
    napi/napi_error_test.cpp
    napi/napi_property_test.cpp
    napi/napi_datatype_test.cpp
    napi/napi_date_test.cpp
    napi/napi_executetasks_test.cpp
    napi/napi_json_test.cpp
    napi/napi_object_test.cpp
    napi/napi_strictqeuals_test.cpp
    napi/napi_arraytest.cpp
    napi/napi_arraybuffer_test.cpp
    napi/napi_basicdatatypes_test.cpp
    napi/napi_bigint_test.cpp
    napi/napi_class_test.cpp
    napi/napi_functioncall_test.cpp
    napi/napi_heapstatisticsdebugg_test.cpp
    napi/napi_lifecycle_test.cpp
    napi/napi_memorymanagementuse_test.cpp
    napi/napi_version_test.cpp
    napi/napi_promise_test.cpp)
target_link_libraries(entry2 PUBLIC libace_napi.z.so libjsvm.so)
target_link_directories(entry2 PUBLIC ${OPENHARMONY_ROOT_PATH}/out/generic_generic_arm_64only/general_all_phone_standard/gen/foundation/arkui/napi/jsvm/)

file(GLOB TEST_FILES jsvmtest/unittests/*.cpp)
add_library(entry SHARED napi/napi_test.cpp
    jsvmtest/jsvm_utils.cpp
    jsvmtest/jsvmtest.cpp
    ${TEST_FILES})
target_link_libraries(entry PUBLIC libace_napi.z.so libjsvm.so entry2)
target_link_directories(entry PUBLIC ${OPENHARMONY_ROOT_PATH}/out/generic_generic_arm_64only/general_all_phone_standard/gen/foundation/arkui/napi/jsvm/)

