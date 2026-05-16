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

// commit: 2e6239dd064d201c6e1b0f589bae9ff27949d2eb 2011-02-19
// commit: 382584724308442f03f3d29f7fc6de9e9d140982 2011-06-12
// Mkstemp should return -1 on bad template
#include <cerrno>
#include <cstdlib>
#include <cstring>
#include "libc_test_shim.h"

#define S "/dev/null/fooXXXX"

int MkstempFailureTest()
{
    int status = SUCCESS_CODE;

    char p[] = S;
    int r;

    r = mkstemp(p);
    if (r != -1) {
        LibcTestError(&status, "mkstemp(" S ") did not fail\n");
    }
    if (memcmp(p, S, sizeof p) != 0) {
        LibcTestError(&status, "mkstemp(" S ") modified the template: %s\n", p);
    }
    if (r == -1 && errno != EINVAL) {
        LibcTestError(&status,
                      "mkstemp(" S ") failed with %d [%s] instead of %d [%s]\n",
                      errno,
                      strerror(errno),
                      EINVAL,
                      strerror(EINVAL));
    }
    return status;
}
