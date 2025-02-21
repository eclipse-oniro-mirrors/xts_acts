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

#include "gtest/gtest.h"

#include "qos.h"


using namespace std;
using namespace testing::ext;
class QoSTestSuite : public testing::Test {
protected:
    // Preset action of the test suite, which is executed before the first test case
    static void SetUpTestCase(void) {
    }
    // Test suite cleanup action, which is executed after the last test case
    static void TearDownTestCase(void) {
    }
    // Preset action of the test case
    virtual void SetUp()
    {
    }
    // Cleanup action of the test case
    virtual void TearDown()
    {
    }
};

/**
 * @tc.name: SetThreadQoSNdkTest
 * @tc.desc: Verify the Set QoSLevel function.
 * @tc.type: FUNC
 */
HWTEST_F(QoSTestSuite, SetThreadQoSNdkTest, Function | MediumTest | Level1)
{
    int ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_UTILITY);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEFAULT);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INITIATED);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEADLINE_REQUEST);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INTERACTIVE);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_SetThreadQoS(QoS_Level(-1));
    EXPECT_EQ(ret, -1);
    ret = OH_QoS_SetThreadQoS(QoS_Level(6));
    EXPECT_EQ(ret, -1);
    ret = OH_QoS_SetThreadQoS(QoS_Level(1024));
    EXPECT_EQ(ret, -1);
}

/**
 * @tc.name: ResetThreadQoSNdkTest
 * @tc.desc: Verify the Reset QoSLevel function.
 * @tc.type: FUNC
 */
HWTEST_F(QoSTestSuite, ResetThreadQoSNdkTest, Function | MediumTest | Level1)
{
    int ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_ResetThreadQoS();
    EXPECT_EQ(ret, 0);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_UTILITY);
    EXPECT_EQ(ret, 0);
    ret =  OH_QoS_ResetThreadQoS();
    EXPECT_EQ(ret, 0);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEFAULT);
    EXPECT_EQ(ret, 0);
    ret =  OH_QoS_ResetThreadQoS();
    EXPECT_EQ(ret, 0);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INITIATED);
    EXPECT_EQ(ret, 0);
    ret =  OH_QoS_ResetThreadQoS();
    EXPECT_EQ(ret, 0);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEADLINE_REQUEST);
    EXPECT_EQ(ret, 0);
    ret =  OH_QoS_ResetThreadQoS();
    EXPECT_EQ(ret, 0);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INTERACTIVE);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_ResetThreadQoS();
    EXPECT_EQ(ret, 0);
}

/**
 * @tc.name: GetThreadQoSNdkTest
 * @tc.desc: Verify the Get QoSLevel function.
 * @tc.type: FUNC
 */
HWTEST_F(QoSTestSuite, GetThreadQoSNdkTest, Function | MediumTest | Level1)
{
    int ret = OH_QoS_GetThreadQoS(nullptr);
    EXPECT_EQ(ret, -1);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    EXPECT_EQ(ret, 0);
    enum QoS_Level level;
    ret = OH_QoS_GetThreadQoS(&level);
    EXPECT_EQ(ret, 0);
    EXPECT_EQ(level, QoS_Level::QOS_BACKGROUND);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_UTILITY);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_GetThreadQoS(&level);
    EXPECT_EQ(ret, 0);
    EXPECT_EQ(level, QoS_Level::QOS_UTILITY);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEFAULT);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_GetThreadQoS(&level);
    EXPECT_EQ(ret, 0);
    EXPECT_EQ(level, QoS_Level::QOS_DEFAULT);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INITIATED);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_GetThreadQoS(&level);
    EXPECT_EQ(ret, 0);
    EXPECT_EQ(level, QoS_Level::QOS_USER_INITIATED);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_DEADLINE_REQUEST);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_GetThreadQoS(&level);
    EXPECT_EQ(ret, 0);
    EXPECT_EQ(level, QoS_Level::QOS_DEADLINE_REQUEST);

    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_USER_INTERACTIVE);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_GetThreadQoS(&level);
    EXPECT_EQ(ret, 0);
    EXPECT_EQ(level, QoS_Level::QOS_USER_INTERACTIVE);

    ret = OH_QoS_ResetThreadQoS();
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_GetThreadQoS(&level);
    EXPECT_EQ(ret, -1);
}

/**
 * @tc.name: ThreadQoSNdkTest
 * @tc.desc: Double Test ThreadQoSNDKTest function.
 * @tc.type: FUNC
 */
HWTEST_F(QoSTestSuite, ThreadQoSNdkTest, Function | MediumTest | Level1)
{
    int ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_SetThreadQoS(QoS_Level::QOS_BACKGROUND);
    EXPECT_EQ(ret, 0);

    enum QoS_Level level;
    ret = OH_QoS_GetThreadQoS(&level);
    EXPECT_EQ(ret, 0);
    EXPECT_EQ(level, QoS_Level::QOS_BACKGROUND);
    ret = OH_QoS_GetThreadQoS(&level);
    EXPECT_EQ(ret, 0);
    EXPECT_EQ(level, QoS_Level::QOS_BACKGROUND);

    ret = OH_QoS_ResetThreadQoS();
    EXPECT_EQ(ret, 0);
    ret = OH_QoS_ResetThreadQoS();
    EXPECT_EQ(ret, -1);
}
