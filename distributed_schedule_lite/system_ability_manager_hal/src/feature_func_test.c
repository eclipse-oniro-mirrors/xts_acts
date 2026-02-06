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

#include <string.h>
#include "cmsis_os.h"
#include "hctest.h"
#include "samgr_lite.h"

#define PRESSURE_BASE (1024 * 10)

typedef struct DemoApi {
    INHERIT_IUNKNOWN;
} DemoApi;

typedef struct DemoFeature {
    INHERIT_FEATURE;
    INHERIT_IUNKNOWNENTRY(DemoApi);
    Identity identity;
} DemoFeature;

typedef struct ExampleService {
    INHERIT_SERVICE;
    Identity identity;
} ExampleService;

static const char *GetName(Service *service)
{
    (void)service;
    return "serviceName201";
}

static BOOL Initialize(Service *service, Identity identity)
{
    ExampleService *example = (ExampleService *)service;
    example->identity = identity;
    return TRUE;
}

static BOOL MessageHandle(Service *service, Request *msg)
{
    (void)msg;
    (void)service;
    return TRUE;
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
    .identity = {-1, -1, NULL},
};

static const char *FEATURE_GetName(Feature *feature)
{
    (void)feature;
    return "featureName201";
}
static const char *FEATURE_GetName2(Feature *feature)
{
    (void)feature;
    return "featureName202";
}
static void FEATURE_OnInitialize(Feature *feature, Service *parent, Identity identity)
{
    DemoFeature *demoFeature = (DemoFeature *)feature;
    demoFeature->identity = identity;
    (void)parent;
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
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
    },
    .identity = {-1, -1, NULL},
};
static DemoFeature g_feature2 = {
    .GetName = FEATURE_GetName2,
    .OnInitialize = FEATURE_OnInitialize,
    .OnStop = FEATURE_OnStop,
    .OnMessage = FEATURE_OnMessage,
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
    },
    .identity = {-1, -1, NULL},
};

LITE_TEST_SUIT(test, samgr, FeatureTestSuite);

static BOOL FeatureTestSuiteSetUp(void)
{
    BOOL result = SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    return result;
}

static BOOL FeatureTestSuiteTearDown(void)
{
    Service *resultService = SAMGR_GetInstance()->UnregisterService("serviceName201");
    if (strcmp(resultService->GetName(resultService), "serviceName201") == 0) {
        return TRUE;
    } else {
        return FALSE;
    }
}

