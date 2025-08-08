/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "BasicServicesKit/oh_commonevent.h"
#include "BasicServicesKit/oh_commonevent_support.h"
#include "common.h"
#include "hilog/log.h"
#include "napi/native_api.h"

static napi_value CreatePublishInfo(napi_env env, napi_callback_info info)
{
    bool ordered = true;
    publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    ASSERT_OBJNE(publishInfo, nullptr);
    NAPI_END;
}

static napi_value DestroyPublishInfo(napi_env env, napi_callback_info info)
{
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

void OnReceive(const CommonEvent_RcvData *data)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CES_TEST PublishInfoCallback001",
                 "PublishInfoCallback001 Enter");
    // 获取回调公共事件名称
    const char *event = OH_CommonEvent_GetEventFromRcvData(data);

    // 获取回调公共事件结果代码
    int code = OH_CommonEvent_GetCodeFromRcvData(data);

    // 获取回调公共事件自定义结果数据
    const char *retData = OH_CommonEvent_GetDataStrFromRcvData(data);

    // 获取回调公共事件包名称
    const char *bundle = OH_CommonEvent_GetBundleNameFromRcvData(data);

    // 获取回调公共事件附件信息
    const CommonEvent_Parameters *parameters = OH_CommonEvent_GetParametersFromRcvData(data);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST",
                 "event: %{public}s, code: %{public}d, data: %{public}s, bundle: %{public}s", event, code, retData,
                 bundle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN,
                 "CES_TEST event: %{public}s, code: %{public}d, data: %{public}s, bundle: %{public}s", event, code,
                 retData, bundle);
}

napi_value GetSetPublishInfoBundleName(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CES_TEST GetSetPublishInfoBundleName",
                 "GetSetPublishInfoBundleName Enter");
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CES_TEST GetSetPublishInfoBundleName",
                 "g_publishInfoBN %{public}s", g_publishInfoBN);
    ASSERT_OBJNE(g_publishInfoBN, nullptr);
    ASSERT_EQ(g_publishInfoBN, "com.example.hitsnotificationcommoneventcapi");
    if (subscriber != nullptr) {
        OH_CommonEvent_UnSubscribe(subscriber);
        OH_CommonEvent_DestroySubscriber(subscriber);
        subscriber = nullptr;
    }
    if (subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(subscribeInfo);
        subscribeInfo = nullptr;
    }
    NAPI_END;
}

static napi_value SetPublishInfoBundleName(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CES_TEST SetPublishInfoBundleName",
                 "SetPublishInfoBundleName enter");

    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char *bundleName = "com.example.hitsnotificationcommoneventcapi";
    auto ret = OH_CommonEvent_SetPublishInfoBundleName(publishInfo, bundleName);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CES_TEST SetPublishInfoBundleName",
                 "OH_CommonEvent_SetPublishInfoBundleName %{public}d", ret);
    ASSERT_EQ(ret, COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

static napi_value SetPublishInfoPermissions(napi_env env, napi_callback_info info)
{
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        const char *permissions[] = {"ohos.permission.RECEIVER_STARTUP_COMPLETED"};
        int32_t num = PARAM_1;
        ASSERT_EQ(OH_CommonEvent_SetPublishInfoPermissions(publishInfo, permissions, num), COMMONEVENT_ERR_OK);
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_USER_UNLOCKED, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

void PublishInfoCallback002(const CommonEvent_RcvData *data)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CES_TEST PublishInfoCallback002",
                 "PublishInfoCallback002 Enter");
    if (data != nullptr) {
        g_publishInfoCode = OH_CommonEvent_GetCodeFromRcvData(data);
    } else {
        g_publishInfoCode = PARAM_0;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CES_TEST  PublishInfoCallback002",
                 "OH_CommonEvent_GetCodeFromRcvData %{public}d", g_publishInfoCode);
}

static napi_value GetSetPublishInfoCode(napi_env env, napi_callback_info info)
{
    if (subscriber != nullptr) {
        OH_CommonEvent_UnSubscribe(subscriber);
        OH_CommonEvent_DestroySubscriber(subscriber);
        subscriber = nullptr;
    }
    if (subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(subscribeInfo);
        subscribeInfo = nullptr;
    }
    ASSERT_EQ(g_publishInfoCode, PARAM_1);
    NAPI_END;
}

static napi_value SetPublishInfoCode(napi_env env, napi_callback_info info)
{
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(subscribeInfo, nullptr);
    subscriber = OH_CommonEvent_CreateSubscriber(subscribeInfo, PublishInfoCallback002);
    ASSERT_OBJNE(subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(subscriber), COMMONEVENT_ERR_OK);
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    int32_t code = PARAM_1;
    if (publishInfo != nullptr) {
        ASSERT_EQ(OH_CommonEvent_SetPublishInfoCode(publishInfo, code), COMMONEVENT_ERR_OK);
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

void PublishInfoCallback003(const CommonEvent_RcvData *data)
{
    dataStr = (char *)OH_CommonEvent_GetDataStrFromRcvData(data);
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

static napi_value GetSetPublishInfoData(napi_env env, napi_callback_info info)
{
    ASSERT_OBJNE(dataStr, nullptr);
    ASSERT_STREQ(dataStr, "data");
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CES_TEST  GetSetPublishInfoData",
                 "GetSetPublishInfoData %{public}s", dataStr);
    NAPI_END;
}

static napi_value SetPublishInfoData(napi_env env, napi_callback_info info)
{
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(subscribeInfo, nullptr);
    subscriber = OH_CommonEvent_CreateSubscriber(subscribeInfo, PublishInfoCallback003);
    ASSERT_OBJNE(subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(subscriber), COMMONEVENT_ERR_OK);
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char *data = "data";
    size_t length = PARAM_4;
    dataStr = nullptr;
    ASSERT_EQ(OH_CommonEvent_SetPublishInfoData(publishInfo, data, length), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

void PublishInfoCallback005(const CommonEvent_RcvData *data)
{
    if (data != nullptr) {
        auto parameters = OH_CommonEvent_GetParametersFromRcvData(data);
        if (parameters != nullptr) {
            g_parametersInt = OH_CommonEvent_GetIntFromParameters(parameters, KEY_INT, PARAM_0);
        }
    } else {
        g_parametersInt = PARAM_0;
    }
}

static napi_value GetSetPublishInfoParameters(napi_env env, napi_callback_info info)
{
    if (subscriber != nullptr) {
        OH_CommonEvent_UnSubscribe(subscriber);
        OH_CommonEvent_DestroySubscriber(subscriber);
        subscriber = nullptr;
    }
    if (subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(subscribeInfo);
        subscribeInfo = nullptr;
    }
    ASSERT_EQ(g_parametersInt, PARAM_1);
    NAPI_END;
}

static napi_value SetPublishInfoParameters(napi_env env, napi_callback_info info)
{
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(subscribeInfo, nullptr);
    subscriber = OH_CommonEvent_CreateSubscriber(subscribeInfo, PublishInfoCallback005);
    ASSERT_OBJNE(subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(subscriber), COMMONEVENT_ERR_OK);
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        auto parameters = OH_CommonEvent_CreateParameters();
        if (parameters != nullptr) {
            ASSERT_EQ(OH_CommonEvent_SetIntToParameters(parameters, KEY_INT, PARAM_1), COMMONEVENT_ERR_OK);
            ASSERT_EQ(OH_CommonEvent_SetPublishInfoParameters(publishInfo, parameters), COMMONEVENT_ERR_OK);
        }
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        OH_CommonEvent_DestroyParameters(parameters);
        publishInfo = nullptr;
    }
    NAPI_END;
}