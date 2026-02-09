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

#include "napi/native_api.h"
#include "hilog/log.h"
#include "BasicServicesKit/oh_commonevent.h"
#include "BasicServicesKit/oh_commonevent_support.h"
#include "common.h"

static napi_value CreateParameters(napi_env env, napi_callback_info info)
{
    parameters = OH_CommonEvent_CreateParameters();
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CreateParameters", 
        "OH_CommonEvent_CreateParameters: %{public}p", parameters);
    ASSERT_OBJNE(parameters, nullptr);
    NAPI_END;
}

static napi_value DestroyParameters(napi_env env, napi_callback_info info)
{
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DestroyParameters", 
            "OH_CommonEvent_DestroyParameters success");
        parameters = nullptr;
    }    
    NAPI_END;
}

static napi_value SetIntToParameters(napi_env env, napi_callback_info info)
{
    parameters = OH_CommonEvent_CreateParameters();
    int value = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetIntToParameters(parameters, KEY_INT, value), COMMONEVENT_ERR_OK);    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetIntToParameters", 
        "OH_CommonEvent_SetIntToParameters: %{public}d", value);
    int ret = OH_CommonEvent_GetIntFromParameters(parameters, KEY_INT, PARAM_1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetIntToParameters", 
        "OH_CommonEvent_GetIntFromParameters: %{public}d", ret);
    ASSERT_EQ(ret, value);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DestroyParameters", 
            "OH_CommonEvent_DestroyParameters success");
        parameters = nullptr;
    }
    NAPI_END;
}

static napi_value SetIntArrayToParameters(napi_env env, napi_callback_info info)
{
    parameters = OH_CommonEvent_CreateParameters();
    int value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(int);
    ASSERT_EQ(OH_CommonEvent_SetIntArrayToParameters(parameters, KEY_INT_ARRAY, value, num),
              COMMONEVENT_ERR_OK);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetIntArrayToParameters", 
        "OH_CommonEvent_SetIntArrayToParameters: %{public}d", num);
    int* ptr = nullptr;
    size_t ret = OH_CommonEvent_GetIntArrayFromParameters(parameters, KEY_INT_ARRAY, &ptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetIntArrayToParameters", 
        "OH_CommonEvent_GetIntArrayFromParameters: %{public}d", ret);
    ASSERT_EQ(ret, num);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DestroyParameters", 
            "OH_CommonEvent_DestroyParameters success");
        parameters = nullptr;
    }
    NAPI_END;
}

static napi_value SetLongToParameters(napi_env env, napi_callback_info info)
{
    parameters = OH_CommonEvent_CreateParameters();
    long value = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetLongToParameters(parameters, KEY_LONG, value), COMMONEVENT_ERR_OK);
    ASSERT_EQ(OH_CommonEvent_GetLongFromParameters(parameters, KEY_LONG, PARAM_0), value);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DestroyParameters", 
            "OH_CommonEvent_DestroyParameters success");
        parameters = nullptr;
    }
    NAPI_END;
}

static napi_value SetLongArrayToParameters(napi_env env, napi_callback_info info)
{
    parameters = OH_CommonEvent_CreateParameters();
    long value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(long);
    ASSERT_EQ(OH_CommonEvent_SetLongArrayToParameters(parameters, KEY_LONG_ARRAY, value, num),
              COMMONEVENT_ERR_OK);
    long* ptr = nullptr;
    size_t ret = OH_CommonEvent_GetLongArrayFromParameters(parameters, KEY_LONG_ARRAY, &ptr);
    ASSERT_EQ(ret, num);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DestroyParameters", 
            "OH_CommonEvent_DestroyParameters success");
        parameters = nullptr;
    }
    NAPI_END;
}

