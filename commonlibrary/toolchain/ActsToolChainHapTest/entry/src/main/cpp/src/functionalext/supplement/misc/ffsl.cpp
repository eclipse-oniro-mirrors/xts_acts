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

#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <syslog.h>
#include <unistd.h>
#include "functionalext.h"

namespace {
constexpr long K_FFSL_MASK0X8 = 0x8L;
constexpr int K_FFSL_EXPECT_BIT4 = 4;
constexpr long K_FFSL_MASK0X8000 = 0x8000L;
constexpr int K_FFSL_EXPECT_BIT16 = 16;
} // namespace

/**
 * @tc.name      : Ffsl0100
 * @tc.desc      : Validates the ability to find the first set value of a value of type long.
 * @tc.level     : Level 0
 */
void Ffsl0100(void)
{
    EXPECT_EQ("Ffsl0100", ffsl(0), 0);
}

/**
 * @tc.name      : Ffsl0200
 * @tc.desc      : Verify to find the first set value of a value of type long (0x8, bit 1)
 * @tc.level     : Level 0
 */
void Ffsl0200(void)
{
    EXPECT_EQ("Ffsl0200", ffsl(K_FFSL_MASK0X8), K_FFSL_EXPECT_BIT4);
}

/**
 * @tc.name      : Ffsl0300
 * @tc.desc      : Validates the ability to find the first set value of a value of type long (0x8000, bit 1)
 * @tc.level     : Level 0
 */
void Ffsl0300(void)
{
    EXPECT_EQ("Ffsl0300", ffsl(K_FFSL_MASK0X8000), K_FFSL_EXPECT_BIT16);
}

static int FfslTestImpl(int argc, char* argv[])
{
    Ffsl0100();
    Ffsl0200();
    Ffsl0300();
    return T_STATUS;
}

int FfslTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return FfslTestImpl(1, libcArgvStub);
}
