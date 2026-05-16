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

#define PUNCT_WINT_COUNT 842
#define UNICODE_SIZE 1114111
#define MAX_VALUE 4294967295
/**
 * @tc.name      : iswpunct_0100
 * @tc.desc      : Use the iswpunct method to determine whether the incoming wide character is a punctuation mark
 * @tc.level     : Level 0
 */
void Iswpunct0100(void)
{
    wchar_t ch = L',';
    int result = iswpunct(ch);
    if (result == 0) {
        t_error("%s iswpunct get result is %d error", __func__, result);
    }
}

/**
 * @tc.name      : iswpunct_0200
 * @tc.desc      : Test iswpunct method for wide characters passed in non-punctuation marks
 * @tc.level     : Level 1
 */
void Iswpunct0200(void)
{
    wchar_t ch = L'A';
    int result = iswpunct(ch);
    if (result != 0) {
        t_error("%s iswpunct get result is %d error", __func__, result);
    }
}

/**
 * @tc.name      : iswpunct_l_0100
 * @tc.desc      : Whether the characters in a wide string are punctuation marks
 * @tc.level     : Level 0
 */
void IswpunctL0100(void)
{
    const wchar_t *str = L"!！，。？?";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswpunct_l(*p, nullptr);
        EXPECT_EQ("iswpunct_l_0100", ret, ONREXPECT);
    }
}

/**
 * @tc.name      : iswpunct_l_0101
 * @tc.desc      : Whether the characters in a wide string are punctuation marks
 * @tc.level     : Level 0
 */
void IswpunctL0101(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L"!！，。？?";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswpunct_l(*p, mLocale);
        EXPECT_EQ("iswpunct_l_0101", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswpunct_l_0102
 * @tc.desc      : Whether the characters in a wide string are punctuation marks
 * @tc.level     : Level 0
 */
void IswpunctL0102(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L"!！，。？?";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswpunct_l(*p, mLocale);
        EXPECT_EQ("iswpunct_l_0102", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswpunct_l_0200
 * @tc.desc      : Whether the characters in a wide string are non-punctuation marks
 * @tc.level     : Level 2
 */
void IswpunctL0200(void)
{
    const wchar_t *str = L"1AaÂÆ";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswpunct_l(*p, nullptr);
        EXPECT_EQ("iswpunct_l_0200", ret, CMPFLAG);
    }
}

/**
 * @tc.name      : iswpunct_l_0201
 * @tc.desc      : Whether the characters in a wide string are non-punctuation marks
 * @tc.level     : Level 2
 */
void IswpunctL0201(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L"1AaÂÆ";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswpunct_l(*p, mLocale);
        EXPECT_EQ("iswpunct_l_0201", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswpunct_l_0202
 * @tc.desc      : Whether the characters in a wide string are non-punctuation marks
 * @tc.level     : Level 2
 */
void IswpunctL0202(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L"1AaÂÆ";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswpunct_l(*p, mLocale);
        EXPECT_EQ("iswpunct_l_0202", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswpunct_l_0300
 * @tc.desc      : Whether the characters in a wide string are non-punctuation marks
 * @tc.level     : Level 2
 */
void IswpunctL0300(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswpunct_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswpunct_l_0300", total, PUNCT_WINT_COUNT);
}

/**
 * @tc.name      : iswpunct_l_0400
 * @tc.desc      : Whether the characters in a wide string are non-punctuation marks
 * @tc.level     : Level 2
 */
void IswpunctL0400(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswpunct_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswpunct_l_0400", total, PUNCT_WINT_COUNT);
}

/**
 * @tc.name      : iswpunct_l_0500
 * @tc.desc      : Whether a character in a the maximum value of int is not a letter
 * @tc.level     : Level 1
 */
void IswpunctL0500(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int ret = iswpunct_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswpunct_l_0500", ret, CMPFLAG);
}

/**
 * @tc.name      : iswpunct_l_0600
 * @tc.desc      : Whether a character in a the maximum value of int is not a letter
 * @tc.level     : Level 1
 */
void IswpunctL0600(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int ret = iswpunct_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswpunct_l_0600", ret, CMPFLAG);
}

static int IswpunctTestImpl(int argc, char *argv[])
{
    typedef void (*SetWctypeIcuEnableFunc)(void);
    SetWctypeIcuEnableFunc setWctypeIcuEnable = (SetWctypeIcuEnableFunc)dlsym(RTLD_DEFAULT, "set_wctype_icu_enable");
    setWctypeIcuEnable();
    Iswpunct0100();
    Iswpunct0200();
    IswpunctL0100();
    IswpunctL0101();
    IswpunctL0102();
    IswpunctL0200();
    IswpunctL0201();
    IswpunctL0202();
    IswpunctL0300();
    IswpunctL0400();
    IswpunctL0500();
    IswpunctL0600();
    return g_tStatus;
}

int IswpunctTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return IswpunctTestImpl(1, libcArgv);
}
