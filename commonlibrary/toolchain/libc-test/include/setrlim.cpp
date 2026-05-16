/* Copyright (C) 2021 Huawei Device Co., Ltd.
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
#include <cstring>
#include <cerrno>
#include <cstdio>
#include <sys/resource.h>

#include "runtest.h"
namespace OHOS {
int Runtest::TSetrlim(int r, long lim)
{
    struct rlimit rl;
    // Gets the current stack size
    if (getrlimit(r, &rl) != 0) {
        printf("getrlimit %d: %s\n", r, strerror(errno));
        return -1;
    }
    if (lim > rl.rlim_max) {
        return -1;
    }
    if (lim == rl.rlim_max && lim == rl.rlim_cur) {
        return 0;
    }
    rl.rlim_max = lim;
    rl.rlim_cur = lim;
    if (setrlimit(r, &rl) != 0) {
        printf("setrlimit(%d, %ld): %s\n", r, lim, strerror(errno));
        return -1;
    }
    return 0;
}
} // namespace OHOS