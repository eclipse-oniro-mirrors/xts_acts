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

#include <stdlib.h>
#include <string.h>
#include "cmsis_os.h"
#include "securec.h"
#include "hctest.h"
#include "samgr_lite.h"

#define OPER_INTERVAL 200    // 200 ms
#define PRESSURE_BASE 10

enum MessageId {
    MSG_NO, // receiver does not send response
    MSG_RT, // receiver send response
    MSG_FW, // receiver forward message 
};

struct Payload {
    int id;
    const char *name;
    int value;
};

typedef struct DemoApi {
    INHERIT_IUNKNOWN;
    BOOL(*SyncCall)
    (IUnknown *iUnknown, struct Payload *payload);
    int32 (*SAMGR_SendRequestProxy)(const Identity *identity, const Request *request, Handler handler);
} DemoApi;

typedef struct DemoFeature {
    INHERIT_FEATURE;
    INHERIT_IUNKNOWNENTRY(DemoApi);
    Identity identity;
    int featureCalledCount;
    BOOL featureStatus;
    char *latestRequest;
} DemoFeature;

typedef struct DefaultFeatureApi {
    INHERIT_IUNKNOWN;
} DefaultFeatureApi;

typedef struct ExampleService {
    INHERIT_SERVICE;
    INHERIT_IUNKNOWNENTRY(DefaultFeatureApi);
    Identity identity;
} ExampleService;

static BOOL SyncCall(IUnknown *iUnknown, struct Payload *payload)
{
    (void)iUnknown;
    if (payload != NULL && payload->id >= 0 && payload->name != NULL) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static int32 SAMGR_SendRequestProxy(const Identity *identity, const Request *request, Handler handler)
{
    return SAMGR_SendRequest(identity, request, handler);
}

static const char *GetName(Service *service)
{
    (void)service;
    return "serviceName501";
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
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
    }
};

static const char *FEATURE_GetName(Feature *feature)
{
    (void)feature;
    return "featureName501";
}

static const char *FEATURE_GetName02(Feature *feature)
{
    (void)feature;
    return "featureName502";
}

static const char *FEATURE_GetName03(Feature *feature)
{
    (void)feature;
    return "featureName503";
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
    int32 returnCode = 0;;
    DemoFeature *demoFeature = (DemoFeature *)feature;
    demoFeature->featureCalledCount++;

    if (demoFeature->latestRequest != NULL) {
        free(demoFeature->latestRequest);
    }
    int requestLen;
    if (request->len > 0) {
        requestLen = request->len;
    } else {
        requestLen = strlen((char *)request->data) + 1;
    }
    demoFeature->latestRequest = (char *)malloc(requestLen * sizeof(char));
    if (demoFeature->latestRequest == NULL) {
        TEST_FAIL();
    }
    errno_t error = strcpy_s(demoFeature->latestRequest, requestLen, (char *)request->data);
    if (error != EOK) {
        TEST_FAIL();
    }

    switch (request->msgId) {
        case MSG_NO:
            returnCode = 0;
            break;
        case MSG_RT:
        {
            Response response = {
                .data = "Yes, you did!",
                .len = 0,
                };
            returnCode = SAMGR_SendResponse(request, &response);
        };
        break;
        case MSG_FW:
        {
            returnCode = 0;
        };
        break;
    }
    demoFeature->featureStatus = ((returnCode == 0) ? TRUE : FALSE);
    return demoFeature->featureStatus;
}

