/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <unistd.h>
#include "functionalext.h"

#define MAX_BUF 256
static const char LIB_PATH_1[] = "/data/storage/el1/bundle/libs/arm/libldso_debug_test_lib_6.so";
static const char LIB_PATH_1_ARM64[] = "/data/storage/el1/bundle/libs/arm64/libldso_debug_test_lib_6.so";
static const char LIB_PATH_2[] = "/data/storage/el1/bundle/libs/arm/libldso_debug_test_lib_8.so";
static const char LIB_PATH_2_ARM64[] = "/data/storage/el1/bundle/libs/arm64/libldso_debug_test_lib_8.so";
static const char LIB_PATH_3[] = "/data/storage/el1/bundle/libs/arm/libldso_debug_test_lib_9.so";
static const char LIB_PATH_3_ARM64[] = "/data/storage/el1/bundle/libs/arm64/libldso_debug_test_lib_9.so";

static bool FileExists(const char* path)
{
    return (path != nullptr && access(path, F_OK) == 0);
}

static int CheckLoaded(char* so)
{
    int pid = getpid();
    char path[MAX_BUF] = { 0 };
    int ret = snprintf(path, sizeof(path), "/proc/%d/maps", pid);
    if (ret < 0) {
        return 0;
    }
    FILE* fp = fopen(path, "r");
    if (fp == nullptr) {
        return 0;
    }

    char buffer[MAX_BUF] = { 0 };
    while (fgets(buffer, MAX_BUF, fp) != nullptr) {
        if (strstr(buffer, so) != nullptr) {
            int closeRet = fclose(fp);
            EXPECT_EQ("CheckLoaded", closeRet, 0);
            return 1;
        }
    }
    int closeRet = fclose(fp);
    EXPECT_EQ("CheckLoaded", closeRet, 0);
    return 0;
}

/**
 * @tc.name      : ldso_memleak_check_0100
 * @tc.desc      : dlopen so file libldso_debug_test_lib_6.so which has another DTNEEDED so file
 *                 libldso_debug_test_lib_7.so. but the libldso_debug_test_lib_7.so is not in device,
 *                 so the dlopen will fail, and we will check there is no memleak for so libldso_debug_test_lib_6.so
 * @tc.level     : Level 0
 */
void LdsoMemleakCheck0100(void)
{
    const char* libPath1 = FileExists(LIB_PATH_1) ? LIB_PATH_1 : LIB_PATH_1_ARM64;
    if (!FileExists(libPath1)) {
        return;
    }
    void* handle = dlopen(libPath1, RTLD_NOW);
    if (handle != nullptr) {
        t_error("dlopen(name=%s, mode=%d) should fail\n", libPath1, RTLD_NOW);
    }
    char* error = dlerror();
    if (error != nullptr && strstr(error, "libldso_debug_test_lib_7.so") == nullptr) {
        t_error("libldso_debug_test_lib_7.so should be not found, %s\n", error);
    }
    if (CheckLoaded(const_cast<char*>(libPath1))) {
        t_error("This so file should not exist in maps, %s\n", const_cast<char*>(libPath1));
    }
}

/**
 * @tc.name      : ldso_memleak_check_0200
 * @tc.desc      : dlopen so file libldso_debug_test_lib_8.so has DTNEEDED so file libldso_debug_test_lib_9.so.
 *                 libldso_debug_test_lib_9.so is dependent on libldso_debug_test_lib_10.so,
 *                 but the libldso_debug_test_lib_10.so is not in device, so the dlopen will fail,
 *                 and we will check there is no memleak for so libldso_debug_test_lib_8.so
 *                 and libldso_debug_test_lib_9.so
 * @tc.level     : Level 0
 */
void LdsoMemleakCheck0200(void)
{
    const char* libPath2 = FileExists(LIB_PATH_2) ? LIB_PATH_2 : LIB_PATH_2_ARM64;
    const char* libPath3 = FileExists(LIB_PATH_3) ? LIB_PATH_3 : LIB_PATH_3_ARM64;
    if (!FileExists(libPath2)) {
        return;
    }
    void* handle = dlopen(libPath2, RTLD_NOW);
    if (handle != nullptr) {
        t_error("dlopen(name=%s, mode=%d) should fail\n", libPath2, RTLD_NOW);
    }
    if (CheckLoaded(const_cast<char*>(libPath2))) {
        t_error("This so file should not exist in maps, %s\n", const_cast<char*>(libPath2));
    }
    if (CheckLoaded(const_cast<char*>(libPath3))) {
        t_error("This so file should not exist in maps, %s\n", const_cast<char*>(libPath3));
    }
}

static int LdsoMemleakCheckTestImpl(int argc, char* argv[])
{
    LdsoMemleakCheck0100();
    LdsoMemleakCheck0200();
    return T_STATUS;
}

int LdsoMemleakCheckTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return LdsoMemleakCheckTestImpl(1, libcArgv);
}
