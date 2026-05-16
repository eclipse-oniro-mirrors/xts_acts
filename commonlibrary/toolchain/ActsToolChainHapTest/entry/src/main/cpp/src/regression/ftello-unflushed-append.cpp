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

// commit 3af2edee150484940916eba1984f78c3b965dd05 2014-02-07
// fix ftello result for append streams with unflushed output
#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fcntl.h>
#include <unistd.h>
#include "libc_test_shim.h"

constexpr off_t EXPECT_OFFSET_7 = 7;
constexpr int FD_MIN_VALID = 2;
constexpr size_t WRITE_LEN_4 = 4;
constexpr size_t WRITE_LEN_3 = 3;

static void AssertCondition(int* status, bool condition, const char* expr)
{
    errno = 0;
    if (!condition) {
        LibcTestError(status, "%s failed (errno: %s)\n", expr, strerror(errno));
    }
}

int FtelloUnflushedAppendTest()
{
    int status = SUCCESS_CODE;

    char tmp[] = "/data/storage/el2/base/cache/testsuite-XXXXXX";
    int fd;
    FILE* f;
    off_t off;

    fd = mkstemp(tmp);
    AssertCondition(&status, fd > FD_MIN_VALID, "mkstemp(tmp) > FD_MIN_VALID");
    AssertCondition(
        &status, write(fd, "abcd", WRITE_LEN_4) == WRITE_LEN_4, "write(fd, \"abcd\", WRITE_LEN_4) == WRITE_LEN_4");
    AssertCondition(&status, close(fd) == 0, "close(fd) == 0");

    fd = open(tmp, O_WRONLY);
    AssertCondition(&status, fd > FD_MIN_VALID, "open(tmp, O_WRONLY) > FD_MIN_VALID");
    f = fdopen(fd, "a");
    AssertCondition(&status, f != nullptr, "fdopen(fd, \"a\")");
    if (f) {
        AssertCondition(&status,
                        fwrite("efg", 1, WRITE_LEN_3, f) == WRITE_LEN_3,
                        "fwrite(\"efg\", 1, WRITE_LEN_3, f) == WRITE_LEN_3");
        off = ftello(f);
        AssertCondition(&status, off != -1, "ftello(f) != -1");
        if (off != EXPECT_OFFSET_7) {
            LibcTestError(&status, "ftello is broken before flush: got %lld, want 7\n", static_cast<long long>(off));
        }
        AssertCondition(&status, fflush(f) == 0, "fflush(f) == 0");
        off = ftello(f);
        AssertCondition(&status, off != -1, "ftello(f) != -1");
        if (off != EXPECT_OFFSET_7) {
            LibcTestError(&status, "ftello is broken after flush: got %lld, want 7\n", static_cast<long long>(off));
        }
        AssertCondition(&status, fclose(f) == 0, "fclose(f) == 0");
    }
    if (fd > FD_MIN_VALID) {
        AssertCondition(&status, unlink(tmp) == 0, "unlink(tmp) == 0");
    }
    return status;
}

int FtelloUnflushedAppendTestCompat()
{
    return FtelloUnflushedAppendTest();
}