static napi_value SetDoubleToParameters(napi_env env, napi_callback_info info)
{
    parameters = OH_CommonEvent_CreateParameters();
    double  value = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetDoubleToParameters(parameters, KEY_DOUBLE, value), COMMONEVENT_ERR_OK);
    ASSERT_EQ(OH_CommonEvent_GetDoubleFromParameters(parameters, KEY_DOUBLE, PARAM_0), value);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DestroyParameters", 
            "OH_CommonEvent_DestroyParameters success");
        parameters = nullptr;
    }
    NAPI_END;
}

static napi_value SetDoubleArrayToParameters(napi_env env, napi_callback_info info)
{
    parameters = OH_CommonEvent_CreateParameters();
    double  value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(double);
    ASSERT_EQ(OH_CommonEvent_SetDoubleArrayToParameters(parameters, KEY_DOUBLE_ARRAY, value, num),
              COMMONEVENT_ERR_OK);
    double * ptr = nullptr;
    size_t ret = OH_CommonEvent_GetDoubleArrayFromParameters(parameters, KEY_DOUBLE_ARRAY, &ptr);
    ASSERT_EQ(ret, num);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DestroyParameters", 
            "OH_CommonEvent_DestroyParameters success");
        parameters = nullptr;
    }
    NAPI_END;
}

static napi_value SetBoolToParameters(napi_env env, napi_callback_info info)
{
    parameters = OH_CommonEvent_CreateParameters();
    bool value = true;
    ASSERT_EQ(OH_CommonEvent_SetBoolToParameters(parameters, KEY_BOOL, value), COMMONEVENT_ERR_OK);
    ASSERT_EQ(OH_CommonEvent_GetBoolFromParameters(parameters, KEY_BOOL, false), value);
    if (!parameters) {
        ASSERT_EQ(OH_CommonEvent_GetBoolFromParameters(parameters, KEY_BOOL, false), false);
    }
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DestroyParameters", 
            "OH_CommonEvent_DestroyParameters success");
        parameters = nullptr;
    }
    NAPI_END;
}

static napi_value SetBoolArrayToParameters(napi_env env, napi_callback_info info)
{
    parameters = OH_CommonEvent_CreateParameters();
    bool value[] = {true, false, true};
    size_t num = sizeof(value) / sizeof(bool);
    ASSERT_EQ(OH_CommonEvent_SetBoolArrayToParameters(parameters, KEY_BOOL_ARRAY, value, num),
              COMMONEVENT_ERR_OK);
    bool* ptr = nullptr;
    size_t ret = OH_CommonEvent_GetBoolArrayFromParameters(parameters, KEY_BOOL_ARRAY, &ptr);
    ASSERT_EQ(ret, num);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DestroyParameters", 
            "OH_CommonEvent_DestroyParameters success");
        parameters = nullptr;
    }
    NAPI_END;
}

static napi_value SetCharToParameters(napi_env env, napi_callback_info info)
{
    parameters = OH_CommonEvent_CreateParameters();
    char value = 'a';
    ASSERT_EQ(OH_CommonEvent_SetCharToParameters(parameters, KEY_CHAR, value), COMMONEVENT_ERR_OK);
    ASSERT_EQ(OH_CommonEvent_GetCharFromParameters(parameters, KEY_CHAR, 'b'), value);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DestroyParameters", 
            "OH_CommonEvent_DestroyParameters success");
        parameters = nullptr;
    }
    NAPI_END;
}

static napi_value SetCharArrayToParameters(napi_env env, napi_callback_info info)
{
    parameters = OH_CommonEvent_CreateParameters();
    char value[] = {'a', 'b', 'c'};
    size_t num = sizeof(value) / sizeof(char);
    ASSERT_EQ(OH_CommonEvent_SetCharArrayToParameters(parameters, KEY_CHAR_ARRAY, value, num),
              COMMONEVENT_ERR_OK);
    char* ptr = nullptr;
    size_t ret = OH_CommonEvent_GetCharArrayFromParameters(parameters, KEY_CHAR_ARRAY, &ptr);
    ASSERT_EQ(ret, num + 1);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DestroyParameters", 
            "OH_CommonEvent_DestroyParameters success");
        parameters = nullptr;
    }
    NAPI_END;
}



