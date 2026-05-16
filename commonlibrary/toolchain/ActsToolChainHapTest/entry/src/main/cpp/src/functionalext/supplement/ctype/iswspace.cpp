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

#define SPACE_WINT_COUNT 29
#define UNICODE_SIZE 1114111
#define MAX_VALUE 4294967295
/**
 * @tc.name      : iswspace_0100
 * @tc.desc      : Use the iswspace method to determine whether the incoming wide character is a blank symbol
 * @tc.level     : Level 0
 */
void Iswspace0100(void)
{
    wchar_t ch = L' ';
    int result = iswspace(ch);
    if (result == 0) {
        t_error("%s iswspace get result is %d error", __func__, result);
    }
}

/**
 * @tc.name      : iswspace_0200
 * @tc.desc      : Test iswpunct method for wide characters passing in non-whitespace characters
 * @tc.level     : Level 1
 */
void Iswspace0200(void)
{
    wchar_t ch = L'A';
    int result = iswspace(ch);
    if (result != 0) {
        t_error("%s iswspace get result is %d error", __func__, result);
    }
}

/**
 * @tc.name      : iswspace_l_0100
 * @tc.desc      : Whether the characters in a wide string is whitespace character
 * @tc.level     : Level 0
 */
void IswspaceL0100(void)
{
    const wchar_t *str = L" \t\n\r";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswspace_l(*p, nullptr);
        EXPECT_EQ("iswspace_l_0100", ret, ONREXPECT);
    }
}

/**
 * @tc.name      : iswspace_l_0101
 * @tc.desc      : Whether the characters in a wide string is whitespace character
 * @tc.level     : Level 0
 */
void IswspaceL0101(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L" \t\n\r";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswspace_l(*p, mLocale);
        EXPECT_EQ("iswspace_l_0101", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswspace_l_0102
 * @tc.desc      : Whether the characters in a wide string is whitespace character
 * @tc.level     : Level 0
 */
void IswspaceL0102(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L" \t\n\r";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswspace_l(*p, mLocale);
        EXPECT_EQ("iswspace_l_0102", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswspace_l_0200
 * @tc.desc      : Whether the characters in a wide string are non-whitespace character
 * @tc.level     : Level 2
 */
void IswspaceL0200(void)
{
    const wchar_t *str = L"1AaÂÆ";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswspace_l(*p, nullptr);
        EXPECT_EQ("iswspace_l_0200", ret, CMPFLAG);
    }
}

/**
 * @tc.name      : iswspace_l_0201
 * @tc.desc      : Whether the characters in a wide string are non-whitespace character
 * @tc.level     : Level 2
 */
void IswspaceL0201(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L"1AaÂÆ";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswspace_l(*p, mLocale);
        EXPECT_EQ("iswspace_l_0201", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswspace_l_0202
 * @tc.desc      : Whether the characters in a wide string are non-whitespace character
 * @tc.level     : Level 2
 */
void IswspaceL0202(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L"1AaÂÆ";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswspace_l(*p, mLocale);
        EXPECT_EQ("iswspace_l_0202", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswspace_l_0300
 * @tc.desc      : Whether the characters in a wide string are non-whitespace character
 * @tc.level     : Level 2
 */
void IswspaceL0300(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswspace_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswspace_l_0300", total, SPACE_WINT_COUNT);
}

/**
 * @tc.name      : iswspace_l_0400
 * @tc.desc      : Whether the characters in a wide string are non-whitespace character
 * @tc.level     : Level 2
 */
void IswspaceL0400(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswspace_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswspace_l_0400", total, SPACE_WINT_COUNT);
}

/**
 * @tc.name      : iswspace_l_0500
 * @tc.desc      : Whether a character in a the maximum value of int is not a letter
 * @tc.level     : Level 1
 */
void IswspaceL0500(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int ret = iswspace_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswspace_l_0500", ret, CMPFLAG);
}

/**
 * @tc.name      : iswspace_l_0600
 * @tc.desc      : Whether a character in a the maximum value of int is not a letter
 * @tc.level     : Level 1
 */
void IswspaceL0600(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int ret = iswspace_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswspace_l_0600", ret, CMPFLAG);
}

static int IswspaceTestImpl(int argc, char *argv[])
{
    typedef void (*SetWctypeIcuEnableFunc)(void);
    SetWctypeIcuEnableFunc setWctypeIcuEnable = (SetWctypeIcuEnableFunc)dlsym(RTLD_DEFAULT, "set_wctype_icu_enable");
    setWctypeIcuEnable();
    Iswspace0100();
    Iswspace0200();
    IswspaceL0100();
    IswspaceL0101();
    IswspaceL0102();
    IswspaceL0200();
    IswspaceL0201();
    IswspaceL0202();
    IswspaceL0300();
    IswspaceL0400();
    IswspaceL0500();
    IswspaceL0600();
    return g_tStatus;
}

int IswspaceTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return IswspaceTestImpl(1, libcArgv);
}
