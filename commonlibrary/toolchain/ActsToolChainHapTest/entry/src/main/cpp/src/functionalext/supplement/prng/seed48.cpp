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

#include <csignal>
#include <cstddef>
#include <cstdlib>
#include <cstring>

#include "test.h"

namespace {
constexpr size_t K_SEED48_STATE_IDX0 = 0U;
constexpr size_t K_SEED48_STATE_IDX1 = 1U;
constexpr size_t K_SEED48_STATE_IDX2 = 2U;
} // namespace

unsigned short g_xsp0 = 0x330e;
unsigned short g_xsp1 = 0x5432;
unsigned short g_xsp2 = 0x9876;

static void Handler(int sig)
{
    exit(T_STATUS);
}

/**
 * @tc.name      : Seed480100
 * @tc.desc      : generate uniformly distributed pseudo-random numbers
 * @tc.level     : Level 0
 */
void Seed480100(void)
{
    long seed = 0x98765432;
    srand48(seed);

    unsigned short xs[] = { 0x0001, 0x0012, 0x0123 };
    unsigned short* xsp = seed48(xs);
    if (xsp[K_SEED48_STATE_IDX0] != g_xsp0 || xsp[K_SEED48_STATE_IDX1] != g_xsp1 ||
        xsp[K_SEED48_STATE_IDX2] != g_xsp2) {
        t_error("%s failed: xsp[0] = %x, xsp[1] = %x, xsp[2] = %x\n",
                __func__,
                xsp[K_SEED48_STATE_IDX0],
                xsp[K_SEED48_STATE_IDX1],
                xsp[K_SEED48_STATE_IDX2]);
    }

    for (size_t i = 0; i < sizeof(xs) / sizeof(xs[0]); ++i) {
        xs[i] = xsp[i];
    }
    seed48(xs);
}

/**
 * @tc.name      : Seed480200
 * @tc.desc      : generate uniformly distributed pseudo-random numbers with nullptr
 * @tc.level     : Level 2
 */
void Seed480200(void)
{
    (void)signal(SIGSEGV, Handler);

    seed48(nullptr);
}

static int Seed48TestImpl(int argc, char* argv[])
{
    Seed480100();
    Seed480200();

    return T_STATUS;
}

int Seed48Test(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return Seed48TestImpl(1, libcArgvStub);
}
