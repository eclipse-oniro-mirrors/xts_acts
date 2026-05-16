/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
#include "napi_json_test.h"
#include "napi/napi_json_test.h"
const size_t BUF_SIZE_MAX = 128;
//OH_JSVM_JsonParse
//null string
[[maybe_unused]] JSVM_Value TestJsonParseTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strJson = "";
    JSVM_Value rstJsonValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateStringUtf8(env, strJson, JSVM_AUTO_LENGTH, &rstJsonValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonParseTest1: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    JSVM_Value rstJsonString;
    status = OH_JSVM_JsonParse(env, rstJsonValue, &rstJsonString);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonParseTest1: OH_JSVM_JsonParse Failed");
        return nullptr;
    }
    JSVM_Value rstError = nullptr;
    status = OH_JSVM_GetAndClearLastException(env, &rstError);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonParseTest1: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//error js string
[[maybe_unused]] JSVM_Value TestJsonParseTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strJson = "{\"name\" \"John\", \"age\": 30, \"city\": \"ChongQing\"}";
    JSVM_Value rstJsonValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateStringUtf8(env, strJson, JSVM_AUTO_LENGTH, &rstJsonValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonParseTest2: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    JSVM_Value rstJsonString;
    status = OH_JSVM_JsonParse(env, rstJsonValue, &rstJsonString);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonParseTest2: OH_JSVM_JsonParse Failed");
        return nullptr;
    }
    JSVM_Value rstError = nullptr;
    status = OH_JSVM_GetAndClearLastException(env, &rstError);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonParseTest1: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//json string, return ok
[[maybe_unused]] JSVM_Value TestJsonParseTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strJson = "{\"name\": \"John\", \"age\": 30, \"city\": \"ChongQing\"}";
    JSVM_Value rstJsonValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateStringUtf8(env, strJson, JSVM_AUTO_LENGTH, &rstJsonValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonParseTest3: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    JSVM_Value rstJsonString;
    status = OH_JSVM_JsonParse(env, rstJsonValue, &rstJsonString);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonParseTest3: OH_JSVM_JsonParse Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//OH_JSVM_JsonStringify
//jsonObject is nullptr，return n-ok
[[maybe_unused]] JSVM_Value TestJsonStringifyTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value rstJsonValue = nullptr;
    JSVM_Status status = OH_JSVM_JsonStringify(env, nullptr, &rstJsonValue);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonStringifyTest1: OH_JSVM_JsonStringify Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//jsonObject为object对象，预期接口返回jsvmok, result预期结果为空序列
[[maybe_unused]] JSVM_Value TestJsonStringifyTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value jsonObject = nullptr;
    JSVM_Status status = OH_JSVM_CreateObject(env, &jsonObject);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonStringifyTest2: OH_JSVM_CreateObject Failed");
        return nullptr;
    }
    JSVM_Value rstJsonString = nullptr;
    status = OH_JSVM_JsonStringify(env, jsonObject, &rstJsonString);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonStringifyTest2: OH_JSVM_JsonStringify Failed");
        return nullptr;
    }
    char strGetBuf[BUF_SIZE_MAX] = {0};
    size_t strLength = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstJsonString, strGetBuf, BUF_SIZE_MAX, &strLength);
    if (strcmp("", strGetBuf) == 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonStringifyTest1: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//jsonobject is TypedArray object，return jsvm ok
[[maybe_unused]] JSVM_Value TestJsonStringifyTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t arrayBufferSize = BUF_SIZE_MAX;
    const size_t typedArrayLength = 1;
    JSVM_Value jsonValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonStringifyTest3: OH_JSVM_CreateArraybuffer Failed");
        return nullptr;
    }
    status = OH_JSVM_CreateTypedarray(env, JSVM_INT8_ARRAY, typedArrayLength, arrayBuffer, 0, &jsonValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonStringifyTest3: OH_JSVM_CreateTypedarray Failed");
    }

    JSVM_Value rstJsonString;
    status = OH_JSVM_JsonStringify(env, jsonValue, &rstJsonString);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonStringifyTest3: OH_JSVM_JsonStringify Failed");
        return nullptr;
    }
    char jsonStrBuf[BUF_SIZE_MAX] = {0};
    size_t rstLength = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstJsonString, jsonStrBuf, BUF_SIZE_MAX, &rstLength);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonStringifyTest3: OH_JSVM_JsonStringify Failed");
        return nullptr;
    }
    if (rstLength != strlen(jsonStrBuf)) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonStringifyTest3: rstLength != arrayBufferSize");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//string -- parse
[[maybe_unused]] JSVM_Value TestJsonCombinationTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    // create object
    JSVM_Value jsonObject = nullptr;
    JSVM_Status status = OH_JSVM_CreateObject(env, &jsonObject);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonCombinationTest1: OH_JSVM_CreateObject Failed");
        return nullptr;
    }
    // set property
    char* strJsonValue = "key value";
    JSVM_Value jsonValue = nullptr;
    char* strJsonKey = "key";
    JSVM_Value jsonKey = nullptr;
    status = OH_JSVM_CreateStringUtf8(env, strJsonKey, JSVM_AUTO_LENGTH, &jsonKey);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonCombinationTest1: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    status = OH_JSVM_CreateStringUtf8(env, strJsonValue, JSVM_AUTO_LENGTH, &jsonValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonCombinationTest1: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    status = OH_JSVM_SetProperty(env, jsonObject, jsonKey, jsonValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonCombinationTest1: OH_JSVM_SetProperty Failed");
        return nullptr;
    }
    JSVM_Value rstJsonString = nullptr;
    status = OH_JSVM_JsonStringify(env, jsonObject, &rstJsonString);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonCombinationTest1: OH_JSVM_JsonStringify Failed");
        return nullptr;
    }
    //parse string
    JSVM_Value rstJsonParseStr = nullptr;
    status = OH_JSVM_JsonParse(env, rstJsonString, &rstJsonParseStr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonCombinationTest1: OH_JSVM_JsonParse Failed");
        return nullptr;
    }
    char strGetBuf[BUF_SIZE_MAX] = {0};
    size_t strLength = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstJsonParseStr, strGetBuf, BUF_SIZE_MAX, &strLength);
    if (status != JSVM_STRING_EXPECTED) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonCombinationTest1: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    char strGetObjBuf[BUF_SIZE_MAX] = {0};
    size_t strObjLength = 0;
    status = OH_JSVM_GetValueStringUtf8(env, jsonObject, strGetObjBuf, BUF_SIZE_MAX, &strObjLength);
    if (status != JSVM_STRING_EXPECTED) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonCombinationTest1: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (strcmp(strGetObjBuf, strGetBuf) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestJsonCombinationTest1: strGetObjBuf != strGetBuf");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}