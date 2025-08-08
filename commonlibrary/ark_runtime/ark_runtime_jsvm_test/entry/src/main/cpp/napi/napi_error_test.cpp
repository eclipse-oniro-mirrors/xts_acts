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
#include "napi_error_test.h"
const size_t ERROR_BUF_SIZE_MAX = 128;
// CreateError interface
[[maybe_unused]] JSVM_Value TestCreateErrorTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "0", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateErrortest1: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// return not null
[[maybe_unused]] JSVM_Value TestCreateErrorTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "-3", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateErrortest2: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// msg is null， return not null
[[maybe_unused]] JSVM_Value TestCreateErrorTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "3", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateErrortest3: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// code is “0”， msg is not null，result is nullptr
[[maybe_unused]] JSVM_Value TestCreateErrorTest4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "0", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Status creatStatus = OH_JSVM_CreateError(env, errorCode, errorMsg, nullptr);
    if (creatStatus == JSVM_OK) {
        printf("OH_JSVM_CreateError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateErrortest4: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//code is string，msg is not null，result is not null
[[maybe_unused]] JSVM_Value TestCreateErrorTest5(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "error code", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateErrortest5: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
///CreateTypeError interface
//code is “0”， msg is not null，result is not null
[[maybe_unused]] JSVM_Value TestCreateTypeErrorTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "0", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateTypeError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateTypeError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateTypeErrortest1: OH_JSVM_CreateTypeError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// code为 -3，msg is not null，result is not null
[[maybe_unused]] JSVM_Value TestCreateTypeErrorTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "-3", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateTypeError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateTypeError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateTypeErrortest2: OH_JSVM_CreateTypeError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// code is 3，msg is not null，result is not null
[[maybe_unused]] JSVM_Value TestCreateTypeErrorTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "3", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateTypeError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateTypeError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateTypeErrortest3: OH_JSVM_CreateTypeError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// code is “0”， msg is not null，result is nullptr
[[maybe_unused]] JSVM_Value TestCreateTypeErrorTest4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "0", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Status creatStatus = OH_JSVM_CreateTypeError(env, errorCode, errorMsg, nullptr);
    if (creatStatus == JSVM_OK) {
        printf("OH_JSVM_CreateTypeError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateErrortest4: OH_JSVM_CreateTypeError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//code is string，msg is not null，result is not null
[[maybe_unused]] JSVM_Value TestCreateTypeErrorTest5(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "error code", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateTypeError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateTypeError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateErrortest5: OH_JSVM_CreateTypeError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
///CreateRangeError interface
//code is "0"， msg is not null，result is not null
[[maybe_unused]] JSVM_Value TestCreateRangeErrorTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "0", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateRangeError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateRangeError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateRangeErrortest1: OH_JSVM_CreateRangeError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// code is "-3"，msg is not null，result is not null
[[maybe_unused]] JSVM_Value TestCreateRangeErrorTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "-3", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateRangeError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateRangeError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateRangeErrortest2: OH_JSVM_CreateRangeError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// code is null，msg is not null，result is not null
[[maybe_unused]] JSVM_Value TestCreateRangeErrorTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "3", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateRangeError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateRangeError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateRangeErrortest3: OH_JSVM_CreateRangeError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// code is "0"， msg is not null，result is nullptr
[[maybe_unused]] JSVM_Value TestCreateRangeErrorTest4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "3", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Status creatStatus = OH_JSVM_CreateRangeError(env, errorCode, errorMsg, nullptr);
    if (creatStatus == JSVM_OK) {
        printf("OH_JSVM_CreateRangeError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateRangeErrortest4: OH_JSVM_CreateRangeError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//code is string，msg is not null，result is not null
[[maybe_unused]] JSVM_Value TestCreateRangeErrorTest5(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "error code", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateRangeError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateRangeError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateRangeErrortest5: OH_JSVM_CreateRangeError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
///CreateSyntaxError interface
//code is "0"， msg is not null，result is not null
[[maybe_unused]] JSVM_Value TestCreateSyntaxErrorTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "0", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateSyntaxError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateSyntaxError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateSyntaxErrortest1: OH_JSVM_CreateSyntaxError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// code is "-3"，msg is not null，result is not null
[[maybe_unused]] JSVM_Value TestCreateSyntaxErrorTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "-3", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateSyntaxError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateSyntaxError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateSyntaxErrortest2: OH_JSVM_CreateSyntaxError Failed");
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// code is "3"，msg is not null，result is not null
[[maybe_unused]] JSVM_Value TestCreateSyntaxErrorTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "3", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateSyntaxError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateSyntaxError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateSyntaxErrortest3: OH_JSVM_CreateSyntaxError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// code is "0"， msg is not null，result is nullptr
[[maybe_unused]] JSVM_Value TestCreateSyntaxErrorTest4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "0", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Status creatStatus = OH_JSVM_CreateSyntaxError(env, errorCode, errorMsg, nullptr);
    if (creatStatus == JSVM_OK) {
        printf("OH_JSVM_CreateSyntaxError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateSyntaxErrortest4: OH_JSVM_CreateSyntaxError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//code is string，msg is not null，result is not null
[[maybe_unused]] JSVM_Value TestCreateSyntaxErrorTest5(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "error code", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateSyntaxError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateSyntaxError Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestCreateSyntaxErrortest5: OH_JSVM_CreateSyntaxError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//Throw interface
//error is not javascript error
[[maybe_unused]] JSVM_Value TestThrowTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    int32_t iNum = 3;
    JSVM_Value rstNumValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateInt32(env, iNum, &rstNumValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowtest1: OH_JSVM_CreateInt32 Failed");
        return nullptr;
    }

    JSVM_Status creatStatus = OH_JSVM_Throw(env, rstNumValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowtest1: OH_JSVM_Throw Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowtest1: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//error is CreateError js error
[[maybe_unused]] JSVM_Value TestThrowTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrCode = "error code";
    JSVM_Value errCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrCode, JSVM_AUTO_LENGTH, &errCode);
    
    const char* strErrMsg = "error msg";
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrMsg, JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value errCreateInfo = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateError(env, errCode, errorMsg, &errCreateInfo);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowtest2: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    JSVM_Status throwStatus = OH_JSVM_Throw(env, errCreateInfo);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowtest2: OH_JSVM_Throw Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowtest2: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//error is CreateTypeError js error
[[maybe_unused]] JSVM_Value TestThrowTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrCode = "error type code";
    JSVM_Value errCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrCode, JSVM_AUTO_LENGTH, &errCode);
    
    const char* strErrMsg = "error type msg";
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrMsg, JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value errCreateInfo = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateTypeError(env, errCode, errorMsg, &errCreateInfo);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowTest3: OH_JSVM_CreateTypeError Failed");
        return nullptr;
    }
    
    JSVM_Status throwStatus = OH_JSVM_Throw(env, errCreateInfo);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowTest3: OH_JSVM_Throw Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowTest3: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//error is CreateRangeError js error
[[maybe_unused]] JSVM_Value TestThrowTest4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strRangeErrCode = "error Range code";
    JSVM_Value errCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strRangeErrCode, JSVM_AUTO_LENGTH, &errCode);
    
    const char* strRangeErrMsg = "error Range msg";
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strRangeErrMsg, JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value errCreateInfo = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateRangeError(env, errCode, errorMsg, &errCreateInfo);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowTest4: OH_JSVM_CreateRangeError Failed");
        return nullptr;
    }
    
    JSVM_Status throwStatus = OH_JSVM_Throw(env, errCreateInfo);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowTest4: OH_JSVM_Throw Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowTest4: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//error is CreateSyntaxError js error
[[maybe_unused]] JSVM_Value TestThrowTest5(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strRangeErrCode = "error Range code";
    JSVM_Value errCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strRangeErrCode, JSVM_AUTO_LENGTH, &errCode);
    const char* strRangeErrMsg = "error Range msg";
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strRangeErrMsg, JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value errCreateInfo = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateSyntaxError(env, errCode, errorMsg, &errCreateInfo);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowtest5: OH_JSVM_CreateSyntaxError Failed");
        return nullptr;
    }
    
    JSVM_Status throwStatus = OH_JSVM_Throw(env, errCreateInfo);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowtest5: OH_JSVM_Throw Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowtest5: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//error is javascript Error
[[maybe_unused]] JSVM_Value TestThrowTest6(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Status throwStatus = OH_JSVM_Throw(env, argv[0]);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowtest6: OH_JSVM_Throw Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowtest6: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowError
//code is not null，msg is nullptr
[[maybe_unused]] JSVM_Value TestThrowErrorTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* errCode = "error code";
    JSVM_Status throwStatus = OH_JSVM_ThrowError(env, errCode, nullptr);
    if (throwStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowErrortest1: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowErrortest1: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//code is nullptr，msg is not null
[[maybe_unused]] JSVM_Value TestThrowErrorTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* errMsg = "error msg";
    JSVM_Status throwStatus = OH_JSVM_ThrowError(env, nullptr, errMsg);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowErrortest2: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowErrortest2: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//code is not null，msg is not null
[[maybe_unused]] JSVM_Value TestThrowErrorTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* errCode = "error code";
    const char* errMsg = "error msg";
    JSVM_Status throwStatus = OH_JSVM_ThrowError(env, errCode, errMsg);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowErrortest3: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowErrortest3: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowTypeError
//code is not null，msg is nullptr
[[maybe_unused]] JSVM_Value TestThrowTypeErrorTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* errCode = "error type code";
    JSVM_Status throwStatus = OH_JSVM_ThrowTypeError(env, errCode, nullptr);
    if (throwStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowTypeErrortest1: OH_JSVM_ThrowTypeError Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowTypeErrortest1: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//code is nullptr，msg is not null
[[maybe_unused]] JSVM_Value TestThrowTypeErrorTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* errMsg = "error type msg";
    JSVM_Status throwStatus = OH_JSVM_ThrowTypeError(env, nullptr, errMsg);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowTypeErrortest2: OH_JSVM_ThrowTypeError Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowTypeErrortest2: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//code is not null，msg is not null
[[maybe_unused]] JSVM_Value TestThrowTypeErrorTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* errCode = "error type code";
    const char* errMsg = "error type msg";
    JSVM_Status throwStatus = OH_JSVM_ThrowTypeError(env, errCode, errMsg);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowTypeErrortest3: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowTypeErrortest3: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowRangeError
//code is not null，msg is nullptr
[[maybe_unused]] JSVM_Value TestThrowRangeErrorTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* errCode = "error Range code";
    JSVM_Status throwStatus = OH_JSVM_ThrowRangeError(env, errCode, nullptr);
    if (throwStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowRangeErrortest1: OH_JSVM_ThrowRangeError Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowRangeErrortest1: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//code is nullptr，msg is not null
[[maybe_unused]] JSVM_Value TestThrowRangeErrorTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* errMsg = "error Range msg";
    JSVM_Status throwStatus = OH_JSVM_ThrowRangeError(env, nullptr, errMsg);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowRangeErrortest2: OH_JSVM_ThrowRangeError Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowRangeErrortest2: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//code is not null，msg is not null
[[maybe_unused]] JSVM_Value TestThrowRangeErrorTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* errCode = "error Range code";
    const char* errMsg = "error Range msg";
    JSVM_Status throwStatus = OH_JSVM_ThrowRangeError(env, errCode, errMsg);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowRangeErrortest3: OH_JSVM_ThrowRangeError Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowRangeErrortest3: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowSyntaxError
//code is not null，msg is nullptr
[[maybe_unused]] JSVM_Value TestThrowSyntaxErrorTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* errCode = "error Syntax code";
    JSVM_Status throwStatus = OH_JSVM_ThrowSyntaxError(env, errCode, nullptr);
    if (throwStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowSyntaxErrorTest1: OH_JSVM_ThrowSyntaxError Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowSyntaxErrorTest1: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//code is nullptr，msg is not null
[[maybe_unused]] JSVM_Value TestThrowSyntaxErrorTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* errMsg = "error Syntax msg";
    JSVM_Status throwStatus = OH_JSVM_ThrowSyntaxError(env, nullptr, errMsg);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowSyntaxErrorTest2: OH_JSVM_ThrowSyntaxError Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowSyntaxErrorTest2: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//code is not null，msg is not null
[[maybe_unused]] JSVM_Value TestThrowSyntaxErrorTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* errCode = "error Syntax code";
    const char* errMsg = "error Syntax msg";
    JSVM_Status throwStatus = OH_JSVM_ThrowSyntaxError(env, errCode, errMsg);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowSyntaxErrorTest3: OH_JSVM_ThrowSyntaxError Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestThrowSyntaxErrorTest3: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//IsError
//value is error object，result is nullptr
[[maybe_unused]] JSVM_Value TestIsErrorTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "error code", JSVM_AUTO_LENGTH, &errorCode);
    
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, "not null", JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsErrorTest1: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    JSVM_Status rstStatus = OH_JSVM_IsError(env, rstValue, nullptr);
    if (rstStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsErrorTest1: OH_JSVM_IsError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//vaule is not error object，result is not null
[[maybe_unused]] JSVM_Value TestIsErrorTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bRst = false;
    JSVM_Status rstStatus = OH_JSVM_IsError(env, argv[0], &bRst);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsErrorTest2: OH_JSVM_IsError status Failed");
    }
    
    if (bRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsErrorTest2: OH_JSVM_IsError bool Failed");
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//GetAndClearLastException
//result is not null，exist error
[[maybe_unused]] JSVM_Value TestGetAndClearLastExceptionTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    // throw error
    OH_JSVM_ThrowError(env, "create error code", "create error msg");
    JSVM_Value rstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_GetAndClearLastException(env, &rstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr,
            "TestGetAndClearLastExceptionTest1: OH_JSVM_GetAndClearLastException status Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//result is not null，not exist error
[[maybe_unused]] JSVM_Value TestGetAndClearLastExceptionTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_GetAndClearLastException(env, &rstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr,
            "TestGetAndClearLastExceptionTest2: OH_JSVM_GetAndClearLastException status Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//result is nullptr
[[maybe_unused]] JSVM_Value TestGetAndClearLastExceptionTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Status rstStatus = OH_JSVM_GetAndClearLastException(env, nullptr);
    if (rstStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr,
            "TestGetAndClearLastExceptionTest3: OH_JSVM_GetAndClearLastException status Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//IsExceptionPending
//result is not null，
[[maybe_unused]] JSVM_Value TestIsExceptionPendingTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    // throw error
    OH_JSVM_ThrowError(env, "create error code", "create error msg");
    bool bRst = false;
    JSVM_Status rstStatus = OH_JSVM_IsExceptionPending(env, &bRst);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsExceptionPendingTest1: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (!bRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsExceptionPendingTest1: OH_JSVM_IsExceptionPending result Failed");
    }
    JSVM_Value getAndClearValue = nullptr;
    JSVM_Status getAndClearErr = OH_JSVM_GetAndClearLastException(env, &getAndClearValue);
    if (getAndClearErr != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr,
            "TestIsExceptionPendingTest1: OH_JSVM_GetAndClearLastException status Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//result is not null
[[maybe_unused]] JSVM_Value TestIsExceptionPendingTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    // throw error
    OH_JSVM_ThrowError(env, "create error code", "create error msg");
    
    JSVM_Value rstErrorValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_GetAndClearLastException(env, &rstErrorValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr,
            "TestIsExceptionPendingTest2: OH_JSVM_GetAndClearLastException status Failed");
        return nullptr;
    }
    
    bool bRst = false;
    JSVM_Status rstPendingStatus = OH_JSVM_IsExceptionPending(env, &bRst);
    if (rstPendingStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsExceptionPendingTest2: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (bRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsExceptionPendingTest2: OH_JSVM_IsExceptionPending result Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//result is nullptr
[[maybe_unused]] JSVM_Value TestIsExceptionPendingTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    JSVM_Status rstStatus = OH_JSVM_IsExceptionPending(env, nullptr);
    if (rstStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsExceptionPendingTest3: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//GetLastErrorInfo
//result is not null
[[maybe_unused]] JSVM_Value TestGetLastErrorInfoTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    int32_t rstInt = 0;
    JSVM_Status getErrStatus = OH_JSVM_GetValueInt32(env, argv[0], &rstInt);
    if (getErrStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetLastErrorInfoTest1: OH_JSVM_GetValueInt32 status Failed");
        return nullptr;
    }
    
    const JSVM_ExtendedErrorInfo* pError = nullptr;
    JSVM_Status rstStatus = OH_JSVM_GetLastErrorInfo(env, &pError);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetLastErrorInfoTest1: OH_JSVM_GetLastErrorInfo status Failed");
        return nullptr;
    }
    if (pError->errorCode != getErrStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetLastErrorInfoTest1: OH_JSVM_GetLastErrorInfo errorCode Failed");
    }
    
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus = OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr,
            "TestGetLastErrorInfoTest1: OH_JSVM_GetAndClearLastException status Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//result is not null
[[maybe_unused]] JSVM_Value TestGetLastErrorInfoTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const JSVM_ExtendedErrorInfo* pError = nullptr;
    JSVM_Status rstStatus = OH_JSVM_GetLastErrorInfo(env, &pError);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetLastErrorInfoTest2: OH_JSVM_GetLastErrorInfo status Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//result is nullptr
[[maybe_unused]] JSVM_Value TestGetLastErrorInfoTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Status rstStatus = OH_JSVM_GetLastErrorInfo(env, nullptr);
    if (rstStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetLastErrorInfoTest3: OH_JSVM_GetLastErrorInfo status Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CreateError-> isError->Throw
[[maybe_unused]] JSVM_Value TestCombinationTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char* strErrCode = "create error code";
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrCode, JSVM_AUTO_LENGTH, &errorCode);
    
    const char* strErrMsg = "create error Msg";
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrMsg, JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest1: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    bool bIsError = false;
    JSVM_Status rstStatus = OH_JSVM_IsError(env, rstValue, &bIsError);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest1: OH_JSVM_IsError Failed");
        return nullptr;
    }
    if (!bIsError) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest1: OH_JSVM_IsError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThowStatus = OH_JSVM_Throw(env, rstValue);
    if (JSVM_OK != rstThowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest1: OH_JSVM_Throw Failed");
        return nullptr;
    }
    
    const JSVM_ExtendedErrorInfo* pErrorInfo = nullptr;
    JSVM_Status rstExtendedStatus = OH_JSVM_GetLastErrorInfo(env, &pErrorInfo);
    if (JSVM_OK != rstExtendedStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest1: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    if (pErrorInfo->errorCode != rstThowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest1: OH_JSVM_GetLastErrorInfo errorCode Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest1: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CreateTypeError-> isError->Throw
[[maybe_unused]] JSVM_Value TestCombinationTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char* strErrCode = "create type error code";
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrCode, JSVM_AUTO_LENGTH, &errorCode);
    
    const char* strErrMsg = "create type error message";
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrMsg, JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateTypeError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest2: OH_JSVM_CreateTypeError Failed");
        return nullptr;
    }
    
    bool bIsError = false;
    JSVM_Status rstStatus = OH_JSVM_IsError(env, rstValue, &bIsError);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest2: OH_JSVM_IsError Failed");
        return nullptr;
    }
    if (!bIsError) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest2: OH_JSVM_IsError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThowStatus = OH_JSVM_Throw(env, rstValue);
    if (JSVM_OK != rstThowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest2: OH_JSVM_Throw Failed");
        return nullptr;
    }
    
    const JSVM_ExtendedErrorInfo* pErrorInfo = nullptr;
    JSVM_Status rstExtendedStatus = OH_JSVM_GetLastErrorInfo(env, &pErrorInfo);
    if (JSVM_OK != rstExtendedStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest2: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    if (pErrorInfo->errorCode != rstThowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest2: OH_JSVM_GetLastErrorInfo errorCode Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest2: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CreateRangeError-> isError->Throw
[[maybe_unused]] JSVM_Value TestCombinationTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char* strErrRangeCode = "create Range error code";
    JSVM_Value errorRangeCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangeCode, JSVM_AUTO_LENGTH, &errorRangeCode);
    const char* strErrRangeMsg = "create Range error message";
    JSVM_Value errorRangeMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangeMsg, JSVM_AUTO_LENGTH, &errorRangeMsg);
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateRangeError(env, errorRangeCode, errorRangeMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest3: OH_JSVM_CreateRangeError Failed");
        return nullptr;
    }
    bool bIsError = false;
    JSVM_Status rstStatus = OH_JSVM_IsError(env, rstValue, &bIsError);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest3: OH_JSVM_IsError Failed");
        return nullptr;
    }
    if (!bIsError) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest3: OH_JSVM_IsError Failed");
        return nullptr;
    }
    JSVM_Status rstThowStatus = OH_JSVM_Throw(env, rstValue);
    if (JSVM_OK != rstThowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest3: OH_JSVM_Throw Failed");
        return nullptr;
    }
    const JSVM_ExtendedErrorInfo* pErrorInfo = nullptr;
    JSVM_Status rstExtendedStatus = OH_JSVM_GetLastErrorInfo(env, &pErrorInfo);
    if (JSVM_OK != rstExtendedStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest3: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    if (pErrorInfo->errorCode != rstThowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest3: OH_JSVM_GetLastErrorInfo errorCode Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest3: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CreateSyntaxError-> isError->Throw
[[maybe_unused]] JSVM_Value TestCombinationTest4(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char* strErrSyntaxCode = "create Syntax error code";
    JSVM_Value errorSyntaxCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxCode, JSVM_AUTO_LENGTH, &errorSyntaxCode);
    
    const char* strErrSyntaxMsg = "create Syntax error message";
    JSVM_Value errorSyntaxMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxMsg, JSVM_AUTO_LENGTH, &errorSyntaxMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateSyntaxError(env, errorSyntaxCode, errorSyntaxMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest4: OH_JSVM_CreateSyntaxError Failed");
        return nullptr;
    }
    
    bool bIsError = false;
    JSVM_Status rstStatus = OH_JSVM_IsError(env, rstValue, &bIsError);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest4: OH_JSVM_IsError Failed");
        return nullptr;
    }
    if (!bIsError) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest4: OH_JSVM_IsError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThrowStatus = OH_JSVM_Throw(env, rstValue);
    if (JSVM_OK != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest4: OH_JSVM_Throw Failed");
        return nullptr;
    }
    
    const JSVM_ExtendedErrorInfo* pErrorInfo = nullptr;
    JSVM_Status rstExtendedStatus = OH_JSVM_GetLastErrorInfo(env, &pErrorInfo);
    if (JSVM_OK != rstExtendedStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest4: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    if (pErrorInfo->errorCode != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest4: OH_JSVM_GetLastErrorInfo errorCode Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest4: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowError
[[maybe_unused]] JSVM_Value TestCombinationTest5(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrCode = "create error code";
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrCode, JSVM_AUTO_LENGTH, &errorCode);
    
    const char* strErrMsg = "create error message";
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrMsg, JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest5: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThowStatus = OH_JSVM_ThrowError(env, "create error code", "create error message");
    if (JSVM_OK != rstThowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest5: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    
    const JSVM_ExtendedErrorInfo* pErrorInfo = nullptr;
    JSVM_Status rstExtendedStatus = OH_JSVM_GetLastErrorInfo(env, &pErrorInfo);
    if (JSVM_OK != rstExtendedStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest5: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    if (pErrorInfo->errorCode != rstThowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest5: OH_JSVM_GetLastErrorInfo errorCode Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest5: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowTypeError
[[maybe_unused]] JSVM_Value TestCombinationTest6(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrTypeCode = "create type error code";
    JSVM_Value errorTypeCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrTypeCode, JSVM_AUTO_LENGTH, &errorTypeCode);
    
    const char* strErrTypeMsg = "create type error message";
    JSVM_Value errorTypeMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrTypeMsg, JSVM_AUTO_LENGTH, &errorTypeMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateTypeError(env, errorTypeCode, errorTypeMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest6: OH_JSVM_CreateTypeError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThowStatus = OH_JSVM_ThrowTypeError(env, "create type error code", "create type error message");
    if (JSVM_OK != rstThowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest6: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    
    const JSVM_ExtendedErrorInfo* pErrorInfo = nullptr;
    JSVM_Status rstExtendedStatus = OH_JSVM_GetLastErrorInfo(env, &pErrorInfo);
    if (JSVM_OK != rstExtendedStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest6: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    if (pErrorInfo->errorCode != rstThowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest6: OH_JSVM_GetLastErrorInfo errorCode Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest6: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowRangeError
[[maybe_unused]] JSVM_Value TestCombinationTest7(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrRangCode = "create Range error code";
    JSVM_Value errorRangeCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangCode, JSVM_AUTO_LENGTH, &errorRangeCode);
    
    const char* strErrRangeMsg = "create Range error message";
    JSVM_Value errorRangeMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangeMsg, JSVM_AUTO_LENGTH, &errorRangeMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateRangeError(env, errorRangeCode, errorRangeMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest7: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThrowStatus = OH_JSVM_ThrowError(env, strErrRangCode, strErrRangeMsg);
    if (JSVM_OK != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest7: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    
    const JSVM_ExtendedErrorInfo* pErrorInfo = nullptr;
    JSVM_Status rstExtendedStatus = OH_JSVM_GetLastErrorInfo(env, &pErrorInfo);
    if (JSVM_OK != rstExtendedStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest7: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    if (pErrorInfo->errorCode != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest7: OH_JSVM_GetLastErrorInfo errorCode Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest7: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowSyntaxError->
[[maybe_unused]] JSVM_Value TestCombinationTest8(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrSyntaxCode = "create Syntax error code";
    JSVM_Value errorSyntaxCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxCode, JSVM_AUTO_LENGTH, &errorSyntaxCode);
    
    const char* strErrSyntaxMsg = "create Syntax error message";
    JSVM_Value errorSyntaxMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxMsg, JSVM_AUTO_LENGTH, &errorSyntaxMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateRangeError(env, errorSyntaxCode, errorSyntaxMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest8: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThrowStatus = OH_JSVM_ThrowError(env, strErrSyntaxCode, strErrSyntaxMsg);
    if (JSVM_OK != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest8: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    
    const JSVM_ExtendedErrorInfo* pErrorInfo = nullptr;
    JSVM_Status rstExtendedStatus = OH_JSVM_GetLastErrorInfo(env, &pErrorInfo);
    if (JSVM_OK != rstExtendedStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest8: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    if (pErrorInfo->errorCode != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest8: OH_JSVM_GetLastErrorInfo errorCode Failed");
        return nullptr;
    }
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest8: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CreateError-> isError->Throw->IsExceptionPending -> GetAndClearLastException
//-> IsExceptionPending
[[maybe_unused]] JSVM_Value TestCombinationTest9(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrCode = "create error code";
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrCode, JSVM_AUTO_LENGTH, &errorCode);
    
    const char* strErrMsg = "create error message";
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrMsg, JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    bool bRstErr = false;
    JSVM_Status isErrStatus = OH_JSVM_IsError(env, rstValue, &bRstErr);
    if (JSVM_OK != isErrStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9: OH_JSVM_IsError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThrowStatus = OH_JSVM_ThrowError(env, strErrCode, strErrMsg);
    if (JSVM_OK != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    
    bool bRstPending = false;
    JSVM_Status rstPendingStatus = OH_JSVM_IsExceptionPending(env, &bRstPending);
    if (rstPendingStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (!bRstPending) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    JSVM_Value rstGetValue = nullptr;
    JSVM_Status rstGetStatus = OH_JSVM_GetAndClearLastException(env, &rstGetValue);
    if (rstGetStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    JSVM_Value getErrorMsg = nullptr;
    JSVM_Status rstGetMsgStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "message", &getErrorMsg);
    if (rstGetMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    JSVM_Value getErrorCode = nullptr;
    JSVM_Status rstGetCodeStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "code", &getErrorCode);
    if (rstGetCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    char strGetErrMsg[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringMsgStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                getErrorMsg,
                                                                strGetErrMsg,
                                                                ERROR_BUF_SIZE_MAX,
                                                                nullptr);
    if (getStringMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    char strGetErrCode[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringCodeStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                 getErrorCode,
                                                                 strGetErrCode,
                                                                 ERROR_BUF_SIZE_MAX,
                                                                 nullptr);
    if (getStringCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    if (strcmp(strErrCode, strGetErrCode) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9:  strcmp error code Failed");
        return nullptr;
    }
    if (strcmp(strErrMsg, strGetErrMsg) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9:  strcmp error Msg Failed");
        return nullptr;
    }
    
    bool bRstPending2 = false;
    JSVM_Status rstPendingStatus2 = OH_JSVM_IsExceptionPending(env, &bRstPending2);
    if (rstPendingStatus2 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (bRstPending2) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest9: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CreateTypeError-> isError->Throw->IsExceptionPending-> GetAndClearLastException
//-> IsExceptionPending
[[maybe_unused]] JSVM_Value TestCombinationTest10(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrTypeCode = "create error code";
    JSVM_Value errorTypeCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrTypeCode, JSVM_AUTO_LENGTH, &errorTypeCode);
    
    const char* strErrTypeMsg = "create error message";
    JSVM_Value errorTypeMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrTypeMsg, JSVM_AUTO_LENGTH, &errorTypeMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateTypeError(env, errorTypeCode, errorTypeMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10: OH_JSVM_CreateTypeError Failed");
        return nullptr;
    }
    
    bool bRstErr = false;
    JSVM_Status isErrStatus = OH_JSVM_IsError(env, rstValue, &bRstErr);
    if (JSVM_OK != isErrStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10: OH_JSVM_IsError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThrowStatus = OH_JSVM_ThrowTypeError(env, strErrTypeCode, strErrTypeMsg);
    if (JSVM_OK != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    
    bool bRstPending = false;
    JSVM_Status rstPendingStatus = OH_JSVM_IsExceptionPending(env, &bRstPending);
    if (rstPendingStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (!bRstPending) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    JSVM_Value rstGetValue = nullptr;
    JSVM_Status rstGetStatus = OH_JSVM_GetAndClearLastException(env, &rstGetValue);
    if (rstGetStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    JSVM_Value getErrorMsg = nullptr;
    JSVM_Status rstGetMsgStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "message", &getErrorMsg);
    if (rstGetMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    JSVM_Value getErrorCode = nullptr;
    JSVM_Status rstGetCodeStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "code", &getErrorCode);
    if (rstGetCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    char strGetErrMsg[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringMsgStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                getErrorMsg,
                                                                strGetErrMsg,
                                                                ERROR_BUF_SIZE_MAX,
                                                                nullptr);
    if (getStringMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    char strGetErrCode[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringCodeStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                 getErrorCode,
                                                                 strGetErrCode,
                                                                 ERROR_BUF_SIZE_MAX,
                                                                 nullptr);
    if (getStringCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    if (strcmp(strErrTypeCode, strGetErrCode) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10:  strcmp error code Failed");
        return nullptr;
    }
    if (strcmp(strErrTypeMsg, strGetErrMsg) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10:  strcmp error Msg Failed");
        return nullptr;
    }
    
    bool bRstPending2 = false;
    JSVM_Status rstPendingStatus2 = OH_JSVM_IsExceptionPending(env, &bRstPending2);
    if (rstPendingStatus2 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (bRstPending2) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest10: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CreateRangeError-> isError->Throw->IsExceptionPending -> GetAndClearLastException
//-> IsExceptionPending
[[maybe_unused]] JSVM_Value TestCombinationTest11(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrRangeCode = "create error code";
    JSVM_Value errorRangeCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangeCode, JSVM_AUTO_LENGTH, &errorRangeCode);
    
    const char* strErrRangeMsg = "create error message";
    JSVM_Value errorRangeMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangeMsg, JSVM_AUTO_LENGTH, &errorRangeMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateTypeError(env, errorRangeCode, errorRangeMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11: OH_JSVM_CreateTypeError Failed");
        return nullptr;
    }
    
    bool bRstErr = false;
    JSVM_Status isErrStatus = OH_JSVM_IsError(env, rstValue, &bRstErr);
    if (JSVM_OK != isErrStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11: OH_JSVM_IsError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThrowStatus = OH_JSVM_ThrowRangeError(env, strErrRangeCode, strErrRangeMsg);
    if (JSVM_OK != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11: OH_JSVM_ThrowRangeError Failed");
        return nullptr;
    }
    
    bool bRstPending = false;
    JSVM_Status rstPendingStatus = OH_JSVM_IsExceptionPending(env, &bRstPending);
    if (rstPendingStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (!bRstPending) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    JSVM_Value rstGetValue = nullptr;
    JSVM_Status rstGetStatus = OH_JSVM_GetAndClearLastException(env, &rstGetValue);
    if (rstGetStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    JSVM_Value getErrorMsg = nullptr;
    JSVM_Status rstGetMsgStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "message", &getErrorMsg);
    if (rstGetMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    JSVM_Value getErrorCode = nullptr;
    JSVM_Status rstGetCodeStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "code", &getErrorCode);
    if (rstGetCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    char strGetErrMsg[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringMsgStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                getErrorMsg,
                                                                strGetErrMsg,
                                                                ERROR_BUF_SIZE_MAX,
                                                                nullptr);
    if (getStringMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    char strGetErrCode[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringCodeStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                 getErrorCode,
                                                                 strGetErrCode,
                                                                 ERROR_BUF_SIZE_MAX,
                                                                 nullptr);
    if (getStringCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    if (strcmp(strErrRangeCode, strGetErrCode) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11:  strcmp error code Failed");
        return nullptr;
    }
    if (strcmp(strErrRangeMsg, strGetErrMsg) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11:  strcmp error Msg Failed");
        return nullptr;
    }
    
    bool bRstPending2 = false;
    JSVM_Status rstPendingStatus2 = OH_JSVM_IsExceptionPending(env, &bRstPending2);
    if (rstPendingStatus2 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (bRstPending2) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest11: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowSyntaxErrorr-> isError->Throw->IsExceptionPending -> GetAndClearLastException
//-> IsExceptionPending
[[maybe_unused]] JSVM_Value TestCombinationTest12(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrSyntaxCode = "create error code";
    JSVM_Value errorSyntaxCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxCode, JSVM_AUTO_LENGTH, &errorSyntaxCode);
    
    const char* strErrSyntaxMsg = "create error message";
    JSVM_Value errorSyntaxMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxMsg, JSVM_AUTO_LENGTH, &errorSyntaxMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateSyntaxError(env, errorSyntaxCode, errorSyntaxMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12: OH_JSVM_CreateSyntaxError Failed");
        return nullptr;
    }
    
    bool bRstErr = false;
    JSVM_Status isErrStatus = OH_JSVM_IsError(env, rstValue, &bRstErr);
    if (JSVM_OK != isErrStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12: OH_JSVM_IsError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThrowStatus = OH_JSVM_ThrowSyntaxError(env, strErrSyntaxCode, strErrSyntaxMsg);
    if (JSVM_OK != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12: OH_JSVM_ThrowSyntaxError Failed");
        return nullptr;
    }
    
    bool bRstPending = false;
    JSVM_Status rstPendingStatus = OH_JSVM_IsExceptionPending(env, &bRstPending);
    if (rstPendingStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (!bRstPending) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    JSVM_Value rstGetValue = nullptr;
    JSVM_Status rstGetStatus = OH_JSVM_GetAndClearLastException(env, &rstGetValue);
    if (rstGetStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    JSVM_Value getErrorMsg = nullptr;
    JSVM_Status rstGetMsgStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "message", &getErrorMsg);
    if (rstGetMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    JSVM_Value getErrorCode = nullptr;
    JSVM_Status rstGetCodeStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "code", &getErrorCode);
    if (rstGetCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    char strGetErrMsg[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringMsgStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                getErrorMsg,
                                                                strGetErrMsg,
                                                                ERROR_BUF_SIZE_MAX,
                                                                nullptr);
    if (getStringMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    char strGetErrCode[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringCodeStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                 getErrorCode,
                                                                 strGetErrCode,
                                                                 ERROR_BUF_SIZE_MAX,
                                                                 nullptr);
    if (getStringCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    if (strcmp(strErrSyntaxCode, strGetErrCode) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12:  strcmp error code Failed");
        return nullptr;
    }
    if (strcmp(strErrSyntaxMsg, strGetErrMsg) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12:  strcmp error Msg Failed");
        return nullptr;
    }
    
    bool bRstPending2 = false;
    JSVM_Status rstPendingStatus2 = OH_JSVM_IsExceptionPending(env, &bRstPending2);
    if (rstPendingStatus2 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (bRstPending2) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest12: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowError->IsExceptionPending -> GetAndClearLastException-> IsExceptionPending
[[maybe_unused]] JSVM_Value TestCombinationTest13(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrCode = "create error code";
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrCode, JSVM_AUTO_LENGTH, &errorCode);
    
    const char* strErrMsg = "create error message";
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrMsg, JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest13: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThrowStatus = OH_JSVM_ThrowError(env, strErrCode, strErrMsg);
    if (JSVM_OK != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest13: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    
    bool bRstPending = false;
    JSVM_Status rstPendingStatus = OH_JSVM_IsExceptionPending(env, &bRstPending);
    if (rstPendingStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest13: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (!bRstPending) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest13: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    JSVM_Value rstGetValue = nullptr;
    JSVM_Status rstGetStatus = OH_JSVM_GetAndClearLastException(env, &rstGetValue);
    if (rstGetStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest13: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    JSVM_Value getErrorMsg = nullptr;
    JSVM_Status rstGetMsgStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "message", &getErrorMsg);
    if (rstGetMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest13: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    JSVM_Value getErrorCode = nullptr;
    JSVM_Status rstGetCodeStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "code", &getErrorCode);
    if (rstGetCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest13: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    char strGetErrMsg[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringMsgStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                getErrorMsg,
                                                                strGetErrMsg,
                                                                ERROR_BUF_SIZE_MAX,
                                                                nullptr);
    if (getStringMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest13: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    char strGetErrCode[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringCodeStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                 getErrorCode,
                                                                 strGetErrCode,
                                                                 ERROR_BUF_SIZE_MAX,
                                                                 nullptr);
    if (getStringCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest13: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    if (strcmp(strErrCode, strGetErrCode) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest13:  strcmp error code Failed");
        return nullptr;
    }
    if (strcmp(strErrMsg, strGetErrMsg) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest13:  strcmp error Msg Failed");
        return nullptr;
    }
    
    bool bRstPending2 = false;
    JSVM_Status rstPendingStatus2 = OH_JSVM_IsExceptionPending(env, &bRstPending2);
    if (rstPendingStatus2 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest13: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (bRstPending2) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest13: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowTypeError->IsExceptionPending -> GetAndClearLastException-> IsExceptionPending
[[maybe_unused]] JSVM_Value TestCombinationTest14(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrTypeCode = "create error code";
    JSVM_Value errorTypeCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrTypeCode, JSVM_AUTO_LENGTH, &errorTypeCode);
    
    const char* strErrTypeMsg = "create error message";
    JSVM_Value errorTypeMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrTypeMsg, JSVM_AUTO_LENGTH, &errorTypeMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateTypeError(env, errorTypeCode, errorTypeMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest14: OH_JSVM_CreateTypeError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThrowStatus = OH_JSVM_ThrowTypeError(env, strErrTypeCode, strErrTypeMsg);
    if (JSVM_OK != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest14: OH_JSVM_ThrowTypeError Failed");
        return nullptr;
    }
    
    bool bRstPending = false;
    JSVM_Status rstPendingStatus = OH_JSVM_IsExceptionPending(env, &bRstPending);
    if (rstPendingStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest14: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (!bRstPending) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest14: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    JSVM_Value rstGetValue = nullptr;
    JSVM_Status rstGetStatus = OH_JSVM_GetAndClearLastException(env, &rstGetValue);
    if (rstGetStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest14: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    JSVM_Value getErrorMsg = nullptr;
    JSVM_Status rstGetMsgStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "message", &getErrorMsg);
    if (rstGetMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest14: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    JSVM_Value getErrorCode = nullptr;
    JSVM_Status rstGetCodeStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "code", &getErrorCode);
    if (rstGetCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest14: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    char strGetErrMsg[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringMsgStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                getErrorMsg,
                                                                strGetErrMsg,
                                                                ERROR_BUF_SIZE_MAX,
                                                                nullptr);
    if (getStringMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest14: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    char strGetErrCode[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringCodeStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                 getErrorCode,
                                                                 strGetErrCode,
                                                                 ERROR_BUF_SIZE_MAX,
                                                                 nullptr);
    if (getStringCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest14: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    if (strcmp(strErrTypeCode, strGetErrCode) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest14:  strcmp error code Failed");
        return nullptr;
    }
    if (strcmp(strErrTypeMsg, strGetErrMsg) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest14:  strcmp error Msg Failed");
        return nullptr;
    }
    
    bool bRstPending2 = false;
    JSVM_Status rstPendingStatus2 = OH_JSVM_IsExceptionPending(env, &bRstPending2);
    if (rstPendingStatus2 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest14: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (bRstPending2) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest14: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowRangeError->IsExceptionPending-> GetAndClearLastException-> IsExceptionPending
[[maybe_unused]] JSVM_Value TestCombinationTest15(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrRangeCode = "create error code";
    JSVM_Value errorRangeCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangeCode, JSVM_AUTO_LENGTH, &errorRangeCode);
    
    const char* strErrRangeMsg = "create error message";
    JSVM_Value errorRangeMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangeMsg, JSVM_AUTO_LENGTH, &errorRangeMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateRangeError(env, errorRangeCode, errorRangeMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest15: OH_JSVM_CreateRangeError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThrowStatus = OH_JSVM_ThrowRangeError(env, strErrRangeCode, strErrRangeMsg);
    if (JSVM_OK != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest15: OH_JSVM_ThrowRangeError Failed");
        return nullptr;
    }
    
    bool bRstPending = false;
    JSVM_Status rstPendingStatus = OH_JSVM_IsExceptionPending(env, &bRstPending);
    if (rstPendingStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest15: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (!bRstPending) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest15: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    JSVM_Value rstGetValue = nullptr;
    JSVM_Status rstGetStatus = OH_JSVM_GetAndClearLastException(env, &rstGetValue);
    if (rstGetStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest15: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    JSVM_Value getErrorMsg = nullptr;
    JSVM_Status rstGetMsgStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "message", &getErrorMsg);
    if (rstGetMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest15: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    JSVM_Value getErrorCode = nullptr;
    JSVM_Status rstGetCodeStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "code", &getErrorCode);
    if (rstGetCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest15: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    char strGetErrMsg[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringMsgStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                getErrorMsg,
                                                                strGetErrMsg,
                                                                ERROR_BUF_SIZE_MAX,
                                                                nullptr);
    if (getStringMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest15: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    char strGetErrCode[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringCodeStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                 getErrorCode,
                                                                 strGetErrCode,
                                                                 ERROR_BUF_SIZE_MAX,
                                                                 nullptr);
    if (getStringCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest15: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    if (strcmp(strErrRangeCode, strGetErrCode) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest15:  strcmp error code Failed");
        return nullptr;
    }
    if (strcmp(strErrRangeMsg, strGetErrMsg) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest15:  strcmp error Msg Failed");
        return nullptr;
    }
    
    bool bRstPending2 = false;
    JSVM_Status rstPendingStatus2 = OH_JSVM_IsExceptionPending(env, &bRstPending2);
    if (rstPendingStatus2 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest15: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (bRstPending2) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest15: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowSyntaxError->IsExceptionPending-> GetAndClearLastException-> IsExceptionPending
[[maybe_unused]] JSVM_Value TestCombinationTest16(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrSyntaxCode = "create error code";
    JSVM_Value errorSyntaxCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxCode, JSVM_AUTO_LENGTH, &errorSyntaxCode);
    
    const char* strErrSyntaxMsg = "create error message";
    JSVM_Value errorSyntaxMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxMsg, JSVM_AUTO_LENGTH, &errorSyntaxMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateSyntaxError(env, errorSyntaxCode, errorSyntaxMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest16: OH_JSVM_CreateSyntaxError Failed");
        return nullptr;
    }
    
    JSVM_Status rstThrowStatus = OH_JSVM_ThrowSyntaxError(env, strErrSyntaxCode, strErrSyntaxMsg);
    if (JSVM_OK != rstThrowStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest16: OH_JSVM_ThrowSyntaxError Failed");
        return nullptr;
    }
    
    bool bRstPending = false;
    JSVM_Status rstPendingStatus = OH_JSVM_IsExceptionPending(env, &bRstPending);
    if (rstPendingStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest16: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (!bRstPending) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest16: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    JSVM_Value rstGetValue = nullptr;
    JSVM_Status rstGetStatus = OH_JSVM_GetAndClearLastException(env, &rstGetValue);
    if (rstGetStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest16: OH_JSVM_GetLastErrorInfo Failed");
        return nullptr;
    }
    JSVM_Value getErrorMsg = nullptr;
    JSVM_Status rstGetMsgStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "message", &getErrorMsg);
    if (rstGetMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest16: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    JSVM_Value getErrorCode = nullptr;
    JSVM_Status rstGetCodeStatus = OH_JSVM_GetNamedProperty(env, rstGetValue, "code", &getErrorCode);
    if (rstGetCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest16: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    char strGetErrMsg[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringMsgStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                getErrorMsg,
                                                                strGetErrMsg,
                                                                ERROR_BUF_SIZE_MAX,
                                                                nullptr);
    if (getStringMsgStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest16: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    char strGetErrCode[ERROR_BUF_SIZE_MAX] = {0};
    JSVM_Status getStringCodeStatus = OH_JSVM_GetValueStringUtf8(env,
                                                                 getErrorCode,
                                                                 strGetErrCode,
                                                                 ERROR_BUF_SIZE_MAX,
                                                                 nullptr);
    if (getStringCodeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest16: OH_JSVM_GetValueStringUtf8 status Failed");
        return nullptr;
    }
    if (strcmp(strErrSyntaxCode, strGetErrCode) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest16:  strcmp error code Failed");
        return nullptr;
    }
    if (strcmp(strErrSyntaxMsg, strGetErrMsg) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest16:  strcmp error Msg Failed");
        return nullptr;
    }
    
    bool bRstPending2 = false;
    JSVM_Status rstPendingStatus2 = OH_JSVM_IsExceptionPending(env, &bRstPending2);
    if (rstPendingStatus2 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest16: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (bRstPending2) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest16: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CreateError->GetAndClearLastException->isError
[[maybe_unused]] JSVM_Value TestCombinationTest17(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrCode = "create error code";
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrCode, JSVM_AUTO_LENGTH, &errorCode);
    
    const char* strErrMsg = "create error message";
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrMsg, JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest17: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    JSVM_Value rstErrorValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_GetAndClearLastException(env, &rstErrorValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest17: OH_JSVM_GetAndClearLastException status Failed");
        return nullptr;
    }
    
    bool bRstErr = false;
    JSVM_Status isErrStatus = OH_JSVM_IsError(env, rstValue, &bRstErr);
    if (JSVM_OK != isErrStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest17: OH_JSVM_IsError status Failed");
        return nullptr;
    }
    if (!bRstErr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest17: OH_JSVM_IsError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CreateTypeError->GetAndClearLastException->isError
[[maybe_unused]] JSVM_Value TestCombinationTest18(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrTypeCode = "create error code";
    JSVM_Value errorTypeCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrTypeCode, JSVM_AUTO_LENGTH, &errorTypeCode);
    
    const char* strErrTypeMsg = "create error message";
    JSVM_Value errorTypeMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrTypeMsg, JSVM_AUTO_LENGTH, &errorTypeMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateTypeError(env, errorTypeCode, errorTypeMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest18: OH_JSVM_CreateTypeError Failed");
        return nullptr;
    }
    
    JSVM_Value rstErrorValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_GetAndClearLastException(env, &rstErrorValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest18: OH_JSVM_GetAndClearLastException status Failed");
        return nullptr;
    }
    
    bool bRstErr = false;
    JSVM_Status isErrStatus = OH_JSVM_IsError(env, rstValue, &bRstErr);
    if (JSVM_OK != isErrStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest18: OH_JSVM_IsError status Failed");
        return nullptr;
    }
    if (!bRstErr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest18: OH_JSVM_IsError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CreateRangeError->GetAndClearLastException->isError
[[maybe_unused]] JSVM_Value TestCombinationTest19(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrRangeCode = "create error code";
    JSVM_Value errorRangeCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangeCode, JSVM_AUTO_LENGTH, &errorRangeCode);
    
    const char* strErrRangeMsg = "create error message";
    JSVM_Value errorRangeMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangeMsg, JSVM_AUTO_LENGTH, &errorRangeMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateRangeError(env, errorRangeCode, errorRangeMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest19: OH_JSVM_CreateRangeError Failed");
        return nullptr;
    }
    
    JSVM_Value rstErrorValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_GetAndClearLastException(env, &rstErrorValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest19: OH_JSVM_GetAndClearLastException status Failed");
        return nullptr;
    }
    
    bool bRstErr = false;
    JSVM_Status isErrStatus = OH_JSVM_IsError(env, rstValue, &bRstErr);
    if (JSVM_OK != isErrStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest19: OH_JSVM_IsError status Failed");
        return nullptr;
    }
    if (!bRstErr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest19: OH_JSVM_IsError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CreateSyntaxErrorr->GetAndClearLastException->isError
[[maybe_unused]] JSVM_Value TestCombinationTest20(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    const char* strErrSyntaxCode = "create error code";
    JSVM_Value errorSyntaxCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxCode, JSVM_AUTO_LENGTH, &errorSyntaxCode);
    
    const char* strErrSyntaxMsg = "create error message";
    JSVM_Value errorSyntaxMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxMsg, JSVM_AUTO_LENGTH, &errorSyntaxMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateSyntaxError(env, errorSyntaxCode, errorSyntaxMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest20: OH_JSVM_CreateSyntaxError Failed");
        return nullptr;
    }
    
    JSVM_Value rstErrorValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_GetAndClearLastException(env, &rstErrorValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest20: OH_JSVM_GetAndClearLastException status Failed");
        return nullptr;
    }
    
    bool bRstErr = false;
    JSVM_Status isErrStatus = OH_JSVM_IsError(env, rstValue, &bRstErr);
    if (JSVM_OK != isErrStatus) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest20: OH_JSVM_IsError status Failed");
        return nullptr;
    }
    if (!bRstErr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest20: OH_JSVM_IsError Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowError->ThrowTypeError->IsExceptionPending-> GetAndClearLastException-> IsExceptionPending
[[maybe_unused]] JSVM_Value TestCombinationTest21(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    // create Error
    const char* strErrCode = "create error code";
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrCode, JSVM_AUTO_LENGTH, &errorCode);
    
    const char* strErrMsg = "create error message";
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrMsg, JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateError(env, errorCode, errorMsg, &rstValue);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest21: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    // create type Error
    const char* strErrTypeCode = "create type error code";
    JSVM_Value errorTypeCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrTypeCode, JSVM_AUTO_LENGTH, &errorTypeCode);
    
    const char* strErrTypeMsg = "create type error message";
    JSVM_Value errorTypeMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrTypeMsg, JSVM_AUTO_LENGTH, &errorTypeMsg);
    
    JSVM_Value rstTypeValue = nullptr;
    JSVM_Status creatTypeStatus = OH_JSVM_CreateTypeError(env, errorTypeCode, errorTypeMsg, &rstTypeValue);
    if (creatTypeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest21: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    // throwError
    JSVM_Status throwStatus = OH_JSVM_ThrowError(env, strErrCode, strErrMsg);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest21: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    //clear throw error
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest21: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    // throwTypeError
    JSVM_Status throwTypeStatus = OH_JSVM_ThrowTypeError(env, strErrTypeCode, strErrTypeMsg);
    if (throwTypeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest21: OH_JSVM_ThrowTypeError Failed");
        return nullptr;
    }
    
    bool bRstPending = false;
    JSVM_Status rstPendingStatus = OH_JSVM_IsExceptionPending(env, &bRstPending);
    if (rstPendingStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest21: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (!bRstPending) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest21: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    JSVM_Value rstErrorValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_GetAndClearLastException(env, &rstErrorValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest21: OH_JSVM_GetAndClearLastException status Failed");
        return nullptr;
    }
    
    bool bRstPending2 = false;
    JSVM_Status rstPendingStatus2 = OH_JSVM_IsExceptionPending(env, &bRstPending2);
    if (rstPendingStatus2 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest21: OH_JSVM_IsExceptionPending status2 Failed");
        return nullptr;
    }
    if (bRstPending2) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest21: OH_JSVM_IsExceptionPending result2 Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowRangeError->ThrowSyntaxError->IsExceptionPending-> GetAndClearLastException-> IsExceptionPending
[[maybe_unused]] JSVM_Value TestCombinationTest22(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    // create Range Error
    const char* strErrRangeCode = "create Range error code";
    JSVM_Value errorRangeCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangeCode, JSVM_AUTO_LENGTH, &errorRangeCode);
    
    const char* strErrRangeMsg = "create Syntax error message";
    JSVM_Value errorRangeMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangeMsg, JSVM_AUTO_LENGTH, &errorRangeMsg);
    
    JSVM_Value rstRangeValue = nullptr;
    JSVM_Status creatRangeStatus = OH_JSVM_CreateRangeError(env, errorRangeCode, errorRangeMsg, &rstRangeValue);
    if (creatRangeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest22: OH_JSVM_CreateRangeError Failed");
        return nullptr;
    }
    
    // create Syntax Error
    const char* strErrSyntaxCode = "create Syntax error code";
    JSVM_Value errorSyntaxCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxCode, JSVM_AUTO_LENGTH, &errorSyntaxCode);
    
    const char* strErrSyntaxMsg = "create Syntax error message";
    JSVM_Value errorSyntaxMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxMsg, JSVM_AUTO_LENGTH, &errorSyntaxMsg);
    
    JSVM_Value rstSyntaxValue = nullptr;
    JSVM_Status creatSyntaxStatus = OH_JSVM_CreateSyntaxError(env, errorSyntaxCode, errorSyntaxMsg, &rstSyntaxValue);
    if (creatSyntaxStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest22: OH_JSVM_CreateSyntaxError Failed");
        return nullptr;
    }
    // throwRangeError
    JSVM_Status throwRangeStatus = OH_JSVM_ThrowRangeError(env, strErrRangeCode, strErrRangeMsg);
    if (throwRangeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest22: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    //clear throw error
    JSVM_Value getAndClearErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest22: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    // throwSyntaxError
    JSVM_Status throwSyntaxStatus = OH_JSVM_ThrowSyntaxError(env, strErrSyntaxCode, strErrSyntaxMsg);
    if (throwSyntaxStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest22: OH_JSVM_ThrowTypeError Failed");
        return nullptr;
    }
    
    bool bRstPending = false;
    JSVM_Status rstPendingStatus = OH_JSVM_IsExceptionPending(env, &bRstPending);
    if (rstPendingStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest22: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (!bRstPending) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest22: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    JSVM_Value rstErrorValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_GetAndClearLastException(env, &rstErrorValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest22: OH_JSVM_GetAndClearLastException status Failed");
        return nullptr;
    }
    
    bool bRstPending2 = false;
    JSVM_Status rstPendingStatus2 = OH_JSVM_IsExceptionPending(env, &bRstPending2);
    if (rstPendingStatus2 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest22: OH_JSVM_IsExceptionPending status2 Failed");
        return nullptr;
    }
    if (bRstPending2) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest22: OH_JSVM_IsExceptionPending result2 Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//ThrowTypeError->ThrowRangeError->ThrowError->ThrowSyntaxError->IsExceptionPending
//->four GetAndClearLastException ->IsExceptionPending
[[maybe_unused]] JSVM_Value TestCombinationTest23(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    // create Error
    const char* strErrCode = "create error code";
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrCode, JSVM_AUTO_LENGTH, &errorCode);
    
    const char* strErrMsg = "create error message";
    JSVM_Value errorMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrMsg, JSVM_AUTO_LENGTH, &errorMsg);
    
    JSVM_Value rstValue = nullptr;
    OH_JSVM_CreateError(env, errorCode, errorMsg, &rstValue);
    
    // create type Error
    const char* strErrTypeCode = "create type error code";
    JSVM_Value errorTypeCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrTypeCode, JSVM_AUTO_LENGTH, &errorTypeCode);
    
    const char* strErrTypeMsg = "create type error message";
    JSVM_Value errorTypeMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrTypeMsg, JSVM_AUTO_LENGTH, &errorTypeMsg);
    
    JSVM_Value rstTypeValue = nullptr;
    JSVM_Status creatTypeStatus = OH_JSVM_CreateTypeError(env, errorTypeCode, errorTypeMsg, &rstTypeValue);
    if (creatTypeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_CreateError Failed");
        return nullptr;
    }
    
    // create Range Error
    const char* strErrRangeCode = "create Range error code";
    JSVM_Value errorRangeCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangeCode, JSVM_AUTO_LENGTH, &errorRangeCode);
    
    const char* strErrRangeMsg = "create Syntax error message";
    JSVM_Value errorRangeMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrRangeMsg, JSVM_AUTO_LENGTH, &errorRangeMsg);
    
    JSVM_Value rstRangeValue = nullptr;
    JSVM_Status creatRangeStatus = OH_JSVM_CreateRangeError(env, errorRangeCode, errorRangeMsg, &rstRangeValue);
    if (creatRangeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_CreateRangeError Failed");
        return nullptr;
    }
    
    // create Syntax Error
    const char* strErrSyntaxCode = "create Syntax error code";
    JSVM_Value errorSyntaxCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxCode, JSVM_AUTO_LENGTH, &errorSyntaxCode);
    
    const char* strErrSyntaxMsg = "create Syntax error message";
    JSVM_Value errorSyntaxMsg = nullptr;
    OH_JSVM_CreateStringUtf8(env, strErrSyntaxMsg, JSVM_AUTO_LENGTH, &errorSyntaxMsg);
    
    JSVM_Value rstSyntaxValue = nullptr;
    JSVM_Status creatSyntaxStatus = OH_JSVM_CreateSyntaxError(env, errorSyntaxCode, errorSyntaxMsg, &rstSyntaxValue);
    if (creatSyntaxStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_CreateSyntaxError Failed");
        return nullptr;
    }
    
    // throwTypeError
    JSVM_Status throwTypeStatus = OH_JSVM_ThrowTypeError(env, strErrTypeCode, strErrTypeMsg);
    if (throwTypeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_ThrowTypeError Failed");
        return nullptr;
    }
    // clear throw type error
    JSVM_Value getAndClearTypeErr = nullptr;
    JSVM_Status getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearTypeErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    // throwRangeError
    JSVM_Status throwRangeStatus = OH_JSVM_ThrowRangeError(env, strErrRangeCode, strErrRangeMsg);
    if (throwRangeStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    //clear throw Range error
    JSVM_Value getAndClearRangeErr = nullptr;
    getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearRangeErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    // throwError
    JSVM_Status throwStatus = OH_JSVM_ThrowError(env, strErrCode, strErrMsg);
    if (throwStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_ThrowError Failed");
        return nullptr;
    }
    //clear throw Syntax error
    JSVM_Value getAndClearErr = nullptr;
    getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    // throwSyntaxError
    JSVM_Status throwSyntaxStatus = OH_JSVM_ThrowSyntaxError(env, strErrSyntaxCode, strErrSyntaxMsg);
    if (throwSyntaxStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_ThrowTypeError Failed");
        return nullptr;
    }
    //clear throw Syntax error
    JSVM_Value getAndClearSyntaxErr = nullptr;
    getAndClearStatus =  OH_JSVM_GetAndClearLastException(env, &getAndClearSyntaxErr);
    if (getAndClearStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_GetAndClearLastException Failed");
        return nullptr;
    }
    
    bool bRstPending = false;
    JSVM_Status rstPendingStatus = OH_JSVM_IsExceptionPending(env, &bRstPending);
    if (rstPendingStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_IsExceptionPending status Failed");
        return nullptr;
    }
    if (bRstPending) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_IsExceptionPending result Failed");
        return nullptr;
    }
    
    // first
    JSVM_Value rstErrorValue1 = nullptr;
    JSVM_Status rstStatus1 = OH_JSVM_GetAndClearLastException(env, &rstErrorValue1);
    if (rstStatus1 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_GetAndClearLastException status1 Failed");
        return nullptr;
    }
    
    // second
    JSVM_Value rstErrorValue2 = nullptr;
    JSVM_Status rstStatus2 = OH_JSVM_GetAndClearLastException(env, &rstErrorValue2);
    if (rstStatus2 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_GetAndClearLastException status2 Failed");
        return nullptr;
    }
    
    // third
    JSVM_Value rstErrorValue3 = nullptr;
    JSVM_Status rstStatus3 = OH_JSVM_GetAndClearLastException(env, &rstErrorValue3);
    if (rstStatus3 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_GetAndClearLastException status3 Failed");
        return nullptr;
    }
    
    // fourth
    JSVM_Value rstErrorValue4 = nullptr;
    JSVM_Status rstStatus4 = OH_JSVM_GetAndClearLastException(env, &rstErrorValue4);
    if (rstStatus4 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_GetAndClearLastException status4 Failed");
        return nullptr;
    }
    
    bool bRstPending2 = false;
    JSVM_Status rstPendingStatus2 = OH_JSVM_IsExceptionPending(env, &bRstPending2);
    if (rstPendingStatus2 != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_IsExceptionPending status2 Failed");
        return nullptr;
    }
    if (bRstPending2) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationTest23: OH_JSVM_IsExceptionPending result2 Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}