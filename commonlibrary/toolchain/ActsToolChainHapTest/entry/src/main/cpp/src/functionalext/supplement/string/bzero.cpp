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

#include <algorithm>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include "test.h"

namespace {
constexpr size_t K_HELLO_WORLD_SPACE_OFFSET = 6U;
constexpr size_t K_WORLD_CLEAR_LEN = 5U;
} // namespace

/**
 * @tc.name      : Bzero0100
 * @tc.desc      : Empty the specified number of elements in the string
 * @tc.level     : Level 0
 */
void Bzero0100(void)
{
    char str[20] = "bzero";
    bzero(str, 1);
    if (str[0] != 0) {
        t_error("%s bzero failed", __func__);
    }
}

/**
 * @tc.name      : Bzero0200
 * @tc.desc      : set '\0' to 0
 * @tc.level     : Level 1
 */
void Bzero0200(void)
{
    char str[20] = "bzero";
    int len = strlen(str);
    bzero(str, sizeof(str));
    if (str[len] != 0) {
        t_error("%s bzero failed", __func__);
    }
}

/**
 * @tc.name      : Bzero0300
 * @tc.desc      : Verify that bzero clears partial content of a string
 * @tc.level     : Level 1
 */
void Bzero0300(void)
{
    char str[20] = "hello world";
    bzero(str + K_HELLO_WORLD_SPACE_OFFSET, K_WORLD_CLEAR_LEN); // Clear "world"
    if (str[0] != 'h' || str[K_HELLO_WORLD_SPACE_OFFSET] != 0) {
        t_error("%s bzero failed", __func__);
    }
}

/**
 * @tc.name      : bzero_0600
 * @tc.desc      : Verify that bzero works correctly on the maximum buffer size
 * @tc.level     : Level 2
 */
void Bzero0400(void)
{
#define MAX_SIZE 1024
    char buffer[MAX_SIZE];
    std::fill_n(buffer, MAX_SIZE, static_cast<unsigned char>(0xff));
    bzero(buffer, MAX_SIZE);
    for (int i = 0; i < MAX_SIZE; i++) {
        if (buffer[i] != 0) {
            t_error("%s bzero failed at position %d", __func__, i);
        }
    }
}

static int BzeroTestWithArgs(int argc, char* argv[])
{
    Bzero0100();
    Bzero0200();
    Bzero0300();
    Bzero0400();
    return T_STATUS;
}

int BzeroTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return BzeroTestWithArgs(1, libcArgvStub);
}
