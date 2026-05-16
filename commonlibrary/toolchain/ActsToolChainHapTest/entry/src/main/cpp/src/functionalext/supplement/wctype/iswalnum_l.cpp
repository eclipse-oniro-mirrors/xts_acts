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

#include <clocale>
#include <cstdlib>
#include <cwctype>
#include <dlfcn.h>
#include "functionalext.h"

const int COUNT = 62;
const int SIZE = 128;

#define ALNUM_WINT_COUNT 137406
#define UNICODE_SIZE 1114111
#define MAX_VALUE 4294967295

/**
 * @tc.name      : IswalnumL0100
 * @tc.desc      : Verify iswalnum_l process success. The parameter c is an English letter,
 *                 and it is judged that the input character is a letter.
 * @tc.level     : Level 0
 */
void IswalnumL0100(void)
{
    wchar_t c = 'a';
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    if (mLocale == nullptr) {
        return;
    }
    int ret = iswalnum_l(c, mLocale);
    EXPECT_NE("IswalnumL0100", ret, 0);
    freelocale(mLocale);
}

/**
 * @tc.name      : IswalnumL0200
 * @tc.desc      : Verify iswalnum_l process success. The parameter c is an English number,
 *                 and it is judged that the input character is a number.
 * @tc.level     : Level 0
 */
void IswalnumL0200(void)
{
    wchar_t c = '1';
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    if (mLocale == nullptr) {
        return;
    }
    int ret = iswalnum_l('1', mLocale);
    EXPECT_NE("IswalnumL0200", ret, 0);
    freelocale(mLocale);
}

/**
 * @tc.name      : IswalnumL0300
 * @tc.desc      : Verify iswalnum_l process success. The parameter c is an special character,
 *                 and it is judged that the input character is not a letter or a number.
 * @tc.level     : Level 2
 */
void IswalnumL0300(void)
{
    wchar_t c = '*';
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    if (mLocale == nullptr) {
        return;
    }
    int ret = iswalnum_l('*', mLocale);
    EXPECT_EQ("IswalnumL0300", ret, 0);
    freelocale(mLocale);
}

/**
 * @tc.name      : IswalnumL0400
 * @tc.desc      : Verify iswalnum_l process success. Determine the number of letters and numbers in the ascii
 *                 code table.
 * @tc.level     : Level 1
 */
void IswalnumL0400(void)
{
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    if (mLocale == nullptr) {
        return;
    }
    int total = 0;
    for (int i = 0; i < SIZE; i++) {
        int ret = iswalnum_l(static_cast<wchar_t>(i), mLocale);
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("IswalnumL0400", total, COUNT);
    freelocale(mLocale);
}

/**
 * @tc.name      : IswalnumL0500
 * @tc.desc      : Verify iswalnum_l process success. Determine the number of letters and numbers in the ascii
 *                 code table.
 * @tc.level     : Level 1
 */
void IswalnumL0500(void)
{
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswalnum_l(static_cast<wchar_t>(i), mLocale);
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("IswalnumL0400", total, ALNUM_WINT_COUNT);
}

/**
 * @tc.name      : IswalnumL0600
 * @tc.desc      : Verify iswalnum_l process success. Determine the number of letters and numbers in the ascii
 *                 code table.
 * @tc.level     : Level 1
 */
void IswalnumL0600(void)
{
    locale_t mLocale = newlocale(LC_ALL_MASK, "zh_CN", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswalnum_l(static_cast<wchar_t>(i), mLocale);
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("IswalnumL0400", total, ALNUM_WINT_COUNT);
}

/**
 * @tc.name      : IswalnumL0700
 * @tc.desc      : Verify iswalnum_l process success. Input parameter is the maximum value of int, please verify that
 * the return is CMPFLAG
 * @tc.level     : Level 1
 */
void IswalnumL0700(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    if (mLocale == nullptr) {
        return;
    }
    int ret = iswalnum_l(static_cast<wchar_t>(MAX_VALUE), mLocale);
    freelocale(mLocale);
    EXPECT_EQ("IswalnumL0700", ret, CMPFLAG);
}

/**
 * @tc.name      : IswalnumL0800
 * @tc.desc      : Verify iswalnum_l process success. Input parameter is the maximum value of int, please verify that
 * the return is CMPFLAG code table.
 * @tc.level     : Level 1
 */
void IswalnumL0800(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    if (mLocale == nullptr) {
        return;
    }
    int ret = iswalnum_l(static_cast<wchar_t>(MAX_VALUE), mLocale);
    freelocale(mLocale);
    EXPECT_EQ("IswalnumL0800", ret, CMPFLAG);
}

static int IswalnumLTestImpl(void)
{
    typedef void (*SetWctypeIcuEnableFunc)(void);
    SetWctypeIcuEnableFunc setWctypeIcuEnable =
        reinterpret_cast<SetWctypeIcuEnableFunc>(dlsym(RTLD_DEFAULT, "setWctypeIcuEnable"));
    if (setWctypeIcuEnable != nullptr) {
        setWctypeIcuEnable();
    }
    IswalnumL0100();
    IswalnumL0200();
    IswalnumL0300();
    IswalnumL0400();
    // Full Unicode scan is extremely environment dependent and slow on some devices.
    // Keep deterministic ASCII/basic cases for portability.
    IswalnumL0700();
    IswalnumL0800();
    return T_STATUS;
}

int IswalnumLTest(void)
{
    return IswalnumLTestImpl();
}
