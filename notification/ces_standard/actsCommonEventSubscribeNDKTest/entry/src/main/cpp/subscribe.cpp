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

#include "unistd.h"

#include "napi/native_api.h"
#include "hilog/log.h"
#include "BasicServicesKit/oh_commonevent.h"
#include "BasicServicesKit/oh_commonevent_support.h"
#include <cstdio>
#include <cwchar>
#include "common.h"

static void OnReceive(const CommonEvent_RcvData *data) {
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "Onreceive event!");
    const char *event = OH_CommonEvent_GetEventFromRcvData(data);
    int code = OH_CommonEvent_GetCodeFromRcvData(data);
    const char *retData = OH_CommonEvent_GetDataStrFromRcvData(data);
    const char *bundle = OH_CommonEvent_GetBundleNameFromRcvData(data);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "event: %{public}s, code: %{public}d, data: %{public}s, bundle: %{public}s\n", event, code, retData, bundle);
    const CommonEvent_Parameters *parameters = OH_CommonEvent_GetParametersFromRcvData(data);
    ASSERT_TRUE(parameters != nullptr);
    int intValue = OH_CommonEvent_GetIntFromParameters(parameters, "wh1", 10);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "intValue = %{public}d", intValue);
    bool boolValue = OH_CommonEvent_GetBoolFromParameters(parameters, "wh4", false);
    if (parameters) {
        ASSERT_EA(boolValue, true);
    } else {
        ASSERT_EA(boolValue, false);
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "boolValue = %{public}d", boolValue);
    bool** boolarray = new bool*;
    int32_t boolarraysize = OH_CommonEvent_GetBoolArrayFromParameters(parameters, "wh6",boolarray);
    printf("int arr size is %d:\n", boolarraysize);
    for (int i = 0; i < boolarraysize; i++) {
        printf("%d |", *((*boolarray) + i));
    }
    printf("\n");
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "boolarraysize = %{public}d", boolarraysize);
    
    char charValue = OH_CommonEvent_GetCharFromParameters(parameters, "wh2", 'A');
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "charValue = %{public}c", charValue);
    char** chararray = new char*;
    int32_t chararraysize = OH_CommonEvent_GetCharArrayFromParameters(parameters, "wh2",chararray);
    printf("int arr size is %d:\n", chararraysize);
    for (int i = 0; i < chararraysize; i++) {
        printf("%c |", *((*chararray) + i));
    }
    printf("\n");
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "chararraysize = %{public}d, %{public}s", chararraysize, *chararray);
    
    double doubleValue = OH_CommonEvent_GetDoubleFromParameters(parameters, "wh3", 33.33);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "doubleValue = %{public}f", doubleValue);
    double** doublearray = new double*;
    int32_t doublearraysize = OH_CommonEvent_GetDoubleArrayFromParameters(parameters, "wh8",doublearray);
    printf("int arr size is %d:\n", doublearraysize);
    for (int i = 0; i < doublearraysize; i++) {
        printf("%f |", *((*doublearray) + i));
    }
    printf("\n");
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "doublearraysize = %{public}d", doublearraysize);
    
    int** arr = new int*;
    int32_t intarrarysize = OH_CommonEvent_GetIntArrayFromParameters(parameters, "wh5",arr);
    printf("int arr size is %d:\n", intarrarysize);
    for (int i = 0; i < intarrarysize; i++) {
        printf("%d |", *((*arr) + i));
    }
    printf("\n");
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "intarrarysize = %{public}d", intarrarysize);
    
    bool exists = OH_CommonEvent_HasKeyInParameters(parameters, "wh4");
    if (parameters) {
        ASSERT_EA(exists, true);
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "exists = %{public}ld", exists);
    }
    bool exist = OH_CommonEvent_HasKeyInParameters(parameters, "wh11");
        ASSERT_EA(exist, false);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "exist = %{public}d", exist);
    
    long longValue = OH_CommonEvent_GetLongFromParameters(parameters, "wh9", 2147483650);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "longValue = %{public}ld", longValue);
    long** longarrary = new long*;
    int32_t longarrarysize = OH_CommonEvent_GetLongArrayFromParameters(parameters, "wh10",longarrary);
    printf("int arr size is %d:\n", longarrarysize);
    for (int i = 0; i < longarrarysize; i++) {
        printf("%ld |", *((*longarrary) + i));
    }
    printf("\n");
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "ces_test", "longarrarysize = %{public}d", longarrarysize);
}

static CommonEvent_Subscriber *subscriber = {};


static CommonEvent_SubscribeInfo* information = nullptr;

