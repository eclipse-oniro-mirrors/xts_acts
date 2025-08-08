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

#include "napi/native_api.h"
#include "hiappevent/hiappevent.h"
#include <cstring>
#include <vector>
#include <string>

#define FAIL (-1)
#define SUCCESS 0
#define PARAM_0 0
#define PARAM_1 1

#undef LOG_TAG
#define LOG_TAG "testTag"

const float FLOAT_123_22 = 123.22f;
const float FLOAT_234_5 = 234.5f;
const float FLOAT_131312_46464 = 131312.46464f;
const double DOUBLE_123_22 = 123.22;
const double DOUBLE_30949_374 = 30949.374;
const double DOUBLE_131312_46464 = 131312.46464;

static struct HiAppEvent_Watcher *g_watcher;

static void OnReceiver(const char *domain, const struct HiAppEvent_AppEventGroup *appEventGroups, uint32_t groupSize)
{
}

static void OnTrigger(int row, int size)
{
};

static void OnTake(const char *const *events, uint32_t eventLen)
{
}

static napi_value OHHiAppEventWrite(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    int32_t num = PARAM_1;
    OH_HiAppEvent_AddInt32Param(list, "int32_key", num);
    int32_t numArray[] = {PARAM_1, INT32_MAX, INT32_MIN};
    OH_HiAppEvent_AddInt32ArrayParam(list, "int32_arr_key", numArray, sizeof(numArray) / sizeof(numArray[0]));
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventConfigure(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    int32_t num = PARAM_1;
    OH_HiAppEvent_AddInt32Param(list, "int32_key", num);
    int ret = -PARAM_1;
    bool configure = OH_HiAppEvent_Configure(DISABLE, "true");
    if (configure) {
        ret = SUCCESS;
    }
    OH_HiAppEvent_Configure(DISABLE, "false");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddBoolParam(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddBoolParam(list, "bool_key", true);
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddBoolArrayParam(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    bool nums[] = {true};
    OH_HiAppEvent_AddBoolArrayParam(list, "bool_arr_key", nums, sizeof(nums) / sizeof(nums[0]));
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddInt8Param(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    int8_t num = PARAM_1;
    OH_HiAppEvent_AddInt8Param(list, "int8_key", num);
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddInt8ArrayParam(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    int8_t num[] = {PARAM_1, INT8_MAX, INT8_MIN};
    OH_HiAppEvent_AddInt8ArrayParam(list, "int8_key", num, sizeof(num) / sizeof(num[0]));
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddInt16Param(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    int16_t num = PARAM_1;
    OH_HiAppEvent_AddInt16Param(list, "int16_key", num);
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddInt16ArrayParam(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    int16_t num[] = {PARAM_1, INT16_MAX, INT16_MIN};
    OH_HiAppEvent_AddInt16ArrayParam(list, "int16_key", num, sizeof(num) / sizeof(num[0]));
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddInt32Param(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    int32_t num = PARAM_1;
    OH_HiAppEvent_AddInt32Param(list, "int32_key", num);
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddInt32ArrayParam(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    int32_t num[] = {PARAM_1, INT32_MAX, INT32_MIN};
    OH_HiAppEvent_AddInt32ArrayParam(list, "int32_key", num, sizeof(num) / sizeof(num[0]));
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddInt64Param(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    int64_t num = PARAM_1;
    OH_HiAppEvent_AddInt64Param(list, "int64_key", num);
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddInt64ArrayParam(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    int64_t num[] = {PARAM_1, INT64_MAX, INT64_MIN};
    OH_HiAppEvent_AddInt64ArrayParam(list, "int64_key", num, sizeof(num) / sizeof(num[0]));
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddFloatParam(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    float num = FLOAT_234_5;
    OH_HiAppEvent_AddFloatParam(list, "float_key", num);
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddFloatArrayParam(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    float num[] = {FLOAT_123_22, FLOAT_234_5, FLOAT_131312_46464};
    OH_HiAppEvent_AddFloatArrayParam(list, "float_key", num, sizeof(num) / sizeof(num[0]));
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddDoubleParam(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    double num = DOUBLE_30949_374;
    OH_HiAppEvent_AddDoubleParam(list, "double_key", num);
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddDoubleArrayParam(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    double nums[] = {DOUBLE_123_22, DOUBLE_30949_374, DOUBLE_131312_46464};
    OH_HiAppEvent_AddDoubleArrayParam(list, "double_arr_key", nums, sizeof(nums) / sizeof(nums[0]));
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddStringParam(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    char str[] = "hello";
    OH_HiAppEvent_AddStringParam(list, "string_key", str);
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventAddStringArrayParam(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    char str[] = "hello";
    char par[] = "world";
    char *strs[] = {str, par};
    OH_HiAppEvent_AddStringArrayParam(list, "string_arr_key", strs, sizeof(strs) / sizeof(strs[0]));
    int ret = OH_HiAppEvent_Write("domain", "name", BEHAVIOR, list);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHHiAppEventCreateParamList(napi_env env, napi_callback_info info)
{
    ParamList list = OH_HiAppEvent_CreateParamList();
    int ret = FAIL;
    if (list != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SetAppEventFilter(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher("testWatcher");
    int32_t code = OH_HiAppEvent_SetAppEventFilter(g_watcher, "testDomain", 0b1000, {}, 0);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value SetAppEventFilterInvName(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher("testWatcher");
    int32_t code = OH_HiAppEvent_SetAppEventFilter(g_watcher, "nullptr", 0b1000, {}, 1);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value SetAppEventFilterInvDomain(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher("testWatcher");
    int32_t code = OH_HiAppEvent_SetAppEventFilter(g_watcher, nullptr, 0b1000, {}, 0);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value SetAppEventFilterInvWatcher(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher(nullptr);
    int32_t code = OH_HiAppEvent_SetAppEventFilter(g_watcher, "testDomain", 0b1000, {}, 0);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value SetTriggerCondition(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher("testWatcher");
    int32_t code = OH_HiAppEvent_SetTriggerCondition(g_watcher, 1, 0, 0);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value SetTriggerConditionInvWatcher(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher(nullptr);
    int32_t code = OH_HiAppEvent_SetTriggerCondition(g_watcher, 1, 0, 0);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value SetWatcherOnTrigger(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher("testWatcher");
    int32_t code = OH_HiAppEvent_SetWatcherOnTrigger(g_watcher, OnTrigger);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value SetWatcherOnTriggerInvWatcher(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher(nullptr);
    int32_t code = OH_HiAppEvent_SetWatcherOnTrigger(g_watcher, OnTrigger);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value SetWatcherOnReceive(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher("testWatcher");
    int32_t code = OH_HiAppEvent_SetWatcherOnReceive(g_watcher, OnReceiver);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value SetWatcherOnReceiveInvWatcher(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher(nullptr);
    int32_t code = OH_HiAppEvent_SetWatcherOnReceive(g_watcher, OnReceiver);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value TakeWatcherData(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher("testWatcher");
    OH_HiAppEvent_AddWatcher(g_watcher);
    int32_t code = OH_HiAppEvent_TakeWatcherData(g_watcher, 1, OnTake);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value TakeWatcherDataInvWatcher(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher(nullptr);
    OH_HiAppEvent_AddWatcher(g_watcher);
    int32_t code = OH_HiAppEvent_TakeWatcherData(g_watcher, 1, OnTake);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}
static napi_value TakeWatcherDataInvOperation(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher("testWatcher");
    int32_t code = OH_HiAppEvent_TakeWatcherData(g_watcher, 1, OnTake);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value AddWatcher(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher("testWatcher");
    int32_t code = OH_HiAppEvent_AddWatcher(g_watcher);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value AddWatcherInvWatcher(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher(nullptr);
    int32_t code = OH_HiAppEvent_AddWatcher(g_watcher);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value RemoveWatcher(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher("testWatcher");
    OH_HiAppEvent_AddWatcher(g_watcher);
    int32_t code = OH_HiAppEvent_RemoveWatcher(g_watcher);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value RemoveWatcherInvWatcher(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher(nullptr);
    OH_HiAppEvent_AddWatcher(g_watcher);
    int32_t code = OH_HiAppEvent_RemoveWatcher(g_watcher);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value RemoveWatcherInvOperation(napi_env env, napi_callback_info info)
{
    napi_value ret;
    g_watcher = OH_HiAppEvent_CreateWatcher("testWatcher");
    int32_t code = OH_HiAppEvent_RemoveWatcher(g_watcher);
    OH_HiAppEvent_DestroyWatcher(g_watcher);
    OH_HiAppEvent_ClearData();
    napi_create_int32(env, code, &ret);
    return ret;
}

static napi_value CreateProcessor(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t strSize;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &strSize);
    char*  name = new char[strSize + 1];
    napi_get_value_string_utf8(env, args[0], name, strSize + 1, nullptr);
    napi_valuetype valueType;
    napi_typeof(env, args[0], &valueType);
    HiAppEvent_Processor* processor = OH_HiAppEvent_CreateProcessor(name);
    delete[] name;
    napi_value retVal;
    napi_create_external(env, processor, nullptr, nullptr, &retVal);
    return retVal;
}

napi_value SetReportRoute(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype processorType;
    napi_valuetype appIdType;
    napi_valuetype routeInfoType;
    napi_typeof(env, args[0], &processorType);
    napi_typeof(env, args[1], &appIdType);
    napi_typeof(env, args[2], &routeInfoType);
    HiAppEvent_Processor* processor;
    napi_get_value_external(env, args[0], reinterpret_cast<void**>(&processor));
    size_t appIdSize;
    size_t routeInfoSize;
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &appIdSize);
    napi_get_value_string_utf8(env, args[2], nullptr, 0, &routeInfoSize);
    char* appId = new char[appIdSize + 1];
    char* routeInfo = new char[routeInfoSize + 1];
    napi_get_value_string_utf8(env, args[1], appId, appIdSize + 1, nullptr);
    napi_get_value_string_utf8(env, args[2], routeInfo, routeInfoSize + 1, nullptr);
    int result = OH_HiAppEvent_SetReportRoute(processor, appId, routeInfo);
    delete[] appId;
    delete[] routeInfo;
    napi_value retVal;
    napi_create_int32(env, result, &retVal);
    return retVal;
}

napi_value SetReportPolicy(napi_env env, napi_callback_info info)
{
    size_t argc = 5;
    napi_value args[5];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype processorType;
    napi_valuetype periodReportType;
    napi_valuetype batchReportType;
    napi_valuetype onStartReportType;
    napi_valuetype onBackgroundReportType;
    napi_typeof(env, args[0], &processorType);
    napi_typeof(env, args[1], &periodReportType);
    napi_typeof(env, args[2], &batchReportType);
    napi_typeof(env, args[3], &onStartReportType);
    napi_typeof(env, args[4], &onBackgroundReportType);
    HiAppEvent_Processor* processor;
    napi_get_value_external(env, args[0], reinterpret_cast<void**>(&processor));
    int32_t periodReport;
    int32_t batchReport;
    napi_get_value_int32(env, args[1], &periodReport);
    napi_get_value_int32(env, args[2], &batchReport);
    bool onStartReport;
    bool onBackgroundReport;
    napi_get_value_bool(env, args[3], &onStartReport);
    napi_get_value_bool(env, args[4], &onBackgroundReport);
    size_t periodSize = sizeof(int32_t);
    size_t batchSize = sizeof(int32_t);
    size_t startReportSize = sizeof(bool);
    size_t backgroundReportSize = sizeof(bool);
    std::fill(reinterpret_cast<uint8_t*>(&periodReport), reinterpret_cast<uint8_t*>(&periodReport) + periodSize, 0);
    std::fill(reinterpret_cast<uint8_t*>(&batchReport), reinterpret_cast<uint8_t*>(&batchReport) + batchSize, 0);
    std::fill(
        reinterpret_cast<uint8_t*>(&onStartReport),
        reinterpret_cast<uint8_t*>(&onStartReport) + startReportSize, 0
        );
    std::fill(
        reinterpret_cast<uint8_t*>(&onBackgroundReport),
        reinterpret_cast<uint8_t*>(&onBackgroundReport) + backgroundReportSize, 0
        );
    int result = OH_HiAppEvent_SetReportPolicy(
        processor, periodReport, batchReport, onStartReport, onBackgroundReport);
    napi_value napiResult;
    napi_create_int32(env, result, &napiResult);
    return napiResult;
}

napi_value SetReportEvent(napi_env env, napi_callback_info info)
{
    size_t argc = 4;
    napi_value args[4];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype processorType;
    napi_valuetype domainType;
    napi_valuetype nameType;
    napi_valuetype isRealTimeType;
    napi_typeof(env, args[0], &processorType);
    napi_typeof(env, args[1], &domainType);
    napi_typeof(env, args[2], &nameType);
    napi_typeof(env, args[3], &isRealTimeType);
    HiAppEvent_Processor* processor;
    napi_get_value_external(env, args[0], reinterpret_cast<void**>(&processor));
    size_t domainSize;
    size_t nameSize;
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &domainSize);
    napi_get_value_string_utf8(env, args[2], nullptr, 0, &nameSize);
    char* domain = new char[domainSize + 1];
    char* name = new char[nameSize + 1];
    napi_get_value_string_utf8(env, args[1], domain, domainSize + 1, nullptr);
    napi_get_value_string_utf8(env, args[2], name, nameSize + 1, nullptr);
    bool isRealTime;
    napi_get_value_bool(env, args[3], &isRealTime);
    int result = OH_HiAppEvent_SetReportEvent(processor, domain, name, isRealTime);
    delete[] domain;
    delete[] name;
    napi_value napiResult;
    napi_create_int32(env, result, &napiResult);
    return napiResult;
}

napi_value SetCustomConfig(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype processorType;
    napi_valuetype keyType;
    napi_valuetype valueType;
    napi_typeof(env, args[0], &processorType);
    napi_typeof(env, args[1], &keyType);
    napi_typeof(env, args[2], &valueType);
    HiAppEvent_Processor* processor;
    napi_get_value_external(env, args[0], reinterpret_cast<void**>(&processor));
    size_t keySize;
    size_t valueSize;
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &keySize);
    napi_get_value_string_utf8(env, args[2], nullptr, 0, &valueSize);
    char* key = new char[keySize + 1];
    char* value = new char[valueSize + 1];
    napi_get_value_string_utf8(env, args[1], key, keySize + 1, nullptr);
    napi_get_value_string_utf8(env, args[2], value, valueSize + 1, nullptr);
    int result = OH_HiAppEvent_SetCustomConfig(processor, key, value);
    delete[] key;
    delete[] value;
    napi_value retVal;
    napi_create_int32(env, result, &retVal);
    return retVal;
}

napi_value SetConfigId(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype processorType;
    napi_valuetype configIdType;
    napi_typeof(env, args[0], &processorType);
    napi_typeof(env, args[1], &configIdType);
    HiAppEvent_Processor* processor;
    napi_get_value_external(env, args[0], reinterpret_cast<void**>(&processor));
    int32_t configId;
    napi_get_value_int32(env, args[1], &configId);
    size_t configIdSize = sizeof(int32_t);
    std::fill(reinterpret_cast<uint8_t*>(&configId), reinterpret_cast<uint8_t*>(&configId) + configIdSize, 0);
    int result = OH_HiAppEvent_SetConfigId(processor, configId);
    napi_value napiResult;
    napi_create_int32(env, result, &napiResult);
    return napiResult;
}

napi_value SetReportUserId(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype processorType;
    napi_valuetype userIdNamesType;
    napi_valuetype sizeType;
    napi_typeof(env, args[0], &processorType);
    napi_typeof(env, args[1], &userIdNamesType);
    napi_typeof(env, args[2], &sizeType);
    HiAppEvent_Processor* processor;
    napi_get_value_external(env, args[0], reinterpret_cast<void**>(&processor));
    int size;
    napi_get_value_int32(env, args[2], &size);
    std::vector<std::string> userIdStrings;
    std::vector<const char*> userIdNames;
    for (uint32_t i = 0; i < size; i++) {
        napi_value element;
        napi_get_element(env, args[1], i, &element);
        size_t strSize;
        napi_get_value_string_utf8(env, element, nullptr, 0, &strSize);
        std::string str(strSize, '\0');
        napi_get_value_string_utf8(env, element, &str[0], strSize + 1, &strSize);
        userIdStrings.push_back(str);
        userIdNames.push_back(userIdStrings.back().c_str());
        }
    int result = OH_HiAppEvent_SetReportUserId(processor, userIdNames.data(), size);
    napi_value retVal;
    napi_create_int32(env, result, &retVal);
    return retVal;
}

napi_value SetReportUserProperty(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype processorType;
    napi_valuetype userPropertyNamesType;
    napi_valuetype sizeType;
    napi_typeof(env, args[0], &processorType);
    napi_typeof(env, args[1], &userPropertyNamesType);
    napi_typeof(env, args[2], &sizeType);
    HiAppEvent_Processor* processor;
    napi_get_value_external(env, args[0], reinterpret_cast<void**>(&processor));
    int size;
    napi_get_value_int32(env, args[2], &size);
    std::vector<std::string> userPropertyNamesStrings;
    std::vector<const char*> userPropertyNames;
    for (uint32_t i = 0; i < size; i++) {
        napi_value element;
        napi_get_element(env, args[1], i, &element);
        size_t strSize;
        napi_get_value_string_utf8(env, element, nullptr, 0, &strSize);
        std::string str(strSize, '\0');
        napi_get_value_string_utf8(env, element, &str[0], strSize + 1, &strSize);
        userPropertyNamesStrings.push_back(str);
        userPropertyNames.push_back(userPropertyNamesStrings.back().c_str());
        }
    int result = OH_HiAppEvent_SetReportUserId(processor, userPropertyNames.data(), size);
    napi_value retVal;
    napi_create_int32(env, result, &retVal);
    return retVal;
}

napi_value AddProcessor(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype processorType;
    napi_typeof(env, args[0], &processorType);
    HiAppEvent_Processor* processor;
    napi_get_value_external(env, args[0], reinterpret_cast<void**>(&processor));
    int result = OH_HiAppEvent_AddProcessor(processor);
    napi_value napiResult;
    napi_create_int32(env, result, &napiResult);
    return napiResult;
}

napi_value RemoveProcessor(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype processorType;
    napi_typeof(env, args[0], &processorType);
    int64_t processorId;
    napi_get_value_int64(env, args[0], &processorId);
    int result = OH_HiAppEvent_RemoveProcessor(processorId);
    napi_value napiResult;
    napi_create_int32(env, result, &napiResult);
    return napiResult;
}

napi_value DestroyProcessor(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype processorType;
    napi_typeof(env, args[0], &processorType);
    HiAppEvent_Processor* processor;
    napi_get_value_external(env, args[0], reinterpret_cast<void**>(&processor));
    OH_HiAppEvent_DestroyProcessor(processor);
    napi_value Result;
    napi_get_undefined(env, &Result);
    return Result;
}

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;
}

static napi_value NAPI_Global_add(napi_env env, napi_callback_info info) {
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHHiAppEventWrite", nullptr, OHHiAppEventWrite, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHiAppEventConfigure", nullptr, OHHiAppEventConfigure, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHiAppEventAddBoolParam", nullptr, OHHiAppEventAddBoolParam, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHiAppEventAddBoolArrayParam", nullptr, OHHiAppEventAddBoolArrayParam, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHHiAppEventAddInt8Param", nullptr, OHHiAppEventAddInt8Param, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHiAppEventAddInt8ArrayParam", nullptr, OHHiAppEventAddInt8ArrayParam, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHHiAppEventAddInt16Param", nullptr, OHHiAppEventAddInt16Param, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHiAppEventAddInt16ArrayParam", nullptr, OHHiAppEventAddInt16ArrayParam, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHHiAppEventAddInt32Param", nullptr, OHHiAppEventAddInt32Param, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHiAppEventAddInt32ArrayParam", nullptr, OHHiAppEventAddInt32ArrayParam, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHHiAppEventAddInt64Param", nullptr, OHHiAppEventAddInt64Param, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHiAppEventAddInt64ArrayParam", nullptr, OHHiAppEventAddInt64ArrayParam, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHHiAppEventAddFloatParam", nullptr, OHHiAppEventAddFloatParam, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHiAppEventAddFloatArrayParam", nullptr, OHHiAppEventAddFloatArrayParam, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHHiAppEventAddDoubleParam", nullptr, OHHiAppEventAddDoubleParam, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHiAppEventAddDoubleArrayParam", nullptr, OHHiAppEventAddDoubleArrayParam, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHHiAppEventAddStringParam", nullptr, OHHiAppEventAddStringParam, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHiAppEventAddStringArrayParam", nullptr, OHHiAppEventAddStringArrayParam, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHHiAppEventCreateParamList", nullptr, OHHiAppEventCreateParamList, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"setAppEventFilter", nullptr, SetAppEventFilter, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setAppEventFilterInvName", nullptr, SetAppEventFilterInvName, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"setAppEventFilterInvDomain", nullptr, SetAppEventFilterInvDomain, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"setAppEventFilterInvWatcher", nullptr, SetAppEventFilterInvWatcher, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"setTriggerCondition", nullptr, SetTriggerCondition, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setTriggerConditionInvWatcher", nullptr, SetTriggerConditionInvWatcher, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"setWatcherOnTrigger", nullptr, SetWatcherOnTrigger, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setWatcherOnTriggerInvWatcher", nullptr, SetWatcherOnTriggerInvWatcher, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"setWatcherOnReceive", nullptr, SetWatcherOnReceive, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setWatcherOnReceiveInvWatcher", nullptr, SetWatcherOnReceiveInvWatcher, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"takeWatcherData", nullptr, TakeWatcherData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"takeWatcherDataInvWatcher", nullptr, TakeWatcherDataInvWatcher, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"takeWatcherDataInvOperation", nullptr, TakeWatcherDataInvOperation, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"addWatcher", nullptr, AddWatcher, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"addWatcherInvWatcher", nullptr, AddWatcherInvWatcher, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"removeWatcher", nullptr, RemoveWatcher, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"removeWatcherInvWatcher", nullptr, RemoveWatcherInvWatcher, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"removeWatcherInvOperation", nullptr, RemoveWatcherInvOperation, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        { "SetReportRoute", nullptr, SetReportRoute, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreateProcessor", nullptr, CreateProcessor, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetReportPolicy", nullptr, SetReportPolicy, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetReportEvent", nullptr, SetReportEvent, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetCustomConfig", nullptr, SetCustomConfig, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetConfigId", nullptr, SetConfigId, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetReportUserId", nullptr, SetReportUserId, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetReportUserProperty", nullptr, SetReportUserId, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AddProcessor", nullptr, AddProcessor, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RemoveProcessor", nullptr, RemoveProcessor, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DestroyProcessor", nullptr, DestroyProcessor, nullptr, nullptr, nullptr, napi_default, nullptr },
        {"add", nullptr, NAPI_Global_add, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
