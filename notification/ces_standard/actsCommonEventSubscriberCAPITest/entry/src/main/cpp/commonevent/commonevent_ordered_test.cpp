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

#include "commonevent_ordered_test.h"
#include "common.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include "oh_commonevent.h"

namespace CesCapiTest {

static CommonEvent_Subscriber *subscriber = nullptr;
static CommonEvent_SubscribeInfo *subscribeInfo = nullptr;
static bool isOrdered = false;
static bool isFinished = false;
static bool isAborted = false;
static bool isGetAborted = false;
static bool isClearAborted = false;
static int32_t subscriberCode = PARAM_0;
static char *subscriberData = nullptr;

void CommonEventOrderedTest::IsOrderedCallback001(const CommonEvent_RcvData *data)
{
    if (subscriber != nullptr) {
        isOrdered = OH_CommonEvent_IsOrderedCommonEvent(subscriber);
        isFinished = OH_CommonEvent_FinishCommonEvent(subscriber);
    }
}

napi_value CommonEventOrderedTest::GetIsOrdered001(napi_env env, napi_callback_info info)
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

    ASSERT_EQ(isOrdered, true);
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventIsOrderedCommonEvent001(napi_env env, napi_callback_info info)
{
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(subscribeInfo, nullptr);
    subscriber = OH_CommonEvent_CreateSubscriber(subscribeInfo, IsOrderedCallback001);
    ASSERT_OBJNE(subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(subscriber), COMMONEVENT_ERR_OK);

    bool ordered = true;
    CommonEvent_PublishInfo *publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventIsOrderedCommonEvent002(napi_env env, napi_callback_info info)
{
    bool ordered = OH_CommonEvent_IsOrderedCommonEvent(nullptr);
    ASSERT_EQ(ordered, false);
    NAPI_END;
}

napi_value CommonEventOrderedTest::GetIsFinished001(napi_env env, napi_callback_info info)
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

    ASSERT_EQ(isFinished, true);
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventFinishCommonEvent001(napi_env env, napi_callback_info info)
{
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(subscribeInfo, nullptr);
    subscriber = OH_CommonEvent_CreateSubscriber(subscribeInfo, IsOrderedCallback001);
    ASSERT_OBJNE(subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(subscriber), COMMONEVENT_ERR_OK);

    bool ordered = true;
    CommonEvent_PublishInfo *publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventFinishCommonEvent002(napi_env env, napi_callback_info info)
{
    bool finished = OH_CommonEvent_FinishCommonEvent(nullptr);
    ASSERT_EQ(finished, false);
    NAPI_END;
}

void CommonEventOrderedTest::IsOrderedCallback002(const CommonEvent_RcvData *data) {
    if (subscriber != nullptr) {
        isOrdered = OH_CommonEvent_IsOrderedCommonEvent(subscriber);
        isAborted = OH_CommonEvent_AbortCommonEvent(subscriber);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "IsOrderedCallback002",
                     "OH_CommonEvent_AbortCommonEvent: %{public}d", isAborted);
        isGetAborted = OH_CommonEvent_GetAbortCommonEvent(subscriber);
        isClearAborted = OH_CommonEvent_ClearAbortCommonEvent(subscriber);
    }
}

napi_value CommonEventOrderedTest::GetIsAborted001(napi_env env, napi_callback_info info)
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

    ASSERT_EQ(isAborted, true);
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventAbortCommonEvent001(napi_env env, napi_callback_info info)
{
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(subscribeInfo, nullptr);
    subscriber = OH_CommonEvent_CreateSubscriber(subscribeInfo, IsOrderedCallback002);
    ASSERT_OBJNE(subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(subscriber), COMMONEVENT_ERR_OK);

    bool ordered = true;
    CommonEvent_PublishInfo *publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventAbortCommonEvent002(napi_env env, napi_callback_info info)
{
    bool aborted = OH_CommonEvent_AbortCommonEvent(nullptr);
    ASSERT_EQ(aborted, false);
    NAPI_END;
}

napi_value CommonEventOrderedTest::GetIsGetAborted001(napi_env env, napi_callback_info info)
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

    ASSERT_EQ(isGetAborted, true);
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventGetAbortCommonEvent001(napi_env env, napi_callback_info info)
{
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(subscribeInfo, nullptr);
    subscriber = OH_CommonEvent_CreateSubscriber(subscribeInfo, IsOrderedCallback002);
    ASSERT_OBJNE(subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(subscriber), COMMONEVENT_ERR_OK);

    bool ordered = true;
    CommonEvent_PublishInfo *publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventGetAbortCommonEvent002(napi_env env, napi_callback_info info)
{
    bool aborted = OH_CommonEvent_GetAbortCommonEvent(nullptr);
    ASSERT_EQ(aborted, false);
    NAPI_END;
}

napi_value CommonEventOrderedTest::GetIsClearAborted001(napi_env env, napi_callback_info info)
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

    ASSERT_EQ(isClearAborted, true);
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventClearAbortCommonEvent001(napi_env env, napi_callback_info info)
{
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(subscribeInfo, nullptr);
    subscriber = OH_CommonEvent_CreateSubscriber(subscribeInfo, IsOrderedCallback002);
    ASSERT_OBJNE(subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(subscriber), COMMONEVENT_ERR_OK);

    bool ordered = true;
    CommonEvent_PublishInfo *publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventClearAbortCommonEvent002(napi_env env, napi_callback_info info)
{
    bool aborted = OH_CommonEvent_ClearAbortCommonEvent(nullptr);
    ASSERT_EQ(aborted, false);
    NAPI_END;
}

void CommonEventOrderedTest::IsOrderedCallback(const CommonEvent_RcvData *data)
{
    OH_LOG_Print(LOG_APP, LOG_WARN, LOG_PRINT_DOMAIN, "CES_TEST", "enter isOrderCall");
    if (subscriber != nullptr) {
        int32_t code = PARAM_1;
        bool ret = OH_CommonEvent_SetCodeToSubscriber(subscriber, code);
        OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "setCode code: %{public}d", ret);
        subscriberCode = OH_CommonEvent_GetCodeFromSubscriber(subscriber);
        OH_LOG_Print(LOG_APP, LOG_WARN, LOG_PRINT_DOMAIN, "CES_TEST",
                     "OH_CommonEvent_GetCodeFromSubscriber: %{public}d", subscriberCode);

        const char *data2 = "data";
        size_t length = PARAM_1;
        bool isSetdata = OH_CommonEvent_SetDataToSubscriber(subscriber, data2, length);
        OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "setData code: %{public}d", isSetdata);
        subscriberData = const_cast<char *>(OH_CommonEvent_GetDataFromSubscriber(subscriber));
    }
}

void CommonEventOrderedTest::IsOrderedCallback003(const CommonEvent_RcvData *data) 
{
    OH_LOG_Print(LOG_APP, LOG_WARN, LOG_PRINT_DOMAIN, "CES_TEST", "enter isOrderCall");
    if (subscriber != nullptr) {
        const char *data2 = "data";
        size_t length = PARAM_4;
        bool isSetdata = OH_CommonEvent_SetDataToSubscriber(subscriber, data2, length);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CES_TEST", "OH_CommonEvent_SetDataToSubscriber: %{public}d",
                     isSetdata);
        subscriberData = const_cast<char *>(OH_CommonEvent_GetDataFromSubscriber(subscriber));
    }
}

napi_value CommonEventOrderedTest::GetCode001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "Create subscribe is expected to be an array.");
    OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "Create22 subscribe is expected to be an array.");
    if (subscriber != nullptr) {
        OH_CommonEvent_UnSubscribe(subscriber);
        OH_CommonEvent_DestroySubscriber(subscriber);
        subscriber = nullptr;
    }
    if (subscribeInfo != nullptr) {
        OH_CommonEvent_DestroySubscribeInfo(subscribeInfo);
        subscribeInfo = nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "Create33 subscribe is expected to be an array.");
    OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "enter getCode  %{public}d", subscriberCode);
    ASSERT_EQ(subscriberCode, PARAM_1);
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventSetCodeToSubscriber001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "enter 111");
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(subscribeInfo, nullptr);
    subscriber = OH_CommonEvent_CreateSubscriber(subscribeInfo, IsOrderedCallback);
    ASSERT_OBJNE(subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(subscriber), COMMONEVENT_ERR_OK);

    bool ordered = true;
    CommonEvent_PublishInfo *publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "publishInfo : %{public}s", publishInfo);
    if (publishInfo != nullptr) {
        int32_t result = OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "publishInfo code: %{public}d", result);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventSetCodeToSubscriber002(napi_env env, napi_callback_info info)
{
    int32_t code = PARAM_1;
    bool isSetCode = OH_CommonEvent_SetCodeToSubscriber(nullptr, code);
    ASSERT_EQ(isSetCode, false);
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventSetCodeToSubscriber003(napi_env env, napi_callback_info info)
{
    int32_t code = PARAM_0;
    bool isSetCode = OH_CommonEvent_SetCodeToSubscriber(subscriber, code);
    ASSERT_EQ(isSetCode, false);
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventGetCodeFromSubscriber001(napi_env env, napi_callback_info info)
{
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(subscribeInfo, nullptr);
    subscriber = OH_CommonEvent_CreateSubscriber(subscribeInfo, IsOrderedCallback);
    ASSERT_OBJNE(subscriber, nullptr);

    bool ordered = true;
    CommonEvent_PublishInfo *publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventGetCodeFromSubscriber002(napi_env env, napi_callback_info info)
{
    int32_t code = OH_CommonEvent_GetCodeFromSubscriber(nullptr);
    ASSERT_EQ(code, PARAM_0);
    NAPI_END;
}

napi_value CommonEventOrderedTest::GetData001(napi_env env, napi_callback_info info)
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

    if (subscriberData != nullptr) {
        ASSERT_STREQ(subscriberData, "d");
    }
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventSetDataToSubscriber001(napi_env env, napi_callback_info info)
{
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(subscribeInfo, nullptr);
    subscriber = OH_CommonEvent_CreateSubscriber(subscribeInfo, IsOrderedCallback);
    ASSERT_OBJNE(subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(subscriber), COMMONEVENT_ERR_OK);
    OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "setData after");
    bool ordered = true;
    CommonEvent_PublishInfo *publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventSetDataToSubscriber002(napi_env env, napi_callback_info info)
{
    const char *data2 = "data";
    size_t length = PARAM_1;
    bool isSetdata = OH_CommonEvent_SetDataToSubscriber(nullptr, data2, length);
    ASSERT_EQ(isSetdata, false);
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventSetDataToSubscriber003(napi_env env, napi_callback_info info)
{
    const char *data = nullptr;
    size_t length = PARAM_1;
    bool isSetdata = OH_CommonEvent_SetDataToSubscriber(subscriber, data, length);
    ASSERT_EQ(isSetdata, false);
    NAPI_END;
}

napi_value CommonEventOrderedTest::GetData002(napi_env env, napi_callback_info info)
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

    if (subscriberData != nullptr) {
        ASSERT_STREQ(subscriberData, "data");
    }
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventGetDataFromSubscriber001(napi_env env, napi_callback_info info)
{
    const char *events[] = {COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    ASSERT_OBJNE(subscribeInfo, nullptr);
    subscriber = OH_CommonEvent_CreateSubscriber(subscribeInfo, IsOrderedCallback003);
    ASSERT_OBJNE(subscriber, nullptr);
    ASSERT_EQ(OH_CommonEvent_Subscribe(subscriber), COMMONEVENT_ERR_OK);

    bool ordered = true;
    CommonEvent_PublishInfo *publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    if (publishInfo != nullptr) {
        OH_CommonEvent_PublishWithInfo(COMMON_EVENT_TEST, publishInfo);
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
        publishInfo = nullptr;
    }
    NAPI_END;
}

napi_value CommonEventOrderedTest::TestCommonEventGetDataFromSubscriber002(napi_env env, napi_callback_info info)
{
    const char *data = OH_CommonEvent_GetDataFromSubscriber(nullptr);
    if (data != nullptr) {
        size_t length = strlen(data);
        ASSERT_EQ(length, PARAM_0);
    }
    NAPI_END;
}
} // namespace CesCapiTest