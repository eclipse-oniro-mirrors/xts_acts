/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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


#include "hctest.h"
#include "devattest_interface.h"

#define ACTS_DEVATTEST_INIT      (-2)
#define ACTS_DEVATTEST_SUCCESS   0

LITE_TEST_SUIT(device_attest, device_attest_lite, DeviceAttestFuncTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL DeviceAttestFuncTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL DeviceAttestFuncTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

BOOL AttestStatusNumberValid(int32_t attestStatusNumber)
{
    if (attestStatusNumber < ACTS_DEVATTEST_INIT || attestStatusNumber > ACTS_DEVATTEST_SUCCESS) {
        return FALSE;
    }
    return TRUE;
}

BOOL AttestStatusValid(AttestResultInfo attestResultInfo)
{
    BOOL result = TRUE;
    if (!AttestStatusNumberValid(attestResultInfo.authResult)) {
        result = FALSE;
    }
    if (!AttestStatusNumberValid(attestResultInfo.softwareResult)) {
        result = FALSE;
    }
    if (!AttestStatusNumberValid(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_VERSIONID])) {
        result = FALSE;
    }
    if (!AttestStatusNumberValid(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_PATCHLEVEL])) {
        result = FALSE;
    }
    if (!AttestStatusNumberValid(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_ROOTHASH])) {
        result = FALSE;
    }
    if (!AttestStatusNumberValid(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_PCID])) {
        result = FALSE;
    }
    if (!AttestStatusNumberValid(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_RESERVE])) {
        result = FALSE;
    }
    if (attestResultInfo.authResult == ACTS_DEVATTEST_SUCCESS) {
        if (attestResultInfo.ticketLength <= 0) {
            result = FALSE;
        }
        if (strcmp(attestResultInfo.ticket, "") == 0) {
            result = FALSE;
        }
    }
    if (result) {
        return TRUE;
    } else {
        return FALSE;
    }
}

/**
 * @tc.name   subDeviceAttest0100
 * @tc.number SUB_Device_Attest_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DeviceAttestFuncTestSuite, subDeviceAttest0100, LEVEL0)
{
    int32_t ret = ACTS_DEVATTEST_SUCCESS;
    ret = StartDevAttestTask();
    TEST_ASSERT_EQUAL_INT(ret, ACTS_DEVATTEST_SUCCESS);
};

/**
 * @tc.name   subDeviceAttest0200
 * @tc.number SUB_Device_Attest_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DeviceAttestFuncTestSuite, subDeviceAttest0200, LEVEL0)
{
    int32_t ret = ACTS_DEVATTEST_SUCCESS;
    AttestResultInfo attestResultInfo = { 0 };
    attestResultInfo.ticket = NULL;
    ret = GetAttestStatus(&attestResultInfo);
    TEST_ASSERT_EQUAL_INT(ret, ACTS_DEVATTEST_SUCCESS);
    TEST_ASSERT_EQUAL_INT(AttestStatusValid(attestResultInfo), TRUE);  
};

RUN_TEST_SUITE(DeviceAttestFuncTestSuite);
