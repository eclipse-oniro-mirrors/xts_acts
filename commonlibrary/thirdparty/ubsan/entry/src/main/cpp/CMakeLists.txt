# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(UBSanXTS)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall  -g3 -Wunused-variable -Wunused-command-line-argument")
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

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/include
                    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src
                    ${OPENHARMONY_ROOT_PATH}/third_party/node/src
                    ${NATIVERENDER_ROOT_PATH}/common
                    ${NATIVERENDER_ROOT_PATH}/include)

add_compile_options(-shared-libsan -fsanitize=undefined)
add_library(entry SHARED napi_init.cpp ${src_sec})
target_link_libraries(entry PUBLIC libbundle_ndk.z.so libace_napi.z.so libclang_rt.ubsan_standalone.so)