static BOOL FEATURE_OnMessage02(Feature *feature, Request *request)
{
    int32 returnCode = 0;
    DemoFeature *demoFeature = (DemoFeature *)feature;
    demoFeature->featureCalledCount++;

    if (demoFeature->latestRequest != NULL) {
        free(demoFeature->latestRequest);
    }
    int requestLen;
    if (request->len > 0) {
        requestLen = request->len;
    } else {
        requestLen = strlen((char *)request->data) + 1;
    }
    demoFeature->latestRequest = (char *)malloc(requestLen * sizeof(char));
    if (demoFeature->latestRequest == NULL) {
        TEST_FAIL();
    }
    errno_t error = strcpy_s(demoFeature->latestRequest, requestLen, (char *)request->data);
    if (error != EOK) {
        TEST_FAIL();
    }

    switch (request->msgId) {
        case MSG_NO:
            returnCode = 0;
            break;
        case MSG_RT:
        {
            Response response = {
                .data = "Yes, you did!",
                .len = 0,
                };
            returnCode = SAMGR_SendResponse(request, &response);
        };
        break;
        case MSG_FW:
        {
            returnCode = 0;
        };
        break;
    }
    demoFeature->featureStatus = ((returnCode == 0) ? TRUE : FALSE);
    return demoFeature->featureStatus;
}

static BOOL FEATURE_OnMessage03(Feature *feature, Request *request)
{
    int32 returnCode = 0;
    DemoFeature *demoFeature = (DemoFeature *)feature;
    demoFeature->featureCalledCount++;

    if (demoFeature->latestRequest != NULL) {
        free(demoFeature->latestRequest);
    }
    int requestLen;
    if (request->len > 0) {
        requestLen = request->len;
    } else {
        requestLen = strlen((char *)request->data) + 1;
    }
    demoFeature->latestRequest = (char *)malloc(requestLen * sizeof(char));
    if (demoFeature->latestRequest == NULL) {
        TEST_FAIL();
    }
    errno_t error = strcpy_s(demoFeature->latestRequest, requestLen, (char *)request->data);
    if (error != EOK) {
        TEST_FAIL();
    }
    
    switch (request->msgId) {
        case MSG_NO:
            returnCode = 0;
            break;
        case MSG_RT:
        {
            Response response = {
                .data = "Yes, you did!",
                .len = 0,
                };
            returnCode = SAMGR_SendResponse(request, &response);
        };
        break;
        case MSG_FW:
        {
            returnCode = 0;
        };
        break;
    }
    demoFeature->featureStatus = ((returnCode == 0) ? TRUE : FALSE);
    return demoFeature->featureStatus;
}

static DemoFeature g_feature = {
    .GetName = FEATURE_GetName,
    .OnInitialize = FEATURE_OnInitialize,
    .OnStop = FEATURE_OnStop,
    .OnMessage = FEATURE_OnMessage,
    .ref = 1,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
        .SyncCall = SyncCall,
        .SAMGR_SendRequestProxy = SAMGR_SendRequestProxy,
    },
    .identity = {-1, -1, NULL},
    .featureCalledCount = 0,
    .featureStatus = TRUE,
    .latestRequest = NULL,
};
static DemoFeature g_feature02 = {
    .GetName = FEATURE_GetName02,
    .OnInitialize = FEATURE_OnInitialize,
    .OnStop = FEATURE_OnStop,
    .OnMessage = FEATURE_OnMessage02,
    .ref = 0,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
        .SyncCall = SyncCall,
        .SAMGR_SendRequestProxy = SAMGR_SendRequestProxy,
    },
    .identity = {-1, 1, NULL},
    .featureCalledCount = 0,
    .featureStatus = TRUE,
    .latestRequest = NULL,
};
static DemoFeature g_feature03 = {
    .GetName = FEATURE_GetName03,
    .OnInitialize = FEATURE_OnInitialize,
    .OnStop = FEATURE_OnStop,
    .OnMessage = FEATURE_OnMessage03,
    .ref = 0,
    .iUnknown = {
        DEFAULT_IUNKNOWN_IMPL,
        .SyncCall = SyncCall,
        .SAMGR_SendRequestProxy = SAMGR_SendRequestProxy,
    },
    .identity = {-1, 2, NULL},
    .featureCalledCount = 0,
    .featureStatus = TRUE,
    .latestRequest = NULL,
};

