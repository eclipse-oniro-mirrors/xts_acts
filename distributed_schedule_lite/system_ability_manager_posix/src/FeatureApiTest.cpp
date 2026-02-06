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

#include "gtest/gtest.h"
#include "utils/SamgrTestBase.h"

using namespace testing::ext;

struct DemoApi {
    INHERIT_IUNKNOWN;
};

struct DemoFeature {
    INHERIT_FEATURE;
    INHERIT_IUNKNOWNENTRY(DemoApi);
    Identity identity;
};

static const char *GetName(Service *service)
{
    (void)service;
    return "serviceName401";
}

struct ExampleService {
    INHERIT_SERVICE;
    Identity identity;
};

static BOOL Initialize(Service *service, Identity identity)
{
    ExampleService *example = (ExampleService *)service;
    example->identity = identity;
    return TRUE;
}

static BOOL MessageHandle(Service *service, Request *msg)
{
    (void)service;
    (void)msg;
    return FALSE;
}

static TaskConfig GetTaskConfig(Service *service)
{
    (void)service;
    TaskConfig config = {
        LEVEL_HIGH, 
        PRI_ABOVE_NORMAL,
        0x800, 
        20, 
        SHARED_TASK
        };
    return config;
}

static ExampleService g_service = {
    .GetName = GetName,
    .Initialize = Initialize,
    .MessageHandle = MessageHandle,
    .GetTaskConfig = GetTaskConfig,
    .identity = {-1, -1, nullptr},
};

static const char *FEATURE_GetName(Feature *feature)
{
    (void)feature;
    return "featureName401";
}
static void FEATURE_OnInitialize(Feature *feature, Service *parent, Identity identity)
{
    DemoFeature *demoFeature = (DemoFeature *)feature;
    demoFeature->identity = identity;
}
static void FEATURE_OnStop(Feature *feature, Identity identity)
{
    (void)feature;
    (void)identity;
}

static BOOL FEATURE_OnMessage(Feature *feature, Request *request)
{
    (void)feature;
    (void)request;
    return TRUE;
}

static DemoFeature g_feature = {
    .GetName = FEATURE_GetName,
    .OnInitialize = FEATURE_OnInitialize,
    .OnStop = FEATURE_OnStop,
    .OnMessage = FEATURE_OnMessage,
    .ver = 1,
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
    },
    .identity = {-1, -1, nullptr},
};

class FeatureApiTest : public testing::Test {
protected:
    // SetUpTestCase: Testsuit setup, run before 1st testcase
    static void SetUpTestCase(void)
    {
        SystemInitProxy();
    }
    // TearDownTestCase: Testsuit teardown, run after last testcase
    static void TearDownTestCase(void)
    {
    }
    // Testcase setup
    virtual void SetUp()
    {
    }
    // Testcase teardown
    virtual void TearDown()
    {
    }
};

