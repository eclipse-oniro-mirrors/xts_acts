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
constexpr int K_RAND_SAMPLE_COUNT = 10;
constexpr unsigned K_REPEAT_SEED = 10U;
constexpr unsigned K_DIFFERENT_SEED = 500U;
} // namespace

/**
 * @tc.name      : Srand0100
 * @tc.desc      : test the srand function to set the random number seed
 * @tc.level     : Level 0
 */
void Srand0100(void)
{
    int a[K_RAND_SAMPLE_COUNT] = { 0 };
    int b[K_RAND_SAMPLE_COUNT] = { 0 };
    srand(K_REPEAT_SEED);
    for (int i = 0; i < K_RAND_SAMPLE_COUNT; i++) {
        /* Exercises libc rand; not used as a cryptographic RNG. */
        a[i] = rand();
    }
    srand(K_REPEAT_SEED);
    for (int i = 0; i < K_RAND_SAMPLE_COUNT; i++) {
        b[i] = rand();
    }
    for (int i = 0; i < K_RAND_SAMPLE_COUNT; i++) {
        if (a[i] != b[i]) {
            t_error("%s srand rand in %d is %d , %d \n", __func__, i, a[i], b[i]);
        }
    }
}

/**
 * @tc.name      : Srand0200
 * @tc.desc      : Change the random number seed
 * @tc.level     : Level 1
 */
void Srand0200(void)
{
    int a = 0;
    int b = 0;
    srand(K_REPEAT_SEED);
    a = rand();
    srand(K_DIFFERENT_SEED);
    b = rand();
    if (a == b) {
        t_error("%s srand get rand is %d , %d \n", __func__, a, b);
    }
}

static int SrandTestImpl(int argc, char* argv[])
{
    Srand0100();
    Srand0200();
    return T_STATUS;
}

int SrandTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SrandTestImpl(1, libcArgvStub);
}