static void ServiceInit(void)
{
    BOOL result = SAMGR_GetInstance()->RegisterService((Service *)&g_service);
    if (result == FALSE) {
        printf("[hctest]E RegisterService failed. \n");
    }
}
SYSEX_SERVICE_INIT(ServiceInit);

static void FeatureInit(void)
{
    BOOL result1 = SAMGR_GetInstance()->RegisterDefaultFeatureApi("serviceName501", GET_IUNKNOWN(g_feature));

    BOOL result2 = SAMGR_GetInstance()->RegisterFeature("serviceName501", (Feature *)&g_feature02);
    BOOL result3 = SAMGR_GetInstance()->RegisterFeatureApi("serviceName501", "featureName502", 
                                                           GET_IUNKNOWN(g_feature02));

    BOOL result4 = SAMGR_GetInstance()->RegisterFeature("serviceName501", (Feature *)&g_feature03);
    BOOL result5 = SAMGR_GetInstance()->RegisterFeatureApi("serviceName501", "featureName503", 
                                                           GET_IUNKNOWN(g_feature03));
    if (result1 == FALSE || result2 == FALSE || result3 == FALSE || result4 == FALSE || result5 == FALSE) {
        printf("[hctest]E failed to register feature or api.\n");
    }
}
SYSEX_FEATURE_INIT(FeatureInit);

static DemoApi *GetIUnknown(const char *serviceName, const char *featureName)
{
    DemoApi *demoApi = NULL;
    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi(serviceName, featureName);
    if (iUnknown == NULL) {
        printf("[hctest]failed to GetFeatureApi.\n");
        return NULL;
    }
    int result = iUnknown->QueryInterface(iUnknown, 0, (void **)&demoApi);
    if (result == 0 && demoApi != NULL) {
        return demoApi;
    } else {
        printf("[hctest]failed to QueryInterface.\n");
        return NULL;
    }
}

static void ReleaseIUnknown(DemoApi *demoApi)
{
    demoApi->Release((IUnknown *)demoApi);
}

static void DemoHandlerAndCheck(const Request *request, const Response *response)
{
    (void)request;
    (void)response;
}

LITE_TEST_SUIT(test, samgr, SendRequestTestSuite);

static BOOL SendRequestTestSuiteSetUp(void)
{
    osDelay(OPER_INTERVAL);
    return TRUE;
}

static BOOL SendRequestTestSuiteTearDown(void)
{
    return TRUE;
}

