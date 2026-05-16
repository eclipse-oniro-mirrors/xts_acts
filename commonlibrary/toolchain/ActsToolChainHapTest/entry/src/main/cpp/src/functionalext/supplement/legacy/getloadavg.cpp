/*
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

#include <climits>
#include <cstdlib>
#include "functionalext.h"

namespace {
constexpr int K_EXPECT_FAILURE = -1;
constexpr int K_EXPECT_ZERO_SAMPLES = 0;
constexpr int K_EXPECT_ONE_SAMPLE = 1;
constexpr int K_EXPECT_TWO_SAMPLES = 2;
constexpr int K_EXPECT_THREE_SAMPLES = 3;
constexpr int K_GETLOADAVG_REQUEST_SAMPLES_3 = 3;
constexpr int K_GETLOADAVG_REQUEST_SAMPLES_4 = 4;
} // namespace

/**
 * @tc.name      : Getloadavg0100
 * @tc.desc      : Verify the average number of processes in the system running queue in different time periods
 * @tc.level     : Level 0
 */
void Getloadavg0100(void)
{
    int result;
    double load[3];

    result = getloadavg(load, K_EXPECT_FAILURE);
    EXPECT_EQ("Getloadavg0100", result, K_EXPECT_FAILURE);
    result = getloadavg(load, INT_MIN);
    EXPECT_EQ("Getloadavg0100", result, K_EXPECT_FAILURE);

    result = getloadavg(load, K_EXPECT_ZERO_SAMPLES);
    EXPECT_EQ("Getloadavg0100", result, K_EXPECT_ZERO_SAMPLES);

    result = getloadavg(load, K_EXPECT_ONE_SAMPLE);
    EXPECT_EQ("Getloadavg0100", result, K_EXPECT_ONE_SAMPLE);
    result = getloadavg(load, K_EXPECT_TWO_SAMPLES);
    EXPECT_EQ("Getloadavg0100", result, K_EXPECT_TWO_SAMPLES);
    result = getloadavg(load, K_GETLOADAVG_REQUEST_SAMPLES_3);
    EXPECT_EQ("Getloadavg0100", result, K_EXPECT_THREE_SAMPLES);
    result = getloadavg(load, K_GETLOADAVG_REQUEST_SAMPLES_4);
    EXPECT_EQ("Getloadavg0100", result, K_EXPECT_THREE_SAMPLES);
    result = getloadavg(load, INT_MAX);
    EXPECT_EQ("Getloadavg0100", result, K_EXPECT_THREE_SAMPLES);
}

static int GetloadavgTestImpl(int argc, char* argv[])
{
    Getloadavg0100();
    return T_STATUS;
}

int GetloadavgTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetloadavgTestImpl(1, libcArgvStub);
}
