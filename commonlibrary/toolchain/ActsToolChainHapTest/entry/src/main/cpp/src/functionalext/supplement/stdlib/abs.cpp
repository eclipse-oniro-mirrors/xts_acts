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

#include <cstdlib>
#include "functionalext.h"

namespace {
constexpr int K_ABS_TEST_MAGNITUDE = 10;
} // namespace

/**
 * @tc.name      : Abs0100
 * @tc.desc      : Verify that the absolute value of the returned parameter is 0 (parameter is 0).
 * @tc.level     : Level 0
 */
void Abs0100(void)
{
    int result = abs(0);
    EXPECT_EQ("Abs0100", result, 0);
}

/**
 * @tc.name      : Abs0200
 * @tc.desc      : Verify that the absolute value of the returned parameter is a positive number (parameter is 10).
 * @tc.level     : Level 0
 */
void Abs0200(void)
{
    int result = abs(K_ABS_TEST_MAGNITUDE);
    EXPECT_EQ("Abs0200", result, K_ABS_TEST_MAGNITUDE);
}

/**
 * @tc.name      : Abs0300
 * @tc.desc      : Verify that the absolute value of the returned parameter is a positive number (parameter is -10).
 * @tc.level     : Level 0
 */
void Abs0300(void)
{
    int result = abs(-K_ABS_TEST_MAGNITUDE);
    EXPECT_EQ("Abs0300", result, K_ABS_TEST_MAGNITUDE);
}

static int AbsTestWithArgs(int argc, char* argv[])
{
    Abs0100();
    Abs0200();
    Abs0300();
    return T_STATUS;
}

int AbsTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return AbsTestWithArgs(1, libcArgvStub);
}
