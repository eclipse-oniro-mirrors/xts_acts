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

// decode across buffer boundary
#include <cerrno>
#include <clocale>
#include <cstdio>
#include <cstring>
#include <cwchar>
#include <unistd.h>
#include "libc_test_shim.h"

namespace {
constexpr int K_STDIN_FD = 0;

void RestoreStdin(int stdinSave, int* status)
{
    if (dup2(stdinSave, K_STDIN_FD) < 0) {
        LibcTestError(status, "dup2(restore stdin) failed\n");
    }
    (void)close(stdinSave);
}
} // namespace
void TSetutf8(void)
{
    if (!setlocale(LC_ALL, "C.UTF-8")) {
        if (!setlocale(LC_ALL, "en_US.UTF-8")) {
            (void)setlocale(LC_ALL, "UTF-8");
        }
    }
}

int FgetwcBufferingTest()
{
    int status = SUCCESS_CODE;

    TSetutf8();

    constexpr ssize_t kUtf8PartialWriteLen = 3;

    int stdinSave = dup(K_STDIN_FD);
    if (stdinSave < 0) {
        LibcTestError(&status, "dup(STDIN) failed\n");
        return status;
    }

    int p[2];
    if (!(pipe(p) == 0)) {
        LibcTestError(&status, "pipe(p) == 0 failed\n");
    }
    if (!(write(p[1], "x\340\240", kUtf8PartialWriteLen) == kUtf8PartialWriteLen)) {
        LibcTestError(
            &status, "write(p[1], \"x\\340\\240\", %zd) == %zd failed\n", kUtf8PartialWriteLen, kUtf8PartialWriteLen);
    }
    if (!(dup2(p[0], 0) == 0)) {
        LibcTestError(&status, "dup2(p[0], 0) == 0 failed\n");
    }
    wint_t wc = fgetwc(stdin);
    if (!(wc == 'x')) {
        LibcTestError(&status, "wc == 'x' failed\n");
    }
    if (!(write(p[1], "\200", 1) == 1)) {
        LibcTestError(&status, "write(p[1], \"\\200\", 1) == 1 failed\n");
    }
    close(p[1]);

    if ((wc = fgetwc(stdin)) != 0x800) {
        LibcTestError(&status, "wanted 0x800, got 0x%x\n", static_cast<unsigned>(wc));
    }

    errno = 0;
    wc = fgetwc(stdin);
    if (wc != WEOF) {
        LibcTestError(&status, "wanted WEOF, got 0x%x\n", static_cast<unsigned>(wc));
    }
    if (errno != 0) {
        LibcTestError(&status, "wanted errno==0, got %d (%s)\n", errno, strerror(errno));
    }
    if (!(feof(stdin) != 0)) {
        LibcTestError(&status, "feof(stdin) != 0 failed\n");
    }
    if (!(ferror(stdin) == 0)) {
        LibcTestError(&status, "ferror(stdin) == 0 failed\n");
    }
    RestoreStdin(stdinSave, &status);
    (void)close(p[0]);
    return status;
}
