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

// rlimit should be able to set file limits
#include <cerrno>
#include <cstdlib>
#include <cstring>
#include <sys/resource.h>
#include <unistd.h>
#include "libc_test_shim.h"
int RlimitOpenFilesTest()
{
    int status = SUCCESS_CODE;

    static const long lim = 100;
    static const int r = RLIMIT_NOFILE;
    struct rlimit rl;
    int fd;
    int maxfd = 0;

    rl.rlim_max = lim;
    rl.rlim_cur = lim;
    if (setrlimit(r, &rl)) {
        LibcTestError(&status, "setrlimit(%d, %ld) failed: %s\n", r, lim, strerror(errno));
    }
    if (getrlimit(r, &rl)) {
        LibcTestError(&status, "getrlimit(%d) failed: %s\n", r, strerror(errno));
    }
    if (rl.rlim_max != lim || rl.rlim_cur != lim) {
        LibcTestError(&status,
                      "getrlimit %d says cur=%ld,max=%ld after setting the limit to %ld\n",
                      r,
                      rl.rlim_cur,
                      rl.rlim_max,
                      lim);
    }

    while ((fd = dup(1)) != -1) {
        if (fd > maxfd) {
            maxfd = fd;
        }
    }
    if (errno != EMFILE) {
        LibcTestError(&status, "dup(1) failed with %s, wanted EMFILE\n", strerror(errno));
    }
    if (maxfd + 1 > lim) {
        LibcTestError(&status, "more fds are open than rlimit allows: fd=%d, limit=%d\n", maxfd, lim);
    }

    return status;
}
