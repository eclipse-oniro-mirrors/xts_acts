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

static CommonEvent_Subscriber *g_subscriber = nullptr;
static CommonEvent_SubscribeInfo *g_subscribeInfo = nullptr;
static CommonEvent_PublishInfo *g_publishInfo = nullptr;
static bool g_isOrderedCommonEvent = false;
static bool g_isAbort = false;
static bool g_isGetAbort = false;
static bool g_isClearAborted = false;
static bool g_isFinished = false;

void IsOrderedCommonEventCallback(const CommonEvent_RcvData *data) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "IsOrderedCommonEventCallback",
                 "IsOrderedCommonEventCallback Enter");
    if (g_subscriber != nullptr) {
        g_isOrderedCommonEvent = OH_CommonEvent_IsOrderedCommonEvent(g_subscriber);
    } else {
        g_isOrderedCommonEvent = false;
    }
}

static napi_value IsOrderedCommonEvent(napi_env env, napi_callback_info info) {
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(g_subscribeInfo, nullptr);
    g_subscriber = OH_CommonEvent_CreateSubscriber(g_subscribeInfo, IsOrderedCommonEventCallback);
    ASSERT_OBJNE(g_subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(g_subscriber), COMMONEVENT_ERR_OK);
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    ASSERT_OBJNE(publishInfo, nullptr);
    ASSERT_EQ(OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

static napi_value GetIsOrderedCommonEvent(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetIsOrderedCommonEvent", "GetIsOrderedCommonEvent Enter");
    if (g_subscriber != nullptr) {
        OH_CommonEvent_UnSubscribe(g_subscriber);
        OH_CommonEvent_DestroySubscriber(g_subscriber);
        g_subscriber = nullptr;
    }
    if (g_subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(g_subscribeInfo);
        g_subscribeInfo = nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetIsOrderedCommonEvent", "g_isOrderedCommonEvent: %{public}d",
                 g_isOrderedCommonEvent);
    ASSERT_EQ(g_isOrderedCommonEvent, true);
    NAPI_END;
}

void FinishCommonEventCallback(const CommonEvent_RcvData *data) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FinishCommonEventCallback", "FinishCommonEventCallback Enter");
    if (g_subscriber != nullptr) {
        g_isFinished = OH_CommonEvent_FinishCommonEvent(g_subscriber);
    } else {
        g_isFinished = false;
    }
}

static napi_value FinishCommonEvent(napi_env env, napi_callback_info info) {
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(g_subscribeInfo, nullptr);
    g_subscriber = OH_CommonEvent_CreateSubscriber(g_subscribeInfo, FinishCommonEventCallback);
    ASSERT_OBJNE(g_subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(g_subscriber), COMMONEVENT_ERR_OK);
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

static napi_value GetFinishCommonEvent(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetFinishCommonEvent", "GetFinishCommonEvent Enter");
    if (g_subscriber != nullptr) {
        OH_CommonEvent_UnSubscribe(g_subscriber);
        OH_CommonEvent_DestroySubscriber(g_subscriber);
        g_subscriber = nullptr;
    }
    if (g_subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(g_subscribeInfo);
        g_subscribeInfo = nullptr;
    }
    ASSERT_EQ(g_isFinished, true);
    NAPI_END;
}

void GetAbortCommonEventCallback(const CommonEvent_RcvData *data) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetAbortCommonEventCallback",
                 "GetAbortCommonEventCallback Enter");
    if (g_subscriber != nullptr) {
        if (OH_CommonEvent_AbortCommonEvent(g_subscriber)) {
            g_isGetAbort = OH_CommonEvent_GetAbortCommonEvent(g_subscriber);
        }
    } else {
        g_isGetAbort = false;
    }
    if (g_subscriber != nullptr) {
        g_isFinished = OH_CommonEvent_FinishCommonEvent(g_subscriber);
    } else {
        g_isFinished = false;
    }
}

