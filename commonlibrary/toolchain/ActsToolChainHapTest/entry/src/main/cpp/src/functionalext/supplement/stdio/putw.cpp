/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <cstdarg>
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <csignal>
#include <fcntl.h>
#include <cwchar>
#include "test.h"
#include <sys/wait.h>
#include "functionalext.h"

#define TEST_VALUE 10

static void DealAberrant(int code)
{
    if (code != SIGSEGV) {
        t_error("putw_0200 code is %d are not SIGSEGV", __func__, code);
    }
    exit(g_tStatus);
}

/**
 * @tc.name      : Putw0100
 * @tc.desc      : Test the putw method to write integers to the file
 * @tc.level     : Level 0
 */
void Putw0100(void)
{
    FILE *fp;
    char *file = "/data/storage/el2/base/cache/putw_test.txt";
    fp = fopen(file, "w+");
    if (fp == nullptr) {
        t_error("%s fopen failed\n", __func__);
        return;
    }
    int result = putw(TEST_VALUE, fp);
    if (result != 0) {
        t_error("%s putw error get result is %d are not want 0\n", __func__, result);
    }
    (void)fclose(fp);
    (void)remove(file);
}

/**
 * @tc.name      : Putw0200
 * @tc.desc      : Test the result of putw when the incoming file pointer is empty
 * @tc.level     : Level 2
 */
void Putw0200(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("putw_0200: Error forking process");
    } else if (pid == 0) {
        FILE *fp = nullptr;
        putw(TEST_VALUE, fp);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("putw_0200", SIGABRT, sig);
        }
    }
}

static int PutwTestImpl(int argc, char *argv[])
{
    Putw0100();
    Putw0200();
    return g_tStatus;
}

int PutwTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return PutwTestImpl(1, libcArgv);
}
