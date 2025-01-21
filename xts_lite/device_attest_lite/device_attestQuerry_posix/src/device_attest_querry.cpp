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


#include <cstdio>
#include "gtest/gtest.h"

#include "devattest_interface.h"

#define DEVATTEST_INIT (-2)
#define DEVATTEST_SUCCESS 0

using namespace std;
using namespace testing::ext;

typedef enum {
    SOFTWARE_RESULT_VERSIONID,
    SOFTWARE_RESULT_PATCHLEVEL,
    SOFTWARE_RESULT_ROOTHASH,
    SOFTWARE_RESULT_PCID,
    SOFTWARE_RESULT_RESERVE,
} SOFTWARE_RESULT_DETAIL_TYPE;

class DeviceAttestQuerryTest : public testing::Test {
public:
    bool AttestStatusNumberValid(int32_t attestStatusNumber)
    {
        if (attestStatusNumber < DEVATTEST_INIT || attestStatusNumber > DEVATTEST_SUCCESS) {
            return false;
        }
        return true;
    }

    ::testing::AssertionResult AttestStatusValid(AttestResultInfo attestResultInfo)
    {
        bool result = true;
        string failString;
        if (!AttestStatusNumberValid(attestResultInfo.authResult)) {
            failString += string(" authResult is ") + to_string(attestResultInfo.authResult);
            result = false;
        }
        if (!AttestStatusNumberValid(attestResultInfo.softwareResult)) {
            failString += string(" softwareResult is ") + to_string(attestResultInfo.softwareResult);
            result = false;
        }
        if (!AttestStatusNumberValid(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_VERSIONID])) {
            failString += string(" versionResult is ")
                          + to_string(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_VERSIONID]);
            result = false;
        }
        if (!AttestStatusNumberValid(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_PATCHLEVEL])) {
            failString += string(" patchResult is ")
                          + to_string(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_PATCHLEVEL]);
            result = false;
        }
        if (!AttestStatusNumberValid(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_ROOTHASH])) {
            failString += string(" roothashResult is ")
                          + to_string(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_ROOTHASH]);
            result = false;
        }
        if (!AttestStatusNumberValid(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_PCID])) {
            failString += string(" pcidResult is ")
                          + to_string(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_PCID]);
            result = false;
        }
        if (!AttestStatusNumberValid(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_RESERVE])) {
            failString += string(" reserveResult is ")
                          + to_string(attestResultInfo.softwareResultDetail[SOFTWARE_RESULT_RESERVE]);
            result = false;
        }
        if (attestResultInfo.authResult == DEVATTEST_SUCCESS) {
            if (attestResultInfo.ticketLength <= 0) {
                failString += string(" ticketLength is ")
                              + to_string(attestResultInfo.ticketLength);
                result = false;
            }
            if (attestResultInfo.ticket == "") {
                failString += string(" ticket is empty");
                result = false;
            }
        }
        if (result) {
            return ::testing::AssertionSuccess();
        } else {
            return ::testing::AssertionFailure() << failString.c_str();
        }
    }
protected:
    static void SetUpTestCase(void) {}
    static void TearDownTestCase(void) {}
    virtual void SetUp() {}
    virtual void TearDown() {}
};

/**
 * @tc.number    : Sub_Device_Attest_Test_0200
 * @tc.name      : HiLog::Warn parameter legal test (Cortex-A, C)
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(DeviceAttestQuerryTest, subDeviceAttestTest0200, Function | MediumTest | Level1)
{
    int32_t ret = DEVATTEST_SUCCESS;
    AttestResultInfo attestResultInfo = { 0 };
    attestResultInfo.ticket = NULL;
    printf("[CLIENT MAIN] query.\n");
    ret = GetAttestStatus(&attestResultInfo);
    EXPECT_EQ(ret, DEVATTEST_SUCCESS);
    bool resultBool = AttestStatusValid(attestResultInfo);
    EXPECT_EQ(resultBool, true);        
}

/**
 * @tc.number    : Sub_Device_Attest_Test_0300
 * @tc.name      : HiLog::Warn parameter legal test (Cortex-A, C)
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(DeviceAttestQuerryTest, subDeviceAttestTest0300, Function | MediumTest | Level1)
{
    int32_t ret = DEVATTEST_SUCCESS;
    ret = StartDevAttestTask();
    printf("[CLIENT MAIN] StartDevAttestTask ret:%d.\n", ret);
    EXPECT_EQ(ret, DEVATTEST_SUCCESS);
    AttestResultInfo attestResultInfo = { 0 };
    attestResultInfo.ticket = NULL;
    printf("[CLIENT MAIN] query.\n");
    ret = GetAttestStatus(&attestResultInfo);
    printf("[CLIENT MAIN] wrong. ret:%d\n", ret);
#ifdef __LINUX__
    EXPECT_EQ(ret, DEVATTEST_SUCCESS);
#else
    EXPECT_FALSE(ret == DEVATTEST_SUCCESS);
#endif
}

