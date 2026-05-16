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
#include <cstdlib>
#include <unistd.h>
#include <sys/wait.h>
#include "functionalext.h"

/**
 * @tc.name      : fork_0100
 * @tc.desc      : The function call is successful and the process can be created
 * @tc.level     : Level 0
 */
void Fork0100()
{
    pid_t fpid;
    int count = 0;
    int options = 0;
    const char *signR = "1";
    const char *signF = "0";
    char list1[2];
    char list2[2];

    fpid = fork();
    if (fpid < 0) {
        t_error("%s error in fork!", __func__);
    } else if (fpid == 0) {
        FILE* fp = fopen("/data/storage/el2/base/cache/test1.txt", "w+");
        if (!fp) {
            t_error("failed to open test1.txt for writing");
        }
        fwrite(signR, sizeof(char), strlen(signR), fp);
        fclose(fp);
        _exit(EXIT_SUCCESS);
    } else {
        FILE* fp = fopen("/data/storage/el2/base/cache/test2.txt", "w+");
        if (!fp) {
            t_error("failed to open test2.txt for writing");
        }
        fwrite(signR, sizeof(char), strlen(signR), fp);
        fclose(fp);
        waitpid(fpid, nullptr, options);
	
        FILE *fp1 = fopen("/data/storage/el2/base/cache/test1.txt", "r");
        if (!fp1) {
            t_error("failed to open test1.txt for reading");
        }
        FILE *fp2 = fopen("/data/storage/el2/base/cache/test2.txt", "r");
        if (!fp2) {
            t_error("failed to open test2.txt for reading");
        }
        fread(list1, sizeof(list1), 1, fp1);
        fread(list2, sizeof(list2), 1, fp2);
        EXPECT_EQ("fork_0100", list1[0], '1');
        EXPECT_EQ("fork_0100", list2[0], '1');

        fclose(fp1);
        fclose(fp2);
        remove("/data/storage/el2/base/cache/test1.txt");
        remove("/data/storage/el2/base/cache/test2.txt");
    }
}

static int ForkTestImpl(int argc, char *argv[])
{
    Fork0100();
    return g_tStatus;
}

int ForkTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return ForkTestImpl(1, libcArgv);
}
