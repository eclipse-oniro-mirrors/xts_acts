/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <unistd.h>
#include "functionalext.h"

#define LIB_PATH_1 "/data/tests/libc-test/src/libldso_debug_test_lib_1.so"
#define LIB_PATH_2 "/data/tests/libc-test/src/libldso_debug_test_lib_2.so"
#define LIB_PATH_3 "/data/tests/libc-test/src/libldso_debug_test_lib_3.so"
#define LIB_PATH_4 "/data/tests/libc-test/src/libldso_debug_test_lib_4.so"
#define LIB_PATH_5 "/data/tests/libc-test/src/libldso_debug_test_lib_5.so"
#define LIB_PATH_6 "/data/tests/libc-test/src/libldso_debug_test_lib_6.so"
#define LIB_PATH_BAK "/data/tests/libc-test/src/libldso_debug_test_lib_bak.so"
#define LIB_PATH_FOR_HISYSEVENT_TEST_0005 "/data/local/tmp/libldso_debug_for_hisysevent_test.so"
#define LIB_PATH_FOR_HISYSEVENT_TEST_0006 "/lib/ld-musl-aarch64.so.1"

#define TEST_LIB_LOADING_TIME 20
#define HISYSEVENT_WAIT_US 100000

typedef void (*TEST_FUN)(void);
constexpr int PROC_CMDLINE_BUF_LEN = 256;

static const char* GetProcessName()
{
    static char processName[PROC_CMDLINE_BUF_LEN] = { 0 };
    FILE* cmdline = fopen("/proc/self/cmdline", "r");
    if (cmdline == nullptr) {
        return "unknown_process";
    }
    if (fgets(processName, sizeof(processName), cmdline) == nullptr || processName[0] == '\0') {
        fclose(cmdline);
        return "unknown_process";
    }
    fclose(cmdline);
    return processName;
}

/**
 * @tc.name      : LdsoDebugTest0001
 * @tc.desc      : Loading three dsos and unload them not in order.
 * @tc.level     : Level 0
 */
void LdsoDebugTest0001(void)
{
    printf("[%s][Line: %d][%s]: entry\n", __FILE__, __LINE__, __func__);

    void* handleLib1 = dlopen(LIB_PATH_1, RTLD_NOW);
    EXPECT_PTRNE("LdsoDebugTest0001", handleLib1, NULL);
    void* handleLib2 = dlopen(LIB_PATH_2, RTLD_NOW);
    EXPECT_PTRNE("LdsoDebugTest0001", handleLib2, NULL);
    void* handleLib3 = dlopen(LIB_PATH_3, RTLD_NOW);
    EXPECT_PTRNE("LdsoDebugTest0001", handleLib3, NULL);

    EXPECT_EQ("LdsoDebugTest0001", dlclose(handleLib1), 0);
    EXPECT_EQ("LdsoDebugTest0001", dlclose(handleLib3), 0);
    EXPECT_EQ("LdsoDebugTest0001", dlclose(handleLib2), 0);

    printf("[%s][Line: %d][%s]: end\n", __FILE__, __LINE__, __func__);
}

/**
 * @tc.name      : LdsoDebugTest0002
 * @tc.desc      : Loading one dso and reload it for 20 times.
 * @tc.level     : Level 0
 */
void LdsoDebugTest0002(void)
{
    printf("[%s][Line: %d][%s]: entry\n", __FILE__, __LINE__, __func__);

    void* handleLib1 = dlopen(LIB_PATH_1, RTLD_NOW);
    EXPECT_PTRNE("LdsoDebugTest0002", handleLib1, NULL);

    for (int i = 0; i < TEST_LIB_LOADING_TIME; i++) {
        handleLib1 = dlopen(LIB_PATH_1, RTLD_NOW);
        EXPECT_PTRNE("LdsoDebugTest0002", handleLib1, NULL);
    }

    EXPECT_EQ("LdsoDebugTest0002", dlclose(handleLib1), 0);

    printf("[%s][Line: %d][%s]: end\n", __FILE__, __LINE__, __func__);
}

/**
 * @tc.name      : LdsoDebugTest0003
 * @tc.desc      : Loading a dso which depends on non-existing dso.
 * @tc.level     : Level 0
 */
void LdsoDebugTest0003(void)
{
    printf("[%s][Line: %d][%s]: entry\n", __FILE__, __LINE__, __func__);

    EXPECT_EQ("LdsoDebugTest0003", rename(LIB_PATH_5, LIB_PATH_BAK), 0);

    void* handleLib4 = dlopen(LIB_PATH_4, RTLD_NOW);
    EXPECT_PTREQ("LdsoDebugTest0003", handleLib4, NULL);

    EXPECT_EQ("LdsoDebugTest0003", rename(LIB_PATH_BAK, LIB_PATH_5), 0);

    printf("[%s][Line: %d][%s]: end\n", __FILE__, __LINE__, __func__);
}

