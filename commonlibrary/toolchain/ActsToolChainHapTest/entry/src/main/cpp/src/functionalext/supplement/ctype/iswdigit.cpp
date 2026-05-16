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

#include <cstdio>
#include <cctype>
#include <cwchar>
#include <clocale>
#include <cwctype>

#include "functionalext.h"
#include "test.h"

#define DIGIT_WINT_COUNT 680
#define UNICODE_SIZE 1114111
#define MAX_VALUE 4294967295
/**
 * @tc.name      : iswdigit_0100
 * @tc.desc      : Use the iswdigit function to determine whether the incoming wide character is a decimal number
 * @tc.level     : Level 0
 */
void Iswdigit0100(void)
{
    wchar_t ch = L'9';
    int result = iswdigit(ch);
    if (result == 0) {
        t_error("%s iswdigit get result is %d error", __func__, result);
    }
}

/**
 * @tc.name      : iswdigit_0200
 * @tc.desc      : Test iswdigit when a non-decimal digit is passed in
 * @tc.level     : Level 1
 */
void Iswdigit0200(void)
{
    wchar_t ch = L'A';
    int result = iswdigit(ch);
    if (result != 0) {
        t_error("%s iswdigit get result is %d error", __func__, result);
    }
}

/**
 * @tc.name      : iswdigit_l_0100
 * @tc.desc      : Whether a character in a wide string is a number character
 * @tc.level     : Level 0
 */
void IswdigitL0100(void)
{
    const wchar_t *str = L"1234567890";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswdigit_l(*p, nullptr);
        EXPECT_EQ("iswdigit_l_0100", ret, ONREXPECT);
    }
}

/**
 * @tc.name      : iswdigit_l_0101
 * @tc.desc      : Whether a character in a wide string is a number character
 * @tc.level     : Level 0
 */
void IswdigitL0101(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L"1234567890";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswdigit_l(*p, mLocale);
        EXPECT_EQ("iswdigit_l_0101", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswdigit_l_0102
 * @tc.desc      : Whether a character in a wide string is a number character
 * @tc.level     : Level 0
 */
void IswdigitL0102(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L"1234567890";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswdigit_l(*p, mLocale);
        EXPECT_EQ("iswdigit_l_0102", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswdigit_l_0200
 * @tc.desc      : Whether a character in a wide string is a non-number character
 * @tc.level     : Level 2
 */
void IswdigitL0200(void)
{
    const wchar_t *str = L"ewqWRE!~*Ad";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswdigit_l(*p, nullptr);
        EXPECT_EQ("iswdigit_l_0200", ret, CMPFLAG);
    }
}

/**
 * @tc.name      : iswdigit_l_0201
 * @tc.desc      : Whether a character in a wide string is a non-number character
 * @tc.level     : Level 2
 */
void IswdigitL0201(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L"ewqWRE!~*Ad";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswdigit_l(*p, mLocale);
        EXPECT_EQ("iswdigit_l_0201", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswdigit_l_0202
 * @tc.desc      : Whether a character in a wide string is a non-number character
 * @tc.level     : Level 2
 */
void IswdigitL0202(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L"ewqWRE!~*Ad";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswdigit_l(*p, mLocale);
        EXPECT_EQ("iswdigit_l_0202", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswdigit_l_0300
 * @tc.desc      : Whether a character in a wide string is a non-number character
 * @tc.level     : Level 2
 */
void IswdigitL0300(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswdigit_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswdigit_l_0300", total, DIGIT_WINT_COUNT);
}

/**
 * @tc.name      : iswdigit_l_0400
 * @tc.desc      : Whether a character in a wide string is a non-number character
 * @tc.level     : Level 2
 */
void IswdigitL0400(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswdigit_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswdigit_l_0400", total, DIGIT_WINT_COUNT);
}

/**
 * @tc.name      : iswdigit_l_0500
 * @tc.desc      : Whether a character in a the maximum value of int is not a letter
 * @tc.level     : Level 1
 */
void IswdigitL0500(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int ret = iswdigit_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswdigit_l_0500", ret, CMPFLAG);
}

/**
 * @tc.name      : iswdigit_l_0600
 * @tc.desc      : Whether a character in a the maximum value of int is not a letter
 * @tc.level     : Level 1
 */
void IswdigitL0600(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int ret = iswdigit_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswdigit_l_0600", ret, CMPFLAG);
}

static int IswdigitTestImpl(int argc, char *argv[])
{
    typedef void (*SetWctypeIcuEnableFunc)(void);
    SetWctypeIcuEnableFunc setWctypeIcuEnable = (SetWctypeIcuEnableFunc)dlsym(RTLD_DEFAULT, "set_wctype_icu_enable");
    setWctypeIcuEnable();
    Iswdigit0100();
    Iswdigit0200();
    IswdigitL0100();
    IswdigitL0101();
    IswdigitL0102();
    IswdigitL0200();
    IswdigitL0201();
    IswdigitL0202();
    IswdigitL0300();
    IswdigitL0400();
    IswdigitL0500();
    IswdigitL0600();
    return g_tStatus;
}

int IswdigitTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return IswdigitTestImpl(1, libcArgv);
}
