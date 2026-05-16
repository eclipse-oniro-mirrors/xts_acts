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

#include "functionalext.h"

namespace {
constexpr int K_FFS_ARG_TWO = 2;
constexpr int K_FFS_EXPECT_BIT2 = 2;
constexpr int K_FFS_ARG_HIGH_BIT = 128;
constexpr int K_FFS_EXPECT_BIT8 = 8;
} // namespace

/**
 * @tc.name      : Ffs0100
 * @tc.desc      : Validation looks for first set value in integer (parameter is 0).
 * @tc.level     : Level 0
 */
void Ffs0100(void)
{
    int result = ffs(0);
    EXPECT_EQ("Ffs0100", result, 0);
}

/**
 * @tc.name      : Ffs0200
 * @tc.desc      : Validation looks for first set value in integer (parameter is 1).
 * @tc.level     : Level 0
 */
void Ffs0200(void)
{
    int result = ffs(1);
    EXPECT_EQ("Ffs0200", result, 1);
}

/**
 * @tc.name      : Ffs0300
 * @tc.desc      : Validation looks for first set value in integer (parameter is 2).
 * @tc.level     : Level 0
 */
void Ffs0300(void)
{
    int result = ffs(K_FFS_ARG_TWO);
    EXPECT_EQ("Ffs0300", result, K_FFS_EXPECT_BIT2);
}

/**
 * @tc.name      : Ffs0400
 * @tc.desc      : Validation looks for first set value in integer (parameter is 3).
 * @tc.level     : Level 0
 */
void Ffs0400(void)
{
    int result = ffs(3);
    EXPECT_EQ("Ffs0400", result, 1);
}

/**
 * @tc.name      : Ffs0500
 * @tc.desc      : Validation looks for first set value in integer (parameter is 255).
 * @tc.level     : Level 0
 */
void Ffs0500(void)
{
    int result = ffs(K_FFS_ARG_HIGH_BIT);
    EXPECT_EQ("Ffs0500", result, K_FFS_EXPECT_BIT8);
}

static int FfsTestImpl(int argc, char* argv[])
{
    Ffs0100();
    Ffs0200();
    Ffs0300();
    Ffs0400();
    Ffs0500();
    return T_STATUS;
}

int FfsTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return FfsTestImpl(1, libcArgvStub);
}
