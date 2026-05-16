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
#include <cstring>
#include <sys/resource.h>
#include "libc_common_memfill.h"
#include "libc_test_shim.h"

int TSetrlim(int r, long lim)
{
    struct rlimit rl;

    if (getrlimit(r, &rl)) {
        LibcTestError(nullptr, "getrlimit %d: %s\n", r, strerror(errno));
        return -1;
    }
    if (static_cast<rlim_t>(lim) > rl.rlim_max) {
        return -1;
    }
    if (static_cast<rlim_t>(lim) == rl.rlim_max && static_cast<rlim_t>(lim) == rl.rlim_cur) {
        return 0;
    }
    rl.rlim_max = static_cast<rlim_t>(lim);
    rl.rlim_cur = static_cast<rlim_t>(lim);
    if (setrlimit(r, &rl)) {
        LibcTestError(nullptr, "setrlimit(%d, %ld): %s\n", r, lim, strerror(errno));
        return -1;
    }
    return 0;
}