/**
 * @tc.name   testSyncCall0010
 * @tc.number DMSLite_SAMGR_SyncCall_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(SendRequestTestSuite, testSyncCall0010, Function | MediumTest | Level1)
{
    DemoApi *demoApi = GetIUnknown("serviceName501", "featureName502");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    struct Payload payload = {
        .id = 0, // api will return true
        .name = "I wanna sync call good result!",
        .value = 1};
    BOOL result = demoApi->SyncCall((IUnknown *)demoApi, &payload);
    TEST_ASSERT_EQUAL_INT(result, TRUE);

    struct Payload payloadX = {
        .id = -1,  // api will return false
        .name = "I wanna sync call good result!",
        .value = 1};
    result = demoApi->SyncCall((IUnknown *)demoApi, &payloadX);
    TEST_ASSERT_EQUAL_INT(result, FALSE);

    ReleaseIUnknown(demoApi);
}

/**
 * @tc.name   testSendRequest0010
 * @tc.number DMSLite_SAMGR_SendRequest_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0010, Function | MediumTest | Level1)
{
    DemoApi *demoApi = GetIUnknown("serviceName501", "featureName502");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    Request request = {.msgId = MSG_RT, .msgValue = 0};
    char *body = "I wanna async call good result!";
    request.len = (int16)(strlen(body) + 1);
    request.data = malloc(request.len);
    if (request.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request.data, request.len, body);

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
    if (iUnknown == NULL) {
        TEST_FAIL();
    }
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    feature->featureCalledCount = 0;
    int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, NULL);
    TEST_ASSERT_EQUAL_INT(result == 0, TRUE);

    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(feature->featureCalledCount == 1, TRUE);
    TEST_ASSERT_EQUAL_INT(strcmp(feature->latestRequest, body), 0);

    ReleaseIUnknown(demoApi);
}

/**
 * @tc.name   testSendRequest0020
 * @tc.number DMSLite_SAMGR_SendRequest_0020
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0020, Function | MediumTest | Level2)
{
    DemoApi *demoApi = GetIUnknown("serviceName501", "featureName502");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    Request request = {.msgId = MSG_RT, .msgValue = 0};
    char *body = "I wanna async call good result!";
    request.len = (int16)(strlen(body) + 1);
    request.data = malloc(request.len);
    if (request.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request.data, request.len, body);

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName502");
    if (iUnknown == NULL) {
        TEST_FAIL();
    }
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    feature->featureCalledCount = 0;
    int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, NULL);
    TEST_ASSERT_EQUAL_INT(result == 0, TRUE);

    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(feature->featureCalledCount == 1, TRUE);
    TEST_ASSERT_EQUAL_INT(strcmp(feature->latestRequest, body), 0);

    ReleaseIUnknown(demoApi);
}

/**
 * @tc.name   testSendRequest0030
 * @tc.number DMSLite_SAMGR_SendRequest_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0030, Function | MediumTest | Level2)
{
    DemoApi *demoApi = GetIUnknown("serviceName501", "featureName502");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    Request request = {.msgId = MSG_RT, .msgValue = 0};
    char *body = "I wanna async call good result!";
    request.len = (int16)(strlen(body) + 1);
    request.data = malloc(request.len);
    if (request.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request.data, request.len, body);

    Identity identityX = {-1, -200, NULL};
    int32 result = demoApi->SAMGR_SendRequestProxy(&identityX, &request, NULL);
    TEST_ASSERT_EQUAL_INT(result != 0, TRUE);

    free(request.data);
    request.data = NULL;
    ReleaseIUnknown(demoApi);
}

/**
 * @tc.name   testSendRequest0040
 * @tc.number DMSLite_SAMGR_SendRequest_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0040, Function | MediumTest | Level2)
{
    DemoApi *demoApi = GetIUnknown("serviceName501", "featureName502");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    Request request = {.msgId = MSG_RT, .msgValue = 0};
    request.len = 0;
    request.data = "I wanna async call good result!";

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    feature->featureCalledCount = 0;
    int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, NULL);
    TEST_ASSERT_EQUAL_INT(result == 0, TRUE);

    osDelay(OPER_INTERVAL);
    TEST_ASSERT_EQUAL_INT(feature->featureCalledCount == 1, TRUE);

    ReleaseIUnknown(demoApi);
}

/**
 * @tc.name   testSendRequest0050
 * @tc.number DMSLite_SAMGR_SendRequest_0050
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0050, Function | MediumTest | Level2)
{
    DemoApi *demoApi = GetIUnknown("serviceName501", "featureName502");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    Request request = {.msgId = MSG_RT, .msgValue = 0};
    char *body = "";
    request.len = (int16)(strlen(body) + 1);
    request.data = malloc(request.len);
    if (request.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request.data, request.len, body);

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    int32 result = demoApi->SAMGR_SendRequestProxy(NULL, &request, NULL);
    TEST_ASSERT_EQUAL_INT(result != 0, TRUE);

    result = demoApi->SAMGR_SendRequestProxy(&feature->identity, NULL, NULL);
    TEST_ASSERT_EQUAL_INT(result != 0, TRUE);

    free(request.data);
    request.data = NULL;
    ReleaseIUnknown(demoApi);
}

/**
 * @tc.name   testSendRequest0060
 * @tc.number DMSLite_SAMGR_SendRequest_0060
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0060, Function | MediumTest | Level2)
{
    DemoApi *demoApi = GetIUnknown("serviceName501", "featureName502");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    Request request = {.msgId = MSG_NO, .msgValue = 0};
    char *body = "I wanna async call good result!";
    request.len = 0;
    request.data = "I wanna async call good result!";
    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
    if (iUnknown == NULL) {
        TEST_FAIL();
    }
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, NULL);
    TEST_ASSERT_EQUAL_INT(result == 0, TRUE);

    Request request2 = {.msgId = MSG_NO, .msgValue = 0};
    request2.len = (int16)(strlen(body) + 1);
    request2.data = malloc(request2.len);
    if (request2.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request2.data, request2.len, body);

    result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request2, NULL);
    TEST_ASSERT_EQUAL_INT(result == 0, TRUE);

    ReleaseIUnknown(demoApi);
}

/**
 * @tc.name   testSendRequest0070
 * @tc.number DMSLite_SAMGR_SendRequest_0070
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0070, Function | MediumTest | Level2)
{
    DemoApi *demoApi = GetIUnknown("serviceName501", "featureName502");
    if (demoApi == NULL) {
        TEST_FAIL();
    }
    Request request = {.msgId = MSG_RT, .msgValue = 0};
    char *body = "I wanna async call good result!";
    request.len = (int16)(strlen(body) + 1);
    request.data = malloc(request.len);
    if (request.data == NULL) {
        TEST_FAIL();
    }
    strcpy_s(request.data, request.len, body);

    IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
    if (iUnknown == NULL) {
        TEST_FAIL();
    }
    DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

    int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, DemoHandlerAndCheck); 
    TEST_ASSERT_EQUAL_INT(result, 0);
    TEST_ASSERT_EQUAL_INT(strcmp(feature->latestRequest, body), 0);
    
    ReleaseIUnknown(demoApi);
}

/**
 * @tc.name   testSendRequest0080
 * @tc.number DMSLite_SAMGR_SendRequest_0080
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0080, Function | MediumTest | Level2)
{
    for (int i = 0; i < PRESSURE_BASE; i++) {
        DemoApi *demoApi = GetIUnknown("serviceName501", "featureName502");
        if (demoApi == NULL) {
            TEST_FAIL();
        }
        Request request = {.msgId = MSG_RT, .msgValue = 0};
        char *body = "I wanna async call good result!";
        request.len = (int16)(strlen(body) + 1);
        request.data = malloc(request.len);
        if (request.data == NULL) {
            TEST_FAIL();
        }
        strcpy_s(request.data, request.len, body);

        IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
        if (iUnknown == NULL) {
            TEST_FAIL();
        }
        DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

        int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, DemoHandlerAndCheck); 
        TEST_ASSERT_EQUAL_INT(result, 0);
        TEST_ASSERT_EQUAL_INT(strcmp(feature->latestRequest, body), 0);
    
        ReleaseIUnknown(demoApi);
    }
}

/**
 * @tc.name   testSendRequest0090
 * @tc.number DMSLite_SAMGR_SendRequest_0090
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
LITE_TEST_CASE(SendRequestTestSuite, testSendRequest0090, Function | MediumTest | Level2)
{
    for (int i = 0; i < PRESSURE_BASE; i++) {
        DemoApi *demoApi = GetIUnknown("serviceName501", "featureName502");
        if (demoApi == NULL) {
            TEST_FAIL();
        }
        Request request = {.msgId = MSG_RT, .msgValue = 0};
        char body[]= "I wanna async call good result!";
        request.len = 0;
        request.data = body;
        
        IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi("serviceName501", "featureName503");
        if (iUnknown == NULL) {
            TEST_FAIL();
        }
        DemoFeature *feature = GET_OBJECT(iUnknown, DemoFeature, iUnknown);

        int32 result = demoApi->SAMGR_SendRequestProxy(&feature->identity, &request, DemoHandlerAndCheck); 
        TEST_ASSERT_EQUAL_INT(result, 0);
        TEST_ASSERT_EQUAL_INT(strcmp(feature->latestRequest, body), 0);
    
        ReleaseIUnknown(demoApi);
    }
}

RUN_TEST_SUITE(SendRequestTestSuite);