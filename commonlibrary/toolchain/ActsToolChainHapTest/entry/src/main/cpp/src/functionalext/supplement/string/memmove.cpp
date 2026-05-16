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
#include <cstdio>
#include <cstring>
#include "test.h"

namespace {
constexpr size_t K_ABCDEFGH_WITH_NUL = 9U;
constexpr size_t K_HELLO_WORLD_WITH_NUL = 11U;
constexpr size_t K_OVERLAP_FORWARD_LEN = 7U;
constexpr size_t K_OVERLAP_REVERSE_LEN = 9U;
constexpr size_t K_OVERLAP_FORWARD_DST_OFFSET = 1U;
constexpr size_t K_OVERLAP_FORWARD_SRC_OFFSET = 2U;
constexpr const char* K_TEXT_ABCDEFGH = "abcdefgh";
constexpr const char* K_TEXT_HELLO_WORLD = "helloWorld";
constexpr const char* K_TEXT_FOO = "foo";
} // namespace

char g_one[50];
char g_two[50];

/**
 * @tc.name      : Memmove0100
 * @tc.desc      : The source address and the destination address are equal, and no copying is performed.
 * @tc.level     : Level 1
 */
void Memmove0100(void)
{
    std::fill_n(g_one, sizeof(g_one), '\0');

    (void)std::memcpy(g_one, K_TEXT_ABCDEFGH, K_ABCDEFGH_WITH_NUL);
    std::memmove(g_one, g_one, K_ABCDEFGH_WITH_NUL);
    if (strcmp(g_one, "abcdefgh")) {
        t_error("%s memmove failed\n", __func__);
    }
}

/**
 * @tc.name      : Memmove0200
 * @tc.desc      : The source address and the destination address do not overlap, copy it.
 * @tc.level     : Level 0
 */
void Memmove0200(void)
{
    std::fill_n(g_one, sizeof(g_one), '\0');
    std::fill_n(g_two, sizeof(g_two), '\0');

    (void)std::memcpy(g_one, K_TEXT_HELLO_WORLD, K_HELLO_WORLD_WITH_NUL);
    (void)std::memcpy(g_two, K_TEXT_FOO, strlen(K_TEXT_FOO) + 1U);
    std::memmove(g_two, g_one, K_HELLO_WORLD_WITH_NUL);
    if (strcmp(g_one, "helloWorld")) {
        t_error("%s memmove failed\n", __func__);
    }
    if (strcmp(g_two, "helloWorld")) {
        t_error("%s memmove failed\n", __func__);
    }
}

/**
 * @tc.name      : Memmove0300
 * @tc.desc      : The first address of dest is less than the first address of src, and forward copy is performed.
 * @tc.level     : Level 1
 */
void Memmove0300(void)
{
    std::fill_n(g_one, sizeof(g_one), '\0');

    (void)std::memcpy(g_one, K_TEXT_ABCDEFGH, K_ABCDEFGH_WITH_NUL);
    std::memmove(g_one + K_OVERLAP_FORWARD_DST_OFFSET, g_one + K_OVERLAP_FORWARD_SRC_OFFSET, K_OVERLAP_FORWARD_LEN);
    if (strcmp(g_one, "acdefgh")) {
        t_error("%s memmove failed\n", __func__);
    }
}

/**
 * @tc.name      : Memmove0400
 * @tc.desc      : The first address of dest is greater than the first address of src, and reverse copy is performed.
 * @tc.level     : Level 1
 */
void Memmove0400(void)
{
    std::fill_n(g_one, sizeof(g_one), '\0');

    (void)std::memcpy(g_one, K_TEXT_ABCDEFGH, K_ABCDEFGH_WITH_NUL);
    std::memmove(g_one + 1, g_one, K_OVERLAP_REVERSE_LEN);
    if (strcmp(g_one, "aabcdefgh")) {
        t_error("%s memmove failed\n", __func__);
    }
}

static int MemmoveTestImpl(int argc, char* argv[])
{
    Memmove0100();
    Memmove0200();
    Memmove0300();
    Memmove0400();

    return T_STATUS;
}

int MemmoveTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return MemmoveTestImpl(1, libcArgvStub);
}