/**
 * @tc.name      : LdsoDebugTest0004
 * @tc.desc      : Loading a dso which is not exist.
 * @tc.level     : Level 0
 */
void LdsoDebugTest0004(void)
{
    printf("[%s][Line: %d][%s]: entry\n", __FILE__, __LINE__, __func__);

    void* handleLib6 = dlopen(LIB_PATH_6, RTLD_NOW);
    EXPECT_PTREQ("LdsoDebugTest0004", handleLib6, nullptr);

    printf("[%s][Line: %d][%s]: end\n", __FILE__, __LINE__, __func__);
}

/**
 * @tc.name      : LdsoDebugTest0005
 * @tc.desc      : Verify HiSysEvent is NOT triggered.
 * @tc.level     : Level 0
 */
void LdsoDebugTest0005(void)
{
    printf("[%s][Line: %d][%s]: entry\n", __FILE__, __LINE__, __func__);

    FILE* fp = NULL;
    char line[512] = { 0 };
    char expectedStr[512] = { 0 };
    int eventFound = 0;

    void* handle = dlopen(LIB_PATH_FOR_HISYSEVENT_TEST_0005, RTLD_NOW);
    EXPECT_PTRNE("LdsoDebugTest0005", handle, NULL);

    usleep(HISYSEVENT_WAIT_US);

    fp = popen("hisysevent -l -n DLOPEN_WITH_ABSOLUTE_PATH 2>/dev/null", "r");
    if (fp != NULL) {
        snprintf(expectedStr, sizeof(expectedStr), "%s:%s", GetProcessName(), LIB_PATH_FOR_HISYSEVENT_TEST_0005);

        // Search for the expected string in HiSysEvent output
        while (fgets(line, sizeof(line), fp) != NULL) {
            if (strstr(line, expectedStr) != NULL) {
                eventFound = 1;
                printf("[%s][Line: %d][%s] failed: data should NOT be found: %s", __FILE__, __LINE__, __func__, line);
                break;
            }
        }
        pclose(fp);
        EXPECT_EQ("ldso_debug_test_0005_event_found", eventFound, 0);
    } else {
        t_error("%s: failed to run hisysevent command\n", __func__);
    }

    if (handle) {
        EXPECT_EQ("ldso_debug_test_0005_dlclose", dlclose(handle), 0);
    }

    printf("[%s][Line: %d][%s]: end\n", __FILE__, __LINE__, __func__);
}

/**
 * @tc.name      : LdsoDebugTest0006
 * @tc.desc      : Verify HiSysEvent is triggered when dlopen file path contains special headers.
 * @tc.level     : Level 0
 */
void LdsoDebugTest0006(void)
{
    printf("[%s][Line: %d][%s]: entry\n", __FILE__, __LINE__, __func__);

    FILE* fp = NULL;
    char line[512] = { 0 };
    char expectedStr[512] = { 0 };
    int eventFound = 0;

    void* handle = dlopen(LIB_PATH_FOR_HISYSEVENT_TEST_0006, RTLD_NOW);
    EXPECT_PTRNE("LdsoDebugTest0006", handle, NULL);

    usleep(HISYSEVENT_WAIT_US);

    fp = popen("hisysevent -l -n DLOPEN_WITH_ABSOLUTE_PATH 2>/dev/null", "r");
    if (fp != NULL) {
        snprintf(expectedStr, sizeof(expectedStr), "%s:%s", GetProcessName(), LIB_PATH_FOR_HISYSEVENT_TEST_0006);

        while (fgets(line, sizeof(line), fp) != NULL) {
            if (strstr(line, expectedStr) != NULL) {
                eventFound = 1;
                printf("[%s][Line: %d][%s] success: HiSysEvent found: %s", __FILE__, __LINE__, __func__, line);
                break;
            }
        }
        pclose(fp);
        EXPECT_EQ("ldso_debug_test_0006_event_found", eventFound, 1);
    } else {
        printf("[%s][Line: %d][%s]: Warning - failed to run hisysevent command\n", __FILE__, __LINE__, __func__);
    }

    if (handle) {
        EXPECT_EQ("ldso_debug_test_0006_dlclose", dlclose(handle), 0);
    }

    printf("[%s][Line: %d][%s]: end\n", __FILE__, __LINE__, __func__);
}

static TEST_FUN g_gFunArray[] = {
    LdsoDebugTest0001, LdsoDebugTest0002, LdsoDebugTest0003, LdsoDebugTest0004, LdsoDebugTest0005, LdsoDebugTest0006,
};

static int LdsoDebugTestTestImpl(void)
{
    printf("[%s][Line: %d][%s]: entry\n", __FILE__, __LINE__, __func__);
    int num = sizeof(g_gFunArray) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }
    printf("[%s][Line: %d][%s]: end\n", __FILE__, __LINE__, __func__);
    return 0;
}

int LdsoDebugTestTest(void)
{
    return LdsoDebugTestTestImpl();
}
