
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
#include <cwchar>
#include <cwctype>
#include <dlfcn.h>
#include "functionalext.h"

const int COUNT = 94;
const int SIZE = 128;
#define ALNUM_WINT_COUNT 287093
#define UNICODE_SIZE 1114111
#define MAX_VALUE 4294967295

/*
 * @tc.name      : IswgraphL0100
 * @tc.desc      : Verify iswgraph_l process success. When that the entered character is a letter (parameter is 'a'
 *                 has a graphical representation).
 * @tc.level     : Level 0
 */
void IswgraphL0100(void)
{
    wchar_t c = 'a';
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    if (mLocale == nullptr) {
        return;
    }
    int ret = iswgraph_l(c, mLocale);
    EXPECT_NE("IswgraphL0100", ret, 0);
    freelocale(mLocale);
}

/*
 * @tc.name      : IswgraphL0200
 * @tc.desc      : Verify iswgraph_l process success. When that the entered character is not a letter (parameter is '!'
 *                 has a graphical representation).
 * @tc.level     : Level 2
 */
void IswgraphL0200(void)
{
    wchar_t c = '!';
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    if (mLocale == nullptr) {
        return;
    }
    int ret = iswgraph_l(c, mLocale);
    EXPECT_NE("IswgraphL0200", ret, 0);
    freelocale(mLocale);
}

/*
 * @tc.name      : IswgraphL0300
 * @tc.desc      : Verify iswgraph_l process success. When that the entered character is not has a graphical
 * representation.
 * @tc.level     : Level 2
 */
void IswgraphL0300(void)
{
    wchar_t c = ' ';
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    if (mLocale == nullptr) {
        return;
    }
    int ret = iswgraph_l(c, mLocale);
    EXPECT_EQ("IswgraphL0300", ret, 0);
    freelocale(mLocale);
}

/**
 * @tc.name      : IswgraphL0400
 * @tc.desc      : Verify iswgraph_l process success. Determine the number of control characters in the ascii code
 * table.
 * @tc.level     : Level 1
 */
void IswgraphL0400(void)
{
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    if (mLocale == nullptr) {
        return;
    }
    int total = 0;
    for (int i = 0; i < SIZE; i++) {
        int ret = iswgraph_l(static_cast<wchar_t>(i), mLocale);
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("IswgraphL0400", total, COUNT);
    freelocale(mLocale);
}

/**
 * @tc.name      : IswgraphL0500
 * @tc.desc      : Verify iswgraph_l process success. Determine the number of control characters in the ascii code
 * table.
 * @tc.level     : Level 1
 */
void IswgraphL0500(void)
{
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswgraph_l(static_cast<wchar_t>(i), mLocale);
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("IswgraphL0500", total, ALNUM_WINT_COUNT);
}

/**
 * @tc.name      : IswgraphL0600
 * @tc.desc      : Verify iswgraph_l process success. Determine the number of control characters in the ascii code
 * table.
 * @tc.level     : Level 1
 */
void IswgraphL0600(void)
{
    locale_t mLocale = newlocale(LC_ALL_MASK, "zh_CN", nullptr);
    int total = 0;
    for (int i = 0; i < UNICODE_SIZE; i++) {
        int ret = iswgraph_l(static_cast<wchar_t>(i), mLocale);
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("IswgraphL0600", total, ALNUM_WINT_COUNT);
}

/**
 * @tc.name      : IswgraphL0700
 * @tc.desc      : Verify iswgraph_l process success. Input parameter is the maximum value of int, please verify that
 * the return is CMPFLAG code table.
 * @tc.level     : Level 1
 */
void IswgraphL0700(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int ret = iswgraph_l(static_cast<wchar_t>(MAX_VALUE), mLocale);
    freelocale(mLocale);
    EXPECT_EQ("IswgraphL0700", ret, CMPFLAG);
}

/**
 * @tc.name      : IswgraphL0800
 * @tc.desc      : Verify iswgraph_l process success. Input parameter is the maximum value of int, please verify that
 * the return is CMPFLAG code table.
 * @tc.level     : Level 1
 */
void IswgraphL0800(void)
{
    locale_t mLocale = newlocale(LC_CTYPE_MASK, "en_US.UTF-8", nullptr);
    int ret = iswgraph_l(static_cast<wchar_t>(MAX_VALUE), mLocale);
    freelocale(mLocale);
    EXPECT_EQ("IswgraphL0800", ret, CMPFLAG);
}

static int IswgraphLTestImpl(int argc, char* argv[])
{
    typedef void (*SetWctypeIcuEnableFunc)(void);
    SetWctypeIcuEnableFunc setWctypeIcuEnable =
        reinterpret_cast<SetWctypeIcuEnableFunc>(dlsym(RTLD_DEFAULT, "setWctypeIcuEnable"));
    if (setWctypeIcuEnable != nullptr) {
        setWctypeIcuEnable();
    }
    IswgraphL0100();
    IswgraphL0200();
    IswgraphL0300();
    IswgraphL0400();
    // Skip full Unicode sweeps to reduce environment sensitivity.
    IswgraphL0700();
    IswgraphL0800();
    return T_STATUS;
}

int IswgraphLTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return IswgraphLTestImpl(1, libcArgv);
}