static napi_value GetAbortCommonEvent(napi_env env, napi_callback_info info) {
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(g_subscribeInfo, nullptr);
    g_subscriber = OH_CommonEvent_CreateSubscriber(g_subscribeInfo, GetAbortCommonEventCallback);
    ASSERT_OBJNE(g_subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(g_subscriber), COMMONEVENT_ERR_OK);
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

static napi_value GetGetAbortCommonEvent(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGetAbortCommonEvent", "GetGetAbortCommonEvent Enter");
    if (g_subscriber != nullptr) {
        OH_CommonEvent_UnSubscribe(g_subscriber);
        OH_CommonEvent_DestroySubscriber(g_subscriber);
        g_subscriber = nullptr;
    }
    if (g_subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(g_subscribeInfo);
        g_subscribeInfo = nullptr;
    }
    ASSERT_EQ(g_isGetAbort, true);
    NAPI_END;
}

void AbortCommonEventCallback(const CommonEvent_RcvData *data) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AbortCommonEventCallback", "AbortCommonEventCallback Enter");
    if (g_subscriber != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AbortCommonEventCallback",
                     "AbortCommonEventCallback Enter g_subscriber");
        g_isAbort = OH_CommonEvent_AbortCommonEvent(g_subscriber);
    } else {
        g_isAbort = false;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AbortCommonEventCallback",
                 "AbortCommonEventCallback Enter %{public}d", g_isAbort);

    if (g_subscriber != nullptr) {
        g_isFinished = OH_CommonEvent_FinishCommonEvent(g_subscriber);
    } else {
        g_isFinished = false;
    }
}

static napi_value AbortCommonEvent(napi_env env, napi_callback_info info) {
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(g_subscribeInfo, nullptr);
    g_subscriber = OH_CommonEvent_CreateSubscriber(g_subscribeInfo, AbortCommonEventCallback);
    ASSERT_OBJNE(g_subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(g_subscriber), COMMONEVENT_ERR_OK);
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

static napi_value GetAbortCommonEvent2(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetAbortCommonEvent2", "GetAbortCommonEvent2 Enter");
    if (g_subscriber != nullptr) {
        OH_CommonEvent_UnSubscribe(g_subscriber);
        OH_CommonEvent_DestroySubscriber(g_subscriber);
        g_subscriber = nullptr;
    }
    if (g_subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(g_subscribeInfo);
        g_subscribeInfo = nullptr;
    }
    ASSERT_EQ(g_isAbort, true);
    NAPI_END;
}

void ClearAbortCommonEventCallback(const CommonEvent_RcvData *data) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ClearAbortCommonEventCallback",
                 "ClearAbortCommonEventCallback Enter");
    if (g_subscriber != nullptr) {
        g_isAbort = OH_CommonEvent_AbortCommonEvent(g_subscriber);
        g_isClearAborted = OH_CommonEvent_ClearAbortCommonEvent(g_subscriber);
    } else {
        g_isClearAborted = false;
    }
}

static napi_value ClearAbortCommonEvent(napi_env env, napi_callback_info info) {
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(g_subscribeInfo, nullptr);
    g_subscriber = OH_CommonEvent_CreateSubscriber(g_subscribeInfo, ClearAbortCommonEventCallback);
    ASSERT_OBJNE(g_subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(g_subscriber), COMMONEVENT_ERR_OK);
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

static napi_value GetClearAbortCommonEvent(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetClearAbortCommonEvent", "GetClearAbortCommonEvent Enter");
    if (g_subscriber != nullptr) {
        OH_CommonEvent_UnSubscribe(g_subscriber);
        OH_CommonEvent_DestroySubscriber(g_subscriber);
        g_subscriber = nullptr;
    }
    if (g_subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(g_subscribeInfo);
        g_subscribeInfo = nullptr;
    }
    ASSERT_EQ(g_isClearAborted, true);
    NAPI_END;
}

void SubscriberCommonEventCallback(const CommonEvent_RcvData *data) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SubscriberCommonEventCallback",
                 "SubscriberCommonEventCallback Enter");
    if (g_subscriber != nullptr) {
        g_isAbort = OH_CommonEvent_AbortCommonEvent(g_subscriber);
        g_isClearAborted = OH_CommonEvent_ClearAbortCommonEvent(g_subscriber);
    } else {
        g_isAbort = false;
    }
}

