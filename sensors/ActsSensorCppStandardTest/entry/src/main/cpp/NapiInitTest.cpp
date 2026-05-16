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
#include "include/NapiInitTestCommon.h"
#include "napi/native_api.h"

int32_t GetInt32Arg(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue)
{
    size_t argc = index + 1;
    napi_value args[2];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc <= index) {
        napi_throw_type_error(env, nullptr, "Argument missing");
        return defaultValue;
    }
    napi_valuetype valuetype;
    napi_typeof(env, args[index], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return defaultValue;
    }
    int32_t result = defaultValue;
    status = napi_get_value_int32(env, args[index], &result);
    if (status != napi_ok) {
        napi_throw_type_error(env, nullptr, "Value is not int32");
        return defaultValue;
    }
    return result;
}

// OHSensorGetInfosTest: GetInfos001, GetInfos002 (case 0-1)
static napi_value OHSensorGetInfosTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Sensor::OHSensorGetInfos001();
                break;
            case CASE_NUM_1:
                result = Acts::Sensor::OHSensorGetInfos002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHSensorSubscribeTest: Subscribe001~014 (case 0-13)
static int RunOHSensorSubscribeCase(int32_t caseNum)
{
    switch (caseNum) {
        case CASE_NUM_0:
            return Acts::Sensor::OHSensorSubscribe001();
        case CASE_NUM_1:
            return Acts::Sensor::OHSensorSubscribe002();
        case CASE_NUM_2:
            return Acts::Sensor::OHSensorSubscribe003();
        case CASE_NUM_3:
            return Acts::Sensor::OHSensorSubscribe004();
        case CASE_NUM_4:
            return Acts::Sensor::OHSensorSubscribe005();
        case CASE_NUM_5:
            return Acts::Sensor::OHSensorSubscribe006();
        case CASE_NUM_6:
            return Acts::Sensor::OHSensorSubscribe007();
        case CASE_NUM_7:
            return Acts::Sensor::OHSensorSubscribe008();
        case CASE_NUM_8:
            return Acts::Sensor::OHSensorSubscribe009();
        case CASE_NUM_9:
            return Acts::Sensor::OHSensorSubscribe010();
        case CASE_NUM_10:
            return Acts::Sensor::OHSensorSubscribe011();
        case CASE_NUM_11:
            return Acts::Sensor::OHSensorSubscribe012();
        case CASE_NUM_12:
            return Acts::Sensor::OHSensorSubscribe013();
        case CASE_NUM_13:
            return Acts::Sensor::OHSensorSubscribe014();
        default:
            return RESULT_ERROR;
    }
}

static napi_value OHSensorSubscribeTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = RunOHSensorSubscribeCase(caseNum);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHSensorUnsubscribeTest: Unsubscribe001~006 (case 0-5)
static napi_value OHSensorUnsubscribeTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Sensor::OHSensorUnsubscribe001();
                break;
            case CASE_NUM_1:
                result = Acts::Sensor::OHSensorUnsubscribe002();
                break;
            case CASE_NUM_2:
                result = Acts::Sensor::OHSensorUnsubscribe003();
                break;
            case CASE_NUM_3:
                result = Acts::Sensor::OHSensorUnsubscribe004();
                break;
            case CASE_NUM_4:
                result = Acts::Sensor::OHSensorUnsubscribe005();
                break;
            case CASE_NUM_5:
                result = Acts::Sensor::OHSensorUnsubscribe006();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHSensorSubscriptionIdSetTypeTest: SetType001~003 (case 0-2)
static napi_value OHSensorSubscriptionIdSetTypeTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Sensor::OHSensorSubscriptionIdSetType001();
                break;
            case CASE_NUM_1:
                result = Acts::Sensor::OHSensorSubscriptionIdSetType002();
                break;
            case CASE_NUM_2:
                result = Acts::Sensor::OHSensorSubscriptionIdSetType003();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHSensorSubscriptionIdGetTypeTest: GetType001~002 (case 0-1)
static napi_value OHSensorSubscriptionIdGetTypeTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Sensor::OHSensorSubscriptionIdGetType001();
                break;
            case CASE_NUM_1:
                result = Acts::Sensor::OHSensorSubscriptionIdGetType002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHSensorSubscriptionAttrSetSamplingIntervalTest: SetSamplingInterval001~002 (case 0-1)
static napi_value OHSensorSubscriptionAttrSetSamplingIntervalTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Sensor::OHSensorSubscriptionAttributeSetSamplingInterval001();
                break;
            case CASE_NUM_1:
                result = Acts::Sensor::OHSensorSubscriptionAttributeSetSamplingInterval002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHSensorSubscriptionAttrGetSamplingIntervalTest: GetSamplingInterval001~002 (case 0-1)
static napi_value OHSensorSubscriptionAttrGetSamplingIntervalTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Sensor::OHSensorSubscriptionAttributeGetSamplingInterval001();
                break;
            case CASE_NUM_1:
                result = Acts::Sensor::OHSensorSubscriptionAttributeGetSamplingInterval002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHSensorSubscriberSetCallbackTest: SetCallback001~002 (case 0-1)
static napi_value OHSensorSubscriberSetCallbackTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Sensor::OHSensorSubscriberSetCallback001();
                break;
            case CASE_NUM_1:
                result = Acts::Sensor::OHSensorSubscriberSetCallback002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHSensorSubscriberGetCallbackTest: GetCallback001~002 (case 0-1)
static napi_value OHSensorSubscriberGetCallbackTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::Sensor::OHSensorSubscriberGetCallback001();
                break;
            case CASE_NUM_1:
                result = Acts::Sensor::OHSensorSubscriberGetCallback002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static const napi_property_descriptor g_sensorDescriptors[] = {
    DECL_NAPI_DESC(OHSensorGetInfosTest),
    DECL_NAPI_DESC(OHSensorSubscribeTest),
    DECL_NAPI_DESC(OHSensorUnsubscribeTest),
    DECL_NAPI_DESC(OHSensorSubscriptionIdSetTypeTest),
    DECL_NAPI_DESC(OHSensorSubscriptionIdGetTypeTest),
    DECL_NAPI_DESC(OHSensorSubscriptionAttrSetSamplingIntervalTest),
    DECL_NAPI_DESC(OHSensorSubscriptionAttrGetSamplingIntervalTest),
    DECL_NAPI_DESC(OHSensorSubscriberSetCallbackTest),
    DECL_NAPI_DESC(OHSensorSubscriberGetCallbackTest),
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(
        env, exports, sizeof(g_sensorDescriptors) / sizeof(g_sensorDescriptors[0]), g_sensorDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module sensorcppstandardModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "sensorcppstandard",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&sensorcppstandardModule);
}
