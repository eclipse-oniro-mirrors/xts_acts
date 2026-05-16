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
 * @tc.name   SetThreadQoSNdkTest
 * @tc.number SetThreadQoSNdkTest
 * @tc.desc   Verify the Set QoSLevel function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
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
 * @tc.name   ResetThreadQoSNdkTest
 * @tc.number ResetThreadQoSNdkTest
 * @tc.desc   Verify the Reset QoSLevel function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
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
 * @tc.name   GetThreadQoSNdkTest
 * @tc.number GetThreadQoSNdkTest
 * @tc.desc   Verify the Get QoSLevel function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
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
 * @tc.name   ThreadQoSNdkTest
 * @tc.number ThreadQoSNdkTest
 * @tc.desc   Double Test ThreadQoSNDKTest function.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
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

/**
 * @tc.name   GewuCreateSessionTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0100
 * @tc.desc   Verify the GewuCreateSession function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(QoSTestSuite, GewuCreateSessionTest, Function | MediumTest | Level1)
{
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS)
    {
        GTEST_SKIP() << "Not support system, skip testCase";
    }
    else
    {
        EXPECT_EQ(sessionResult.error, OH_QoS_GewuErrorCode::OH_QOS_GEWU_INVAL);
    }
}

void MockCallback(void *context, const char *response)
{
    return;
}

/**
 * @tc.name   GewuSubmitRequestTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0200
 * @tc.desc   Verify the GewuSubmitRequest function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(QoSTestSuite, GewuSubmitRequestTest, Function | MediumTest | Level1)
{
    const char *attributes = "{\"model\": \"/data/service/el1/public/gewu/Qwen2.5-0.5B-CPU-Q4\","
        "\"eval_settings\": {\"backend\": \"cpu\", \"max_ctx\": \"8192\"}}";
    const char *request = "{\
        \"type\": \"ChatComplete\",\
        \"messages\": [\
            {\
                \"role\": \"developer\",\
                \"content\": \"Your are a helpful assistant.\"\
            },\
            {\
                \"role\": \"user\",\
                \"content\": \"hi\"\
            }\
        ],\
        \"stream\": true\
    }";
    void *fakeContext = reinterpret_cast<void *>(0x1234);
    OH_QoS_GewuOnResponse cb = MockCallback;
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession(attributes);
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS)
    {
        GTEST_SKIP() << "Not support system, skip testCase";
    }
    else
    {
        EXPECT_EQ(sessionResult.error, OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK);

        OH_QoS_GewuSubmitRequestResult requestResult;
        requestResult = OH_QoS_GewuSubmitRequest(sessionResult.session, request, cb, fakeContext);
        EXPECT_EQ(requestResult.error, OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK);

        OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(sessionResult.session);
        EXPECT_EQ(error, OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK);

        sessionResult = OH_QoS_GewuCreateSession("");
        requestResult = OH_QoS_GewuSubmitRequest(sessionResult.session, "", cb, fakeContext);
        EXPECT_EQ(requestResult.error, OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT);

        requestResult = OH_QoS_GewuSubmitRequest(0, nullptr, cb, fakeContext);
        EXPECT_EQ(requestResult.error, OH_QoS_GewuErrorCode::OH_QOS_GEWU_FAULT);
        EXPECT_NE(requestResult.error, OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOMEM);
    }
}

/**
 * @tc.name   GewuAbortRequestTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0300
 * @tc.desc   Verify the GewuAbortRequest function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(QoSTestSuite, GewuAbortRequestTest, Function | MediumTest | Level1)
{
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS)
    {
        GTEST_SKIP() << "Not support system, skip testCase";
    }
    else
    {
        OH_QoS_GewuErrorCode error = OH_QoS_GewuAbortRequest(sessionResult.session, 0);
        EXPECT_EQ(error, OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT);
        EXPECT_NE(error, OH_QoS_GewuErrorCode::OH_QOS_GEWU_OK);
    }
}

/**
 * @tc.name   GewuDestroySessionTest
 * @tc.number SUB_RESOURCESCHEDULE_QOS_0400
 * @tc.desc   Verify the GewuDestroySession function
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(QoSTestSuite, GewuDestroySessionTest, Function | MediumTest | Level1)
{
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS)
    {
        GTEST_SKIP() << "Not support system, skip testCase";
    }
    else
    {
        OH_QoS_GewuErrorCode error = OH_QoS_GewuDestroySession(sessionResult.session);
        EXPECT_EQ(error, OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOENT);
    }
}

/*
 * @tc.number:SUB_RESOURCESCHEDULE_QOS_0500
 * @tc.name: GewuErrorCodeTest
 * @tc.desc: Verify the Gewu error code
 * @tc.size: MediumTest
 * @tc.type: Function
 * @tc.level: Level 1
 */
HWTEST_F(QoSTestSuite, GewuErrorCodeTest, Function | MediumTest | Level1)
{
    OH_QoS_GewuCreateSessionResult sessionResult = OH_QoS_GewuCreateSession("");
    if (sessionResult.error == OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOSYS)
    {
        GTEST_SKIP() << "Not support system, skip testCase";
    }
    else
    {
        EXPECT_NE(sessionResult.error, OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOPERM);
        EXPECT_NE(sessionResult.error, OH_QoS_GewuErrorCode::OH_QOS_GEWU_NOMEM);
        EXPECT_NE(sessionResult.error, OH_QoS_GewuErrorCode::OH_QOS_GEWU_EXIST);
    }
}
