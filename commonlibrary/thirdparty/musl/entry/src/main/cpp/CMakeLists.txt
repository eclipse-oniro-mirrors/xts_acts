# Copyright (c) 2024 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(musl)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall  -g3 -Wunused-variable -Wunused-command-line-argument")
#set(CMAKE_CXX_VISIBILITY_PRESET default)
#set(CMAKE_VISIBILITY_INLINES_HIDDEN 0)
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

add_definitions("-DLOG_DOMAIN=0x0000")
add_definitions("-DLOG_TAG=\"testTag\"")

add_library(applicationTargetSdkVersionndk SHARED applicationTargetSdkVersionndk.cpp ${src_sec})
add_library(capabilityndk SHARED capabilityndk.cpp ${src_sec})

add_library(complexndk SHARED complexndk.cpp ${src_sec})
target_include_directories(complexndk PRIVATE
                           ${OPENHARMONY_ROOT_PATH}/third_party/musl/include)

add_library(deviceApiVersionndk SHARED deviceApiVersionndk.cpp ${src_sec})
add_library(ctypendk SHARED ctypendk.cpp ${src_sec})
add_library(direntndk SHARED direntndk.cpp ${src_sec})
add_library(errndk SHARED errndk.cpp ${src_sec})
add_library(fcntlndk SHARED fcntlndk.cpp ${src_sec})
add_library(fenvndk SHARED fenvndk.cpp ${src_sec})
add_library(fenvndk1 SHARED fenvndk1.cpp ${src_sec})
add_library(fsuidndk SHARED fsuidndk.cpp ${src_sec})
add_library(fsuidndk1 SHARED fsuidndk1.cpp ${src_sec})
add_library(ftwndk SHARED ftwndk.cpp ${src_sec})
add_library(getoptndk SHARED getoptndk.cpp ${src_sec})
add_library(globndk SHARED globndk.cpp ${src_sec})
add_library(iconvndk SHARED iconvndk.cpp ${src_sec})
add_library(ifndk SHARED ifndk.cpp ${src_sec})
add_library(initndk SHARED initndk.cpp ${src_sec})
add_library(inndk SHARED inndk.cpp ${src_sec})
add_library(ipcndk SHARED ipcndk.cpp ${src_sec})
add_library(klogndk SHARED klogndk.cpp ${src_sec})
add_library(klogndk1 SHARED klogndk1.cpp ${src_sec})
add_library(langinfondk SHARED langinfondk.cpp ${src_sec})
add_library(genndk SHARED libgenndk.cpp ${src_sec})
add_library(localendk SHARED localendk.cpp ${src_sec})
add_library(mallocndk SHARED mallocndk.cpp ${src_sec})
add_library(membarrierndk SHARED membarrierndk.cpp ${src_sec})
add_library(mmanndk SHARED mmanndk.cpp ${src_sec})
add_library(mmanndk1 SHARED mmanndk1.cpp ${src_sec})
add_library(mntentndk SHARED mntentndk.cpp ${src_sec})
add_library(mntentndk1 SHARED mntentndk1.cpp ${src_sec})
add_library(mountndk SHARED mountndk.cpp ${src_sec})
add_library(mountndk1 SHARED mountndk1.cpp ${src_sec})
add_library(msgndk SHARED msgndk.cpp ${src_sec})
add_library(nameserndk SHARED nameserndk.cpp ${src_sec})
add_library(nltypesndk SHARED nltypesndk.cpp ${src_sec})
add_library(otherstestndk SHARED otherstestndk.cpp ${src_sec})
add_library(personalityndk SHARED personalityndk.cpp ${src_sec})
add_library(pollndk SHARED pollndk.cpp ${src_sec})
add_library(prctlndk SHARED prctlndk.cpp ${src_sec})
add_library(ptracendk SHARED ptracendk.cpp ${src_sec})
add_library(ptyndk SHARED ptyndk.cpp ${src_sec})
add_library(pwdndk SHARED pwdndk.cpp ${src_sec})
add_library(quotandk SHARED quotandk.cpp ${src_sec})
add_library(quotandk1 SHARED quotandk1.cpp ${src_sec})
add_library(randomndk SHARED randomndk.cpp ${src_sec})
add_library(randomndk1 SHARED randomndk1.cpp ${src_sec})
add_library(resolvndk SHARED resolvndk.cpp ${src_sec})
add_library(searchndk SHARED searchndk.cpp ${src_sec})
add_library(searchndk1 SHARED searchndk1.cpp ${src_sec})
add_library(selectndk SHARED selectndk.cpp ${src_sec})
add_library(semndk SHARED semndk.cpp ${src_sec})
add_library(sendfilendk SHARED sendfilendk.cpp ${src_sec})
add_library(shmndk SHARED shmndk.cpp ${src_sec})
add_library(socketndk SHARED socketndk.cpp ${src_sec})
add_library(spawnndk SHARED spawnndk.cpp ${src_sec})
add_library(spawnndk1 SHARED spawnndk1.cpp ${src_sec})
add_library(statfsndk SHARED statfsndk.cpp ${src_sec})
add_library(statndk SHARED statndk.cpp ${src_sec})
add_library(statvfsndk SHARED statvfsndk.cpp ${src_sec})
add_library(stdioextndk SHARED stdioextndk.cpp ${src_sec})
add_library(stdioextndk1 SHARED stdioextndk1.cpp ${src_sec})
add_library(stroptsndk SHARED stroptsndk.cpp ${src_sec})
add_library(sysinfondk SHARED sysinfondk.cpp ${src_sec})
add_library(syslogndk SHARED syslogndk.cpp ${src_sec})
add_library(sysmmanndk SHARED sysmmanndk.cpp ${src_sec})
add_library(termiosndk SHARED termiosndk.cpp ${src_sec})
add_library(termiosndk1 SHARED termiosndk1.cpp ${src_sec})
add_library(tgkillndk SHARED tgkillndk.cpp ${src_sec})
add_library(threadsndk SHARED threadsndk.cpp ${src_sec})
add_library(threadsndk1 SHARED threadsndk1.cpp ${src_sec})
add_library(timerfdndk SHARED timerfdndk.cpp ${src_sec})
add_library(timesndk SHARED timesndk.cpp ${src_sec})
add_library(ucharndk SHARED ucharndk.cpp ${src_sec})
add_library(uiondk SHARED uiondk.cpp ${src_sec})
add_library(utimendk SHARED utimendk.cpp ${src_sec})
add_library(utmpndk SHARED utmpndk.cpp ${src_sec})
add_library(utsnamendk SHARED utsnamendk.cpp ${src_sec})
add_library(xattrndk SHARED xattrndk.cpp ${src_sec})
add_library(grpndk SHARED grpndk.cpp ${src_sec})
add_library(ifaddrsndk SHARED ifaddrsndk.cpp ${src_sec})
add_library(ifaddrsndk1 SHARED ifaddrsndk1.cpp ${src_sec})
add_library(inetndk SHARED inetndk.cpp ${src_sec})
add_library(inotifyndk SHARED inotifyndk.cpp ${src_sec})
add_library(inttypesndk SHARED inttypesndk.cpp ${src_sec})
add_library(mathndk SHARED mathndk.cpp ${src_sec})
add_library(netdbndk SHARED netdbndk.cpp ${src_sec})
add_library(pthreadndk SHARED pthreadndk.cpp ${src_sec})
add_library(pthreadndk1 SHARED pthreadndk1.cpp ${src_sec})
add_library(regexndk SHARED regexndk.cpp ${src_sec})
add_library(resourcendk SHARED resourcendk.cpp ${src_sec})
add_library(resourcendk1 SHARED resourcendk1.cpp ${src_sec})
add_library(schedndk SHARED schedndk.cpp ${src_sec})
add_library(semaphorendk SHARED semaphorendk.cpp ${src_sec})
add_library(semaphorendk1 SHARED semaphorendk1.cpp ${src_sec})
add_library(setjmpndk SHARED setjmpndk.cpp ${src_sec})
add_library(setjmpndk1 SHARED setjmpndk1.cpp ${src_sec})
add_library(signalndk SHARED signalndk.cpp ${src_sec})
add_library(stdiondk SHARED stdiondk.cpp ${src_sec})
add_library(stdiondk1 SHARED stdiondk1.cpp ${src_sec})
add_library(stdlibndk SHARED stdlibndk.cpp ${src_sec})
add_library(stringndk SHARED stringndk.cpp ${src_sec})
add_library(stringsndk SHARED stringsndk.cpp ${src_sec})
add_library(timendk SHARED timendk.cpp ${src_sec})
add_library(timendk1 SHARED timendk1.cpp ${src_sec})
add_library(unistdndk SHARED unistdndk.cpp ${src_sec})
add_library(unistdndk1 SHARED unistdndk1.cpp ${src_sec})
add_library(wcharndk SHARED wcharndk.cpp ${src_sec})
add_library(wcharndk1 SHARED wcharndk1.cpp ${src_sec})
add_library(wctypendk SHARED wctypendk.cpp ${src_sec})
add_library(swapndk SHARED swapndk.cpp ${src_sec})
add_library(dlfcnndk SHARED dlfcnndk.cpp ${src_sec})
#add_library(waitndk SHARED waitndk.cpp ${src_sec})
add_library(linkndk SHARED linkndk.cpp ${src_sec})
add_library(auxv1ndk SHARED auxv1ndk.cpp ${src_sec})
add_library(capability1ndk SHARED capability1ndk.cpp ${src_sec})
add_library(dirent1ndk SHARED dirent1ndk.cpp ${src_sec})
add_library(fcntl1ndk SHARED fcntl1ndk.cpp ${src_sec})
add_library(ftw1ndk SHARED ftw1ndk.cpp ${src_sec})
add_library(getopt1ndk SHARED getopt1ndk.cpp ${src_sec})
add_library(glob1ndk SHARED glob1ndk.cpp ${src_sec})
add_library(grp1ndk SHARED grp1ndk.cpp ${src_sec})
add_library(inotify1ndk SHARED inotify1ndk.cpp ${src_sec})
add_library(locale1ndk SHARED locale1ndk.cpp ${src_sec})
add_library(malloc1ndk SHARED malloc1ndk.cpp ${src_sec})
add_library(stat1ndk SHARED stat1ndk.cpp ${src_sec})

target_link_libraries(applicationTargetSdkVersionndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(capabilityndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(complexndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(deviceApiVersionndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(ctypendk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(direntndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(errndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(fcntlndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(fenvndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(fenvndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(fsuidndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(fsuidndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(ftwndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(getoptndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(globndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(iconvndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(ifndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(initndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(inndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(ipcndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(klogndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(klogndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(langinfondk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(genndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(localendk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(mallocndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(membarrierndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(mmanndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(mmanndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(mntentndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(mntentndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(mountndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(mountndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(msgndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(nameserndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(nltypesndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(otherstestndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(personalityndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(pollndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(prctlndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(ptracendk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(ptyndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(pwdndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(quotandk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(quotandk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(randomndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(randomndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(resolvndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(searchndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(searchndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(selectndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(semndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(sendfilendk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(shmndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(socketndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(spawnndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(spawnndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(statfsndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(statndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(statvfsndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(stdioextndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(stdioextndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(stroptsndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(sysinfondk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(syslogndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(sysmmanndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(termiosndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(termiosndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(tgkillndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(threadsndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(threadsndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(timerfdndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(timesndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(ucharndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(uiondk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(utimendk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(utmpndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(utsnamendk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(xattrndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(grpndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(ifaddrsndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(ifaddrsndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(inetndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(inotifyndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(inttypesndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(mathndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(netdbndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(pthreadndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(pthreadndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(regexndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(resourcendk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(resourcendk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(schedndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(semaphorendk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(semaphorendk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(setjmpndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(setjmpndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(signalndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(stdiondk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(stdiondk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(stdlibndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(stringndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(stringsndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(timendk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(timendk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(unistdndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(unistdndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(wcharndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(wcharndk1 PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(wctypendk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(swapndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(dlfcnndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
#target_link_libraries(waitndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(linkndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(auxv1ndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(capability1ndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(dirent1ndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(fcntl1ndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(ftw1ndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(getopt1ndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(glob1ndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(grp1ndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(inotify1ndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(locale1ndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(malloc1ndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)
target_link_libraries(stat1ndk PUBLIC libace_napi.z.so libhilog_ndk.z.so)