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

#include <ctype.h>
#include <math.h>
#include <stropts.h>

#include "gtest/gtest.h"
#include "log.h"
#include "utils.h"

using namespace testing::ext;

class ActsUtilCheckApiTest : public testing::Test {
public:
    locale_t g_aucaLocale;
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
        g_aucaLocale = newlocale(LC_ALL_MASK, "", (locale_t)0);
    }
    // Testcase teardown
    virtual void TearDown()
    {
        freelocale(g_aucaLocale);
    }
};

/**
 * @tc.name   testIsalnum0100
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALNUM_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalnum0100, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = '2';
    returnVal = isalnum(paraVal);
    LOGD("    isalnum returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isalnum returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalnum0200
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALNUM_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalnum0200, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'z';
    returnVal = isalnum(paraVal);
    LOGD("    isalnum returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isalnum returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalnum0300
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALNUM_0300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalnum0300, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'Z';
    returnVal = isalnum(paraVal);
    LOGD("    isalnum returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isalnum returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalnum0400
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALNUM_0400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalnum0400, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isalnum(paraVal);
    LOGD("    isalnum returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isalnum returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalnum0500
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALNUM_0500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalnum0500, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isalnum(paraVal);
    LOGD("    isalnum returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isalnum returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalnumL0600
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALNUM_L_0600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalnumL0600, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = '2';
    returnVal = isalnum_l(paraVal, g_aucaLocale);
    LOGD("    isalnum_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isalnum_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalnumL0700
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALNUM_L_0700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalnumL0700, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'z';
    returnVal = isalnum_l(paraVal, g_aucaLocale);
    LOGD("    isalnum_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isalnum_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalnumL0800
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALNUM_L_0800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalnumL0800, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'Z';
    returnVal = isalnum_l(paraVal, g_aucaLocale);
    LOGD("    isalnum_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isalnum_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalnumL0900
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALNUM_L_0900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalnumL0900, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isalnum_l(paraVal, g_aucaLocale);
    LOGD("    isalnum_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isalnum_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalnumL1000
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALNUM_L_1000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalnumL1000, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isalnum_l(paraVal, g_aucaLocale);
    LOGD("    isalnum_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isalnum_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalpha1100
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALPHA_1100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalpha1100, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'z';
    returnVal = isalpha(paraVal);
    LOGD("    isalpha returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isalpha returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalpha1200
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALPHA_1200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalpha1200, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'Z';
    returnVal = isalpha(paraVal);
    LOGD("    isalpha returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isalpha returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalpha1300
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALPHA_1300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalpha1300, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isalpha(paraVal);
    LOGD("    isalpha returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isalpha returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalpha1400
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALPHA_1400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalpha1400, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isalpha(paraVal);
    LOGD("    isalpha returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isalpha returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalphaL1500
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALPHA_L_1500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalphaL1500, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'z';
    returnVal = isalpha_l(paraVal, g_aucaLocale);
    LOGD("    isalpha_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isalpha_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalphaL1600
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALPHA_L_1600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalphaL1600, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'Z';
    returnVal = isalpha_l(paraVal, g_aucaLocale);
    LOGD("    isalpha_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isalpha_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalphaL1700
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALPHA_L_1700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalphaL1700, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isalpha_l(paraVal, g_aucaLocale);
    LOGD("    isalpha_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isalpha_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsalphaL1800
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISALPHA_L_1800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsalphaL1800, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isalpha_l(paraVal, g_aucaLocale);
    LOGD("    isalpha_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isalpha_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsascii1900
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISASCII_1900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsascii1900, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'z';
    returnVal = isascii(paraVal);
    LOGD("    isascii returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isascii returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsascii2000
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISASCII_2000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsascii2000, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'Z';
    returnVal = isascii(paraVal);
    LOGD("    isascii returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isascii returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsascii2100
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISASCII_2100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsascii2100, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = '~';
    returnVal = isascii(paraVal);
    LOGD("    isascii returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isascii returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsascii2200
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISASCII_2200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsascii2200, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 128;
    returnVal = isascii(paraVal);
    LOGD("    isascii returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isascii returnVal:='" << returnVal << "'";
}

// /**
// * @tc.number     SUB_KERNEL_UTIL_CHECK_ISASTREAM_2300
// * @tc.name       test isastream api with digit
// * @tc.desc       [C- SOFTWARE -0200]
// */
/**
 * @tc.name   testIsastream2300
 * @tc.number testIsastream2300
 * @tc.desc   testIsastream2300
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
// HWTEST_F(ActsUtilCheckApiTest, testIsastream2300, Function | MediumTest | Level1) {
//     int paraVal;
//     int returnVal;

//     paraVal = 128;
//     ASSERT_TRUE(-1 == returnVal) << "ErrInfo: isastream returnVal:='" << returnVal << "'";
// }

/**
 * @tc.name   testIsatty2400
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISATTY_2400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsatty2400, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 128;
    returnVal = isatty(paraVal);
    LOGD("    isatty returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isatty returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsblank2500
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISBLANK_2500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsblank2500, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isblank(paraVal);
    LOGD("    isblank returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isblank returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsblank2600
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISBLANK_2600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsblank2600, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'A';
    returnVal = isblank(paraVal);
    LOGD("    isblank returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isblank returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsblankL2700
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISBLANK_L_2700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsblankL2700, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isblank_l(paraVal, g_aucaLocale);
    LOGD("    isblank_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isblank_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsblankL2800
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISBLANK_L_2800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsblankL2800, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'A';
    returnVal = isblank_l(paraVal, g_aucaLocale);
    LOGD("    isblank_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isblank_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIscntrl2900
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISCNTRL_2900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIscntrl2900, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = iscntrl(paraVal);
    LOGD("    iscntrl returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: iscntrl returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIscntrl3000
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISCNTRL_3000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIscntrl3000, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'A';
    returnVal = iscntrl(paraVal);
    LOGD("    iscntrl returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: iscntrl returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIscntrlL3100
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISCNTRL_L_3100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIscntrlL3100, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = iscntrl_l(paraVal, g_aucaLocale);
    LOGD("    iscntrl_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: iscntrl_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIscntrlL3200
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISCNTRL_L_3200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIscntrlL3200, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'A';
    returnVal = iscntrl_l(paraVal, g_aucaLocale);
    LOGD("    iscntrl_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: iscntrl_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsdigit3300
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISDIGIT_3300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsdigit3300, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = '3';
    returnVal = isdigit(paraVal);
    LOGD("    isdigit returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isdigit returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsdigitl3400
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISDIGIT_3400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsdigitl3400, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'a';
    returnVal = isdigit(paraVal);
    LOGD("    isdigit returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isdigit returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsdigitl3500
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISDIGIT_3500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsdigitl3500, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isdigit(paraVal);
    LOGD("    isdigit returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isdigit returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsdigit3600
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISDIGIT_3600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsdigit3600, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isdigit(paraVal);
    LOGD("    isdigit returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isdigit returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsdigitL3700
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISDIGIT_L_3700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsdigitL3700, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = '3';
    returnVal = isdigit_l(paraVal, g_aucaLocale);
    LOGD("    isdigit_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isdigit_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsdigitlL3800
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISDIGIT_L_3800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsdigitlL3800, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = 'a';
    returnVal = isdigit_l(paraVal, g_aucaLocale);
    LOGD("    isdigit_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isdigit_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsdigitlL3900
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISDIGIT_L_3900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsdigitlL3900, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isdigit_l(paraVal, g_aucaLocale);
    LOGD("    isdigit_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isdigit_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsdigitL4000
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISDIGIT_L_4000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsdigitL4000, Function | MediumTest | Level1) {
    int paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isdigit_l(paraVal, g_aucaLocale);
    LOGD("    isdigit_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isdigit_l returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsfinite4100
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISFINITE_4100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsfinite4100, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isfinite(paraVal);
    LOGD("    isfinite returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isfinite returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsfinite4200
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISFINITE_4200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsfinite4200, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = 3.1415926;
    returnVal = isfinite(paraVal);
    LOGD("    isfinite returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isfinite returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsfinite4300
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISFINITE_4300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsfinite4300, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = 1.26e3;
    returnVal = isfinite(paraVal);
    LOGD("    isfinite returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isfinite returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgraph4400
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGRAPH_4400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgraph4400, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = 'A';
    returnVal = isgraph(paraVal);
    LOGD("    isgraph returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isgraph returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgraph4500
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGRAPH_4500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgraph4500, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = 'z';
    returnVal = isgraph(paraVal);
    LOGD("    isgraph returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isgraph returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgraph4600
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGRAPH_4600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgraph4600, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isgraph(paraVal);
    LOGD("    isgraph returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isgraph returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgraph4700
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGRAPH_4700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgraph4700, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isgraph(paraVal);
    LOGD("    isgraph returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isgraph returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgraphL4800
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGRAPH_L_4800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgraphL4800, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = 'A';
    returnVal = isgraph_l(paraVal, g_aucaLocale);
    LOGD("    isgraph returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isgraph returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgraphL4900
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGRAPH_L_4900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgraphL4900, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = 'z';
    returnVal = isgraph_l(paraVal, g_aucaLocale);
    LOGD("    isgraph returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isgraph returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgraphL5000
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGRAPH_L_5000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgraphL5000, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isgraph_l(paraVal, g_aucaLocale);
    LOGD("    isgraph returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isgraph returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgraphL5100
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGRAPH_L_5100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgraphL5100, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isgraph_l(paraVal, g_aucaLocale);
    LOGD("    isgraph returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isgraph returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgreater5200
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGREATER_5200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgreater5200, Function | MediumTest | Level1) {
    double paraVal1;
    double paraVal2;
    int returnVal;

    paraVal1 = 1.1;
    paraVal2 = 2.1;
    returnVal = isgreater(paraVal1, paraVal2);
    LOGD("    isgreater returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isgreater returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgreater5300
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGREATER_5300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgreater5300, Function | MediumTest | Level1) {
    double paraVal1;
    double paraVal2;
    int returnVal;

    paraVal1 = 2.1;
    paraVal2 = 1.1;
    returnVal = isgreater(paraVal1, paraVal2);
    LOGD("    isgreater returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isgreater returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgreater5400
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGREATER_5400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgreater5400, Function | MediumTest | Level1) {
    double paraVal1;
    double paraVal2;
    int returnVal;

    paraVal1 = 2.1;
    paraVal2 = 2.1;
    returnVal = isgreater(paraVal1, paraVal2);
    LOGD("    isgreater returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isgreater returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgreaterequal5500
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGREATEREQUAL_5500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgreaterequal5500, Function | MediumTest | Level1) {
    double paraVal1;
    double paraVal2;
    int returnVal;

    paraVal1 = 1.1;
    paraVal2 = 2.1;
    returnVal = isgreaterequal(paraVal1, paraVal2);
    LOGD("    isgreaterequal returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isgreaterequal returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgreaterequal5600
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGREATEREQUAL_5600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgreaterequal5600, Function | MediumTest | Level1) {
    double paraVal1;
    double paraVal2;
    int returnVal;

    paraVal1 = 2.1;
    paraVal2 = 1.1;
    returnVal = isgreaterequal(paraVal1, paraVal2);
    LOGD("    isgreaterequal returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isgreaterequal returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsgreaterequal5700
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISGREATEREQUAL_5700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsgreaterequal5700, Function | MediumTest | Level1) {
    double paraVal1;
    double paraVal2;
    int returnVal;

    paraVal1 = 2.1;
    paraVal2 = 2.1;
    returnVal = isgreaterequal(paraVal1, paraVal2);
    LOGD("    isgreaterequal returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isgreaterequal returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsinf5800
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISINF_5800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsinf5800, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = INFINITY;
    returnVal = isinf(paraVal);
    LOGD("    isinf returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(1 == returnVal) << "ErrInfo: isinf  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslessequal5900
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLESSEQUAL_5900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslessequal5900, Function | MediumTest | Level1) {
    double paraVal1;
    double paraVal2;
    int returnVal;

    paraVal1 = 1.1;
    paraVal2 = 2.1;
    returnVal = islessequal(paraVal1, paraVal2);
    LOGD("    islessequal returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 != returnVal) << "ErrInfo: islessequal returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslessequal6000
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLESSEQUAL_6000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslessequal6000, Function | MediumTest | Level1) {
    double paraVal1;
    double paraVal2;
    int returnVal;

    paraVal1 = 2.1;
    paraVal2 = 1.1;
    returnVal = islessequal(paraVal1, paraVal2);
    LOGD("    islessequal returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: islessequal returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslessequal6100
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLESSEQUAL_6100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslessequal6100, Function | MediumTest | Level1) {
    double paraVal1;
    double paraVal2;
    int returnVal;

    paraVal1 = 2.1;
    paraVal2 = 2.1;
    returnVal = islessequal(paraVal1, paraVal2);
    LOGD("    islessequal returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: islessequal returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslessgreater6200
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLESSGREATER_6200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslessgreater6200, Function | MediumTest | Level1) {
    double paraVal1;
    double paraVal2;
    int returnVal;

    paraVal1 = 2.1;
    paraVal2 = 2.1;
    returnVal = islessgreater(paraVal1, paraVal2);
    LOGD("    islessgreater returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: islessgreater returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslessgreater6300
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLESSGREATER_6300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslessgreater6300, Function | MediumTest | Level1) {
    double paraVal1;
    double paraVal2;
    int returnVal;

    paraVal1 = 1.1;
    paraVal2 = 2.1;
    returnVal = islessgreater(paraVal1, paraVal2);
    LOGD("    islessgreater returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: islessgreater returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslessgreater6400
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLESSGREATER_6400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslessgreater6400, Function | MediumTest | Level1) {
    double paraVal1;
    double paraVal2;
    int returnVal;

    paraVal1 = 3.1;
    paraVal2 = 2.1;
    returnVal = islessgreater(paraVal1, paraVal2);
    LOGD("    islessgreater returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: islessgreater returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslower6500
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLOWER_6500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslower6500, Function | MediumTest | Level1) {
    char paraChar;
    int returnVal;

    paraChar = 'A';
    returnVal = islower(paraChar);
    LOGD("    islower c:='%c',   returnVal:='%c'\n", paraChar, returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: islower c:='" << paraChar << "',   returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslower6600
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLOWER_6600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslower6600, Function | MediumTest | Level1) {
    char paraChar;
    int returnVal;

    paraChar = 'a';
    returnVal = islower(paraChar);
    LOGD("    islower c:='%c',   returnVal:='%c'\n", paraChar, returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: islower c:='" << paraChar << "',   returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslower6700
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLOWER_6700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslower6700, Function | MediumTest | Level1) {
    char paraChar;
    int returnVal;

    paraChar = '5';
    returnVal = islower(paraChar);
    LOGD("    islower c:='%c',   returnVal:='%c'\n", paraChar, returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: islower c:='" << paraChar << "',   returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslower6800
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLOWER_6800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslower6800, Function | MediumTest | Level1) {
    char paraChar;
    int returnVal;

    paraChar = ' ';
    returnVal = islower(paraChar);
    LOGD("    islower c:='%c',   returnVal:='%c'\n", paraChar, returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: islower c:='" << paraChar << "',   returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslowerL6900
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLOWER_L_6900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslowerL6900, Function | MediumTest | Level1) {
    char paraChar;
    int returnVal;

    paraChar = 'A';
    returnVal = islower_l(paraChar, g_aucaLocale);
    LOGD("    islower_l c:='%c',   returnVal:='%c'\n", paraChar, returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: islower_l c:='" << paraChar << "',   returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslowerL7000
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLOWER_L_7000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslowerL7000, Function | MediumTest | Level1) {
    char paraChar;
    int returnVal;

    paraChar = 'a';
    returnVal = islower_l(paraChar, g_aucaLocale);
    LOGD("    islower_l c:='%c',   returnVal:='%c'\n", paraChar, returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: islower_l c:='" << paraChar << "',   returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslowerL7100
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLOWER_L_7100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslowerL7100, Function | MediumTest | Level1) {
    char paraChar;
    int returnVal;

    paraChar = '5';
    returnVal = islower_l(paraChar, g_aucaLocale);
    LOGD("    islower_l c:='%c',   returnVal:='%c'\n", paraChar, returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: islower_l c:='" << paraChar << "',   returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIslowerL7200
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISLOWER_L_7200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIslowerL7200, Function | MediumTest | Level1) {
    char paraChar;
    int returnVal;

    paraChar = ' ';
    returnVal = islower_l(paraChar, g_aucaLocale);
    LOGD("    islower_l c:='%c',   returnVal:='%c'\n", paraChar, returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: islower_l c:='" << paraChar << "',   returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsnan7300
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISNAN_7300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsnan7300, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = NAN;
    returnVal = isnan(paraVal);
    LOGD("    isnan returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isnan  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsnormal7400
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISNORMAL_7400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsnormal7400, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = FP_NORMAL;
    returnVal = isnormal(paraVal);
    LOGD("    isnormal returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isnormal  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsnormal7500
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISNORMAL_7500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsnormal7500, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = NAN;
    returnVal = isnormal(paraVal);
    LOGD("    isnormal returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isnormal  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsnormal7600
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISNORMAL_7600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsnormal7600, Function | MediumTest | Level1) {
    double paraVal;
    int returnVal;

    paraVal = 2.1;
    returnVal = isnormal(paraVal);
    LOGD("    isnormal returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isnormal  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsprint7700
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISPRINT_7700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsprint7700, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'a';
    returnVal = isprint(paraVal);
    LOGD("    isprint returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isprint  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsprint7800
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISPRINT_7800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsprint7800, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isprint(paraVal);
    LOGD("    isprint returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isprint  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsprint7900
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISPRINT_7900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsprint7900, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isprint(paraVal);
    LOGD("    isprint returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isprint  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsprintL8000
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISPRINT_L_8000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsprintL8000, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'a';
    returnVal = isprint_l(paraVal, g_aucaLocale);
    LOGD("    isprint_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isprint_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsprintL8100
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISPRINT_L_8100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsprintL8100, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isprint_l(paraVal, g_aucaLocale);
    LOGD("    isprint_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isprint_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsprintL8200
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISPRINT_L_8200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsprintL8200, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isprint_l(paraVal, g_aucaLocale);
    LOGD("    isprint_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isprint_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIspunct8300
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISPUNCT_8300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIspunct8300, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = ispunct(paraVal);
    LOGD("    ispunct returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: ispunct  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIspunct8400
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISPUNCT_8400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIspunct8400, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'A';
    returnVal = ispunct(paraVal);
    LOGD("    ispunct returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: ispunct  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIspunct8500
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISPUNCT_8500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIspunct8500, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = ispunct(paraVal);
    LOGD("    ispunct returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: ispunct  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIspunctL8600
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISPUNCT_L_8600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIspunctL8600, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = ispunct_l(paraVal, g_aucaLocale);
    LOGD("    ispunct_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: ispunct_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIspunctL8700
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISPUNCT_L_8700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIspunctL8700, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'A';
    returnVal = ispunct_l(paraVal, g_aucaLocale);
    LOGD("    ispunct_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: ispunct_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIspunctL8800
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISPUNCT_L_8800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIspunctL8800, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = ispunct_l(paraVal, g_aucaLocale);
    LOGD("    ispunct_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: ispunct_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsspace8900
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISSPACE_8900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsspace8900, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'a';
    returnVal = isspace(paraVal);
    LOGD("    isspace returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isspace  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsspace9000
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISSPACE_9000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsspace9000, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isspace(paraVal);
    LOGD("    isspace returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isspace  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsspace9100
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISSPACE_9100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsspace9100, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isspace(paraVal);
    LOGD("    isspace returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isspace  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsspace9200
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISSPACE_9200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsspace9200, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\r';
    returnVal = isspace(paraVal);
    LOGD("    isspace returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isspace  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsspace9300
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISSPACE_9300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsspace9300, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\f';
    returnVal = isspace(paraVal);
    LOGD("    isspace returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isspace  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsspace9400
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISSPACE_9400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsspace9400, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\t';
    returnVal = isspace(paraVal);
    LOGD("    isspace returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isspace  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsspaceL9500
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISSPACE_L_9500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsspaceL9500, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'a';
    returnVal = isspace_l(paraVal, g_aucaLocale);
    LOGD("    isspace_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isspace_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsspaceL9600
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISSPACE_L_9600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsspaceL9600, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = ' ';
    returnVal = isspace_l(paraVal, g_aucaLocale);
    LOGD("    isspace_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isspace_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsspaceL9620
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISSPACE_L_9620
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsspaceL9620, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isspace_l(paraVal, g_aucaLocale);
    LOGD("    isspace_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isspace_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsspaceL9640
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISSPACE_L_9640
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsspaceL9640, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\r';
    returnVal = isspace_l(paraVal, g_aucaLocale);
    LOGD("    isspace_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isspace_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsspaceL9660
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISSPACE_L_9660
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsspaceL9660, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\f';
    returnVal = isspace_l(paraVal, g_aucaLocale);
    LOGD("    isspace_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isspace_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsspaceL9680
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISSPACE_L_9680
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsspaceL9680, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\t';
    returnVal = isspace_l(paraVal, g_aucaLocale);
    LOGD("    isspace_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isspace_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsunordered9700
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISUNORDERED_9700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsunordered9700, Function | MediumTest | Level1) {
    double paraVal1;
    double paraVal2;
    int returnVal;

    paraVal1 = NAN;
    paraVal2 = 0;
    returnVal = isunordered(paraVal1, paraVal2);
    LOGD("    isunordered returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(1 == returnVal) << "ErrInfo: isunordered  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsupper9720
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISUPPER_9720
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsupper9720, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'A';
    returnVal = isupper(paraVal);
    LOGD("    isupper returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isupper  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsupper9740
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISUPPER_9740
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsupper9740, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'a';
    returnVal = isupper(paraVal);
    LOGD("    isupper returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isupper  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsupper9760
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISUPPER_9760
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsupper9760, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '5';
    returnVal = isupper(paraVal);
    LOGD("    isupper returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isupper  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsupper9780
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISUPPER_9780
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsupper9780, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isupper(paraVal);
    LOGD("    isupper returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isupper  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsupperL9800
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISUPPER_L_9800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsupperL9800, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'A';
    returnVal = isupper_l(paraVal, g_aucaLocale);
    LOGD("    isupper_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isupper_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsupperL9820
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISUPPER_L_9820
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsupperL9820, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'a';
    returnVal = isupper_l(paraVal, g_aucaLocale);
    LOGD("    isupper_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isupper_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsupperL9840
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISUPPER_L_9840
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsupperL9840, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '5';
    returnVal = isupper_l(paraVal, g_aucaLocale);
    LOGD("    isupper_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isupper_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsupperL9860
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISUPPER_L_9860
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsupperL9860, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = '\n';
    returnVal = isupper_l(paraVal, g_aucaLocale);
    LOGD("    isupper_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isupper_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsxdigit9880
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISXDIGIT_9880
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsxdigit9880, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'F';
    returnVal = isxdigit(paraVal);
    LOGD("    isxdigit returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isxdigit  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsxdigit9900
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISXDIGIT_9900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsxdigit9900, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'G';
    returnVal = isxdigit(paraVal);
    LOGD("    isxdigit returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isxdigit  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsxdigitL9920
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISXDIGIT_L_9920
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsxdigitL9920, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'F';
    returnVal = isxdigit_l(paraVal, g_aucaLocale);
    LOGD("    isxdigit_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(returnVal != 0) << "ErrInfo: isxdigit_l  returnVal:='" << returnVal << "'";
}

/**
 * @tc.name   testIsxdigitL19940
 * @tc.number SUB_KERNEL_UTIL_CHECK_ISXDIGIT_L_9940
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsUtilCheckApiTest, testIsxdigitL19940, Function | MediumTest | Level1) {
    char paraVal;
    int returnVal;

    paraVal = 'G';
    returnVal = isxdigit_l(paraVal, g_aucaLocale);
    LOGD("    isxdigit_l returnVal:='%d'\n", returnVal);
    ASSERT_TRUE(0 == returnVal) << "ErrInfo: isxdigit_l  returnVal:='" << returnVal << "'";
}