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

#include "InputmethodPrivateCommandCapiTest.h"
#include "napi/native_api.h"
#include "string"
#include <cstdint>
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <inputmethod/inputmethod_attach_options_capi.h>
#include <inputmethod/inputmethod_controller_capi.h>
#include <inputmethod/inputmethod_private_command_capi.h>
#include <napi/native_api.h>

void AddInputMethodPrivateCommandCapiTest1(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhPrivateCommandSetKeyNullPointer", nullptr, TestOhPrivateCommandSetKeyNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandSetKeyOk", nullptr, TestOhPrivateCommandSetKeyOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandSetBoolValueNullPointer", nullptr,
                        TestOhPrivateCommandSetBoolValueNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandSetIntValueNullPointer", nullptr,
                        TestOhPrivateCommandSetIntValueNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandSetStrValueNullPointer", nullptr,
                        TestOhPrivateCommandSetStrValueNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandGetKeyNullPointer", nullptr, TestOhPrivateCommandGetKeyNullPointer,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandGetKeyOk", nullptr, TestOhPrivateCommandGetKeyOk, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOHPrivateCommandGetValueTypeNullPointer", nullptr,
                        TestOHPrivateCommandGetValueTypeNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOHPrivateCommandGetValueTypeOk", nullptr, TestOHPrivateCommandGetValueTypeOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
}

