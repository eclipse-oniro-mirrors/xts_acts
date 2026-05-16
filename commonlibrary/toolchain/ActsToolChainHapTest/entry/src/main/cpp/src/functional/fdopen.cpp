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

#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <unistd.h>
#include "libc_test_shim.h"

#define STD_FD_MAX 2

static inline void TestCondition(bool condition, int *statusPtr, const char *expr)
{
    errno = 0;
    if (!condition) {
        LibcTestError(statusPtr, "%s failed (errno = %d)\n", expr, errno);
    }
}

#define TEST(c, statusPtr) TestCondition((c), (statusPtr), #c)

void Fdopen1(int& status)
{
    char tmp[] = "/data/storage/el2/base/cache/testsuite-XXXXXX";
    char foo[6];
    int fd;
    FILE* f;

    TEST((fd = mkstemp(tmp)) > STD_FD_MAX, &status);
    TEST(write(fd, "hello", 6) == 6, &status);
    TEST(f = fdopen(fd, "rb"), &status);
    if (f) {
        TEST(ftello(f) == 6, &status);
        TEST(fseeko(f, 0, SEEK_SET) == 0, &status);
        TEST(fgets(foo, sizeof foo, f), &status);
        if (strcmp(foo, "hello") != 0) {
            LibcTestError(&status, "fgets read back: \"%s\"; wanted: \"hello\"\n", foo);
        }
        fclose(f);
    }
    if (fd > STD_FD_MAX) {
        TEST(unlink(tmp) != -1, &status);
    }
}

void Fdopen2(int& status)
{
    FILE* f = fdopen(-1, "w");
    TEST(f == nullptr, &status);
    printf("f == %p\n", f);
}

int FdopenTest()
{
    int status = SUCCESS_CODE;

    Fdopen1(status);
    Fdopen2(status);
    return status;
}