static napi_value CreateSubscribeInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, NULL, NULL);
    if (argc != 1) {
        OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "CreateSubscribeInfo wrong number of arguments.");
        return 0;
    }

    size_t strLen = 0;
    napi_value result = args[0];
    bool isArray = false;
    napi_valuetype valuetype = napi_undefined;
    napi_is_array(env, result, &isArray);
    if (!isArray) {
        OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "Create subscribe is expected to be an array.");
        napi_value res = nullptr;
        napi_create_int32(env, 403, &res);
        return res;
    }

    uint32_t length = 0;
    
    napi_get_array_length(env, result, &length);
    if (length == 0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "The array is empty.");
        information = OH_CommonEvent_CreateSubscribeInfo(nullptr, 0);
        if (information == nullptr) {
            OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "Create subscribe failed.");
            napi_value res = nullptr;
            napi_create_int32(env, 401, &res);
            return res;
        } else {
            OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "Create subscribe successful.");
            napi_value res = nullptr;
            napi_create_int32(env, 402, &res);
            return res;
        }
        return 0;
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "The array size is %{public}u.", length);
    const char *events[length];
    for (size_t i = 0; i < length; i++) {
        napi_value event = nullptr;
        napi_get_element(env, result, i, &event);
        napi_typeof(env, event, &valuetype);
        if (valuetype != napi_string) {
            OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "Wrong argument type. String expected.");
            return 0;
        }
        char* str = new char[1024];
        napi_get_value_string_utf8(env, event, str, 1024 - 1, &strLen);
        events[i] = str;
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "Get event %{public}s.", str);
    }
    information = OH_CommonEvent_CreateSubscribeInfo(events, length);
    if (information == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "Create subscribe info failed.");
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "Create subscribe info successful.");
    }
    return 0;
}

static napi_value SetPublisherPermission(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, NULL, NULL);
    if (argc != 1) {
        OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "SetPublisherPermission wrong number of arguments.");
        return 0;
    }
    size_t strLen = 0;
    napi_value result = args[0];
    napi_valuetype valuetype = napi_undefined;
    char str[1024] = {0};
    napi_get_named_property(env, args[0], "permission", &result);
    napi_typeof(env, result, &valuetype);
    if (valuetype != napi_string) {
        OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "Wrong argument type. String expected.");
        return 0;
    }
    
    napi_get_value_string_utf8(env, result, str, 1024 - 1, &strLen);
    int32_t ret = OH_CommonEvent_SetPublisherPermission(information, str);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "Get permission %{public}s.", str);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "Set publisher permission, result %{public}d.", ret);
    return 0;
}

static napi_value SetPublisherBundleName(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, NULL, NULL);
    if (argc != 1) {
        OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "PublisherBundleName wrong number of arguments.");
        return 0;
    }
    size_t strLen = 0;
    napi_value result = args[0];
    napi_valuetype valuetype = napi_undefined;
    napi_get_named_property(env, args[0], "bundleName", &result);
    napi_typeof(env, result, &valuetype);
    if (valuetype != napi_string) {
        OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "Wrong argument type. String expected.");
        return 0;
    }
    char str[1024] = {0};
    napi_get_value_string_utf8(env, result, str, 1024 - 1, &strLen);
    int32_t ret = OH_CommonEvent_SetPublisherBundleName(information, str);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "Get bundleName %{public}s.", str);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "Set publisher bundle name, result %{public}d.", ret);
    return 0;
}

static napi_value DestroySubscribeInfo(napi_env env, napi_callback_info info)
{
    OH_CommonEvent_DestroySubscribeInfo(information);
    information = nullptr;
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "Destroy subscribe info successful.");
    napi_value res = nullptr;
    napi_create_int32(env, 400, &res);
    return res;
}

static napi_value CreateSubscriber(napi_env env, napi_callback_info info)
{
    subscriber = OH_CommonEvent_CreateSubscriber(information, OnReceive);
    if (subscriber == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_WARN, 1, "CES_TEST", "Create subscriber failed.");
        napi_value res = nullptr;
        napi_create_int32(env, 401, &res);
        return res;
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "Create subscriber successful.");
    }
    return 0;
}

static napi_value DestroySubscriber(napi_env env, napi_callback_info info)
{
    OH_CommonEvent_DestroySubscriber(subscriber);
    subscriber = nullptr;
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "Destroy subscriber successful.");
    napi_value res = nullptr;
    napi_create_int32(env, 400, &res);
    return res;
}

static napi_value CommonEventSubscribe(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_CommonEvent_Subscribe(subscriber);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "Subscribe result %{public}d", ret);
    napi_value res = nullptr;
    napi_create_int32(env, ret, &res);
    return res;
}

static napi_value CommonEventUnSubscribe(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_CommonEvent_UnSubscribe(subscriber);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "unSubscribe result %{public}d", ret);
    napi_value res = nullptr;
    napi_create_int32(env, ret, &res);
    return res;
}

static napi_value ReleaseSubscribeInfo(napi_env env, napi_callback_info info)
{
    information = nullptr;
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "Assign subscriber info nullptr");
    return 0;
}

static napi_value ReleaseSubscriber(napi_env env, napi_callback_info info)
{
    subscriber = nullptr;
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "CES_TEST", "Assign subscriber nullptr");
    return 0;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "create_subscribe_info", nullptr, CreateSubscribeInfo, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "set_publisher_permission", nullptr, SetPublisherPermission, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "set_publisher_bundleName", nullptr, SetPublisherBundleName, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "destroy_subscribe_info", nullptr, DestroySubscribeInfo, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "create_subscriber", nullptr, CreateSubscriber, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "destroy_subscriber", nullptr, DestroySubscriber, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "common_event_subscribe", nullptr, CommonEventSubscribe, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "common_event_unsubscribe", nullptr, CommonEventUnSubscribe, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "release_subscribe_info", nullptr, ReleaseSubscribeInfo, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "release_subscriber", nullptr, ReleaseSubscriber, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "subscribe",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}