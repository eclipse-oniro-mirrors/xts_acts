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
#include "functionalext.h"

namespace {
struct LocaleGuard {
    locale_t loc;
    explicit LocaleGuard(locale_t l) : loc(l) {}
    ~LocaleGuard()
    {
        if (loc != nullptr) {
            freelocale(loc);
        }
    }
    locale_t Get() const
    {
        return loc;
    }
};
} // namespace

const int COUNT = 62;

/**
 * @tc.name      : IswctypeL0100
 * @tc.desc      : Verify iswctype_l process success. The parameter c is a WCTYPE_ALNUM,
 *                 and it is judged that the input character is a WCTYPE_ALNUM.
 * @tc.level     : Level 0
 */
void IswctypeL0100(void)
{
    wchar_t c = L'0';
    wctype_t wt = wctype("alnum");
    EXPECT_NE("IswctypeL0100", wt, -1);
    LocaleGuard locGuard(newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr));
    locale_t mLocale = locGuard.Get();
    int ret = iswctype_l(c, wt, mLocale);
    EXPECT_NE("IswctypeL0100", ret, 0);
}

/**
 * @tc.name      : IswctypeL0200
 * @tc.desc      : Verify iswctype_l process success. The parameter c is a WCTYPE_ALPHA,
 *                 and it is judged that the input character is a WCTYPE_ALPHA.
 * @tc.level     : Level 0
 */
void IswctypeL0200(void)
{
    wchar_t c = L'a';
    wctype_t wt = wctype("alpha");
    EXPECT_NE("IswctypeL0200", wt, -1);
    LocaleGuard locGuard(newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr));
    locale_t mLocale = locGuard.Get();
    int ret = iswctype_l(c, wt, mLocale);
    EXPECT_NE("IswctypeL0200", ret, 0);
}

/**
 * @tc.name      : IswctypeL0300
 * @tc.desc      : Verify iswctype_l process success. The parameter c is a WCTYPE_BLANK,
 *                 and it is judged that the input character is a WCTYPE_BLANK.
 * @tc.level     : Level 0
 */
void IswctypeL0300(void)
{
    wchar_t c = L' ';
    wctype_t wt = wctype("blank");
    EXPECT_NE("IswctypeL0300", wt, -1);
    LocaleGuard locGuard(newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr));
    locale_t mLocale = locGuard.Get();
    int ret = iswctype_l(c, wt, mLocale);
    EXPECT_NE("IswctypeL0300", ret, 0);
}

/**
 * @tc.name      : IswctypeL0400
 * @tc.desc      : Verify iswctype_l process success. The parameter c is a WCTYPE_CNTRL,
 *                 and it is judged that the input character is a WCTYPE_CNTRL.
 * @tc.level     : Level 0
 */
void IswctypeL0400(void)
{
    wchar_t c = L'\n';
    wctype_t wt = wctype("cntrl");
    EXPECT_NE("IswctypeL0400", wt, -1);
    LocaleGuard locGuard(newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr));
    locale_t mLocale = locGuard.Get();
    int ret = iswctype_l(c, wt, mLocale);
    EXPECT_NE("IswctypeL0400", ret, 0);
}

/**
 * @tc.name      : IswctypeL0500
 * @tc.desc      : Verify iswctype_l process success. The parameter c is a WCTYPE_DIGIT,
 *                 and it is judged that the input character is a WCTYPE_DIGIT.
 * @tc.level     : Level 0
 */
void IswctypeL0500(void)
{
    wchar_t c = L'1';
    wctype_t wt = wctype("digit");
    EXPECT_NE("IswctypeL0500", wt, -1);
    LocaleGuard locGuard(newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr));
    locale_t mLocale = locGuard.Get();
    int ret = iswctype_l(c, wt, mLocale);
    EXPECT_NE("IswctypeL0500", ret, 0);
}

/**
 * @tc.name      : IswctypeL0600
 * @tc.desc      : Verify iswctype_l process success. The parameter c is a WCTYPE_GRAPH,
 *                 and it is judged that the input character is a WCTYPE_GRAPH.
 * @tc.level     : Level 0
 */
void IswctypeL0600(void)
{
    wchar_t c = L'!';
    wctype_t wt = wctype("graph");
    EXPECT_NE("IswctypeL0600", wt, -1);
    LocaleGuard locGuard(newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr));
    locale_t mLocale = locGuard.Get();
    int ret = iswctype_l(c, wt, mLocale);
    EXPECT_NE("IswctypeL0600", ret, 0);
}

/**
 * @tc.name      : IswctypeL0700
 * @tc.desc      : Verify iswctype_l process success. The parameter c is a WCTYPE_LOWER,
 *                 and it is judged that the input character is a WCTYPE_LOWER.
 * @tc.level     : Level 0
 */
