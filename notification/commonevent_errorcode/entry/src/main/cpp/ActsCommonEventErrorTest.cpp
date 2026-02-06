/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "common.h"
#include "oh_commonevent.h"
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#define MAX_STRING_LENGTH 1024
static CommonEvent_Subscriber *g_subscriber = nullptr;
static bool g_isOrdered = false;
static bool g_isFinished = false;
static CommonEvent_SubscribeInfo *g_subscribeInfo = nullptr;
constexpr int32_t MAX_SUBSCRIBER_LIMIT = 200;
static void IsOrderedCallback001(const CommonEvent_RcvData *data)
{
    if (g_subscriber != nullptr) {
        g_isOrdered = OH_CommonEvent_IsOrderedCommonEvent(g_subscriber);
        g_isFinished = OH_CommonEvent_FinishCommonEvent(g_subscriber);
    }
}

static napi_value testCommonEventInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *events[] = {CesCapiTest::COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    g_subscriber = OH_CommonEvent_CreateSubscriber(nullptr, IsOrderedCallback001);
    int32_t retResult = OH_CommonEvent_Subscribe(g_subscriber);
    napi_create_int32(env,  retResult == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetPublisherPermissionSuccess(napi_env env, napi_callback_info info)
{
    const char *events[] = {CesCapiTest::COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    napi_value result;
    char str[1024] = {0};
    size_t strLen = 0;
    napi_get_value_string_utf8(env, result, str, MAX_STRING_LENGTH - 1, &strLen);
    int32_t ret = OH_CommonEvent_SetPublisherPermission(g_subscribeInfo, str);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetPublisherPermissionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    char str[1024] = {0};
    size_t strLen = 0;
    napi_get_value_string_utf8(env, result, str, MAX_STRING_LENGTH - 1, &strLen);
    int32_t ret = OH_CommonEvent_SetPublisherPermission(nullptr, nullptr);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetPublisherBundleNameSuccess(napi_env env, napi_callback_info info)
{
    const char *events[] = {CesCapiTest::COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    napi_value result;
    char str[1024] = {0};
    size_t strLen = 0;
    napi_get_value_string_utf8(env, result, str, MAX_STRING_LENGTH - 1, &strLen);
    int32_t ret = OH_CommonEvent_SetPublisherBundleName(g_subscribeInfo, str);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetPublisherBundleNameError(napi_env env, napi_callback_info info)
{
    napi_value result;
    char str[1024] = {0};
    size_t strLen = 0;
    napi_get_value_string_utf8(env, result, str, MAX_STRING_LENGTH - 1, &strLen);
    int32_t ret = OH_CommonEvent_SetPublisherBundleName(nullptr, str);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetPublishInfoBundleNameInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result;
    char str[1024] = {0};
    size_t strLen = 0;
    napi_get_value_string_utf8(env, result, str, MAX_STRING_LENGTH - 1, &strLen);
    int32_t ret = OH_CommonEvent_SetPublishInfoBundleName(nullptr, str);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetPublishInfoPermissionSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* permissions[] = {"ohos.permission.RECEIVER_STARTUP_COMPLETED"};
    int32_t num = PARAM_1;
    int32_t ret = OH_CommonEvent_SetPublishInfoPermissions(publishInfo, permissions, num);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetPublishInfoPermissionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* permissions[] = {"ohos.permission.RECEIVER_STARTUP_COMPLETED"};
    int32_t num = PARAM_1;
    int32_t ret = OH_CommonEvent_SetPublishInfoPermissions(nullptr, permissions, num);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetPublishInfoCodeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    int32_t code = PARAM_1;
    int32_t ret = OH_CommonEvent_SetPublishInfoCode(publishInfo, code);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetPublishInfoCodeError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t code = PARAM_1;
    int32_t ret = OH_CommonEvent_SetPublishInfoCode(nullptr, code);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetPublishInfoDataSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    const char* data = "data";
    size_t length = PARAM_6;
    int32_t ret = OH_CommonEvent_SetPublishInfoData(publishInfo, data, length);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetPublishInfoDataError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* data = "data";
    size_t length = PARAM_6;
    int32_t ret = OH_CommonEvent_SetPublishInfoData(nullptr, data, length);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetPublishInfoParameterSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    auto parameters = OH_CommonEvent_CreateParameters();
    int32_t ret = OH_CommonEvent_SetPublishInfoParameters(publishInfo, parameters);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetPublishInfoParameterError(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto parameters = OH_CommonEvent_CreateParameters();
    int32_t ret = OH_CommonEvent_SetPublishInfoParameters(nullptr, parameters);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetIntToParameterSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "int";
    int value = PARAM_1;
    int32_t ret = OH_CommonEvent_SetIntToParameters(parameters, key, value);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetIntToParameterError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *key = "int";
    int value = PARAM_1;
    int32_t ret = OH_CommonEvent_SetIntToParameters(nullptr, key, value);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetIntArrayToParameterSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "intArray";
    int value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(int);
    int32_t ret = OH_CommonEvent_SetIntArrayToParameters(parameters, key, value, num);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetIntArrayToParameterError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *key = "intArray";
    int value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(int);
    int32_t ret = OH_CommonEvent_SetIntArrayToParameters(nullptr, key, value, num);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetLongToParameterSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "long";
    long value = PARAM_1;
    int32_t ret = OH_CommonEvent_SetLongToParameters(parameters, key, value);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetLongToParameterError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *key = "long";
    long value = PARAM_1;
    int32_t ret = OH_CommonEvent_SetLongToParameters(nullptr, key, value);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetLongArrayToParameterSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "longArray";
    long value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(long);
    int32_t ret = OH_CommonEvent_SetLongArrayToParameters(parameters, key, value, num);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetLongArrayToParameterError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *key = "longArray";
    long value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(long);
    int32_t ret = OH_CommonEvent_SetLongArrayToParameters(nullptr, key, value, num);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetBoolToParameterSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "bool";
    bool value = true;
    int32_t ret = OH_CommonEvent_SetBoolToParameters(parameters, key, value);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetBoolToParameterError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *key = "bool";
    bool value = true;
    int32_t ret = OH_CommonEvent_SetBoolToParameters(nullptr, key, value);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetBoolArrayToParameterSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "boolArray";
    bool value[] = {true, false, true};
    size_t num = sizeof(value) / sizeof(bool);
    int32_t ret = OH_CommonEvent_SetBoolArrayToParameters(parameters, key, value, num);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetBoolArrayToParameterError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *key = "boolArray";
    bool value[] = {true, false, true};
    size_t num = sizeof(value) / sizeof(bool);
    int32_t ret = OH_CommonEvent_SetBoolArrayToParameters(nullptr, key, value, num);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}


static napi_value SetCharToParameterSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "char";
    char value = 'a';
    int32_t ret = OH_CommonEvent_SetCharToParameters(parameters, key, value);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetCharToParameterError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *key = "char";
    char value = 'a';
    int32_t ret = OH_CommonEvent_SetCharToParameters(nullptr, key, value);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetCharArrayToParameterSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "charArray";
    char value[] = {'a', 'b', 'c'};
    size_t num = sizeof(value) / sizeof(char);
    int32_t ret = OH_CommonEvent_SetCharArrayToParameters(parameters, key, value, num);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetCharArrayToParameterError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *key = "charArray";
    char value[] = {'a', 'b', 'c'};
    size_t num = sizeof(value) / sizeof(char);
    int32_t ret = OH_CommonEvent_SetCharArrayToParameters(nullptr, key, value, num);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetDoubleToParameterSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "double";
    double value = PARAM_1;
    int32_t ret = OH_CommonEvent_SetDoubleToParameters(parameters, key, value);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetDoubleToParameterError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *key = "double";
    double value = PARAM_1;
    int32_t ret = OH_CommonEvent_SetDoubleToParameters(nullptr, key, value);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SetDoubleArrayToParameterSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "doubleArray";
    double value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(double);
    int32_t ret = OH_CommonEvent_SetDoubleArrayToParameters(parameters, key, value, num);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SetDoubleArrayToParameterError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *key = "doubleArray";
    double value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(double);
    int32_t ret = OH_CommonEvent_SetDoubleArrayToParameters(nullptr, key, value, num);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value PublishSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* event = CesCapiTest::COMMON_EVENT_TEST;
    int32_t ret = OH_CommonEvent_Publish(event);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value PublishInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* event = nullptr;
    int32_t ret = OH_CommonEvent_Publish(event);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value PublishWithInfoSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* event = CesCapiTest::COMMON_EVENT_TEST;
    bool ordered = false;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    int32_t ret = OH_CommonEvent_PublishWithInfo(event, publishInfo);
    napi_create_int32(env, ret == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value PublishWithInfoInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_CommonEvent_PublishWithInfo(nullptr, nullptr);
    napi_create_int32(env, ret == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static void IsOrderedCallback002(const CommonEvent_RcvData *data)
{
}

static napi_value SubscribeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *events[] = {CesCapiTest::COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    g_subscriber = OH_CommonEvent_CreateSubscriber(g_subscribeInfo, IsOrderedCallback002);
    int32_t retResult = OH_CommonEvent_Subscribe(g_subscriber);
    napi_create_int32(env,  retResult == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value SubscriberNumExceeded(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *events[] = {CesCapiTest::COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    for (int i = 0; i <= MAX_SUBSCRIBER_LIMIT; i++) {
        g_subscriber = OH_CommonEvent_CreateSubscriber(g_subscribeInfo, IsOrderedCallback001);
        int32_t retResult = OH_CommonEvent_Subscribe(g_subscriber);
        napi_create_int32(env, retResult == COMMONEVENT_ERR_SUBSCRIBER_NUM_EXCEEDED ? 0 : -1, &result);
    }
    return result;
}

static napi_value SubscribeInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *events[] = {CesCapiTest::COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    g_subscriber = OH_CommonEvent_CreateSubscriber(nullptr, IsOrderedCallback001);
    int32_t retResult = OH_CommonEvent_Subscribe(g_subscriber);
    napi_create_int32(env,  retResult == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value SubscriberNumExceeded1(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *events[] = {CesCapiTest::COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    for (int i = 0; i <= MAX_SUBSCRIBER_LIMIT; i++) {
        g_subscriber = OH_CommonEvent_CreateSubscriber(g_subscribeInfo, IsOrderedCallback001);
        int32_t retResult = OH_CommonEvent_Subscribe(g_subscriber);
        napi_create_int32(env, retResult == COMMONEVENT_ERR_SUBSCRIBER_NUM_EXCEEDED ? 0 : -1, &result);
    }
    return result;
}

static napi_value UnSubscribeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *events[] = {CesCapiTest::COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    g_subscriber = OH_CommonEvent_CreateSubscriber(g_subscribeInfo, IsOrderedCallback001);
    int32_t retResult = OH_CommonEvent_UnSubscribe(g_subscriber);
    napi_create_int32(env,  retResult == COMMONEVENT_ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value UnSubscribeInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char *events[] = {CesCapiTest::COMMON_EVENT_TEST};
    int32_t eventsNum = sizeof(events) / sizeof(char *);
    g_subscribeInfo = OH_CommonEvent_CreateSubscribeInfo(events, eventsNum);
    g_subscriber = OH_CommonEvent_CreateSubscriber(nullptr, IsOrderedCallback001);
    int32_t retResult = OH_CommonEvent_UnSubscribe(g_subscriber);
    napi_create_int32(env,  retResult == COMMONEVENT_ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_property_descriptor desc[] = {
    {"testCommonEventInvalidParameter", nullptr, testCommonEventInvalidParameter,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPublisherPermissionSuccess", nullptr, SetPublisherPermissionSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPublisherPermissionError", nullptr, SetPublisherPermissionError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPublisherBundleNameSuccess", nullptr, SetPublisherBundleNameSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPublisherBundleNameError", nullptr, SetPublisherBundleNameError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPublishInfoBundleNameInvalidParameter", nullptr, SetPublishInfoBundleNameInvalidParameter,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPublishInfoPermissionSuccess", nullptr, SetPublishInfoPermissionSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPublishInfoPermissionError", nullptr, SetPublishInfoPermissionError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPublishInfoCodeSuccess", nullptr, SetPublishInfoCodeSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPublishInfoCodeError", nullptr, SetPublishInfoCodeError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPublishInfoDataSuccess", nullptr, SetPublishInfoDataSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPublishInfoDataError", nullptr, SetPublishInfoDataError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPublishInfoParameterSuccess", nullptr, SetPublishInfoParameterSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetPublishInfoParameterError", nullptr, SetPublishInfoParameterError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetIntToParameterSuccess", nullptr, SetIntToParameterSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetIntToParameterError", nullptr, SetIntToParameterError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetIntArrayToParameterSuccess", nullptr, SetIntArrayToParameterSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetIntArrayToParameterError", nullptr, SetIntArrayToParameterError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetLongToParameterSuccess", nullptr, SetLongToParameterSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetLongToParameterError", nullptr, SetLongToParameterError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetLongArrayToParameterSuccess", nullptr, SetLongArrayToParameterSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetLongArrayToParameterError", nullptr, SetLongArrayToParameterError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetBoolToParameterSuccess", nullptr, SetBoolToParameterSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetBoolToParameterError", nullptr, SetBoolToParameterError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetBoolArrayToParameterSuccess", nullptr, SetBoolArrayToParameterSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetBoolArrayToParameterError", nullptr, SetBoolArrayToParameterError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetCharToParameterSuccess", nullptr, SetCharToParameterSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetCharToParameterError", nullptr, SetCharToParameterError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetCharArrayToParameterSuccess", nullptr, SetCharArrayToParameterSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetCharArrayToParameterError", nullptr, SetCharArrayToParameterError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetDoubleToParameterSuccess", nullptr, SetDoubleToParameterSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetDoubleToParameterError", nullptr, SetDoubleToParameterError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetDoubleArrayToParameterSuccess", nullptr, SetDoubleArrayToParameterSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetDoubleArrayToParameterError", nullptr, SetDoubleArrayToParameterError,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"PublishSuccess", nullptr, PublishSuccess, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"PublishInvalidParameter", nullptr, PublishInvalidParameter,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"PublishWithInfoSuccess", nullptr, PublishWithInfoSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"PublishWithInfoInvalidParameter", nullptr, PublishWithInfoInvalidParameter,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SubscribeSuccess", nullptr, SubscribeSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SubscriberNumExceeded", nullptr, SubscriberNumExceeded,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SubscribeInvalidParameter", nullptr, SubscribeInvalidParameter,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SubscriberNumExceeded1", nullptr, SubscriberNumExceeded1,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UnSubscribeSuccess", nullptr, UnSubscribeSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"UnSubscribeInvalidParameter", nullptr, UnSubscribeInvalidParameter,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    };

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "commoneventerrorcode",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