/**
 * @tc.name   testRegisterFeatureApi0010
 * @tc.number DMSLite_SAMGR_RegisterFeatureApi_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(FeatureApiTest, testRegisterFeatureApi0010, Function | MediumTest | Level1) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);

    BOOL result = SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401",
                                                          GET_IUNKNOWN(g_feature));
    ASSERT_EQ(result, TRUE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testRegisterFeatureApi0020
 * @tc.number DMSLite_SAMGR_RegisterFeatureApi_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testRegisterFeatureApi0020, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);

    BOOL result = SAMGR_GetInstance()->RegisterFeatureApi(NULL, "featureName401", GET_IUNKNOWN(g_feature));
    ASSERT_EQ(result, FALSE);

    result = SAMGR_GetInstance()->RegisterFeatureApi("", "featureName401", GET_IUNKNOWN(g_feature));
    ASSERT_EQ(result, FALSE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testRegisterFeatureApi0030
 * @tc.number DMSLite_SAMGR_RegisterFeatureApi_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testRegisterFeatureApi0030, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);

    BOOL result = SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "", GET_IUNKNOWN(g_feature));
    ASSERT_EQ(result, FALSE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testRegisterFeatureApi0040
 * @tc.number DMSLite_SAMGR_RegisterFeatureApi_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testRegisterFeatureApi0040, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);

    BOOL result = SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", nullptr);
    ASSERT_EQ(result, FALSE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testRegisterFeatureApi0050
 * @tc.number DMSLite_SAMGR_RegisterFeatureApi_0050
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testRegisterFeatureApi0050, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);

    // feature is null, handle as default feature api
    BOOL result = SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", nullptr, GET_IUNKNOWN(g_feature));
    ASSERT_EQ(result, TRUE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", nullptr);
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testRegisterFeatureApi0060
 * @tc.number DMSLite_SAMGR_RegisterFeatureApi_0060
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testRegisterFeatureApi0060, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);

    BOOL result = SAMGR_GetInstance()->RegisterFeatureApi("noExistService", "featureName401", GET_IUNKNOWN(g_feature));
    ASSERT_EQ(result, FALSE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testRegisterFeatureApi0070
 * @tc.number DMSLite_SAMGR_RegisterFeatureApi_0070
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testRegisterFeatureApi0070, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);

    BOOL result = SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "noExistFeature", GET_IUNKNOWN(g_feature));
    ASSERT_EQ(result, FALSE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testRegisterFeatureApi0080
 * @tc.number DMSLite_SAMGR_RegisterFeatureApi_0080
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testRegisterFeatureApi0080, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401",
                                            GET_IUNKNOWN(g_feature));

    BOOL result = SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401",
                                                          GET_IUNKNOWN(g_feature));
    ASSERT_EQ(result, FALSE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testGetFeatureApi0010
 * @tc.number DMSLite_SAMGR_GetFeatureApi_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(FeatureApiTest, testGetFeatureApi0010, Function | MediumTest | Level1) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", GET_IUNKNOWN(g_feature));

    IUnknown *resultIUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName401", "featureName401");
    ASSERT_EQ(resultIUnknown != nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testGetFeatureApi0020
 * @tc.number DMSLite_SAMGR_GetFeatureApi_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testGetFeatureApi0020, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", GET_IUNKNOWN(g_feature));

    IUnknown *resultIUnknown = SAMGR_GetInstance()->GetFeatureApi(NULL, "featureName401");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);
    resultIUnknown = SAMGR_GetInstance()->GetFeatureApi("", "featureName401");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testGetFeatureApi0030
 * @tc.number DMSLite_SAMGR_GetFeatureApi_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testGetFeatureApi0030, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", GET_IUNKNOWN(g_feature));

    IUnknown *resultIUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName401", nullptr);
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);
    resultIUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName401", "");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testGetFeatureApi0040
 * @tc.number DMSLite_SAMGR_GetFeatureApi_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testGetFeatureApi0040, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    
    IUnknown *resultIUnknown = SAMGR_GetInstance()->GetFeatureApi("noExistService", "featureName401");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);
    resultIUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName401", "noExistFeature");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testGetFeatureApi0050
 * @tc.number DMSLite_SAMGR_GetFeatureApi_0050
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testGetFeatureApi0050, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    
    IUnknown *resultIUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName401", "featureName401");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testGetFeatureApi0060
 * @tc.number DMSLite_SAMGR_GetFeatureApi_0060
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testGetFeatureApi0060, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", GET_IUNKNOWN(g_feature));
    
    IUnknown *resultIUnknown1 = SAMGR_GetInstance()->GetFeatureApi("serviceName401", "featureName401");
    IUnknown *resultIUnknown2 = SAMGR_GetInstance()->GetFeatureApi("serviceName401", "featureName401");
    ASSERT_EQ(resultIUnknown1 == resultIUnknown2, TRUE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testUnregisterFeatureApi0010
 * @tc.number DMSLite_SAMGR_UnregisterFeatureApi_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testUnregisterFeatureApi0010, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", GET_IUNKNOWN(g_feature));

    IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    ASSERT_EQ(resultIUnknown != nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testUnregisterFeatureApi0020
 * @tc.number DMSLite_SAMGR_UnregisterFeatureApi_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testUnregisterFeatureApi0020, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", GET_IUNKNOWN(g_feature));

    IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterFeatureApi(NULL, "featureName401");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);
    resultIUnknown = SAMGR_GetInstance()->UnregisterFeatureApi("", "featureName401");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testUnregisterFeatureApi0030
 * @tc.number DMSLite_SAMGR_UnregisterFeatureApi_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testUnregisterFeatureApi0030, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", GET_IUNKNOWN(g_feature));

    IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testUnregisterFeatureApi0040
 * @tc.number DMSLite_SAMGR_UnregisterFeatureApi_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testUnregisterFeatureApi0040, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", GET_IUNKNOWN(g_feature));

    IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterFeatureApi("noExistService", "featureName401");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testUnregisterFeatureApi0050
 * @tc.number DMSLite_SAMGR_UnregisterFeatureApi_0050
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testUnregisterFeatureApi0050, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", GET_IUNKNOWN(g_feature));

    IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "noExistFeature");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}

/**
 * @tc.name   testUnregisterFeatureApi0060
 * @tc.number DMSLite_SAMGR_UnregisterFeatureApi_0060
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FeatureApiTest, testUnregisterFeatureApi0060, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    SAMGR_GetInstance()->RegisterFeature("serviceName401", (Feature *)&g_feature);

    for (int i = 0; i < PRESSURE_BASE; i++) {
        BOOL result = SAMGR_GetInstance()->RegisterFeatureApi("serviceName401", "featureName401", 
                                                              GET_IUNKNOWN(g_feature));
        ASSERT_EQ(result, TRUE);

        IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterFeatureApi("serviceName401", "featureName401");
        ASSERT_EQ(resultIUnknown != nullptr, TRUE);
    }
    SAMGR_GetInstance()->UnregisterFeature("serviceName401", "featureName401");
    SAMGR_GetInstance()->UnregisterService("serviceName401");
}