void AddInputMethodPrivateCommandCapiTest2(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOhPrivateCommandGetBoolValueNullPointer", nullptr,
                        TestOhPrivateCommandGetBoolValueNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandGetBoolValueOk", nullptr, TestOhPrivateCommandGetBoolValueOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandGetBoolValueQueryFailed", nullptr,
                        TestOhPrivateCommandGetBoolValueQueryFailed, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandGetIntValueNullPointer", nullptr,
                        TestOhPrivateCommandGetIntValueNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandGetIntValueOk", nullptr, TestOhPrivateCommandGetIntValueOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandGetIntValueQueryFailed", nullptr,
                        TestOhPrivateCommandGetIntValueQueryFailed, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandGetStrValueNullPointer", nullptr,
                        TestOhPrivateCommandGetStrValueNullPointer, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandGetStrValueOk", nullptr, TestOhPrivateCommandGetStrValueOk, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhPrivateCommandGetStrValueQueryFailed", nullptr,
                        TestOhPrivateCommandGetStrValueQueryFailed, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void AddInputMethodPrivateCommandCapiTest(std::vector<napi_property_descriptor> &descData)
{
    AddInputMethodPrivateCommandCapiTest1(descData);
    AddInputMethodPrivateCommandCapiTest2(descData);
}

napi_value TestOhPrivateCommandSetKeyNullPointer(napi_env env, napi_callback_info info)
{
    std::string key = "key";
    auto privateCommand = OH_PrivateCommand_Create(const_cast<char *>(key.c_str()), key.length());
    std::string newKey = "newKey";
    int ret = OH_PrivateCommand_SetKey(nullptr, const_cast<char *>(newKey.c_str()), newKey.length());
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandSetKeyOk(napi_env env, napi_callback_info info)
{
    std::string key = "key";
    InputMethod_PrivateCommand *privateCommand =
        OH_PrivateCommand_Create(const_cast<char *>(key.c_str()), key.length());
    std::string newKey = "newKey";
    int ret = OH_PrivateCommand_SetKey(privateCommand, const_cast<char *>(newKey.c_str()), newKey.length());
    OH_PrivateCommand_Destroy(privateCommand);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandSetBoolValueNullPointer(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    bool valStr1 = true;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    int ret = OH_PrivateCommand_SetBoolValue(nullptr, valStr1);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandSetIntValueNullPointer(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    int32_t value = 10;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    int ret = OH_PrivateCommand_SetIntValue(nullptr, value);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandSetStrValueNullPointer(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    std::string valStr1 = "testValue_2";
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    int ret = OH_PrivateCommand_SetStrValue(nullptr, const_cast<char *>(valStr1.c_str()), valStr1.length());
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandGetKeyNullPointer(napi_env env, napi_callback_info info)
{
    std::string key = "key";
    InputMethod_PrivateCommand *privateCommand =
        OH_PrivateCommand_Create(const_cast<char *>(key.c_str()), key.length());
    std::string newKey = "newKey";
    OH_PrivateCommand_SetKey(privateCommand, const_cast<char *>(newKey.c_str()), newKey.length());
    const char *actStrKey = nullptr;
    size_t actStrKeyLength = 0;
    int ret = OH_PrivateCommand_GetKey(nullptr, &actStrKey, &actStrKeyLength);
    OH_PrivateCommand_Destroy(privateCommand);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandGetKeyOk(napi_env env, napi_callback_info info)
{
    std::string key = "key";
    InputMethod_PrivateCommand *privateCommand =
        OH_PrivateCommand_Create(const_cast<char *>(key.c_str()), key.length());

    std::string newKey = "newKey";
    OH_PrivateCommand_SetKey(privateCommand, const_cast<char *>(newKey.c_str()), newKey.length());
    const char *actStrKey = nullptr;
    size_t actStrKeyLength = 0;
    int ret = OH_PrivateCommand_GetKey(privateCommand, &actStrKey, &actStrKeyLength);
    OH_PrivateCommand_Destroy(privateCommand);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOHPrivateCommandGetValueTypeNullPointer(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    int32_t value = 10;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    int res = OH_PrivateCommand_SetIntValue(keyCommand2, value);
    InputMethod_CommandValueType type = IME_COMMAND_VALUE_TYPE_INT32;
    int ret = OH_PrivateCommand_GetValueType(nullptr, &type);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOHPrivateCommandGetValueTypeOk(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    int32_t value = 10;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetIntValue(keyCommand2, value);
    InputMethod_CommandValueType type = IME_COMMAND_VALUE_TYPE_INT32;
    int ret = OH_PrivateCommand_GetValueType(keyCommand2, &type);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandGetBoolValueNullPointer(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    bool valStr1 = true;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetBoolValue(keyCommand2, valStr1);
    bool type = false;
    int ret = OH_PrivateCommand_GetBoolValue(nullptr, &type);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandGetBoolValueOk(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    bool valStr1 = true;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetBoolValue(keyCommand2, valStr1);
    bool type = false;
    int ret = OH_PrivateCommand_GetBoolValue(keyCommand2, &type);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandGetBoolValueQueryFailed(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    std::string valStr1 = "testValue";
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetStrValue(keyCommand2, const_cast<char *>(valStr1.c_str()), valStr1.length());
    bool type = false;
    int ret = OH_PrivateCommand_GetBoolValue(keyCommand2, &type);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_QUERY_FAILED ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandGetIntValueNullPointer(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    int32_t value = 10;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetIntValue(keyCommand2, value);
    int32_t value1 = 0;
    int ret = OH_PrivateCommand_GetIntValue(nullptr, &value1);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandGetIntValueOk(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    int32_t value = 10;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetIntValue(keyCommand2, value);
    int32_t value1 = 0;
    int ret = OH_PrivateCommand_GetIntValue(keyCommand2, &value1);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandGetIntValueQueryFailed(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    bool valStr1 = true;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetBoolValue(keyCommand2, valStr1);
    int32_t value1;
    int ret = OH_PrivateCommand_GetIntValue(keyCommand2, &value1);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_QUERY_FAILED ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandGetStrValueNullPointer(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    std::string valStr1 = "testValue_2";
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetStrValue(keyCommand2, const_cast<char *>(valStr1.c_str()), valStr1.length());
    const char *strValue = nullptr;
    size_t strValueLength = 0;
    int ret = OH_PrivateCommand_GetStrValue(nullptr, &strValue, &strValueLength);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_NULL_POINTER ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandGetStrValueOk(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    std::string valStr1 = "testValue_2";
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetStrValue(keyCommand2, const_cast<char *>(valStr1.c_str()), valStr1.length());
    const char *strValue = nullptr;
    size_t strValueLength = 0;
    int ret = OH_PrivateCommand_GetStrValue(keyCommand2, &strValue, &strValueLength);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_OK ? 0 : -1, &result);
    return result;
}

napi_value TestOhPrivateCommandGetStrValueQueryFailed(napi_env env, napi_callback_info info)
{
    std::string keyStr1 = "testKey_1";
    int32_t value = 10;
    InputMethod_PrivateCommand *keyCommand2 = nullptr;
    keyCommand2 = OH_PrivateCommand_Create(const_cast<char *>(keyStr1.c_str()), keyStr1.length());
    OH_PrivateCommand_SetIntValue(keyCommand2, value);
    const char *strValue = nullptr;
    size_t strValueLength = 0;
    int ret = OH_PrivateCommand_GetStrValue(keyCommand2, &strValue, &strValueLength);
    napi_value result;
    napi_create_int32(env, ret == InputMethod_ErrorCode::IME_ERR_QUERY_FAILED ? 0 : -1, &result);
    return result;
}