static napi_value SubscriberCommonEvent(napi_env env, napi_callback_info info) {
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(g_subscribeInfo, nullptr);
    g_subscriber = OH_CommonEvent_CreateSubscriber(g_subscribeInfo, SubscriberCommonEventCallback);
    ASSERT_OBJNE(g_subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(g_subscriber), COMMONEVENT_ERR_OK);
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

static napi_value GetGetCodeFromSubscriber(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGetCodeFromSubscriber", "GetGetCodeFromSubscriber Enter");
    int32_t result = OH_CommonEvent_GetCodeFromSubscriber(g_subscriber);
    ASSERT_EQ(result, PARAM_0);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "GetGetCodeFromSubscriber %{public}d", result);

    if (g_subscriber != nullptr) {
        OH_CommonEvent_UnSubscribe(g_subscriber);
        OH_CommonEvent_DestroySubscriber(g_subscriber);
        g_subscriber = nullptr;
    }
    if (g_subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(g_subscribeInfo);
        g_subscribeInfo = nullptr;
    }
    NAPI_END;
}

static napi_value GetSetCodeToSubscriber(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetSetCodeToSubscriber", "GetSetCodeToSubscriber Enter");
    if (g_subscriber != nullptr) {
        ASSERT_EQ(OH_CommonEvent_SetCodeToSubscriber(g_subscriber, PARAM_1), true);
        ASSERT_EQ(OH_CommonEvent_GetCodeFromSubscriber(g_subscriber), PARAM_1);
        OH_CommonEvent_UnSubscribe(g_subscriber);
        OH_CommonEvent_DestroySubscriber(g_subscriber);
        g_subscriber = nullptr;
    }
    if (g_subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(g_subscribeInfo);
        g_subscribeInfo = nullptr;
    }
    NAPI_END;
}

static napi_value GetGetDataFromSubscriber(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGetDataFromSubscriber", "GetGetDataFromSubscriber Enter");
    const char *retStr = OH_CommonEvent_GetDataFromSubscriber(g_subscriber);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetSetDataToSubscriber",
                 "OH_CommonEvent_GetDataFromSubscriber %{public}s", retStr);
    ASSERT_OBJNE(retStr, nullptr);
    ASSERT_STREQ(retStr, "");
    if (g_subscriber != nullptr) {
        OH_CommonEvent_UnSubscribe(g_subscriber);
        OH_CommonEvent_DestroySubscriber(g_subscriber);
        g_subscriber = nullptr;
    }
    if (g_subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(g_subscribeInfo);
        g_subscribeInfo = nullptr;
    }
    NAPI_END;
}

static napi_value GetSetDataToSubscriber(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetGetDataFromSubscriber", "GetGetDataFromSubscriber Enter");
    const char *data = "data";
    bool ret = OH_CommonEvent_SetDataToSubscriber(g_subscriber, data, PARAM_4);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetSetDataToSubscriber",
                 "OH_CommonEvent_SetDataToSubscriber %{public}d", ret);
    ASSERT_EQ(ret, true);
    const char *retStr = OH_CommonEvent_GetDataFromSubscriber(g_subscriber);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetSetDataToSubscriber",
                 "OH_CommonEvent_GetDataFromSubscriber %{public}s", retStr);
    ASSERT_STREQ(retStr, data);
    if (g_subscriber != nullptr) {
        OH_CommonEvent_UnSubscribe(g_subscriber);
        OH_CommonEvent_DestroySubscriber(g_subscriber);
        g_subscriber = nullptr;
    }
    if (g_subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(g_subscribeInfo);
        g_subscribeInfo = nullptr;
    }
    NAPI_END;
}
