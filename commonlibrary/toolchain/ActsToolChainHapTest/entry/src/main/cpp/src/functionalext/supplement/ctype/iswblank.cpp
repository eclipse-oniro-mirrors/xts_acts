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

#include <cctype>
#include <cwchar>
#include <cwctype>
#include <clocale>
#include "functionalext.h"

#define BLANK_WINT_COUNT 18
#define UNICODE_SIZE 1114111
#define MAX_VALUE 4294967295

/**
 * @tc.name      : iswblank_l_0100
 * @tc.desc      : Whether a character in a wide string is a blank character
 * @tc.level     : Level 0
 */
void IswblankL0100(void)
{
    const wchar_t *str = L" \t";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswblank_l(*p, nullptr);
        EXPECT_EQ("iswblank_l_0100", ret, ONREXPECT);
    }
}

/**
 * @tc.name      : iswblank_l_0101
 * @tc.desc      : Whether a character in a wide string is a blank character
 * @tc.level     : Level 0
 */
void IswblankL0101(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L" \t";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswblank_l(*p, mLocale);
        EXPECT_EQ("iswblank_l_0101", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswblank_l_0102
 * @tc.desc      : Whether a character in a wide string is a blank character
 * @tc.level     : Level 0
 */
void IswblankL0102(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L" \t";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswblank_l(*p, mLocale);
        EXPECT_EQ("iswblank_l_0102", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswblank_l_0200
 * @tc.desc      : Whether the characters in a wide string is blank characters
 * @tc.level     : Level 2
 */
void IswblankL0200(void)
{
    const wchar_t *str = L"2!~*3Ad";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswblank_l(*p, nullptr);
        EXPECT_EQ("iswblank_l_0200", ret, CMPFLAG);
    }
}

/**
 * @tc.name      : iswblank_l_0201
 * @tc.desc      : Whether the characters in a wide string is blank characters
 * @tc.level     : Level 2
 */
void IswblankL0201(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L"2!~*3Ad";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswblank_l(*p, mLocale);
        EXPECT_EQ("iswblank_l_0201", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswblank_l_0202
 * @tc.desc      : Whether the characters in a wide string is blank characters
 * @tc.level     : Level 2
 */
void IswblankL0202(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L"2!~*3Ad";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswblank_l(*p, mLocale);
        EXPECT_EQ("iswblank_l_0202", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswblank_l_0300
 * @tc.desc      : Whether the characters in a wide string is blank characters
 * @tc.level     : Level 1
 */
void IswblankL0300(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswblank_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswblank_l_0300", total, BLANK_WINT_COUNT);
}

/**
 * @tc.name      : iswblank_l_0400
 * @tc.desc      : Whether the characters in a wide string is blank characters
 * @tc.level     : Level 1
 */
void IswblankL0400(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswblank_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswblank_l_0400", total, BLANK_WINT_COUNT);
}

/**
 * @tc.name      : iswblank_l_0500
 * @tc.desc      : Whether a character in a the maximum value of int is not a letter
 * @tc.level     : Level 1
 */
void IswblankL0500(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int ret = iswblank_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswblank_l_0500", ret, CMPFLAG);
}

/**
 * @tc.name      : iswblank_l_0600
 * @tc.desc      : Whether a character in a the maximum value of int is not a letter
 * @tc.level     : Level 1
 */
void IswblankL0600(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int ret = iswblank_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswblank_l_0600", ret, CMPFLAG);
}

/**
 * @tc.name      : iswblank_0100
 * @tc.desc      : Whether a character in a wide string is a blank character
 * @tc.level     : Level 0
 */
void Iswblank0100(void)
{
    const wchar_t *str = L" \t";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswblank(*p);
        EXPECT_EQ("iswblank_0100", ret, ONREXPECT);
    }
}

/**
 * @tc.name      : iswblank_0200
 * @tc.desc      : Whether the characters in a wide string is blank characters
 * @tc.level     : Level 2
 */
void Iswblank0200(void)
{
    const wchar_t *str = L"2!~*3Ad";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswblank(*p);
        EXPECT_EQ("iswblank_0200", ret, CMPFLAG);
    }
}

static int IswblankTestImpl(void)
{
    typedef void (*SetWctypeIcuEnableFunc)(void);
    SetWctypeIcuEnableFunc setWctypeIcuEnable = (SetWctypeIcuEnableFunc)dlsym(RTLD_DEFAULT, "set_wctype_icu_enable");
    setWctypeIcuEnable();
    IswblankL0100();
    IswblankL0101();
    IswblankL0102();
    IswblankL0200();
    IswblankL0201();
    IswblankL0202();
    IswblankL0300();
    IswblankL0400();
    IswblankL0500();
    IswblankL0600();

    Iswblank0100();
    Iswblank0200();
    return g_tStatus;
}

int IswblankTest(void)
{
    return IswblankTestImpl();
}
