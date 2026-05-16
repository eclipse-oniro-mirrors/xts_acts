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
constexpr long long K_FFSLL_MASK0X8000000 = 0x8000000LL;
constexpr int K_FFSLL_EXPECT_BIT28 = 28;
constexpr long long K_FFSLL_MASK0X800000000 = 0x800000000LL;
constexpr int K_FFSLL_EXPECT_BIT36 = 36;
} // namespace

/**
 * @tc.name      : Ffsll0100
 * @tc.desc      : Verify to find the first set value of a value of type long long
 *                 (valid for each argument, 0, bit 1)
 * @tc.level     : Level 0
 */
void Ffsll0100(void)
{
    int result = ffsll(0);
    EXPECT_EQ("Ffsll0100", result, 0);
}

/**
 * @tc.name      : Ffsll0200
 * @tc.desc      : Verify to find the first set value of a value of type long long
 *                 (valid for each argument, 0x8000000,bit 1)
 * @tc.level     : Level 0
 */
void Ffsll0200(void)
{
    int result = ffsll(K_FFSLL_MASK0X8000000);
    EXPECT_EQ("Ffsll0200", result, K_FFSLL_EXPECT_BIT28);
}

/**
 * @tc.name      : Ffsll0300
 * @tc.desc      : Verify to find the first set value of a value of type long long
 *                 (valid for each argument, 0x800000000,bit 1)
 * @tc.level     : Level 0
 */
void Ffsll0300(void)
{
    int result = ffsll(K_FFSLL_MASK0X800000000);
    EXPECT_EQ("Ffsll0300", result, K_FFSLL_EXPECT_BIT36);
}

static int FfsllTestImpl(int argc, char* argv[])
{
    Ffsll0100();
    Ffsll0200();
    Ffsll0300();
    return T_STATUS;
}

int FfsllTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return FfsllTestImpl(1, libcArgvStub);
}