/**
 * @tc.name   testRegisterFeature0010
 * @tc.number DMSLite_SAMGR_RegisterFeature_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(FeatureTestSuite, testRegisterFeature0010, Function | MediumTest | Level1)
{
    BOOL result = SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
}

/**
 * @tc.name   testRegisterFeature0020
 * @tc.number DMSLite_SAMGR_RegisterFeature_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testRegisterFeature0020, Function | MediumTest | Level2)
{
    BOOL result = SAMGR_GetInstance()->RegisterFeature(NULL, (Feature *)&g_feature);
    TEST_ASSERT_EQUAL_INT(result, FALSE);
}

/**
 * @tc.name   testRegisterFeature0030
 * @tc.number DMSLite_SAMGR_RegisterFeature_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testRegisterFeature0030, Function | MediumTest | Level2)
{
    BOOL result = SAMGR_GetInstance()->RegisterFeature("serviceName201", NULL);
    TEST_ASSERT_EQUAL_INT(result, FALSE);
}

/**
 * @tc.name   testRegisterFeature0040
 * @tc.number DMSLite_SAMGR_RegisterFeature_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testRegisterFeature0040, Function | MediumTest | Level2)
{
    BOOL result = SAMGR_GetInstance()->RegisterFeature("noExistServiceName", (Feature *)&g_feature);
    TEST_ASSERT_EQUAL_INT(result, FALSE);
}

/**
 * @tc.name   testRegisterFeature0050
 * @tc.number DMSLite_SAMGR_RegisterFeature_0050
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testRegisterFeature0050, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);

    BOOL result = SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);
    TEST_ASSERT_EQUAL_INT(result, FALSE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
}

/**
 * @tc.name   testRegisterFeature0060
 * @tc.number DMSLite_SAMGR_RegisterFeature_0060
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testRegisterFeature0060, Function | MediumTest | Level2)
{
    BOOL result1 = SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);
    TEST_ASSERT_EQUAL_INT(result1, TRUE);
    BOOL result2 = SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature2);
    TEST_ASSERT_EQUAL_INT(result2, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
    SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName202");
}

/**
 * @tc.name   testUnregisterFeature0010
 * @tc.number DMSLite_SAMGR_UnregisterFeature_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testUnregisterFeature0010, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);

    Feature *resultFeature = SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
    TEST_ASSERT_EQUAL_INT(strcmp(resultFeature->GetName(resultFeature), "featureName201"), 0);
}

/**
 * @tc.name   testUnregisterFeature0020
 * @tc.number DMSLite_SAMGR_UnregisterFeature_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testUnregisterFeature0020, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);

    Feature *resultFeature = SAMGR_GetInstance()->UnregisterFeature(NULL, "featureName201");
    TEST_ASSERT_EQUAL_INT(resultFeature == NULL, TRUE);

    resultFeature = SAMGR_GetInstance()->UnregisterFeature("", "featureName201");
    TEST_ASSERT_EQUAL_INT(resultFeature == NULL, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
}

/**
 * @tc.name   testUnregisterFeature0030
 * @tc.number DMSLite_SAMGR_UnregisterFeature_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testUnregisterFeature0030, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);

    Feature *resultFeature = SAMGR_GetInstance()->UnregisterFeature("serviceName201", NULL);
    TEST_ASSERT_EQUAL_INT(resultFeature == NULL, TRUE);

    resultFeature = SAMGR_GetInstance()->UnregisterFeature("serviceName201", "");
    TEST_ASSERT_EQUAL_INT(resultFeature == NULL, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
}

/**
 * @tc.name   testUnregisterFeature0040
 * @tc.number DMSLite_SAMGR_UnregisterFeature_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testUnregisterFeature0040, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);

    Feature *resultFeature = SAMGR_GetInstance()->UnregisterFeature("noExistService", "featureName201");
    TEST_ASSERT_EQUAL_INT(resultFeature == NULL, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
}

/**
 * @tc.name   testUnregisterFeature0050
 * @tc.number DMSLite_SAMGR_UnregisterFeature_0050
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testUnregisterFeature0050, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);

    Feature *resultFeature = SAMGR_GetInstance()->UnregisterFeature("serviceName201", "noExistFeature");
    TEST_ASSERT_EQUAL_INT(resultFeature == NULL, TRUE);

    SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
}

/**
 * @tc.name   testUnregisterFeature0060
 * @tc.number DMSLite_SAMGR_UnregisterFeature_0060
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testUnregisterFeature0060, Function | MediumTest | Level2)
{
    SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);
    SAMGR_GetInstance()->RegisterFeatureApi("serviceName201", "featureName201", GET_IUNKNOWN(g_feature));

    Feature *result = SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
    TEST_ASSERT_EQUAL_INT(result == NULL, TRUE);

    SAMGR_GetInstance()->UnregisterFeatureApi("serviceName201", "featureName201");
    SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
}

/**
 * @tc.name   testUnregisterFeature0070
 * @tc.number DMSLite_SAMGR_UnregisterFeature_0070
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(FeatureTestSuite, testUnregisterFeature0070, Function | MediumTest | Level2)
{
    // RegisterService and unregister feature over and over again, if there is memory leak samgr will crash
    for (int i = 0; i < PRESSURE_BASE; i++) {
        BOOL result = SAMGR_GetInstance()->RegisterFeature("serviceName201", (Feature *)&g_feature);
        TEST_ASSERT_EQUAL_INT(result, TRUE);
        
        Feature *resultFeature = SAMGR_GetInstance()->UnregisterFeature("serviceName201", "featureName201");
        TEST_ASSERT_EQUAL_INT(strcmp(resultFeature->GetName(resultFeature), "featureName201"), 0);
    }
}

RUN_TEST_SUITE(FeatureTestSuite);