void IswctypeL0700(void)
{
    wchar_t c = L'z';
    wctype_t wt = wctype("lower");
    EXPECT_NE("IswctypeL0700", wt, -1);
    LocaleGuard locGuard(newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr));
    locale_t mLocale = locGuard.Get();
    int ret = iswctype_l(c, wt, mLocale);
    EXPECT_NE("IswctypeL0700", ret, 0);
}

/**
 * @tc.name      : IswctypeL0800
 * @tc.desc      : Verify iswctype_l process success. The parameter c is a WCTYPE_PRINT,
 *                 and it is judged that the input character is a WCTYPE_PRINT.
 * @tc.level     : Level 0
 */
void IswctypeL0800(void)
{
    wchar_t c = L'p';
    wctype_t wt = wctype("print");
    EXPECT_NE("IswctypeL0800", wt, -1);
    LocaleGuard locGuard(newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr));
    locale_t mLocale = locGuard.Get();
    int ret = iswctype_l(c, wt, mLocale);
    EXPECT_NE("IswctypeL0800", ret, 0);
}

/**
 * @tc.name      : IswctypeL0900
 * @tc.desc      : Verify iswctype_l process success. The parameter c is a WCTYPE_PUNCT,
 *                 and it is judged that the input character is a WCTYPE_PUNCT.
 * @tc.level     : Level 0
 */
void IswctypeL0900(void)
{
    wchar_t c = L'/';
    wctype_t wt = wctype("punct");
    EXPECT_NE("IswctypeL0900", wt, -1);
    LocaleGuard locGuard(newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr));
    locale_t mLocale = locGuard.Get();
    int ret = iswctype_l(c, wt, mLocale);
    EXPECT_NE("IswctypeL0900", ret, 0);
}

/**
 * @tc.name      : IswctypeL1000
 * @tc.desc      : Verify iswctype_l process success. The parameter c is a WCTYPE_SPACE,
 *                 and it is judged that the input character is a WCTYPE_SPACE.
 * @tc.level     : Level 0
 */
void IswctypeL1000(void)
{
    wchar_t c = L'\n';
    wctype_t wt = wctype("space");
    EXPECT_NE("IswctypeL1000", wt, -1);
    LocaleGuard locGuard(newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr));
    locale_t mLocale = locGuard.Get();
    int ret = iswctype_l(c, wt, mLocale);
    EXPECT_NE("IswctypeL1000", ret, 0);
}

/**
 * @tc.name      : IswctypeL1100
 * @tc.desc      : Verify iswctype_l process success. The parameter c is a WCTYPE_UPPER,
 *                 and it is judged that the input character is a WCTYPE_UPPER.
 * @tc.level     : Level 0
 */
void IswctypeL1100(void)
{
    wchar_t c = L'A';
    wctype_t wt = wctype("upper");
    EXPECT_NE("IswctypeL1100", wt, -1);
    LocaleGuard locGuard(newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr));
    locale_t mLocale = locGuard.Get();
    int ret = iswctype_l(c, wt, mLocale);
    EXPECT_NE("IswctypeL1100", ret, 0);
}

/**
 * @tc.name      : IswctypeL1200
 * @tc.desc      : Verify iswctype_l process success. The parameter c is a WCTYPE_XDIGIT,
 *                 and it is judged that the input character is a WCTYPE_XDIGIT.
 * @tc.level     : Level 0
 */
void IswctypeL1200(void)
{
    wchar_t c = L'd';
    wctype_t wt = wctype("xdigit");
    EXPECT_NE("IswctypeL1200", wt, -1);
    LocaleGuard locGuard(newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr));
    locale_t mLocale = locGuard.Get();
    int ret = iswctype_l(c, wt, mLocale);
    EXPECT_NE("IswctypeL1200", ret, 0);
}

/**
 * @tc.name      : IswctypeL1300
 * @tc.desc      : Verify iswctype_l process success. The parameter c is a error type,
 *                 and it is judged that the input character is a error type.
 * @tc.level     : Level 2
 */
void IswctypeL1300(void)
{
    wchar_t c = L'【';
    wctype_t wt = wctype("xdigit");
    EXPECT_NE("IswctypeL1300", wt, -1);
    LocaleGuard locGuard(newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr));
    locale_t mLocale = locGuard.Get();
    int ret = iswctype_l(c, wt, mLocale);
    EXPECT_EQ("IswctypeL1300", ret, 0);
}

static int IswctypeLTestImpl(void)
{
    IswctypeL0100();
    IswctypeL0200();
    IswctypeL0300();
    IswctypeL0400();
    IswctypeL0500();
    IswctypeL0600();
    IswctypeL0700();
    IswctypeL0800();
    IswctypeL0900();
    IswctypeL1000();
    IswctypeL1100();
    IswctypeL1200();
    IswctypeL1300();
    return T_STATUS;
}

int IswctypeLTest(void)
{
    return IswctypeLTestImpl();
}
