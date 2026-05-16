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

#include "functionalext.h"

typedef void (*TEST_FUN)();

/**
 * @tc.name      : Printf0100
 * @tc.desc      : Verify the output data in the specified format (the format character is d)
 * @tc.level     : Level 0
 */
void Printf0100(void)
{
    int num = 6;
    int result = printf("%d\n", num);
    EXPECT_TRUE("Printf0100", result > 0);
}

/**
 * @tc.name      : Printf0200
 * @tc.desc      : Verify the output data in the specified format (the format character is o)
 * @tc.level     : Level 0
 */
void Printf0200(void)
{
    int num = 6;
    int result = printf("%o\n", num);
    EXPECT_TRUE("Printf0200", result > 0);
}

/**
 * @tc.name      : Printf0300
 * @tc.desc      : Verify the output data in the specified format (the format character is x,X)
 * @tc.level     : Level 0
 */
void Printf0300(void)
{
    int num = 6;
    int result = printf("%x\n", num);
    EXPECT_TRUE("Printf0300", result > 0);

    result = printf("%X\n", num);
    EXPECT_TRUE("Printf0300", result > 0);
}

/**
 * @tc.name      : Printf0400
 * @tc.desc      : Verify the output data in the specified format (the format character is u)
 * @tc.level     : Level 0
 */
void Printf0400(void)
{
    int num = 6;
    const unsigned int numU = static_cast<unsigned int>(num);
    int result = printf("%u\n", numU);
    EXPECT_TRUE("Printf0400", result > 0);
}

/**
 * @tc.name      : Printf0500
 * @tc.desc      : Verify the output data in the specified format (the format character is f)
 * @tc.level     : Level 0
 */
void Printf0500(void)
{
    int num = 6;
    const double numD = static_cast<double>(num);
    int result = printf("%f\n", numD);
    EXPECT_TRUE("Printf0500", result > 0);
}

/**
 * @tc.name      : Printf0600
 * @tc.desc      : Verify the output data in the specified format (the format character is e,E)
 * @tc.level     : Level 0
 */
void Printf0600(void)
{
    int num = 6;
    const double numD = static_cast<double>(num);
    int result = printf("%e\n", numD);
    EXPECT_TRUE("Printf0600", result > 0);

    result = printf("%E\n", numD);
    EXPECT_TRUE("Printf0600", result > 0);
}

/**
 * @tc.name      : Printf0700
 * @tc.desc      : Verify the output data in the specified format (the format character is g,G)
 * @tc.level     : Level 0
 */
void Printf0700(void)
{
    int num = 6;
    const double numD = static_cast<double>(num);
    int result = printf("%g\n", numD);
    EXPECT_TRUE("Printf0700", result > 0);

    result = printf("%G\n", numD);
    EXPECT_TRUE("Printf0700", result > 0);
}

/**
 * @tc.name      : Printf0800
 * @tc.desc      : Verify the output data in the specified format (the format character is c)
 * @tc.level     : Level 0
 */
void Printf0800(void)
{
    char ch = 'a';
    int result = printf("%c\n", ch);
    EXPECT_TRUE("Printf0800", result > 0);
}

/**
 * @tc.name      : Printf0900
 * @tc.desc      : Verify the output data in the specified format (the format character is s)
 * @tc.level     : Level 0
 */
void Printf0900(void)
{
    char num[] = "test";
    int result = printf("%s\n", num);
    EXPECT_TRUE("Printf0900", result > 0);
}

static int PrintfTestImpl(int argc, char* argv[])
{
    Printf0100();
    Printf0200();
    Printf0300();
    Printf0400();
    Printf0500();
    Printf0600();
    Printf0700();
    Printf0800();
    Printf0900();

    return T_STATUS;
}

int PrintfTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return PrintfTestImpl(1, libcArgvStub);
}
