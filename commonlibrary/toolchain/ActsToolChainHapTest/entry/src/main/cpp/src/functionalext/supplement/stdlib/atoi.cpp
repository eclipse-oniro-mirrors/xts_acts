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

typedef void (*TEST_FUN)();
const int32_t ZERO = 0;
const int32_t NUMBER = 123456;
const int32_t NUM = 123;
const int32_t NUMB = 1234;
const int32_t NU = 12;
const int32_t BURDENNUM = -2147483648;

/**
 * @tc.name      : Atoi0100
 * @tc.desc      : Verify that there are and only numbers (starting with non-zero digits) strings are
 *                 converted to integers
 * @tc.level     : Level 0
 */
void Atoi0100(void)
{
    char str[] = "123456";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi0100", fptr, NUMBER);
}

/**
 * @tc.name      : Atoi0200
 * @tc.desc      : Verify that there are and only numbers (starting with a 0) string is converted to an integer
 * @tc.level     : Level 0
 */
void Atoi0200(void)
{
    char str[] = "000123456";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi0200", fptr, NUMBER);
}

/**
 * @tc.name      : Atoi0300
 * @tc.desc      : Verify that spaces are at the beginning of the string string is converted to an integer
 * @tc.level     : Level 1
 */
void Atoi0300(void)
{
    char str[] = " 123456";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi0300", fptr, NUMBER);
}

/**
 * @tc.name      : Atoi0400
 * @tc.desc      : Verify that spaces are in the middle of the string and convert the string to an integer
 * @tc.level     : Level 1
 */
void Atoi0400(void)
{
    char str[] = "123  456";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi0400", fptr, NUM);
}

/**
 * @tc.name      : Atoi0500
 * @tc.desc      : Verify that string conversion to integer (- at the beginning of the number)
 * @tc.level     : Level 1
 */
void Atoi0500(void)
{
    char str[] = "-123456";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi0500", fptr, -NUMBER);
}

/**
 * @tc.name      : Atoi0600
 * @tc.desc      : Verify that string conversion to integer (- in the middle of the number)
 * @tc.level     : Level 1
 */
void Atoi0600(void)
{
    char str[] = "1234-56";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi0600", fptr, NUMB);
}

/**
 * @tc.name      : Atoi0700
 * @tc.desc      : Verify that string conversion to integer (+ at the beginning of the number)
 * @tc.level     : Level 1
 */
void Atoi0700(void)
{
    char str[] = "+123456";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi0700", fptr, NUMBER);
}

/**
 * @tc.name      : Atoi0800
 * @tc.desc      : Verify that string conversion to integer (+ in the middle of the number)
 * @tc.level     : Level 1
 */
void Atoi0800(void)
{
    char str[] = "1234+56";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi0800", fptr, NUMB);
}

/**
 * @tc.name      : Atoi0900
 * @tc.desc      : Verify that string conversion to integer (English characters are at the beginning)
 * @tc.level     : Level 2
 */
void Atoi0900(void)
{
    char str[] = "a123456";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi0900", fptr, ZERO);
}

/**
 * @tc.name      : Atoi1000
 * @tc.desc      : Verify that string conversion to integer (English characters are in the middle)
 * @tc.level     : Level 2
 */
void Atoi1000(void)
{
    char str[] = "12b3456";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi1000", fptr, NU);
}

/**
 * @tc.name      : Atoi1100
 * @tc.desc      : Verify that string conversion to integer (parameter invalid nullptr)
 * @tc.level     : Level 2
 */
void Atoi1100(void)
{
    char str[] = "NULL";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi1100", fptr, ZERO);
}

/**
 * @tc.name      : Atoi1200
 * @tc.desc      : Verify that string conversion to integer (parameter invalid "")
 * @tc.level     : Level 2
 */
void Atoi1200(void)
{
    char str[] = "";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi1200", fptr, ZERO);
}

/**
 * @tc.name      : Atoi1300
 * @tc.desc      : Verify that string conversion to integer (parameter exceeds max value)
 * @tc.level     : Level 2
 */
void Atoi1300(void)
{
    char str[] = "2147483648";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi1300", fptr, BURDENNUM);
}

/**
 * @tc.name      : Atoi1400
 * @tc.desc      : erify that string conversion to integer (parameter less than minimum value)
 * @tc.level     : Level 2
 */
void Atoi1400(void)
{
    char str[] = "-2147483648";
    int32_t fptr = atoi(str);
    EXPECT_EQ("Atoi1400", fptr, BURDENNUM);
}

namespace {
TEST_FUN g_gFunArray[] = {
    Atoi0100, Atoi0200, Atoi0300, Atoi0400, Atoi0500, Atoi0600, Atoi0700,
    Atoi0800, Atoi0900, Atoi1000, Atoi1100, Atoi1200, Atoi1300, Atoi1400,
};
}

static int AtoiTestWithArgs(int argc, char* argv[])
{
    int num = sizeof(g_gFunArray) / sizeof(g_gFunArray[0]);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return T_STATUS;
}

int AtoiTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return AtoiTestWithArgs(1, libcArgvStub);
}
