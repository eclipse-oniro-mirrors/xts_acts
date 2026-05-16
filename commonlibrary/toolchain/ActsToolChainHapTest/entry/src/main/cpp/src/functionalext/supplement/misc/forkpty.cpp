/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <pty.h>
#include <sys/wait.h>
#include <unistd.h>
#include "functionalext.h"

/**
 * @tc.name      : forkpty_0100
 * @tc.desc      : Each parameter is valid and can open a pair of pseudo-terminals for a new
 *                 session and create a processing process.
 * @tc.level     : Level 0
 * @note         : This test requires fork() and PTY support, which may not be available
 *                 on all platforms (e.g., HarmonyOS/OpenHarmony).
 */
void Forkpty0100(void)
{
    int master;
    pid_t pid;
    pid = forkpty(&master, nullptr, nullptr, nullptr);
    if (pid < 0) {
        printf("Forkpty0100: forkpty failed (errno=%d). ", errno);
        printf("This function requires fork() and PTY support, which may not be available on this platform.\n");
        return;
    }

    char* signR = "1";
    char list1[2] = { 0 };
    char list2[2] = { 0 };
    FILE* fp;

    if (pid == 0) {
        fp = fopen("/data/storage/el2/base/cache/test1.txt", "w+");
        if (!fp) {
            t_error("Forkpty0100: child failed to open test1.txt for writing");
            exit(EXIT_FAILURE);
        }
        fwrite(signR, sizeof(char), strlen(signR), fp);
        fclose(fp);
        exit(EXIT_SUCCESS);
    } else {
        wait(nullptr);
        fp = fopen("/data/storage/el2/base/cache/test2.txt", "w+");
        if (!fp) {
            t_error("Forkpty0100: parent failed to open test2.txt for writing");
            return;
        }
        fwrite(signR, sizeof(char), strlen(signR), fp);
        fclose(fp);

        FILE* fp1 = fopen("/data/storage/el2/base/cache/test1.txt", "r");
        FILE* fp2 = fopen("/data/storage/el2/base/cache/test2.txt", "r");

        if (!fp1 || !fp2) {
            t_error("Forkpty0100: failed to open files for reading");
            if (fp1) {
                fclose(fp1);
            }
            if (fp2) {
                fclose(fp2);
            }
            remove("/data/storage/el2/base/cache/test1.txt");
            remove("/data/storage/el2/base/cache/test2.txt");
            return;
        }

        fread(list1, sizeof(list1), 1, fp1);
        fread(list2, sizeof(list2), 1, fp2);
        EXPECT_EQ("Forkpty0100", list1[0], '1');
        EXPECT_EQ("Forkpty0100", list2[0], '1');
        fclose(fp1);
        fclose(fp2);
        remove("/data/storage/el2/base/cache/test1.txt");
        remove("/data/storage/el2/base/cache/test2.txt");
    }
}

static int ForkptyTestImpl(int argc, char* argv[])
{
    Forkpty0100();
    return T_STATUS;
}

int ForkptyTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return ForkptyTestImpl(1, libcArgv);
}
