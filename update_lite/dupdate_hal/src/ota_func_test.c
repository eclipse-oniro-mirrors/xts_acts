/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "hctest.h"
#include "hota_updater.h"

#define ERRORCALLBACK    0
#define STATUSCALLBACK   0
#define USE_HOS_PKG      1
#define NOT_HOS_PKG      0
#define ERR_PAK_FALG     2
#define DATA_LENGTH      190
#define READ_LENGTH      0
#define ERR_LENGTH       9
#define DATA_OFFSET      0

LITE_TEST_SUIT(ota, otalite, OtaFuncTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL OtaFuncTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL OtaFuncTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

/**
 * @tc.name   subUpgradeAPI0100
 * @tc.number SUB_Upgrade_API_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(OtaFuncTestSuite, subUpgradeAPI0100, Function | MediumTest | Level1)
{
    unsigned int ret;
    ret = HotaInit(ERRORCALLBACK, STATUSCALLBACK);
    printf("HotaInit return = %d\r\n", ret);
    TEST_ASSERT_EQUAL_INT(OHOS_SUCCESS, ret);
};

/**
 * @tc.name   subUpgradeAPI0200
 * @tc.number SUB_Upgrade_API_0200
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(OtaFuncTestSuite, subUpgradeAPI0200, Function | MediumTest | Level1)
{
    unsigned int ret;
    ret = HotaSetPackageType(USE_HOS_PKG);
    printf("use package flag = %d\r\n, return = %d\r\n", USE_HOS_PKG, ret);
    TEST_ASSERT_EQUAL_INT(OHOS_SUCCESS, ret);
    ret = HotaSetPackageType(NOT_HOS_PKG);
    printf("use package flag = %d\r\n, return = %d\r\n", NOT_HOS_PKG, ret);
    TEST_ASSERT_EQUAL_INT(OHOS_SUCCESS, ret);
};

/**
 * @tc.name   subUpgradeAPI0300
 * @tc.number SUB_Upgrade_API_0300
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(OtaFuncTestSuite, subUpgradeAPI0300, Function | MediumTest | Level1)
{
    unsigned int ret;
    unsigned int index = 0;
    ret = HotaGetUpdateIndex(&index);
    printf("index = %d\r\n, get index return = %d\r\n", index, ret);
    TEST_ASSERT_EQUAL_INT(OHOS_SUCCESS, ret);
};

/**
 * @tc.name   subUpgradeAPI0800
 * @tc.number SUB_Upgrade_API_0800
 * @tc.desc   [C-L1-310] MUST NOT alter JS API behavior.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(OtaFuncTestSuite, subUpgradeAPI0800, Function | MediumTest | Level1)
{
    unsigned int ret;
    ret = HotaSetPackageType(ERR_PAK_FALG);
    printf("use package flag = %d, return = %d\r\n", ERR_PAK_FALG, ret);
    TEST_ASSERT_EQUAL_INT(OHOS_FAILURE, ret);
};

/**
 * @tc.name   subUpgradeAPI1000
 * @tc.number SUB_Upgrade_API_1000
 * @tc.desc   [C-L1-310] MUST NOT alter JS API behavior.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(OtaFuncTestSuite, subUpgradeAPI1000, Function | MediumTest | Level1)
{
    unsigned int ret;
    unsigned int index = 0;
    ret = HotaGetUpdateIndex(&index);
    printf("index = %d, get index return = %d\r\n", index, ret);
    ret = HotaSetPackageType(USE_HOS_PKG);
    printf("use package flag = %d\r\n, return = %d\r\n", USE_HOS_PKG, ret);
    unsigned char buffer[DATA_LENGTH] = {0};
    ret = HotaWrite(buffer, DATA_OFFSET, DATA_LENGTH);
    printf("Hota write return =%d\r\n", ret);
    TEST_ASSERT_EQUAL_INT(OHOS_FAILURE, ret);
    HotaCancel();
};

/**
 * @tc.name   subUpgradeAPI1100
 * @tc.number SUB_Upgrade_API_1100
 * @tc.desc   [C-L1-310] MUST NOT alter JS API behavior.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(OtaFuncTestSuite, subUpgradeAPI1100, Function | MediumTest | Level1)
{
    unsigned int ret;
    unsigned int index = 0;
    ret = HotaGetUpdateIndex(&index);
    printf("index = %d, get index return = %d\r\n", index, ret);
    ret = HotaSetPackageType(NOT_HOS_PKG);
    printf("use package flag = %d\r\n, return = %d\r\n", NOT_HOS_PKG, ret);
    unsigned char buffer[DATA_LENGTH] = {0};
    ret = HotaWrite(buffer, DATA_OFFSET, DATA_LENGTH);
    printf("Hota write return =%d\r\n", ret);
    unsigned char bufferread[DATA_LENGTH] = {0};
    ret = HotaRead(DATA_OFFSET, DATA_LENGTH, bufferread);
    printf("Hota read return =%d\r\n", ret);
    TEST_ASSERT_EQUAL_INT(OHOS_FAILURE, ret);
    HotaCancel();
};

/**
 * @tc.name   subUpgradeAPI1200
 * @tc.number SUB_Upgrade_API_1200
 * @tc.desc   [C-L1-310] MUST NOT alter JS API behavior.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(OtaFuncTestSuite, subUpgradeAPI1200, Function | MediumTest | Level1)
{
    unsigned int ret;
    ret = HotaCancel();
    printf("Hota Cancel return = %d\r\n", ret);
    TEST_ASSERT_EQUAL_INT(OHOS_FAILURE, ret);
};

RUN_TEST_SUITE(OtaFuncTestSuite);
