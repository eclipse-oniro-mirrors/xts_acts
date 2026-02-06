/*
 * Copyright (c) 2021-2022 Huawei Device Co., Ltd.
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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include "hctest.h"
#include "ohos_types.h"
#include "slite/ability_manager.h"
#include "ability_errors.h"
#include "want.h"

#define DATA_EXTERN (2 * 3)

/**
* @brief  register a test suit named AbilityMgrTestSuite
* @param  subsystem name is aafwk
* @param  module name is  abilitymgr
* @param  test suit name is AbilityMgrTestSuite
*/
LITE_TEST_SUIT(aafwk, abilitymgr, AbilityMgrTestSuite);

static BOOL AbilityMgrTestSuiteSetUp(void)
{
    printf("----------test case with AbilityMgrTest start-------------\n");
    return TRUE;
}

static BOOL AbilityMgrTestSuiteTearDown(void)
{
    printf("----------test case with AbilityMgrTest end-------------\n");
    return TRUE;
}

/**
 * @tc.name   testClearElementLegal
 * @tc.number SUB_AAFWK_ABILITY_0001
 * @tc.desc   testClearElement parameter legal test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testClearElementLegal, Function | MediumTest | Level0)
{
    printf("------start testClearElementLegal------\n");
    ElementName element = { 0 };
    SetElementDeviceID(&element, "0001000");
    SetElementBundleName(&element, "com.openharmony.testnative");
    bool ret = SetElementAbilityName(&element, "SecondAbility");
    if (ret) {
        char aName[] = "SecondAbility";
        char bName[] = "com.openharmony.testnative";
        char dID[] = "0001000";
        TEST_ASSERT_EQUAL_STRING(element.abilityName, aName);
        TEST_ASSERT_EQUAL_STRING(element.bundleName, bName);
        TEST_ASSERT_EQUAL_STRING(element.deviceId, dID);
        ClearElement(&element);
        TEST_ASSERT_EQUAL_STRING(element.abilityName, NULL);
        TEST_ASSERT_EQUAL_STRING(element.bundleName, NULL);
        TEST_ASSERT_EQUAL_STRING(element.deviceId, NULL);
    }
    printf("------end testClearElementLegal------\n");
}

/**
 * @tc.name   testClearElementIllegal
 * @tc.number SUB_AAFWK_ABILITY_0002
 * @tc.desc   testClearElement parameter illegal test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testClearElementIllegal, Function | MediumTest | Level0)
{
    printf("------start testClearElementIllegal------\n");
    ElementName element = { 0 };
    SetElementDeviceID(&element, "0001000");
    SetElementBundleName(&element, "com.openharmony.testnative");
    bool ret = SetElementAbilityName(&element, "SecondAbility");
    if (ret) {
        char aName[] = "SecondAbility";
        char bName[] = "com.openharmony.testnative";
        char dID[] = "0001000";
        TEST_ASSERT_EQUAL_STRING(element.abilityName, aName);
        TEST_ASSERT_EQUAL_STRING(element.bundleName, bName);
        TEST_ASSERT_EQUAL_STRING(element.deviceId, dID);
        ClearElement(NULL);
        TEST_ASSERT_EQUAL_STRING(element.abilityName, aName);
        TEST_ASSERT_EQUAL_STRING(element.bundleName, bName);
        TEST_ASSERT_EQUAL_STRING(element.deviceId, dID);
    }
    printf("------end testClearElementIllegal------\n");
}

/**
 * @tc.name   testSetWantElementLegal
 * @tc.number SUB_AAFWK_ABILITY_0003
 * @tc.desc   testSetWantElement parameter legal test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testSetWantElementLegal, Function | MediumTest | Level0)
{
    printf("------start testSetWantElementLegal------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    SetElementDeviceID(&element, "0001000");
    SetElementBundleName(&element, "com.openharmony.testnative");
    SetElementAbilityName(&element, "SecondAbility");
    if (element.abilityName != NULL) {
        bool ret = SetWantElement(&want, element);
        if (ret) {
            TEST_ASSERT_EQUAL_STRING(want.element->deviceId, "0001000");
            TEST_ASSERT_EQUAL_STRING(want.element->abilityName, "SecondAbility");
            TEST_ASSERT_EQUAL_STRING(want.element->bundleName, "com.openharmony.testnative");
        }
    }
    ClearElement(&element);
    ClearWant(&want);
    TEST_ASSERT_EQUAL_STRING(want.element, NULL);
    printf("------end testSetWantElementLegal------\n");
}

/**
 * @tc.name   testSetWantElementIllegal
 * @tc.number SUB_AAFWK_ABILITY_0004
 * @tc.desc   testSetWantElement parameter illegal test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testSetWantElementIllegal, Function | MediumTest | Level2)
{
    printf("------start testSetWantElementIllegal------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    bool ret = SetWantElement(&want, element);
    if (ret) {
        TEST_ASSERT_EQUAL_STRING(want.element->deviceId, NULL);
        TEST_ASSERT_EQUAL_STRING(want.element->abilityName, NULL);
        TEST_ASSERT_EQUAL_STRING(want.element->bundleName, NULL);
    }
    ClearElement(&element);
    TEST_ASSERT_EQUAL_STRING(element.abilityName, NULL);
    ClearWant(&want);
    TEST_ASSERT_EQUAL_STRING(want.element, NULL);
    printf("------end testSetWantElementIllegal------\n");
}

/**
 * @tc.name   testClearWantIllegal
 * @tc.number SUB_AAFWK_ABILITY_0005
 * @tc.desc   testClearWant parameter illegal test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testClearWantIllegal, Function | MediumTest | Level2)
{
    printf("------start testClearWantIllegal------\n");
    Want want = { 0 };
    ElementName element = { 0 };
    SetElementDeviceID(&element, "0001000");
    SetElementBundleName(&element, "com.openharmony.testnative");
    bool ret = SetElementAbilityName(&element, "SecondAbility");
    if (ret) {
        ret = SetWantElement(&want, element);
        if (ret) {
            TEST_ASSERT_EQUAL_STRING(want.element->deviceId, "0001000");
            TEST_ASSERT_EQUAL_STRING(want.element->abilityName, "SecondAbility");
            TEST_ASSERT_EQUAL_STRING(want.element->bundleName, "com.openharmony.testnative");
            ClearWant(NULL);
            TEST_ASSERT_EQUAL_STRING(want.element->deviceId, "0001000");
            TEST_ASSERT_EQUAL_STRING(want.element->abilityName, "SecondAbility");
            TEST_ASSERT_EQUAL_STRING(want.element->bundleName, "com.openharmony.testnative");
        }
    }
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testClearWantIllegal------\n");
}

/**
 * @tc.name   testSetWantDateLegal
 * @tc.number SUB_AAFWK_ABILITY_0006
 * @tc.desc   testSetWantDate parameter legal test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testSetWantDateLegal, Function | MediumTest | Level0)
{
    printf("------start testSetWantDateLegal------\n");
    Want want = { 0 };
    char *data = "test";
    SetWantData(&want, (void *)data, strlen(data) + 1);
    if (want.data != NULL) {
        TEST_ASSERT_EQUAL_STRING((char*)(want.data), data);
        TEST_ASSERT_TRUE(want.dataLength == strlen(data) + 1);
    }
    ClearWant(&want);
    TEST_ASSERT_EQUAL_STRING(want.data, NULL);
    TEST_ASSERT_TRUE(want.dataLength == strlen(data) + 1);
    printf("------end testSetWantDateLegal------\n");
}

/**
 * @tc.name   testSetWantDateIllegal
 * @tc.number SUB_AAFWK_ABILITY_0007
 * @tc.desc   testSetWantDate parameter illegal test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testSetWantDateIllegal, Function | MediumTest | Level2)
{
    printf("------start testSetWantDateIllegal------\n");
    Want want = { 0 };
    SetWantData(&want, "test", -1);
    TEST_ASSERT_EQUAL_STRING((char*)(want.data), NULL);
    TEST_ASSERT_FALSE(want.dataLength);
    SetWantData(&want, NULL, 0);
    TEST_ASSERT_EQUAL_STRING((char*)(want.data), NULL);
    TEST_ASSERT_FALSE(want.dataLength);
    printf("------end testSetWantDateIllegal------\n");
}

/**
 * @tc.name   testStartAbilityIllegal
 * @tc.number SUB_AAFWK_ABILITY_0008
 * @tc.desc   testStartAbility parameter illegal test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testStartAbilityIllegal, Function | MediumTest | Level0)
{
    printf("------start testStartAbilityIllegal------\n");
    int ret = StartAbility(NULL);
    TEST_ASSERT_TRUE(ret == PARAM_CHECK_ERROR);
    printf("------end testStartAbilityIllegal------\n");
}

/**
 * @tc.name   testSetIntParamIllegal
 * @tc.number SUB_AAFWK_ABILITY_0010
 * @tc.desc   testSetIntParam parameter illegal test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testSetIntParamIllegal, Function | MediumTest | Level0)
{
    printf("------start testSetIntParamIllegal------\n");
    bool ret = SetIntParam(NULL, NULL, 0, 0);
    TEST_ASSERT_FALSE(ret);
    printf("------end testSetIntParamIllegal------\n");
}

/**
 * @tc.name   testSetIntParamLegal
 * @tc.number SUB_AAFWK_ABILITY_0011
 * @tc.desc   testSetIntParam parameter legal test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testSetIntParamLegal, Function | MediumTest | Level0)
{
    printf("------start testSetIntParamLegal------\n");
    Want want = { 0 };
    int32_t value = 1;
    char *key = "key";
    bool ret = SetIntParam(&want, key, strlen(key), value);
    TEST_ASSERT_TRUE(ret);
    TEST_ASSERT_TRUE(want.dataLength == (strlen(key) + sizeof(int) + DATA_EXTERN));
    TEST_ASSERT_TRUE(want.data != NULL);
    printf("------end testSetIntParamLegal------\n");
}

/**
 * @tc.name   testSetStrParamIllegal
 * @tc.number SUB_AAFWK_ABILITY_0012
 * @tc.desc   testSetStrParam parameter illegal test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testSetStrParamIllegal, Function | MediumTest | Level0)
{
    printf("------start testSetStrParamIllegal------\n");
    bool ret = SetStrParam(NULL, NULL, 0, NULL, 0);
    TEST_ASSERT_FALSE(ret);
    printf("------end testSetStrParamIllegal------\n");
}

/**
 * @tc.name   testSetStrParamLegal
 * @tc.number SUB_AAFWK_ABILITY_0013
 * @tc.desc   testSetStrParam parameter legal test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(AbilityMgrTestSuite, testSetStrParamLegal, Function | MediumTest | Level2)
{
    printf("------start testSetStrParamLegal------\n");
    Want want = { 0 };
    char *key = "key";
    char *value = "value";
    bool ret = SetStrParam(&want, key, strlen(key), value, strlen(value));
    TEST_ASSERT_TRUE(ret);
    TEST_ASSERT_TRUE(want.dataLength == (strlen(value) + strlen(key) + DATA_EXTERN));
    TEST_ASSERT_TRUE(want.data != NULL);
    printf("------end testSetStrParamLegal------\n");
}

RUN_TEST_SUITE(AbilityMgrTestSuite);