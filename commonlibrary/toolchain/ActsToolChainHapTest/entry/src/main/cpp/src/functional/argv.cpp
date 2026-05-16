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

#include <climits>
#include <cstring>
#include "test.h"

static int ArgvTestWithArgs(int argc, char** argv)
{
    char buf[PATH_MAX];
    if (!(argc == 1)) {
        t_error("argc == 1 failed: argc should be 1\n");
    }
    if (!(argv[0] != nullptr)) {
        t_error("argv[0] != nullptr failed: argv[0] should not be nullptr\n");
    }
    if (!(argv[1] == nullptr)) {
        t_error("argv[1] == nullptr failed: argv[1] should be nullptr\n");
    }
    if (!(argv[0][0] != 0)) {
        t_error("argv[0][0] != 0 failed: argv[0] should not be empty\n");
    }
    {
        size_t len = strlen(argv[0]);
        if (!(len < sizeof buf)) {
            t_error("argv[0] path length is not a valid PATH for buffer\n");
        } else {
            (void)std::memcpy(buf, argv[0], len + 1U);
        }
    }
    return T_STATUS;
}

int ArgvTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return ArgvTestWithArgs(1, libcArgvStub);
}
