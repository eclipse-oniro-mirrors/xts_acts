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
#include <cstdio>
#include <cwchar>
#include <cwctype>
#include <clocale>

#include "functionalext.h"
#include "test.h"

#define UPPER_WINT_COUNT 1831
#define UNICODE_SIZE 1114111
#define MAX_VALUE 4294967295
/**
 * @tc.name      : iswupper_0100
 * @tc.desc      : Determine whether the incoming wide character is an uppercase letter by the iswupper method
 * @tc.level     : Level 0
 */
void Iswupper0100(void)
{
    wchar_t ch = L'A';
    int result = iswupper(ch);
    if (result == 0) {
        t_error("%s iswupper get result is %d error", __func__, result);
    }
}

/**
 * @tc.name      : iswupper_0200
 * @tc.desc      : Test the return value of iswupper when lowercase letters are passed in
 * @tc.level     : Level 1
 */
void Iswupper0200(void)
{
    wchar_t ch = L'a';
    int result = iswupper(ch);
    if (result != 0) {
        t_error("%s iswupper get result is %d error", __func__, result);
    }
}

/**
 * @tc.name      : iswupper_0300
 * @tc.desc      : Test iswupper return value when passing in a number
 * @tc.level     : Level 1
 */
void Iswupper0300(void)
{
    wchar_t ch = L'1';
    int result = iswupper(ch);
    if (result != 0) {
        t_error("%s iswupper get result is %d error", __func__, result);
    }
}

/**
 * @tc.name      : iswupper_l_0100
 * @tc.desc      : Whether the characters in a wide string is upper character
 * @tc.level     : Level 0
 */
void IswupperL0100(void)
{
    const wchar_t *str = L"ABCDEFG";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswupper_l(*p, nullptr);
        EXPECT_EQ("IswupperL0100", ret, ONREXPECT);
    }
}

/**
 * @tc.name      : iswupper_l_0101
 * @tc.desc      : Whether the characters in a wide string is upper character
 * @tc.level     : Level 0
 */
void IswupperL0101(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L"ABCDEFG";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswupper_l(*p, mLocale);
        EXPECT_EQ("iswupper_l_0101", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswupper_l_0102
 * @tc.desc      : Whether the characters in a wide string is upper character
 * @tc.level     : Level 0
 */
void IswupperL0102(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L"ABCDEFG";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswupper_l(*p, mLocale);
        EXPECT_EQ("iswupper_l_0102", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswupper_l_0200
 * @tc.desc      : Whether the characters in a wide string are non-upper character
 * @tc.level     : Level 2
 */
void IswupperL0200(void)
{
    const wchar_t *str = L"abcefg1";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswupper_l(*p, nullptr);
        EXPECT_EQ("IswupperL0200", ret, CMPFLAG);
    }
}

/**
 * @tc.name      : iswupper_l_0201
 * @tc.desc      : Whether the characters in a wide string are non-upper character
 * @tc.level     : Level 2
 */
void IswupperL0201(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L"abcefg1";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswupper_l(*p, mLocale);
        EXPECT_EQ("iswupper_l_0201", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswupper_l_0202
 * @tc.desc      : Whether the characters in a wide string are non-upper character
 * @tc.level     : Level 2
 */
void IswupperL0202(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L"abcefg1";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswupper_l(*p, mLocale);
        EXPECT_EQ("iswupper_l_0202", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswupper_l_0300
 * @tc.desc      : Whether the characters in a wide string are non-upper character
 * @tc.level     : Level 2
 */
void IswupperL0300(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswupper_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswupper_l_0300", total, UPPER_WINT_COUNT);
}

/**
 * @tc.name      : iswupper_l_0400
 * @tc.desc      : Whether the characters in a wide string are non-upper character
 * @tc.level     : Level 2
 */
void IswupperL0400(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswupper_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswupper_l_0400", total, UPPER_WINT_COUNT);
}

/**
 * @tc.name      : iswupper_l_0500
 * @tc.desc      : Whether a character in a the maximum value of int is not a letter
 * @tc.level     : Level 1
 */
void IswupperL0500(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int ret = iswupper_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswupper_l_0500", ret, CMPFLAG);
}

/**
 * @tc.name      : iswupper_l_0600
 * @tc.desc      : Whether a character in a the maximum value of int is not a letter
 * @tc.level     : Level 1
 */
void IswupperL0600(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int ret = iswupper_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswupper_l_0600", ret, CMPFLAG);
}

static int IswupperTestImpl(int argc, char *argv[])
{
    typedef void (*SetWctypeIcuEnableFunc)(void);
    SetWctypeIcuEnableFunc setWctypeIcuEnable = (SetWctypeIcuEnableFunc)dlsym(RTLD_DEFAULT, "set_wctype_icu_enable");
    setWctypeIcuEnable();
    Iswupper0100();
    Iswupper0200();
    Iswupper0300();
    IswupperL0100();
    IswupperL0101();
    IswupperL0102();
    IswupperL0200();
    IswupperL0201();
    IswupperL0202();
    IswupperL0300();
    IswupperL0400();
    IswupperL0500();
    IswupperL0600();
    return g_tStatus;
}

int IswupperTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return IswupperTestImpl(1, libcArgv);
}
