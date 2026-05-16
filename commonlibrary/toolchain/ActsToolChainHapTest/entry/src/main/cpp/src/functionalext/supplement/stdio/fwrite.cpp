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

#include "functionalext.h"
#include <unistd.h>
#include <fcntl.h>
#include <cstdlib>

static const char *PATH = "/data/storage/el2/base/cache/test.txt";

/**
 * @tc.name      : Fwrite0100
 * @tc.desc      : File pointer at the end of a file, the position to which the current file pointer points
 * @tc.level     : Level 0
 */
static void Fwrite0100(void)
{
    FILE *fptr = fopen(PATH, "w+");
    EXPECT_PTRNE("Fwrite0100", fptr, NULL);

    char buf[] = "this is test";
    int result = fwrite(buf, sizeof(char), strlen(buf), fptr);
    EXPECT_TRUE("Fwrite0100", result == strlen(buf));

    (void)fclose(fptr);
    (void)remove(PATH);
}

/**
 * @tc.name      : Fwrite0200
 * @tc.desc      : File pointer at the beginning of a file, the location to which the current file pointer points
 * @tc.level     : Level 0
 */
void Fwrite0200(void)
{
    FILE *fptr = fopen(PATH, "w+");
    EXPECT_PTRNE("Fwrite0200", fptr, NULL);

    char buf[] = "this is test";
    int result = fwrite(buf, 0, strlen(buf), fptr);
    EXPECT_EQ("Fwrite0200", result, 0);

    (void)fclose(fptr);
    (void)remove(PATH);
}

/**
 * @tc.name      : Fwrite0300
 * @tc.desc      : Invalid argument. Cannot get the location of the current file pointer
 * @tc.level     : Level 2
 */
void Fwrite0300(void)
{
    FILE *fptr = fopen(PATH, "w+");
    EXPECT_PTRNE("Fwrite0300", fptr, NULL);

    char buf[] = "this is test";
    int result = fwrite(buf, sizeof(char), 0, fptr);
    EXPECT_EQ("Fwrite0300", result, 0);

    (void)fclose(fptr);
    (void)remove(PATH);
}

void Fwrite0400(void)
{
    pid_t childPid = 0;
    int fds[2] = {0};
    pipe(fds);
    int pipeRead = 0;
    int pipeWrite = 1;

    char buf[1024] = {0};

    childPid = fork();
    EXPECT_NE("Fwrite0400", childPid, -1);
    if (childPid == 0) {
        // childr
        dup2(fds[pipeWrite], STDOUT_FILENO);
        dup2(fds[pipeRead], STDIN_FILENO);

        close(fds[pipeWrite]);
        close(fds[pipeRead]);

        // exec
        execl("/bin/sh", "/bin/sh", "-c", "/system/bin/bm get -u", NULL);
        exit(0);
    } else {
        // parent
        close(fds[pipeWrite]);
        fcntl(fds[pipeRead], F_SETFD, F_DUPFD_CLOEXEC);
        int cn = read(fds[pipeRead], buf, sizeof(buf));
        EXPECT_MT("Fwrite0400", cn, 0);
    }
}

static int FwriteTestImpl(int argc, char *argv[])
{
    Fwrite0100();
    Fwrite0200();
    Fwrite0300();
    return g_tStatus;
}

int FwriteTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FwriteTestImpl(1, libcArgv);
}
