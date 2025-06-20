/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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


#include "napi/native_api.h"
#include <cstdio>
#include <cwchar>
#include "oh_commonevent.h"
#include "oh_commonevent_support.h"
#include "common.h"
#include "commonevent_publishinfo_test.h"

namespace CesCapiTest {

static CommonEvent_Subscriber* subscriber = nullptr;
static CommonEvent_SubscribeInfo* subscribeInfo = nullptr;
static char* dataStr = nullptr;

napi_value CommonEventPublishInfoTest::TestCommonEventCreatePublishInfo001(napi_env env,
                                                                           napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo == nullptr) {
        napi_value res = nullptr;
        napi_create_int32(env, INVALID_PARAM, &res);
        return res;
    }
    OH_CommonEvent_DestroyPublishInfo(publishInfo);
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventCreatePublishInfo002(napi_env env,
                                                                           napi_callback_info info)
{
    bool ordered = false;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo == nullptr) {
        napi_value res = nullptr;
        napi_create_int32(env, INVALID_PARAM, &res);
        return res;
    }
    OH_CommonEvent_DestroyPublishInfo(publishInfo);
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventDestroyPublishInfo001(napi_env env,
                                                                            napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

//SetPublishInfoBundleName
napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoBundleName001(napi_env env,
                                                                                  napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* bundleName = "com.example.myapplication444";
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoBundleName(publishInfo, bundleName), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoBundleName002(napi_env env,
                                                                                  napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* bundleName = "com.example.myapplication444";
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoBundleName(nullptr, bundleName),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoBundleName003(napi_env env,
                                                                                  napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* bundleName = nullptr;
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoBundleName(publishInfo, bundleName), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoPermissions001(napi_env env,
                                                                                   napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* permissions[] = {"ohos.permission.RECEIVER_STARTUP_COMPLETED"};
    int32_t num = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoPermissions(publishInfo, permissions, num),
              COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoPermissions002(napi_env env,
                                                                                   napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* permissions[] = {"ohos.permission.RECEIVER_STARTUP_COMPLETED"};
    int32_t num = PARAM_0;
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoPermissions(nullptr, permissions, num),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoPermissions003(napi_env env,
                                                                                   napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* permissions[] = {"ohos.permission.RECEIVER_STARTUP_COMPLETED"};
    int32_t num = PARAM_0;
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoPermissions(publishInfo, nullptr, num),
              COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoCode001(napi_env env, napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    int32_t code = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoCode(publishInfo, code), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoCode002(napi_env env, napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    int32_t code = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoCode(nullptr, code), COMMONEVENT_ERR_INVALID_PARAMETER);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

void CommonEventPublishInfoTest::PublishInfoCallback001(const CommonEvent_RcvData *data)
{
    dataStr = const_cast<char *>(OH_CommonEvent_GetDataStrFromRcvData(data));
    if (subscriber != nullptr) {
        OH_CommonEvent_UnSubscribe(subscriber);
    }
    if (subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(subscribeInfo);
        subscribeInfo = nullptr;
    }
    if (subscriber != nullptr) {
        OH_CommonEvent_DestroySubscriber(subscriber);
        subscriber = nullptr;
    }
}

napi_value CommonEventPublishInfoTest::GetDataStr001(napi_env env, napi_callback_info info)
{
    if (dataStr != nullptr) {
        ASSERT_STREQ(dataStr, "d");
    }
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoData001(napi_env env, napi_callback_info info)
{
    const char* events[] = {COMMON_EVENT_USER_UNLOCKED};
    int32_t eventsNum = sizeof(events) / sizeof(char*);
    subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(subscribeInfo, nullptr);
    subscriber = OH_CommonEvent_CreateSubscriber(subscribeInfo, PublishInfoCallback001);
    ASSERT_OBJNE(subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(subscriber), COMMONEVENT_ERR_OK);

    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* data = "data";
    size_t length = PARAM_1;
    dataStr = nullptr;
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoData(publishInfo, data, length), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_USER_UNLOCKED, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::GetDataStr002(napi_env env, napi_callback_info info)
{
    if (dataStr != nullptr) {
        ASSERT_STREQ(dataStr, "data");
    }
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoData002(napi_env env, napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* data = "data";
    size_t length = PARAM_6;
    dataStr = nullptr;
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoData(publishInfo, data, length), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::GetDataStr003(napi_env env, napi_callback_info info)
{
    if (dataStr != nullptr) {
        ASSERT_STREQ(dataStr, "data");
    }
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoData003(napi_env env, napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* data = "data";
    size_t length = PARAM_4;
    dataStr = nullptr;
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoData(publishInfo, data, length), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoData004(napi_env env, napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* data = "data";
    size_t length = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoData(nullptr, data, length),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoData005(napi_env env, napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* data = "data";
    size_t length = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoData(publishInfo, nullptr, length), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoData006(napi_env env, napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* data = "data";
    size_t length = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoData(publishInfo, data, PARAM_0), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoParameters001(napi_env env, napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    auto parameters = OH_CommonEvent_CreateParameters();
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoParameters(publishInfo, parameters), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    publishInfo = nullptr;
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoParameters002(napi_env env, napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    auto parameters = OH_CommonEvent_CreateParameters();
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoParameters(nullptr, parameters),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    publishInfo = nullptr;
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventPublishInfoTest::TestCommonEventSetPublishInfoParameters003(napi_env env, napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    auto parameters = OH_CommonEvent_CreateParameters();
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoParameters(publishInfo, nullptr), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    publishInfo = nullptr;
    parameters = nullptr;
    NAPI_END;
}
} // namespace CesCapiTest