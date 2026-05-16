/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include <strings.h>
#include <wctype.h>
#include <wchar.h>

#include "gtest/gtest.h"
#include "log.h"
#include "utils.h"

using namespace testing::ext;

class ActsUtilStringOperApiTest : public testing::Test {
public:
    locale_t g_ausoaLocale;
protected:
    // SetUpTestCase: Testsuit setup, run before 1st testcase
    static void SetUpTestCase(void)
    {
    }
    // TearDownTestCase: Testsuit teardown, run after last testcase
    static void TearDownTestCase(void)
    {
    }
    // Testcase setup
    virtual void SetUp()
    {
        g_ausoaLocale = newlocale(LC_ALL_MASK, "", (locale_t)0);
    }
    // Testcase teardown
    virtual void TearDown()
    {
        freelocale(g_ausoaLocale);
    }
};

/**
 * @tc.name   testFss0100
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_FFS_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testFss0100, Function | MediumTest | Level1) {
    int paraValue;
    int returnVal;

    paraValue = 1;
    returnVal = ffs(paraValue);
    LOGD("    ffs returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(1 == returnVal) << "ErrInfo: ffs returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testFss0200
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_FFS_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testFss0200, Function | MediumTest | Level1) {
    int paraValue;
    int returnVal;

    paraValue = 0;
    returnVal = ffs(paraValue);
    LOGD("    ffs returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: ffs returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testFss0300
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_FFS_0300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testFss0300, Function | MediumTest | Level1) {
    int paraValue;
    int returnVal;

    paraValue = 0x8000;
    returnVal = ffs(paraValue);
    LOGD("    ffs returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(16 == returnVal) << "ErrInfo: ffs returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testFssl0400
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_FFSL_0400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testFssl0400, Function | MediumTest | Level1) {
    long int paraValue;
    int returnVal;

    paraValue = 1;
    returnVal = ffsl(paraValue);
    LOGD("    ffsl returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(1 == returnVal) << "ErrInfo: ffsl returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testFssl0500
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_FFSL_0500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testFssl0500, Function | MediumTest | Level1) {
    long int paraValue;
    int returnVal;

    paraValue = 0;
    returnVal = ffsl(paraValue);
    LOGD("    ffsl returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: ffsl returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testFssl0600
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_FFSL_0600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testFssl0600, Function | MediumTest | Level1) {
    long int paraValue;
    int returnVal;

    paraValue = 0x8000;
    returnVal = ffsl(paraValue);
    LOGD("    ffsl returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(16 == returnVal) << "ErrInfo: ffsl returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testFssll0700
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_FFSLL_0700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testFssll0700, Function | MediumTest | Level1) {
    long long int paraValue;
    int returnVal;

    paraValue = 1;
    returnVal = ffsll(paraValue);
    LOGD("    ffsll returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(1 == returnVal) << "ErrInfo: ffsll returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testFssll0800
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_FFSLL_0800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testFssll0800, Function | MediumTest | Level1) {
    long long int paraValue;
    int returnVal;

    paraValue = 0;
    returnVal = ffsll(paraValue);
    LOGD("    ffsll returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: ffsll returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testFssll0900
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_FFSLL_0900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testFssll0900, Function | MediumTest | Level1) {
    long long int paraValue;
    int returnVal;

    paraValue = 0x800000000000;
    returnVal = ffsll(paraValue);
    LOGD("    ffsll returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(48 == returnVal) << "ErrInfo: ffsll returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcwidth1000
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCWIDTH_1000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcwidth1000, Function | MediumTest | Level1) {
    wchar_t wideChar;
    int returnVal;

    wideChar = '\0';
    returnVal = wcwidth(wideChar);
    LOGD("    wcwidth returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcwidth returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcwidth1100
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCWIDTH_1100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcwidth1100, Function | MediumTest | Level1) {
    wchar_t wideChar;
    int returnVal;

    wideChar = 'A';
    returnVal = wcwidth(wideChar);
    LOGD("    wcwidth returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(1 == returnVal) << "ErrInfo: wcwidth returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWctype1200
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCTYPE_1200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWctype1200, Function | MediumTest | Level1) {
    const char *paraVal = "alnum";
    wctype_t returnVal;

    returnVal = wctype(paraVal);
    LOGD("    wcwidth returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: wcwidth returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWctype1300
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCTYPE_1300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWctype1300, Function | MediumTest | Level1) {
    const char *paraVal = "alnumalpha";
    wctype_t returnVal;

    returnVal = wctype(paraVal);
    LOGD("    wcwidth returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcwidth returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWctypeL1400
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCTYPE_L_1400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWctypeL1400, Function | MediumTest | Level1) {
    const char *paraVal = "alnum";
    wctype_t returnVal;

    returnVal = wctype_l(paraVal, g_ausoaLocale);
    LOGD("    wctype_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: wctype_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWctypeL1500
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCTYPE_L_1500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWctypeL1500, Function | MediumTest | Level1) {
    const char *paraVal = "alnumalpha";
    wctype_t returnVal;

    returnVal = wctype_l(paraVal, g_ausoaLocale);
    LOGD("    wctype_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wctype_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testMblen1600
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_MBLEN_1600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testMblen1600, Function | MediumTest | Level1) {
    const char *paraVal = nullptr;
    size_t sizeVal;
    int returnVal;

    paraVal = "a";
    sizeVal = 1;
    returnVal = mblen(paraVal, sizeVal);
    LOGD("    mblen returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(1 == returnVal) << "ErrInfo: mblen returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testMbrlen1700
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_MBLEN_1700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testMbrlen1700, Function | MediumTest | Level1) {
    const char *paraVal = nullptr;
    size_t sizeVal;
    mbstate_t *psVal = nullptr;
    size_t returnVal;

    paraVal = "a";
    sizeVal = 1;
    returnVal = mbrlen(paraVal, sizeVal, psVal);
    LOGD("    mbrlen returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(1 == returnVal) << "ErrInfo: mbrlen returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcpcpy1800
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCPCPY_1800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcpcpy1800, Function | MediumTest | Level1) {
    wchar_t paraDest[10];
    const wchar_t *paraSrc = L"abcde";
    wchar_t *returnVal = nullptr;

    returnVal = wcpcpy(paraDest, paraSrc);
    LOGD("    wcpcpy returnVal:='%x'\n", returnVal);
    ASSERT_TRUE(0 == wcscmp(paraDest, paraSrc) && L'\0' == *returnVal)
        << "ErrInfo: wcpcpy returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcpncpy1900
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCPNCPY_1900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcpncpy1900, Function | MediumTest | Level1) {
    wchar_t paraDest[10];
    const wchar_t *paraSrc = L"abcde";
    size_t lenVal;
    wchar_t *returnVal = nullptr;

    lenVal = wcslen(paraSrc);
    returnVal = wcpncpy(paraDest, paraSrc, lenVal + 1);
    LOGD("    wcpncpy returnVal:='%x'\n", returnVal);
    ASSERT_TRUE(0 == wcsncmp(paraDest, paraSrc, lenVal) && L'\0' == *returnVal)
        << "ErrInfo: wcpncpy returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcscasecmp2000
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCASECMP_2000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcscasecmp2000, Function | MediumTest | Level1) {
    const wchar_t *strVal1 = L"abcde";
    const wchar_t *strVal2 = L"ABCDE";
    int returnVal;

    returnVal = wcscasecmp(strVal1, strVal2);
    LOGD("    wcscasecmp returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcscasecmp returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcscasecmp2100
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCASECMP_2100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcscasecmp2100, Function | MediumTest | Level1) {
    const wchar_t *strVal1 = L"abcde";
    const wchar_t *strVal2 = L"abcde";
    int returnVal;

    returnVal = wcscasecmp(strVal1, strVal2);
    LOGD("    wcscasecmp returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcscasecmp returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcscasecmpL2200
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCASECMP_L_2000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcscasecmpL2200, Function | MediumTest | Level1) {
    const wchar_t *strVal1 = L"abcde";
    const wchar_t *strVal2 = L"ABCDE";
    int returnVal;

    returnVal = wcscasecmp_l(strVal1, strVal2, g_ausoaLocale);
    LOGD("    wcscasecmp_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcscasecmp_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcscasecmpL2300
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCASECMP_L_2100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcscasecmpL2300, Function | MediumTest | Level1) {
    const wchar_t *strVal1 = L"abcde";
    const wchar_t *strVal2 = L"abcde";
    int returnVal;

    returnVal = wcscasecmp_l(strVal1, strVal2, g_ausoaLocale);
    LOGD("    wcscasecmp_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcscasecmp_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcsncasecmp2400
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSNCASECMP_2400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcsncasecmp2400, Function | MediumTest | Level1) {
    const wchar_t *strVal1 = L"abcde";
    const wchar_t *strVal2 = L"ABCDE";
    size_t lenVal;
    int returnVal;

    lenVal = 3;
    returnVal = wcsncasecmp(strVal1, strVal2, lenVal);
    LOGD("    wcsncasecmp returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcsncasecmp returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcsncasecmp2500
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSNCASECMP_2500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcsncasecmp2500, Function | MediumTest | Level1) {
    const wchar_t *strVal1 = L"abcde";
    const wchar_t *strVal2 = L"abcde";
    size_t lenVal;
    int returnVal;

    lenVal = 5;
    returnVal = wcsncasecmp(strVal1, strVal2, lenVal);
    LOGD("    wcsncasecmp returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcsncasecmp returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcsncasecmpL2600
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSNCASECMP_L_2600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcsncasecmpL2600, Function | MediumTest | Level1) {
    const wchar_t *strVal1 = L"abcde";
    const wchar_t *strVal2 = L"ABCDE";
    size_t lenVal;
    int returnVal;

    lenVal = 3;
    returnVal = wcsncasecmp_l(strVal1, strVal2, lenVal, g_ausoaLocale);
    LOGD("    wcsncasecmp_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcsncasecmp_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcsncasecmpL2700
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSNCASECMP_L_2700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcsncasecmpL2700, Function | MediumTest | Level1) {
    const wchar_t *strVal1 = L"abcde";
    const wchar_t *strVal2 = L"abcde";
    size_t lenVal;
    int returnVal;

    lenVal = 5;
    returnVal = wcsncasecmp_l(strVal1, strVal2, lenVal, g_ausoaLocale);
    LOGD("    wcsncasecmp_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcsncasecmp_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcsnlen2800
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSNLEN_2800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcsnlen2800, Function | MediumTest | Level1) {
    const wchar_t *paraVal = L"abcde";
    size_t maxLen;
    size_t returnVal;

    maxLen = wcslen(paraVal);
    returnVal = wcsnlen(paraVal, maxLen);
    LOGD("    wcsnlen returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(5 == returnVal) << "ErrInfo: wcsnlen returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcswidth2900
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSWIDTH_2900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcswidth2900, Function | MediumTest | Level1) {
    const wchar_t *paraVal = L"abcde";
    size_t lenVal;
    int returnVal;

    lenVal = wcslen(paraVal);
    returnVal = wcswidth(paraVal, lenVal);
    LOGD("    wcswidth returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(5 == returnVal) << "ErrInfo: wcswidth returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcscat3000
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCAT_3000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcscat3000, Function | MediumTest | Level1) {
    wchar_t paraDest[10];
    wchar_t paraSrc[5];
    wchar_t *returnVal = nullptr;

    wcscpy(paraDest, L"abc");
    wcscpy(paraSrc, L"def");
    returnVal = wcscat(paraDest, paraSrc);
    LOGD("    wcscat returnVal:='%s'\n", returnVal);
    ASSERT_TRUE(0 == wcscmp(returnVal, L"abcdef")) << "ErrInfo: wcscat returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcsncat3100
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSNCAT_3100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcsncat3100, Function | MediumTest | Level1) {
    wchar_t paraDest[10];
    wchar_t paraSrc[5];
    wchar_t *returnVal = nullptr;

    wcsncpy(paraDest, L"abc", wcslen(L"abc") + 1);
    wcsncpy(paraSrc, L"def", wcslen(L"def") + 1);
    returnVal = wcsncat(paraDest, paraSrc, wcslen(L"def"));
    LOGD("    wcscat returnVal:='%x'\n", returnVal);
    ASSERT_TRUE(0 == wcscmp(returnVal, L"abcdef")) << "ErrInfo: wcscat returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcschr3200
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCHR_3200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcschr3200, Function | MediumTest | Level1) {
    const wchar_t *paraWcs;
    wchar_t paraWc;
    wchar_t *returnVal;

    paraWcs = L"abcdefa";
    paraWc = 'a';
    returnVal = wcschr((wchar_t *)paraWcs, paraWc);
    LOGD("    wcschr returnVal:='%x'\n", returnVal);
    ASSERT_TRUE(paraWcs == returnVal) << "ErrInfo: wcschr *returnVal:='" << *returnVal << "'";
}

/**
 * @tc.name   testWcschr3300
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCHR_3300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcschr3300, Function | MediumTest | Level1) {
    const wchar_t *paraWcs;
    wchar_t paraWc;
    wchar_t *returnVal;

    paraWcs = L"abcdef";
    paraWc = 'g';
    returnVal = wcschr((wchar_t *)paraWcs, paraWc);
    LOGD("    wcschr returnVal:='%x'\n", returnVal);
    ASSERT_TRUE(nullptr == returnVal) << "ErrInfo: wcschr returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcsrchr3400
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSRCHR_3400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcsrchr3400, Function | MediumTest | Level1) {
    const wchar_t *paraWcs;
    wchar_t paraWc;
    wchar_t *returnVal;

    paraWcs = L"abcdefa";
    paraWc = 'a';
    returnVal = wcsrchr((wchar_t *)paraWcs, paraWc);
    LOGD("    wcsrchr returnVal:='%x %x %x'\n", paraWcs, returnVal, (paraWcs + wcslen(L"abcdef")));
    ASSERT_TRUE((paraWcs + wcslen(L"abcdef")) == returnVal) << "ErrInfo: wcsrchr *returnVal:='" << *returnVal << "'";
}

/**
 * @tc.name   testWcsrchr3500
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCHR_3500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcsrchr3500, Function | MediumTest | Level1) {
    const wchar_t *paraWcs;
    wchar_t paraWc;
    wchar_t *returnVal;

    paraWcs = L"abcdef";
    paraWc = 'g';
    returnVal = wcsrchr((wchar_t *)paraWcs, paraWc);
    LOGD("    wcsrchr returnVal:='%x'\n", returnVal);
    ASSERT_TRUE(nullptr == returnVal) << "ErrInfo: wcsrchr returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcsdup3600
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSDUP_3600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcsdup3600, Function | MediumTest | Level1) {
    const wchar_t *paraWcs;
    wchar_t *returnVal;

    paraWcs = L"abcdef";
    returnVal = wcsdup(paraWcs);
    LOGD("    wcsdup returnVal:='%x'\n", returnVal);
    ASSERT_TRUE(0 == wcscmp(returnVal, paraWcs)) << "ErrInfo: wcsdup returnVal:='" << returnVal << "'";
    free(returnVal);
}

/**
 * @tc.name   testWcscoll3700
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCOLL_3700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcscoll3700, Function | MediumTest | Level1) {
    const wchar_t *paraWcs1;
    const wchar_t *paraWcs2;
    int returnVal;

    paraWcs1 = L"abcdef";
    paraWcs2 = L"abcdef";
    returnVal = wcscoll(paraWcs1, paraWcs2);
    LOGD("    wcscoll returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcscoll returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcscoll3800
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCOLL_3800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcscoll3800, Function | MediumTest | Level1) {
    const wchar_t *paraWcs1;
    const wchar_t *paraWcs2;
    int returnVal;

    paraWcs1 = L"abcdefg";
    paraWcs2 = L"abcdef";
    returnVal = wcscoll(paraWcs1, paraWcs2);
    LOGD("    wcscoll returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal > 0) << "ErrInfo: wcscoll returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcscoll3900
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCOLL_3900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcscoll3900, Function | MediumTest | Level1) {
    const wchar_t *paraWcs1;
    const wchar_t *paraWcs2;
    int returnVal;

    paraWcs1 = L"abcde";
    paraWcs2 = L"abcdef";
    returnVal = wcscoll(paraWcs1, paraWcs2);
    LOGD("    wcscoll returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal < 0) << "ErrInfo: wcscoll returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcscollL4000
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCOLL_L_4000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcscollL4000, Function | MediumTest | Level1) {
    const wchar_t *paraWcs1;
    const wchar_t *paraWcs2;
    int returnVal;

    paraWcs1 = L"abcdef";
    paraWcs2 = L"abcdef";
    returnVal = wcscoll_l(paraWcs1, paraWcs2, g_ausoaLocale);
    LOGD("    wcscoll_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcscoll_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcscollL4100
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCOLL_L_4100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcscollL4100, Function | MediumTest | Level1) {
    const wchar_t *paraWcs1;
    const wchar_t *paraWcs2;
    int returnVal;

    paraWcs1 = L"abcdefg";
    paraWcs2 = L"abcdef";
    returnVal = wcscoll_l(paraWcs1, paraWcs2, g_ausoaLocale);
    LOGD("    wcscoll_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal > 0) << "ErrInfo: wcscoll_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcscollL4200
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCOLL_L_4200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcscollL4200, Function | MediumTest | Level1) {
    const wchar_t *paraWcs1;
    const wchar_t *paraWcs2;
    int returnVal;

    paraWcs1 = L"abcde";
    paraWcs2 = L"abcdef";
    returnVal = wcscoll_l(paraWcs1, paraWcs2, g_ausoaLocale);
    LOGD("    wcscoll_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal < 0) << "ErrInfo: wcscoll_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcscspn4300
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCSPN_4300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcscspn4300, Function | MediumTest | Level1) {
    const wchar_t *paraWcs;
    const wchar_t *paraRjct;
    size_t returnVal;

    paraWcs = L"abcdef";
    paraRjct = L"def";
    returnVal = wcscspn(paraWcs, paraRjct);
    LOGD("    wcscspn returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(3 == returnVal) << "ErrInfo: wcscspn returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcscspn4400
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSCSPN_4400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcscspn4400, Function | MediumTest | Level1) {
    const wchar_t *paraWcs;
    const wchar_t *paraRjct;
    size_t returnVal;

    paraWcs = L"abcdef";
    paraRjct = L"ghi";
    returnVal = wcscspn(paraWcs, paraRjct);
    LOGD("    wcscspn returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(6 == returnVal) << "ErrInfo: wcscspn returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcsspn4500
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSSPN_4500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcsspn4500, Function | MediumTest | Level1) {
    const wchar_t *paraWcs;
    const wchar_t *paraAcpt;
    size_t returnVal;

    paraWcs = L"abcdef";
    paraAcpt = L"def";
    returnVal = wcsspn(paraWcs, paraAcpt);
    LOGD("    wcsspn returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcsspn returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcsspn4600
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSSPN_4600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcsspn4600, Function | MediumTest | Level1) {
    const wchar_t *paraWcs;
    const wchar_t *paraAcpt;
    size_t returnVal;

    paraWcs = L"abcdef";
    paraAcpt = L"ghi";
    returnVal = wcsspn(paraWcs, paraAcpt);
    LOGD("    wcsspn returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: wcsspn returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcspbrk4700
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSPBRK_4700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcspbrk4700, Function | MediumTest | Level1) {
    const wchar_t *paraWcs;
    const wchar_t *paraAcpt;
    wchar_t *returnVal;

    paraWcs = L"abcdef";
    paraAcpt = L"def";
    returnVal = wcspbrk((wchar_t *)paraWcs, paraAcpt);
    LOGD("    wcspbrk returnVal:='%x'\n", returnVal);
    ASSERT_TRUE((paraWcs + wcslen(L"abc")) == returnVal) << "ErrInfo: wcspbrk returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testWcspbrk4800
 * @tc.number SUB_KERNEL_UTIL_STRINGOPER_WCSPBRK_4800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilStringOperApiTest, testWcspbrk4800, Function | MediumTest | Level1) {
    const wchar_t *paraWcs;
    const wchar_t *paraAcpt;
    wchar_t *returnVal;

    paraWcs = L"abcdef";
    paraAcpt = L"ghi";
    returnVal = wcspbrk((wchar_t *)paraWcs, paraAcpt);
    LOGD("    wcspbrk returnVal:='%x'\n", returnVal);
    ASSERT_TRUE(nullptr == returnVal) << "ErrInfo: wcspbrk returnVal:='" << returnVal << "'";
}
