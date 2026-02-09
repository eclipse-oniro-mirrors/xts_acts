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

struct ExampleService {
    INHERIT_SERVICE;
    Identity identity;
};

static DemoApi g_api = {
    DEFAULT_IUNKNOWN_IMPL,
};

static const char *GetName(Service *service)
{
    (void)service;
    return "serviceName301";
}

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
    TaskConfig config = {LEVEL_HIGH, PRI_ABOVE_NORMAL, 0x800, 20, SHARED_TASK};
    return config;
}

static ExampleService g_service = {
    .GetName = GetName,
    .Initialize = Initialize,
    .MessageHandle = MessageHandle,
    .GetTaskConfig = GetTaskConfig,
    .identity = {-1, -1, nullptr},
};

class DefaultFeatureApiTest : public testing::Test {
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
        BOOL result = SAMGR_GetInstance()->RegisterService((Service *)&g_service);
        if (result != TRUE) {
            printf("[hcpptest]E failed to register service. \n");
        }
    }
    // Testcase teardown
    virtual void TearDown()
    {
        SAMGR_GetInstance()->UnregisterService("serviceName301");
    }
};

/**
 * @tc.name   testRegisterDefaultFeatureApi0010
 * @tc.number DMSLite_SAMGR_RegisterDefaultFeatureApi_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DefaultFeatureApiTest, testRegisterDefaultFeatureApi0010, Function | MediumTest | Level1) {
    BOOL result = SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);
    ASSERT_EQ(result, TRUE);

    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName301");
}

/**
 * @tc.name   testRegisterDefaultFeatureApi0020
 * @tc.number DMSLite_SAMGR_RegisterDefaultFeatureApi_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DefaultFeatureApiTest, testRegisterDefaultFeatureApi0020, Function | MediumTest | Level2) {
    BOOL result = SAMGR_GetInstance()->RegisterDefaultFeatureApi(NULL, (IUnknown *)&g_api);
    ASSERT_EQ(result, FALSE);
}

/**
 * @tc.name   testRegisterDefaultFeatureApi0030
 * @tc.number DMSLite_SAMGR_RegisterDefaultFeatureApi_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DefaultFeatureApiTest, testRegisterDefaultFeatureApi0030, Function | MediumTest | Level2) {
    BOOL result = SAMGR_GetInstance()->RegisterDefaultFeatureApi("noExistService", (IUnknown *)&g_api);
    ASSERT_EQ(result, FALSE);
}

/**
 * @tc.name   testRegisterDefaultFeatureApi0040
 * @tc.number DMSLite_SAMGR_RegisterDefaultFeatureApi_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DefaultFeatureApiTest, testRegisterDefaultFeatureApi0040, Function | MediumTest | Level2) {
    BOOL result = SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", nullptr);
    ASSERT_EQ(result, FALSE);
}

/**
 * @tc.name   testRegisterDefaultFeatureApi0050
 * @tc.number DMSLite_SAMGR_RegisterDefaultFeatureApi_0050
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DefaultFeatureApiTest, testRegisterDefaultFeatureApi0050, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);
    BOOL result = SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);
    ASSERT_EQ(result, FALSE);

    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName301");
}

/**
 * @tc.name   testGetDefaultFeatureApi0010
 * @tc.number DMSLite_SAMGR_GetDefaultFeatureApi_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DefaultFeatureApiTest, testGetDefaultFeatureApi0010, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);

    IUnknown *resultIUnknown = SAMGR_GetInstance()->GetDefaultFeatureApi("serviceName301");
    ASSERT_EQ(resultIUnknown != nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName301");
}

/**
 * @tc.name   testGetDefaultFeatureApi0020
 * @tc.number DMSLite_SAMGR_GetDefaultFeatureApi_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DefaultFeatureApiTest, testGetDefaultFeatureApi0020, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);

    IUnknown *resultIUnknown = SAMGR_GetInstance()->GetDefaultFeatureApi(NULL);
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName301");
}

/**
 * @tc.name   testGetDefaultFeatureApi0030
 * @tc.number DMSLite_SAMGR_GetDefaultFeatureApi_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DefaultFeatureApiTest, testGetDefaultFeatureApi0030, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);

    IUnknown *resultIUnknown = SAMGR_GetInstance()->GetDefaultFeatureApi("noExistService");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName301");
}

/**
 * @tc.name   testGetDefaultFeatureApi0040
 * @tc.number DMSLite_SAMGR_GetDefaultFeatureApi_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DefaultFeatureApiTest, testGetDefaultFeatureApi0040, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);

    IUnknown *resultIUnknown1 = SAMGR_GetInstance()->GetDefaultFeatureApi("serviceName301");
    IUnknown *resultIUnknown2 = SAMGR_GetInstance()->GetDefaultFeatureApi("serviceName301");
    ASSERT_EQ(resultIUnknown1 == resultIUnknown2, TRUE);

    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName301");
}

/**
 * @tc.name   testUnregisterDefaultFeatureApi0010
 * @tc.number DMSLite_SAMGR_UnregisterDefaultFeatureApi_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DefaultFeatureApiTest, testUnregisterDefaultFeatureApi0010, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);

    IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName301");
    ASSERT_EQ(resultIUnknown != nullptr, TRUE);
}

/**
 * @tc.name   testUnregisterDefaultFeatureApi0020
 * @tc.number DMSLite_SAMGR_UnregisterDefaultFeatureApi_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DefaultFeatureApiTest, testUnregisterDefaultFeatureApi0020, Function | MediumTest | Level2) {
    SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);

    IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterDefaultFeatureApi(NULL);
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);

    resultIUnknown = SAMGR_GetInstance()->UnregisterDefaultFeatureApi("");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);

    SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName301");
}

/**
 * @tc.name   testUnregisterDefaultFeatureApi0030
 * @tc.number DMSLite_SAMGR_UnregisterDefaultFeatureApi_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DefaultFeatureApiTest, testUnregisterDefaultFeatureApi0030, Function | MediumTest | Level2) {
    IUnknown *resultIUnknown = SAMGR_GetInstance()->UnregisterDefaultFeatureApi("noExistService");
    ASSERT_EQ(resultIUnknown == nullptr, TRUE);
}

/**
 * @tc.name   testUnregisterDefaultFeatureApi0040
 * @tc.number DMSLite_SAMGR_UnregisterDefaultFeatureApi_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DefaultFeatureApiTest, testUnregisterDefaultFeatureApi0040, Function | MediumTest | Level2) {
    // RegisterService and unregister default api over and over again, if there is memory leak samgr will crash
    for (int i = 0; i < PRESSURE_BASE; i++) {
        BOOL result = SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName301", (IUnknown *)&g_api);
        ASSERT_EQ(result, TRUE);

        IUnknown *resultIUnknown = SAMGR_GetInstance()->GetDefaultFeatureApi("serviceName301");
        ASSERT_EQ(resultIUnknown != nullptr, TRUE);

        resultIUnknown = SAMGR_GetInstance()->UnregisterDefaultFeatureApi("serviceName301");
        ASSERT_EQ(resultIUnknown != nullptr, TRUE);

        resultIUnknown = SAMGR_GetInstance()->GetDefaultFeatureApi("serviceName301");
        ASSERT_EQ(resultIUnknown == nullptr, TRUE);
    }
}