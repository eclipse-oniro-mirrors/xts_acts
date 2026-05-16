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

#define ALPHA_WINT_COUNT 136726
#define UNICODE_SIZE 1114111
#define MAX_VALUE 4294967295
/**
 * @tc.name      : iswalpha_l_0100
 * @tc.desc      : Whether the characters in a wide string are letters
 * @tc.level     : Level 0
 */
void IswalphaL0100(void)
{
    const wchar_t *str = L"aBcrWER";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswalpha_l(*p, nullptr);
        EXPECT_EQ("iswalpha_l_0100", ret, ONREXPECT);
    }
}

/**
 * @tc.name      : iswalpha_l_0101
 * @tc.desc      : Whether the characters in a wide string are letters
 * @tc.level     : Level 0
 */
void IswalphaL0101(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L"aBcrWER";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswalpha_l(*p, mLocale);
        EXPECT_EQ("iswalpha_l_0101", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswalpha_l_0102
 * @tc.desc      : Whether the characters in a wide string are letters
 * @tc.level     : Level 0
 */
void IswalphaL0102(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L"aBcrWER";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswalpha_l(*p, mLocale);
        EXPECT_EQ("iswalpha_l_0102", ret, ONREXPECT);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswalpha_l_0200
 * @tc.desc      : Whether a character in a wide string is not a letter
 * @tc.level     : Level 2
 */
void IswalphaL0200(void)
{
    const wchar_t *str = L"2!~*";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswalpha_l(*p, nullptr);
        EXPECT_EQ("iswalpha_l_0200", ret, CMPFLAG);
    }
}

/**
 * @tc.name      : iswalpha_l_0201
 * @tc.desc      : Whether a character in a wide string is not a letter
 * @tc.level     : Level 2
 */
void IswalphaL0201(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    const wchar_t *str = L"2!~*";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswalpha_l(*p, mLocale);
        EXPECT_EQ("iswalpha_l_0201", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswalpha_l_0202
 * @tc.desc      : Whether a character in a wide string is not a letter
 * @tc.level     : Level 2
 */
void IswalphaL0202(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    const wchar_t *str = L"2!~*";
    const wchar_t *p = str;
    while (*p++ && *p != '\0') {
        int ret = iswalpha_l(*p, mLocale);
        EXPECT_EQ("iswalpha_l_0202", ret, CMPFLAG);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : iswalpha_l_0300
 * @tc.desc      : Whether a character in a wide string is not a letter
 * @tc.level     : Level 1
 */
void IswalphaL0300(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswalpha_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswalpha_l_0300", total, ALPHA_WINT_COUNT);
}

/**
 * @tc.name      : iswalpha_l_0400
 * @tc.desc      : Whether a character in a wide string is not a letter
 * @tc.level     : Level 1
 */
void IswalphaL0400(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswalpha_l(i, mLocale);
        if (ret) {
            total++;
        }
    }
    freelocale(mLocale);
    EXPECT_EQ("iswalpha_l_0300", total, ALPHA_WINT_COUNT);
}

/**
 * @tc.name      : iswalpha_l_0500
 * @tc.desc      : Whether a character in a wide string is not a letter
 * @tc.level     : Level 1
 */
void IswalphaL0500(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "zh_CN", nullptr);
    int ret = iswalpha_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswalpha_l_0500", ret, CMPFLAG);
}

/**
 * @tc.name      : iswalpha_l_0600
 * @tc.desc      : Whether a character in a wide string is not a letter
 * @tc.level     : Level 1
 */
void IswalphaL0600(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int ret = iswalpha_l(MAX_VALUE, mLocale);
    freelocale(mLocale);
    EXPECT_EQ("iswalpha_l_0600", ret, CMPFLAG);
}

static int IswalphaTestImpl(void)
{
    typedef void (*SetWctypeIcuEnableFunc)(void);
    SetWctypeIcuEnableFunc setWctypeIcuEnable = (SetWctypeIcuEnableFunc)dlsym(RTLD_DEFAULT, "set_wctype_icu_enable");
    setWctypeIcuEnable();
    IswalphaL0100();
    IswalphaL0101();
    IswalphaL0102();
    IswalphaL0200();
    IswalphaL0201();
    IswalphaL0202();
    IswalphaL0300();
    IswalphaL0400();
    IswalphaL0500();
    IswalphaL0600();
    return g_tStatus;
}

int IswalphaTest(void)
{
    return IswalphaTestImpl();
}
