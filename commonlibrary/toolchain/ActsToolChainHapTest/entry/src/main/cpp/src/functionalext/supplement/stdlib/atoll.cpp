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

#include <cctype>
#include <cstdlib>
#include "functionalext.h"

namespace {
constexpr long long K_ATOLL0400_EXPECTED = 123LL;
} // namespace

long long int g_result = 123456789012345;
int g_resultA = 123456;
int g_resultC = -123456;
int g_resultD = 1234567890;
int g_resultE = 1234;
int g_successfully = 0;
int g_resultG = 12;

/**
 * @tc.name      : Atoll0100
 * @tc.desc      : Verify that the string can be converted to an integer (parameter is 123456789012345)
 * @tc.level     : Level 0
 */
void Atoll0100(void)
{
    long long int num;
    char str[] = "123456789012345";
    num = atoll(str);
    EXPECT_EQ("Atoll0100", num, g_result);
}

/**
 * @tc.name      : Atoll0200
 * @tc.desc      : Verify that the string can be converted to an integer (parameter is 000123456)
 * @tc.level     : Level 0
 */
void Atoll0200(void)
{
    long long int num;
    char str[] = "000123456";
    num = atoll(str);
    EXPECT_EQ("Atoll0200", num, g_resultA);
}

/**
 * @tc.name      : Atoll0300
 * @tc.desc      : Verify that the string can be converted to an integer (parameter is  123456)
 * @tc.level     : Level 1
 */
void Atoll0300(void)
{
    long long int num;
    char str[] = " 123456";
    num = atoll(str);
    EXPECT_EQ("Atoll0300", num, g_resultA);
}

/**
 * @tc.name      : Atoll0400
 * @tc.desc      : Verify that the string can be converted to an integer (parameter is 123 456)
 * @tc.level     : Level 1
 */
void Atoll0400(void)
{
    long long int num;
    char str[] = "123 456";
    num = atoll(str);
    EXPECT_EQ("Atoll0400", num, K_ATOLL0400_EXPECTED);
}

/**
 * @tc.name      : Atoll0500
 * @tc.desc      : Verify that the string can be converted to an integer (parameter is -123456)
 * @tc.level     : Level 1
 */
void Atoll0500(void)
{
    long long int num;
    char str[] = "-123456";
    num = atoll(str);
    EXPECT_EQ("Atoll0500", num, g_resultC);
}

/**
 * @tc.name      : Atoll0600
 * @tc.desc      : Verify that the string can be converted to an integer (parameter is 1234567890-56)
 * @tc.level     : Level 1
 */
void Atoll0600(void)
{
    long long int num;
    char str[] = "1234567890-56";
    num = atoll(str);
    EXPECT_EQ("Atoll0600", num, g_resultD);
}

/**
 * @tc.name      : Atoll0700
 * @tc.desc      : Verify that the string can be converted to an integer (parameter is +123456)
 * @tc.level     : Level 1
 */
void Atoll0700(void)
{
    long long int num;
    char str[] = "+123456";
    num = atoll(str);
    EXPECT_EQ("Atoll0700", num, g_resultA);
}

/**
 * @tc.name      : Atoll0800
 * @tc.desc      : Verify that the string can be converted to an integer (parameter is 1234+56)
 * @tc.level     : Level 1
 */
void Atoll0800(void)
{
    long long int num;
    char str[] = "1234+56";
    num = atoll(str);
    EXPECT_EQ("Atoll0800", num, g_resultE);
}

/**
 * @tc.name      : Atoll0900
 * @tc.desc      : Verify that cannot convert string to integer (parameter is a123456)
 * @tc.level     : Level 2
 */
void Atoll0900(void)
{
    long long int num;
    char str[] = "a123456";
    num = atoll(str);
    EXPECT_EQ("Atoll0900", num, g_successfully);
}

/**
 * @tc.name      : Atoll1000
 * @tc.desc      : Verify that cannot convert string to integer (parameter is 12b3456789012345)
 * @tc.level     : Level 2
 */
void Atoll1000(void)
{
    long long int num;
    char str[] = "12b3456789012345";
    num = atoll(str);
    EXPECT_EQ("Atoll1000", num, g_resultG);
}

/**
 * @tc.name      : Atoll1100
 * @tc.desc      : Verify that cannot convert string to integer (parameter is nullptr)
 * @tc.level     : Level 2
 */
void Atoll1100(void)
{
    long long int num;
    char str[] = "NULL";
    num = atoll(str);
    EXPECT_EQ("Atoll1100", num, g_successfully);
}

/**
 * @tc.name      : Atoll1200
 * @tc.desc      : Verify that cannot convert string to integer (parameter is “”)
 * @tc.level     : Level 2
 */
void Atoll1200(void)
{
    long long int num;
    char str[] = "";
    num = atoll(str);
    EXPECT_EQ("Atoll1200", num, g_successfully);
}

static int AtollTestWithArgs(int argc, char* argv[])
{
    Atoll0100();
    Atoll0200();
    Atoll0300();
    Atoll0400();
    Atoll0500();
    Atoll0600();
    Atoll0700();
    Atoll0800();
    Atoll0900();
    Atoll1000();
    Atoll1100();
    Atoll1200();

    return T_STATUS;
}

int AtollTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return AtollTestWithArgs(1, libcArgvStub);
}
