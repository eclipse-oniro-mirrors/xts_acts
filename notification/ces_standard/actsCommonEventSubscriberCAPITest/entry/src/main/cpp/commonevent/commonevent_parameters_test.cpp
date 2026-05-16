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


#include "commonevent_parameters_test.h"
#include "common.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include "oh_commonevent.h"
#include <cstdio>
#include <cwchar>

namespace CesCapiTest {
napi_value CommonEventParametersTest::TestCommonEventCreateParameters001(napi_env env, napi_callback_info info)
{
    auto ret = OH_CommonEvent_CreateParameters();
    if (ret == nullptr) {
        napi_value res = nullptr;
        napi_create_int32(env, INVALID_PARAM, &res);
        return res;
    }
    OH_CommonEvent_DestroyParameters(ret);
    ret = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventDestroyParameters001(napi_env env, napi_callback_info info)
{
    auto information = OH_CommonEvent_CreateParameters();
    if (information != nullptr) {
        OH_CommonEvent_DestroyParameters(information);
    }
    information = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetIntToParameters001(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "int";
    int value = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetIntToParameters(parameters, key, value), COMMONEVENT_ERR_OK);
    ASSERT_EQ(OH_CommonEvent_GetIntFromParameters(parameters, key, PARAM_0), PARAM_1);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetIntToParameters002(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "int";
    int value = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetIntToParameters(nullptr, key, value),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetIntArrayToParameters001(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "intArray";
    int value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(int);
    ASSERT_EQ(OH_CommonEvent_SetIntArrayToParameters(parameters, key, value, num),
              COMMONEVENT_ERR_OK);
    int *ptr = nullptr;
    ASSERT_EQ(OH_CommonEvent_GetIntArrayFromParameters(parameters, key, &ptr), num);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetIntArrayToParameters002(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "intArray";
    int value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(int);
    ASSERT_EQ(OH_CommonEvent_SetIntArrayToParameters(nullptr, key, value, num),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetLongToParameters001(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "long";
    long value = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetLongToParameters(parameters, key, value), COMMONEVENT_ERR_OK);
    ASSERT_EQ(OH_CommonEvent_GetLongFromParameters(parameters, key, PARAM_0), PARAM_1);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetLongToParameters002(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "long";
    long value = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetLongToParameters(nullptr, key, value),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetLongArrayToParameters001(napi_env env,
                                                                                 napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "longArray";
    long value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(long);
    ASSERT_EQ(OH_CommonEvent_SetLongArrayToParameters(parameters, key, value, num),
              COMMONEVENT_ERR_OK);
    long *ptr = nullptr;
    ASSERT_EQ(OH_CommonEvent_GetLongArrayFromParameters(parameters, key, &ptr), num);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetLongArrayToParameters002(napi_env env,
                                                                                 napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "longArray";
    long value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(long);
    ASSERT_EQ(OH_CommonEvent_SetLongArrayToParameters(nullptr, key, value, num),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetDoubleToParameters001(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "double";
    double value = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetDoubleToParameters(parameters, key, value), COMMONEVENT_ERR_OK);
    ASSERT_EQ(OH_CommonEvent_GetDoubleFromParameters(parameters, key, PARAM_0), PARAM_1);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetDoubleToParameters002(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "double";
    double value = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetDoubleToParameters(nullptr, key, value),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetDoubleToParameters003(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "double";
    double value = PARAM_1;
    ASSERT_EQ(OH_CommonEvent_SetDoubleToParameters(parameters, nullptr, value),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetDoubleToParameters004(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "double";
    double value = PARAM_4;
    ASSERT_EQ(OH_CommonEvent_SetDoubleToParameters(parameters, key, value), COMMONEVENT_ERR_OK);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetDoubleArrayToParameters001(napi_env env,
                                                                                   napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "doubleArray";
    double value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(double);
    ASSERT_EQ(OH_CommonEvent_SetDoubleArrayToParameters(parameters, key, value, num),
              COMMONEVENT_ERR_OK);
    double *ptr = nullptr;
    ASSERT_EQ(OH_CommonEvent_GetDoubleArrayFromParameters(parameters, key, &ptr), num);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetDoubleArrayToParameters002(napi_env env,
                                                                                   napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "doubleArray";
    double value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(double);
    ASSERT_EQ(OH_CommonEvent_SetDoubleArrayToParameters(nullptr, key, value, num),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetDoubleArrayToParameters003(napi_env env,
                                                                                   napi_callback_info info)

{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "doubleArray";
    double value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(double);
    ASSERT_EQ(OH_CommonEvent_SetDoubleArrayToParameters(parameters, nullptr, value, num),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetDoubleArrayToParameters004(napi_env env,
                                                                                   napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "doubleArray";
    double value[] = {PARAM_1, PARAM_4, PARAM_6};
    size_t num = sizeof(value) / sizeof(double);
    ASSERT_EQ(OH_CommonEvent_SetDoubleArrayToParameters(parameters, key, nullptr, num),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetBoolToParameters001(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "bool";
    bool value = true;
    ASSERT_EQ(OH_CommonEvent_SetBoolToParameters(parameters, key, value), COMMONEVENT_ERR_OK);
    ASSERT_EQ(OH_CommonEvent_GetBoolFromParameters(parameters, key, false), true);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetBoolToParameters002(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "bool";
    bool value = true;
    ASSERT_EQ(OH_CommonEvent_SetBoolToParameters(nullptr, key, value),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetBoolToParameters003(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "bool";
    bool value = true;
    ASSERT_EQ(OH_CommonEvent_SetBoolToParameters(parameters, nullptr, value),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetBoolToParameters004(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "bool";
    bool value = false;
    ASSERT_EQ(OH_CommonEvent_SetBoolToParameters(parameters, key, value), COMMONEVENT_ERR_OK);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}


napi_value CommonEventParametersTest::TestCommonEventSetBoolArrayToParameters001(napi_env env,
                                                                                 napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "boolArray";
    bool value[] = {true, false, true};
    size_t num = sizeof(value) / sizeof(bool);
    ASSERT_EQ(OH_CommonEvent_SetBoolArrayToParameters(parameters, key, value, num),
              COMMONEVENT_ERR_OK);
    bool *ptr = nullptr;
    ASSERT_EQ(OH_CommonEvent_GetBoolArrayFromParameters(parameters, key, &ptr), num);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetBoolArrayToParameters002(napi_env env,
                                                                                 napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "boolArray";
    bool value[] = {true, false, true};
    size_t num = sizeof(value) / sizeof(bool);
    ASSERT_EQ(OH_CommonEvent_SetBoolArrayToParameters(nullptr, key, value, num),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetBoolArrayToParameters003(napi_env env,
                                                                                 napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "boolArray";
    bool value[] = {true, false, true};
    size_t num = sizeof(value) / sizeof(bool);
    ASSERT_EQ(OH_CommonEvent_SetBoolArrayToParameters(parameters, nullptr, value, num),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetBoolArrayToParameters004(napi_env env,
                                                                                 napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "boolArray";
    bool value[] = {true, false, true};
    size_t num = sizeof(value) / sizeof(bool);
    ASSERT_EQ(OH_CommonEvent_SetBoolArrayToParameters(parameters, key, nullptr, num),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetCharToParameters001(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "char";
    char value = 'a';
    ASSERT_EQ(OH_CommonEvent_SetCharToParameters(parameters, key, value), COMMONEVENT_ERR_OK);
    ASSERT_EQ(OH_CommonEvent_GetCharFromParameters(parameters, key, 'v'), value);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetCharToParameters002(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "char";
    char value = 'a';
    ASSERT_EQ(OH_CommonEvent_SetCharToParameters(nullptr, key, value),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetCharToParameters003(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "char";
    char value = 'a';
    ASSERT_EQ(OH_CommonEvent_SetCharToParameters(parameters, nullptr, value),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetCharToParameters004(napi_env env, napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "char";
    char value = 'b';
    ASSERT_EQ(OH_CommonEvent_SetCharToParameters(parameters, key, value), COMMONEVENT_ERR_OK);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetCharArrayToParameters001(napi_env env,
                                                                                 napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "charArray";
    // 这里后端判断必须有/0，如果没有/0，就不会自动补充，不带num和get返回的数量就会相差1--岳港 30058781
    char value[] = {'a', 'b', 'c', '\0'};
    size_t num = sizeof(value) / sizeof(char);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestCommonEventSetCharArrayToParameters001", "num : %{public}d",
                 num);
    ASSERT_EQ(OH_CommonEvent_SetCharArrayToParameters(parameters, key, value, num),
              COMMONEVENT_ERR_OK);
    char *ptr = nullptr;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestCommonEventSetCharArrayToParameters001",
                 "OH_CommonEvent_GetCharArrayFromParameters: %{public}d",
                 OH_CommonEvent_GetCharArrayFromParameters(parameters, key, &ptr));
    ASSERT_EQ(OH_CommonEvent_GetCharArrayFromParameters(parameters, key, &ptr), num);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
        parameters = nullptr;
    }
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetCharArrayToParameters002(napi_env env,
                                                                                 napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "charArray";
    char value[] = {'a', 'b', 'c'};
    size_t num = sizeof(value) / sizeof(char);
    ASSERT_EQ(OH_CommonEvent_SetCharArrayToParameters(nullptr, key, value, num),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetCharArrayToParameters003(napi_env env,
                                                                                 napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "charArray";
    char value[] = {'a', 'b', 'c'};
    size_t num = sizeof(value) / sizeof(char);
    ASSERT_EQ(OH_CommonEvent_SetCharArrayToParameters(parameters, nullptr, value, num),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}

napi_value CommonEventParametersTest::TestCommonEventSetCharArrayToParameters004(napi_env env,
                                                                                 napi_callback_info info)
{
    auto parameters = OH_CommonEvent_CreateParameters();
    const char *key = "charArray";
    char value[] = {'a', 'b', 'c'};
    size_t num = sizeof(value) / sizeof(char);
    ASSERT_EQ(OH_CommonEvent_SetCharArrayToParameters(parameters, key, nullptr, num),
              COMMONEVENT_ERR_INVALID_PARAMETER);
    if (parameters != nullptr) {
        OH_CommonEvent_DestroyParameters(parameters);
    }
    parameters = nullptr;
    NAPI_END;
}
} // namespace CesCapiTest