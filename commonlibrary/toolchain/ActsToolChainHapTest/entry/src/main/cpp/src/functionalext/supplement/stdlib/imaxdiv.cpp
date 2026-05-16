/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include <cinttypes>
#include "functionalext.h"

/**
 * @tc.name      : Imaxdiv0100
 * @tc.desc      : Verify imaxdiv process success when param num is positive integer, param den is positive integer
 * @tc.level     : Level 0
 */
void Imaxdiv0100(void)
{
    intmax_t num = 4;
    intmax_t den = 3;
    imaxdiv_t ret = imaxdiv(num, den);
    EXPECT_EQ("Imaxdiv0100", ret.quot, 1);
    EXPECT_EQ("Imaxdiv0100", ret.rem, 1);
}

/**
 * @tc.name      : Imaxdiv0200
 * @tc.desc      : Verify imaxdiv process success when param num is positive integer, param den is negative integer
 * @tc.level     : Level 0
 */
void Imaxdiv0200(void)
{
    intmax_t num = 4;
    intmax_t den = -3;
    imaxdiv_t ret = imaxdiv(num, den);
    EXPECT_EQ("Imaxdiv0200", ret.quot, -1);
    EXPECT_EQ("Imaxdiv0200", ret.rem, 1);
}

/**
 * @tc.name      : Imaxdiv0300
 * @tc.desc      : Verify imaxdiv process success when param num is negative integer, param den is positive integer
 * @tc.level     : Level 0
 */
void Imaxdiv0300(void)
{
    intmax_t num = -4;
    intmax_t den = 3;
    imaxdiv_t ret = imaxdiv(num, den);
    EXPECT_EQ("Imaxdiv0300", ret.quot, -1);
    EXPECT_EQ("Imaxdiv0300", ret.rem, -1);
}

/**
 * @tc.name      : Imaxdiv0400
 * @tc.desc      : Verify imaxdiv process success when param num is negative integer, param den is negative integer
 * @tc.level     : Level 0
 */
void Imaxdiv0400(void)
{
    intmax_t num = -4;
    intmax_t den = -3;
    imaxdiv_t ret = imaxdiv(num, den);
    EXPECT_EQ("Imaxdiv0400", ret.quot, 1);
    EXPECT_EQ("Imaxdiv0400", ret.rem, -1);
}

static int ImaxdivTestImpl(int argc, char* argv[])
{
    Imaxdiv0100();
    Imaxdiv0200();
    Imaxdiv0300();
    Imaxdiv0400();
    return T_STATUS;
}

int ImaxdivTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return ImaxdivTestImpl(1, libcArgvStub);
}
