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

#define XDIGIT_WINT_COUNT 704
#define UNICODE_SIZE 1114111
#define MAX_VALUE 4294967295

#include "functionalext.h"
#include "test.h"

/**
 * @tc.name      : iswxdigit_0100
 * @tc.desc      : Use the iswxdigit method to determine whether the incoming wide character is a hexadecimal number
 * @tc.level     : Level 0
 */
void Iswxdigit0100(void)
{
    wchar_t ch = L'A';
    int result = iswxdigit(ch);
    if (result == 0) {
        t_error("%s iswxdigit get result is %d error", __func__, result);
    }
}

/**
 * @tc.name      : iswxdigit_0200
 * @tc.desc      : Incoming digit test iswxdigit return value
 * @tc.level     : Level 1
 */
void Iswxdigit0200(void)
{
    wchar_t ch = L'1';
    int result = iswxdigit(ch);
    if (result == 0) {
        t_error("%s iswxdigit get result is %d error", __func__, result);
    }
}

/**
 * @tc.name      : iswxdigit_0300
 * @tc.desc      : Pass in letters over F to test iswxdigit return value
 * @tc.level     : Level 1
 */
void Iswxdigit0300(void)
{
    wchar_t ch = L'G';
    int result = iswxdigit(ch);
    if (result != 0) {
        t_error("%s iswxdigit get result is %d error", __func__, result);
    }
}

/**
 * @tc.name      : iswxdigit_l_0100
 * @tc.desc      : Whether the characters in a wide string is hexadecimal digit character
 * @tc.level     : Level 0
 */
void IswxdigitL0100(void)
{
    const wchar_t *str = L"0123456789AaBbCcDdEeFf";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswxdigit_l(*p, nullptr);
        EXPECT_EQ("iswxdigit_l_0100", ret, ONREXPECT);
    }
}

/**
 * @tc.name      : iswxdigit_l_0101
 * @tc.desc      : Whether the characters in a wide string is hexadecimal digit character
 * @tc.level     : Level 0
 */
void IswxdigitL0101(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L"0123456789AaBbCcDdEeFf";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswxdigit_l(*p, mLocale);
        EXPECT_EQ("iswxdigit_l_0101", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswxdigit_l_0102
 * @tc.desc      : Whether the characters in a wide string is hexadecimal digit character
 * @tc.level     : Level 0
 */
void IswxdigitL0102(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L"0123456789AaBbCcDdEeFf";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswxdigit_l(*p, mLocale);
        EXPECT_EQ("iswxdigit_l_0102", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswxdigit_l_0200
 * @tc.desc      : Whether the characters in a wide string is non-hexadecimal digit character
 * @tc.level     : Level 2
 */
void IswxdigitL0200(void)
{
    const wchar_t *str = L"!@hHiIjJZz";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswxdigit_l(*p, nullptr);
        EXPECT_EQ("iswxdigit_l_0200", ret, CMPFLAG);
    }
}

/**
 * @tc.name      : iswxdigit_l_0201
 * @tc.desc      : Whether the characters in a wide string is non-hexadecimal digit character
 * @tc.level     : Level 2
 */
void IswxdigitL0201(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L"!@hHiIjJZz";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswxdigit_l(*p, mLocale);
        EXPECT_EQ("iswxdigit_l_0201", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswxdigit_l_0202
 * @tc.desc      : Whether the characters in a wide string is non-hexadecimal digit character
 * @tc.level     : Level 2
 */
void IswxdigitL0202(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L"!@hHiIjJZz";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswxdigit_l(*p, mLocale);
        EXPECT_EQ("iswxdigit_l_0202", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswxdigit_l_0300
 * @tc.desc      : Whether the characters in a wide string is non-hexadecimal digit character
 * @tc.level     : Level 2
 */
void IswxdigitL0300(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswxdigit_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswxdigit_l_0300", total, XDIGIT_WINT_COUNT);
}

/**
 * @tc.name      : iswxdigit_l_0400
 * @tc.desc      : Whether the characters in a wide string is non-hexadecimal digit character
 * @tc.level     : Level 2
 */
void IswxdigitL0400(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswxdigit_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswxdigit_l_0400", total, XDIGIT_WINT_COUNT);
}

/**
 * @tc.name      : iswxdigit_l_0500
 * @tc.desc      : Whether a character in a the maximum value of int is not a letter
 * @tc.level     : Level 1
 */
void IswxdigitL0500(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int ret = iswxdigit_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswxdigit_l_0500", ret, CMPFLAG);
}

/**
 * @tc.name      : iswxdigit_l_0600
 * @tc.desc      : Whether a character in a the maximum value of int is not a letter
 * @tc.level     : Level 1
 */
void IswxdigitL0600(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int ret = iswxdigit_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswxdigit_l_0600", ret, CMPFLAG);
}

static int IswxdigitTestImpl(int argc, char *argv[])
{
    typedef void (*SetWctypeIcuEnableFunc)(void);
    SetWctypeIcuEnableFunc setWctypeIcuEnable = (SetWctypeIcuEnableFunc)dlsym(RTLD_DEFAULT, "set_wctype_icu_enable");
    setWctypeIcuEnable();
    Iswxdigit0100();
    Iswxdigit0200();
    Iswxdigit0300();
    IswxdigitL0100();
    IswxdigitL0101();
    IswxdigitL0102();
    IswxdigitL0200();
    IswxdigitL0201();
    IswxdigitL0202();
    IswxdigitL0300();
    IswxdigitL0400();
    IswxdigitL0500();
    IswxdigitL0600();

    return g_tStatus;
}

int IswxdigitTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return IswxdigitTestImpl(1, libcArgv);
}
