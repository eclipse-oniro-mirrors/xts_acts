/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cmath>
#include <cstdlib>
#include "functionalext.h"

namespace {
constexpr int K_SRAND48_SEED_CASE_COUNT = 2;
constexpr int K_DRAND48_SAMPLE_COUNT = 5;
constexpr double K_DRAND48_ABS_TOLERANCE = 1e-11;
} // namespace

/**
 * @tc.name      : Srand480100
 * @tc.desc      : Verify that the random number can be obtained by calling the srand48 function.
 * @tc.level     : Level 0
 */
void Srand480100(void)
{
    struct Srand48Data {
        long seed;
        double value[K_DRAND48_SAMPLE_COUNT];
    };
    struct Srand48Data testData[K_SRAND48_SEED_CASE_COUNT] = {
        { 1,
          { 0.0416303447718782138,
            0.454492444728629152,
            0.834817218166914898,
            0.335986030145200232,
            0.565489403566136417 } },
        { 2,
          { 0.912432653437466712,
            0.15908290897229449,
            0.573262780710262376,
            0.801506833263324836,
            0.553675300337165055 } },
    };
    int i;
    int j;
    for (i = 0; i < K_SRAND48_SEED_CASE_COUNT; i++) {
        srand48(testData[i].seed);
        for (j = 0; j < K_DRAND48_SAMPLE_COUNT; j++) {
            EXPECT_TRUE("Srand480100", fabs(drand48() - testData[i].value[j]) < K_DRAND48_ABS_TOLERANCE);
        }
    }
}

static int Srand48TestImpl(int argc, char* argv[])
{
    Srand480100();

    return T_STATUS;
}

int Srand48Test(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return Srand48TestImpl(1, libcArgvStub);
}
