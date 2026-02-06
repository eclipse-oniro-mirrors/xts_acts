/*
 * Copyright (c) 2020-2021 Huawei Device Co., Ltd.
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

#include <securec.h>
#include "hctest.h"
#include "ohos_types.h"
#include "parameter.h"
#include "parameter_utils.h"
#include "sysparam_errno.h"

#define MAX_LEN 128
#define INVALID_LEN 2
#define COMMON_ERROR (-1)
#define INVALID_PARAMETER (-9)

static const char* g_defSysParam = "data of sys param ***...";

LITE_TEST_SUIT(utils, parameter, ParameterFuncTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL ParameterFuncTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL ParameterFuncTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

/**
 * @tc.name   testSetParameter001
 * @tc.number SUB_UTILS_PARAMETER_2500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter001,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version_606";
    char value[] = "OEM-10.1.0";
    ret = SetParameter(key, value);
    TEST_ASSERT_EQUAL_INT(0, ret);
};

/**
 * @tc.name   testSetParameter002
 * @tc.number SUB_UTILS_PARAMETER_2600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter002,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "_._..__...___";
    char value[] = "！@#￥%……&*（）——+~《》？，。、“‘；：、12345767890";
    ret = SetParameter(key, value);
    TEST_ASSERT_EQUAL_INT(-9, ret);
};

/**
 * @tc.name   testSetParameter003
 * @tc.number SUB_UTILS_PARAMETER_2700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter003,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "keywithonlylowercase";
    char value[] = "test key with only lowercase";
    ret = SetParameter(key, value);
    TEST_ASSERT_EQUAL_INT(0, ret);
};

/**
 * @tc.name   testSetParameter004
 * @tc.number SUB_UTILS_PARAMETER_2800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter004,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "202006060602";
    char value[] = "test key with only number";
    ret = SetParameter(key, value);
    TEST_ASSERT_EQUAL_INT(0, ret);
};

/**
 * @tc.name   testSetParameter005
 * @tc.number SUB_UTILS_PARAMETER_2900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter005,
               Function | MediumTest | Level1) {
    int ret;

    char key1[] = "rw.sys.version.version.version";
    char value1[] = "set with key = 31";
    ret = SetParameter(key1, value1);
    TEST_ASSERT_EQUAL_INT(0, ret);

    char key2[] = "rw.sys.version.version";
    char value2[] =
        "abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklm\
nopqrstuvwxyz1234567890abcdefghijklmnopqrstuvw";
    ret = SetParameter(key2, value2);
    TEST_ASSERT_EQUAL_INT(0, ret);
};

/**
 * @tc.name   testSetParameter006
 * @tc.number SUB_UTILS_PARAMETER_3000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter006,
               Function | MediumTest | Level1) {
    int ret;

    char value[] = "test with null";
    ret = SetParameter(NULL, value);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }

    char key[] = "rw.sys.version";
    ret = SetParameter(key, NULL);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter007
 * @tc.number SUB_UTILS_PARAMETER_3100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter007,
               Function | MediumTest | Level1) {
    int ret;

    char value[] = "test with null";
    ret = SetParameter("\0", value);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }

    char key[] = "rw.sys.version";
    ret = SetParameter(key, "\0");
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter008
 * @tc.number SUB_UTILS_PARAMETER_3200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter008,
               Function | MediumTest | Level1) {
    int ret;

    char key1[] = "rw.sys.version.version.version.v";
    char value1[] = "set with key = 32";
    ret = SetParameter(key1, value1);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }

    char key2[] = "rw.sys.version.version.version.version";
    char value2[] = "set with key > 32";
    ret = SetParameter(key2, value2);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter009
 * @tc.number SUB_UTILS_PARAMETER_3300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter009,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "Rw.Sys.Version.Version";
    char value[] = "set value with uppercase";
    ret = SetParameter(key, value);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter010
 * @tc.number SUB_UTILS_PARAMETER_3400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter010,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw sys version version";
    char value[] = "set value with blank";
    ret = SetParameter(key, value);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter011
 * @tc.number SUB_UTILS_PARAMETER_3500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter011,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw+sys&version%version*";
    char value[] = "set value with special characters";
    ret = SetParameter(key, value);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter012
 * @tc.number SUB_UTILS_PARAMETER_3600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter012,
               Function | MediumTest | Level1) {
    int ret;

    char key1[] = "rw.sys.version.version1";
    char value1[] =
        "abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890\
abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrst";
    ret = SetParameter(key1, value1);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }

    char key2[] = "rw.sys.version.version2";
    char value2[] =
        "abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890\
abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890";
    ret = SetParameter(key2, value2);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testSetParameter013
 * @tc.number SUB_UTILS_PARAMETER_3700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testSetParameter013,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "key_for_blank_value";
    char value[] = "                         ";
    ret = SetParameter(key, value);
    TEST_ASSERT_EQUAL_INT(0, ret);
};

/**
 * @tc.name   testGetParameter001
 * @tc.number SUB_UTILS_PARAMETER_3800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter001,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version_606";
    char rightVal[] = "OEM-10.1.0";
    char value[MAX_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal, value);
};

/**
 * @tc.name   testGetParameter002
 * @tc.number SUB_UTILS_PARAMETER_3900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter002,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "_._..__...___";
    char rightVal[] = "！@#￥%……&*（）——+~《》？，。、“‘；：、12345767890";
    char value[MAX_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(g_defSysParam), ret);
    TEST_ASSERT_EQUAL_STRING(g_defSysParam, value);
};

/**
 * @tc.name   testGetParameter003
 * @tc.number SUB_UTILS_PARAMETER_4000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter003,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "keywithonlylowercase";
    char rightVal[] = "test key with only lowercase";
    char value[MAX_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal, value);
};

/**
 * @tc.name   testGetParameter004
 * @tc.number SUB_UTILS_PARAMETER_4100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter004,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "202006060602";
    char rightVal[] = "test key with only number";
    char value[MAX_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal, value);
};

/**
 * @tc.name   testGetParameter005
 * @tc.number SUB_UTILS_PARAMETER_4200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter005,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version_606";
    char rightVal[] = "OEM-10.1.0";
    char value[MAX_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, NULL, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal, value);
};

/**
 * @tc.name   testGetParameter006
 * @tc.number SUB_UTILS_PARAMETER_4300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter006,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "none.exist.key";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(g_defSysParam), ret);
    TEST_ASSERT_EQUAL_STRING(g_defSysParam, value);
};

/**
 * @tc.name   testGetParameter007
 * @tc.number SUB_UTILS_PARAMETER_4400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter007,
               Function | MediumTest | Level1) {
    int ret;

    char key1[] = "rw.sys.version.version.version";
    char rightVal1[] = "set with key = 31";
    char value1[MAX_LEN] = {0};
    SetParameter(key1, rightVal1);
    ret = GetParameter(key1, g_defSysParam, value1, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal1), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal1, value1);

    char key2[] = "rw.sys.version.version";
    char rightVal2[] =
        "abcdefghijklmnopqrstuvwxyz1234567890abcdefgh\
ijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvw";
    char value2[MAX_LEN] = {0};
    SetParameter(key2, rightVal2);
    ret = GetParameter(key2, g_defSysParam, value2, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal2), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal2, value2);
};

/**
 * @tc.name   testGetParameter008
 * @tc.number SUB_UTILS_PARAMETER_4500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter008,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version_606";
    char rightVal[] = "OEM-10.1.0";
    char value[INVALID_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, value, INVALID_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter009
 * @tc.number SUB_UTILS_PARAMETER_4600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter009,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version_606";
    char rightVal[] = "OEM-10.1.0";
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, NULL, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter010
 * @tc.number SUB_UTILS_PARAMETER_4700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter010,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "none.exist.key";
    char value[INVALID_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, INVALID_LEN);
    TEST_ASSERT_EQUAL_INT(-9, ret);
};

/**
 * @tc.name   testGetParameter011
 * @tc.number SUB_UTILS_PARAMETER_4800
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter011,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "none.exist.key";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, NULL, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(SYSPARAM_NOT_FOUND, ret);
};

/**
 * @tc.name   testGetParameter012
 * @tc.number SUB_UTILS_PARAMETER_4900
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter012,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version.version.version.v";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter013
 * @tc.number SUB_UTILS_PARAMETER_5000
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter013,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version.version.version.version";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter014
 * @tc.number SUB_UTILS_PARAMETER_5100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter014,
               Function | MediumTest | Level1) {
    int ret;

    char value[MAX_LEN] = {0};
    ret = GetParameter(NULL, g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter015
 * @tc.number SUB_UTILS_PARAMETER_5200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter015,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "Rw.Sys.Version.Version";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter016
 * @tc.number SUB_UTILS_PARAMETER_5300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter016,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw sys version version";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter017
 * @tc.number SUB_UTILS_PARAMETER_5400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter017,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw+sys&version%version*";
    char value[MAX_LEN] = {0};
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter018
 * @tc.number SUB_UTILS_PARAMETER_5500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter018,
               Function | MediumTest | Level1) {
    int ret;

    char value[MAX_LEN] = {0};
    ret = GetParameter("\0", g_defSysParam, value, MAX_LEN);
    if ((ret == COMMON_ERROR) || (ret == INVALID_PARAMETER)) {
        TEST_ASSERT_EQUAL_INT(1, 1);
    }
};

/**
 * @tc.name   testGetParameter019
 * @tc.number SUB_UTILS_PARAMETER_5600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter019,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "key_for_blank_value";
    char rightVal[] = "                         ";
    char value[MAX_LEN] = {0};
    SetParameter(key, rightVal);
    ret = GetParameter(key, g_defSysParam, value, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal, value);
};

/**
 * @tc.name   testGetParameter020
 * @tc.number SUB_UTILS_PARAMETER_5700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(ParameterFuncTestSuite,
               testGetParameter020,
               Function | MediumTest | Level1) {
    int ret;

    char key[] = "rw.sys.version_606";
    char rightVal1[] = "OEM-10.1.0";
    char value1[MAX_LEN] = {0};
    ret = SetParameter(key, rightVal1);
    TEST_ASSERT_EQUAL_INT(0, ret);
    ret = GetParameter(key, g_defSysParam, value1, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal1), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal1, value1);

    char rightVal2[] = "update the value of OEM-10.1.0";
    char value2[MAX_LEN] = {0};
    ret = SetParameter(key, rightVal2);
    TEST_ASSERT_EQUAL_INT(0, ret);
    ret = GetParameter(key, g_defSysParam, value2, MAX_LEN);
    TEST_ASSERT_EQUAL_INT(strlen(rightVal2), ret);
    TEST_ASSERT_EQUAL_STRING(rightVal2, value2);
};

RUN_TEST_SUITE(ParameterFuncTestSuite);
