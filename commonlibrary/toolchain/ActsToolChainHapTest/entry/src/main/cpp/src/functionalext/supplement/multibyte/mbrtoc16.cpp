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
 * @tc.name      : Mbrtoc160100
 * @tc.desc      : Convert a single-byte string to a wide string
 * @tc.level     : Level 0
 */
void Mbrtoc160100(void)
{
    char16_t pc = 0;
    int ret = -1;
    char* str = setlocale(LC_CTYPE, "C.UTF-8");
    if (str == nullptr) {
        t_error("setlocale failed\n");
        return;
    }
    uselocale(LC_GLOBAL_LOCALE);

    ret = mbrtoc16(&pc, "abcdef", 1, nullptr);
    EXPECT_EQ("Mbrtoc160100", ret, 1);
    EXPECT_EQ("Mbrtoc160100", pc, 'a');
}

/**
 * @tc.name      : Mbrtoc160200
 * @tc.desc      : Convert a multibyte string to a wide-character string
 * @tc.level     : Level 0
 */
void Mbrtoc160200(void)
{
    char16_t out;
    int ret = 0;
    char str[] = "\u00a3";
    char str1[] = "\u08a3";
    mbstate_t ps{};

    ret = mbrtoc16(&out, str, strlen(str), nullptr);
    EXPECT_EQ("Mbrtoc160200", ret, TWO);
    EXPECT_EQ("Mbrtoc160200", out, TWO_BYTE_TEST_VALUE);

    ret = mbrtoc16(&out, str1, strlen(str1), &ps);
    EXPECT_EQ("Mbrtoc160200", ret, THREE);
    EXPECT_EQ("Mbrtoc160200", out, THREE_BYTE_TEST_VALUE);
}

/**
 * @tc.name      : Mbrtoc160300
 * @tc.desc      : Provide exception parameter data, convert the string to a wide string
 * @tc.level     : Level 2
 */
void Mbrtoc160300(void)
{
    char16_t out;
    char str[] = "\xc2";
    char strx[] = "\xc2\xa3";
    int errorresult = -2;
    mbstate_t ps{};

    int ret = static_cast<int>(mbrtoc16(&out, str, sizeof(str), nullptr));
    EXPECT_EQ("Mbrtoc160300", ret, ERREXPECT);
    EXPECT_EQ("Mbrtoc160300", errno, EILSEQ);
    ret = static_cast<int>(mbrtoc16(&out, strx, 1, nullptr));
    EXPECT_EQ("Mbrtoc160300", ret, errorresult);
    ret = static_cast<int>(mbrtoc16(nullptr, nullptr, 0, &ps));
    EXPECT_EQ("Mbrtoc160300", ret, CMPFLAG);
}

static int Mbrtoc16TestImpl(void)
{
    Mbrtoc160100();
    Mbrtoc160200();
    Mbrtoc160300();
    return T_STATUS;
}

int Mbrtoc16Test(void)
{
    return Mbrtoc16TestImpl();
}
