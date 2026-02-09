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
#include "hiappeventTest.h"
#include "hiappevent/hiappevent.h"
#include <hilog/log.h>
struct HiAppEvent_Watcher *g_watcher;

napi_value SetReportRouteValue(napi_env env, napi_callback_info info)
{
    napi_valuetype routeInfoType;
    HiAppEvent_Processor *processor;
    size_t routeInfoSize = 0;
    char *routeInfo = new char[routeInfoSize + 1];
    auto returnValue = OH_HiAppEvent_SetReportRoute(processor, nullptr, routeInfo);
    int ret = -1;
    if (returnValue == HIAPPEVENT_INVALID_PARAM_VALUE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetReportPolicy(napi_env env, napi_callback_info info)
{
    HiAppEvent_Processor *processor;
    int returnValue = OH_HiAppEvent_SetReportPolicy(processor, 0, -1, false, true);
    int ret = -1;
    if (returnValue == HIAPPEVENT_INVALID_PARAM_VALUE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetCustomConfig(napi_env env, napi_callback_info info)
{
    HiAppEvent_Processor *processor;
    int returnValue = OH_HiAppEvent_SetCustomConfig(processor, nullptr, nullptr);
    int ret = -1;
    if (returnValue == HIAPPEVENT_INVALID_PARAM_VALUE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetConfigId(napi_env env, napi_callback_info info)
{
    HiAppEvent_Processor *processor;
    int returnValue = OH_HiAppEvent_SetConfigId(processor, -1);
    int ret = -1;
    if (returnValue == HIAPPEVENT_INVALID_PARAM_VALUE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetConfigName(napi_env env, napi_callback_info info)
{
    int returnValue = OH_HiAppEvent_SetConfigName(nullptr, "SDK_OCG");
    int ret = -1;
    if (returnValue == HIAPPEVENT_PROCESSOR_IS_NULL) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetReportUserId(napi_env env, napi_callback_info info)
{
    HiAppEvent_Processor *processor;
    int returnValue = OH_HiAppEvent_SetReportUserId(processor, nullptr, 0);
    int ret = -1;
    if (returnValue == HIAPPEVENT_INVALID_PARAM_VALUE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetReportUserProperty0(napi_env env, napi_callback_info info)
{
    HiAppEvent_Processor *processor;
    int returnValue = OH_HiAppEvent_SetReportUserProperty(processor, nullptr, 0);
    int ret = -1;
    if (returnValue == HIAPPEVENT_INVALID_PARAM_VALUE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetReportUserProperty1(napi_env env, napi_callback_info info)
{
    int returnValue = OH_HiAppEvent_SetReportUserProperty(nullptr, nullptr, 0);
    int ret = -1;
    if (returnValue == HIAPPEVENT_PROCESSOR_IS_NULL) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetReportUserProperty2(napi_env env, napi_callback_info info)
{
    HiAppEvent_Processor *processor;
    const char *userStrs[] = {"aaa", ""};
    int returnValue = OH_HiAppEvent_SetReportUserProperty(processor, userStrs, 0);
    int ret = -1;
    if (returnValue == HIAPPEVENT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetReportUserProperty3(napi_env env, napi_callback_info info)
{
    HiAppEvent_Processor *processor;
    const char *userStrs[] = {"aaa", ""};
    int returnValue = OH_HiAppEvent_SetReportUserProperty(processor, userStrs, 0);
    int ret = 0;
    if (returnValue == HIAPPEVENT_INVALID_PARAM_VALUE_LENGTH) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetReportUserPropertyCode(napi_env env, napi_callback_info info)
{
    int returnValue = OH_HiAppEvent_SetReportUserProperty(nullptr, nullptr, 0);
    int ret = -1;
    if (returnValue == HIAPPEVENT_PROCESSOR_IS_NULL) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetReportUserPropertyCodeValue(napi_env env, napi_callback_info info)
{
    HiAppEvent_Processor *processor;
    int returnValue = OH_HiAppEvent_SetReportUserProperty(processor, nullptr, 0);
    int ret = -1;
    if (returnValue == HIAPPEVENT_INVALID_PARAM_VALUE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

void OnReceiver(const char *domain, const struct HiAppEvent_AppEventGroup *appEventGroup, uint32_t groupSize)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "ArkWeb", "=======zhaohang  result:%{public}s", '333huifei');
    if (appEventGroup->appEventInfos->domain == "test") {
        HiAppEvent_AppEventInfo info = {};
        if (info.domain == appEventGroup->appEventInfos->domain) {
        }
    }
    if (appEventGroup->appEventInfos->name == "test") {
    }
    if (appEventGroup->appEventInfos->type == 1) {
    }
    if (appEventGroup->appEventInfos->params == "test") {
    }
    if (appEventGroup->infoLen == '1') {
    }
    if (appEventGroup->name == "test") {
    }
}
napi_value SetWatcherOnReceive(napi_env env, napi_callback_info info)
{
    g_watcher = OH_HiAppEvent_CreateWatcher("testWatcher");
    int32_t code = OH_HiAppEvent_SetWatcherOnReceive(g_watcher, OnReceiver);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "ArkWeb", "=======zhaohang  result:%{public}d", code);

    napi_value result = nullptr;
    napi_create_int32(env, code, &result);
    return result;
}

napi_value RemoveProcessor(napi_env env, napi_callback_info info)
{
    int64_t processorId = 0;
    int returnValue = OH_HiAppEvent_RemoveProcessor(processorId);
    int ret = -1;
    if (returnValue == HIAPPEVENT_PROCESSOR_NOT_FOUND) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetConfigItem(napi_env env, napi_callback_info info)
{
    int returnValue = OH_HiAppEvent_SetConfigItem(nullptr, "testName", "testValue");
    int ret = -1;
    if (returnValue == HIAPPEVENT_EVENT_CONFIG_IS_NULL) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetConfigItem1(napi_env env, napi_callback_info info)
{
    HiAppEvent_Config *configDemo = OH_HiAppEvent_CreateConfig();
    int returnValue = OH_HiAppEvent_SetConfigItem(configDemo, "testName", "");
    int ret = -1;
    if (returnValue == HIAPPEVENT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetEventConfig(napi_env env, napi_callback_info info)
{
    HiAppEvent_Config *configDemo = OH_HiAppEvent_CreateConfig();
    int returnValue = OH_HiAppEvent_SetEventConfig("", configDemo);
    int ret = -1;
    if (returnValue == HIAPPEVENT_INVALID_PARAM_VALUE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value HiAppEventSetConfigItem(napi_env env, napi_callback_info info)
{
    HiAppEvent_Config* configDemo = OH_HiAppEvent_CreateConfig();
    int returnValue = OH_HiAppEvent_SetConfigItem(configDemo, nullptr, "testValue");
    int ret = -1;
    if (returnValue == HIAPPEVENT_INVALID_PARAM_VALUE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value SetEventConfigSuccess(napi_env env, napi_callback_info info)
{
    HiAppEvent_Config* configDemo = OH_HiAppEvent_CreateConfig();
    OH_HiAppEvent_SetConfigItem(configDemo, "log_type", "0");
    int returnValue = OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo);
    int ret = -1;
    if (returnValue == HIAPPEVENT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value HiAppEventCreateProcessor(napi_env env, napi_callback_info info)
{
    HiAppEvent_Processor *processor = OH_HiAppEvent_CreateProcessor("namesssssssssssssrr553r43");
    int returnValue = OH_HiAppEvent_AddProcessor(processor);
    int ret = -1;
    if (returnValue == HIAPPEVENT_OPERATE_FAILED) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
