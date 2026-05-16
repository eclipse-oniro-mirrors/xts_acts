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

#include <clocale>
#include <cstring>
#include <cuchar>
#include "functionalext.h"

#define TWO_BYTE_TEST_VALUE 0x00a3
#define THREE_BYTE_TEST_VALUE 0x08a3
#define TWO 2
#define THREE 3

/**
 * @tc.name      : Mbrtoc320100
 * @tc.desc      : Convert a single-byte string to a wide string
 * @tc.level     : Level 0
 */
void Mbrtoc320100(void)
{
    char32_t pc = 0;
    int ret = 0;
    char* str = setlocale(LC_CTYPE, "C.UTF-8");
    if (str == nullptr) {
        t_error("setlocale failed\n");
        return;
    }
    uselocale(LC_GLOBAL_LOCALE);

    ret = mbrtoc32(&pc, "abcdef", 1, nullptr);
    EXPECT_EQ("Mbrtoc320100", ret, 1);
    EXPECT_EQ("Mbrtoc320100", pc, 'a');
}

/**
 * @tc.name      : Mbrtoc320200
 * @tc.desc      : Convert a multibyte string to a wide-character string
 * @tc.level     : Level 0
 */
void Mbrtoc320200(void)
{
    char32_t out;
    char str[] = "\u00a3";
    char str1[] = "\u08a3";
    mbstate_t ps{};
    int ret = 0;

    ret = mbrtoc32(&out, str, strlen(str), nullptr);
    EXPECT_EQ("Mbrtoc320200", ret, TWO);
    EXPECT_EQ("Mbrtoc320200", out, TWO_BYTE_TEST_VALUE);

    ret = mbrtoc32(&out, str1, strlen(str1), &ps);
    EXPECT_EQ("Mbrtoc320200", ret, THREE);
    EXPECT_EQ("Mbrtoc320200", out, THREE_BYTE_TEST_VALUE);
}

/**
 * @tc.name      : Mbrtoc320300
 * @tc.desc      : Provide exception parameter data, convert the string to a wide string
 * @tc.level     : Level 2
 */
void Mbrtoc320300(void)
{
    char32_t out;
    char str[] = "\xc2";
    char strx[] = "\xc2\xa3";
    int errorresult = -2;
    mbstate_t ps{};
    int ret = 0;

    ret = static_cast<int>(mbrtoc32(&out, str, sizeof(str), nullptr));
    EXPECT_EQ("Mbrtoc320300", ret, ERREXPECT);
    EXPECT_EQ("Mbrtoc320300", errno, EILSEQ);
    ret = static_cast<int>(mbrtoc32(&out, strx, 1, nullptr));
    EXPECT_EQ("Mbrtoc320300", ret, errorresult);
    ret = static_cast<int>(mbrtoc32(nullptr, nullptr, 0, &ps));
    EXPECT_EQ("Mbrtoc320300", ret, CMPFLAG);
}

static int Mbrtoc32TestImpl(void)
{
    Mbrtoc320100();
    Mbrtoc320200();
    Mbrtoc320300();
    return T_STATUS;
}

int Mbrtoc32Test(void)
{
    return Mbrtoc32TestImpl();
}
