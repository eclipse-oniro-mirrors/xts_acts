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

#include <cstdio>
#include <cstdlib>
#include "test.h"

namespace {
constexpr unsigned int K_RAND_R_SECOND_SEED = 200U;
} // namespace

unsigned int g_seed = 123;

/**
 * @tc.name      : RandR0100
 * @tc.desc      : The return value obtained by calling rand_d is different when testing different random number seeds
 * @tc.level     : Level 0
 */
void RandR0100(void)
{
    unsigned int seed = 10;
    int aResult = rand_r(&seed);
    seed = K_RAND_R_SECOND_SEED;
    int bResult = rand_r(&seed);
    if (aResult == bResult) {
        t_error("%s rand_r error change seed get result is all %d\n", __func__, aResult);
    }
}

/**
 * @tc.name      : RandR0200
 * @tc.desc      : When the test changes the same random number seed, the return value obtained by calling rand_d is
 *                 the same
 * @tc.level     : Level 1
 */
void RandR0200(void)
{
    unsigned int seed = g_seed;
    int aResult = rand_r(&seed);
    seed = g_seed;
    int bResult = rand_r(&seed);
    if (aResult != bResult) {
        t_error("%s rand_r error get result is %d and %d \n", __func__, aResult, bResult);
    }
}

/**
 * @tc.name      : RandR0300
 * @tc.desc      : test that the function return value obtained by calling the rand_d function twice in a row is
 *                 different
 * @tc.level     : Level 1
 */
void RandR0300(void)
{
    unsigned int seed = 10;
    int aResult = rand_r(&seed);
    int bResult = rand_r(&seed);
    if (aResult == bResult) {
        t_error("%s rand_r error change seed get result is all %d\n", __func__, aResult);
    }
}

static int RandRTestImpl(int argc, char* argv[])
{
    RandR0100();
    RandR0200();
    RandR0300();
    return T_STATUS;
}

int RandRTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return RandRTestImpl(1, libcArgvStub);
}
