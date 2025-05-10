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

#define ACTS_DEVATTEST_SUCCESS 0
#define SLEEP_TIMEOUT 1

using namespace std;
using namespace testing::ext;

class DeviceAttestStartTest : public testing::Test {
protected:
    static void SetUpTestCase(void) {}
    static void TearDownTestCase(void) {}
    virtual void SetUp() {}
    virtual void TearDown()
    {
        sleep(SLEEP_TIMEOUT);
    }
};

/**
 * @tc.number    : Sub_Device_Attest_Test_0100
 * @tc.name      : HiLog::Info parameter legal test (Cortex-A, C)
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(DeviceAttestStartTest, subDeviceAttestTest0100, Function | MediumTest | Level1)
{
    int32_t ret = ACTS_DEVATTEST_SUCCESS;
    ret = StartDevAttestTask();
    printf("[CLIENT MAIN] StartDevAttestTask ret:%d.\n", ret);
    EXPECT_EQ(ret, ACTS_DEVATTEST_SUCCESS);
}
