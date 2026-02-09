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
#include "cstring"
#include "napi/native_api.h"
#include "napi_functioncall_test.h"

const int DIFF_VALUE_NOE = 1;
const int DIFF_VALUE_TWO = 2;
//OH_JSVM_CallFunction:recv nullptr,CreateFunction without input parameters, argc 0, argv nullptr, result not null
//return 0, result is consistent with the expected value of the function in CreateFunction
[[maybe_unused]] JSVM_Value TestCallFunction01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value result;
    JSVM_Value funcValue = nullptr;
    JSVM_CallbackStruct param;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "func", NAPI_AUTO_LENGTH, &param, &funcValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction01:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    status = OH_JSVM_CallFunction(env, nullptr, funcValue, 0, nullptr, &result);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction01:OH_JSVM_CallFunction status Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//recv undefined, CreateFunction without input parameters,argc 0, argv nullptr, result not null
//return 0, result is consistent with the expected value of the function in CreateFunction
static JSVM_Value CalculateArea(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    double width;
    OH_JSVM_GetValueDouble(env, args[0], &width);
    double height;
    OH_JSVM_GetValueDouble(env, args[1], &height);
    JSVM_Value area;
    OH_JSVM_CreateDouble(env, width * height, &area);
    return area;
}

[[maybe_unused]] JSVM_Value TestCallFunction02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value funcValue = nullptr;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    param.callback = CalculateArea;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "CalculateArea", NAPI_AUTO_LENGTH, &param, &funcValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction02:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    JSVM_Value recv = nullptr;
    JSVM_Value result;
    status = OH_JSVM_GetUndefined(env, &recv);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction02:OH_JSVM_GetUndefined status Failed.");
        return nullptr;
    }
    status = OH_JSVM_CallFunction(env, recv, funcValue, 0, nullptr, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction02:OH_JSVM_CallFunction status Failed.");
        return nullptr;
    }

    int32_t rst = 0;
    OH_JSVM_GetValueInt32(env, result, &rst);
    if (rst != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction02:call back result is Abnormal.");
        return nullptr;
    }
    
    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//recv undefined,CreateFunction without input parameters, argc 0, argv nullptr, result not null
//return not ok
[[maybe_unused]] JSVM_Value TestCallFunction03(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 3;
    JSVM_Value argv[3] = { nullptr};
    JSVM_Value thisArg = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, argv, &thisArg, nullptr);

    uint32_t arrayLen = 0;
    OH_JSVM_GetArrayLength(env, argv[1], &arrayLen);
    if (arrayLen < 0 || arrayLen > std::numeric_limits<uint32_t>::max() / sizeof(JSVM_Value)) {
        OH_JSVM_ThrowError(env, nullptr, "Invalid array length.");
        return nullptr;
    } else {
        JSVM_Value *args = new JSVM_Value[arrayLen];
        for (auto i = 0; i < arrayLen; i++) {
            OH_JSVM_GetElement(env, argv[1], i, &args[i]);
        }
    }
    JSVM_Value jsString;
    JSVM_Status status = OH_JSVM_CoerceToString(env, argv[0], &jsString);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction03:OH_JSVM_CoerceToString status Failed.");
        return nullptr;
    }
    size_t length = 0;
    status = OH_JSVM_GetValueStringUtf8(env, jsString, NULL, 0, &length);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction03:OH_JSVM_GetValueStringUtf8 status Failed.");
        return nullptr;
    }
    size_t capacity = length + 1;
    char *buffer = new char[capacity];
    size_t copyLength = 0;
    status = OH_JSVM_GetValueStringUtf8(env, jsString, buffer, capacity, &copyLength);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction03:OH_JSVM_GetValueStringUtf8 status Failed.");
        return nullptr;
    }
    JSVM_Value func = nullptr;
    status = OH_JSVM_CreateFunctionWithScript(env,
                                              buffer,
                                              JSVM_AUTO_LENGTH,
                                              arrayLen,
                                              0,
                                              nullptr,
                                              &func);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction03:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    JSVM_Value result;
    JSVM_Value recv = nullptr;
    OH_JSVM_GetUndefined(env, &recv);
    status = OH_JSVM_CallFunction(env, recv, func, 0, nullptr, &result);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction03:OH_JSVM_CallFunction status Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}

[[maybe_unused]] JSVM_Value TestCallFunction04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.data = nullptr;
    param.callback = CalculateArea;
    JSVM_Value funcValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "calculateArea", NAPI_AUTO_LENGTH, &param, &funcValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction04:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    JSVM_Value globalRecv = nullptr;
    JSVM_Value result = nullptr;
    status = OH_JSVM_GetGlobal(env, &globalRecv);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction04:OH_JSVM_GetGlobal status Failed.");
        return nullptr;
    }
    status = OH_JSVM_CallFunction(env, globalRecv, funcValue, 0, nullptr, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction04:OH_JSVM_CallFunction status Failed.");
        return nullptr;
    }
    int32_t rst = 0;
    OH_JSVM_GetValueInt32(env, result, &rst);
    if (rst != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction04:call back result is Abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//recv global,CreateFunction interface that requires one input parameter, argc 1,argv not null,len 1, result not null
//return 0,result is consistent with the expected value of the function in CreateFunction
[[maybe_unused]] JSVM_Value valueAddOne(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    int32_t val;
    OH_JSVM_GetValueInt32(env, argv[0], &val);

    JSVM_Value rst;
    OH_JSVM_CreateInt32(env, val + 1, &rst);
    return rst;
}
[[maybe_unused]] JSVM_Value TestCallFunction05(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value funcValue = nullptr;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    param.callback = valueAddOne;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "valueAddOne", NAPI_AUTO_LENGTH, &param, &funcValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction05:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    JSVM_Value gloablRecv = nullptr;
    OH_JSVM_GetGlobal(env, &gloablRecv);
    JSVM_Value param1;
    OH_JSVM_CreateInt32(env, 1, &param1);
    JSVM_Value argv[1] = {param1};
    JSVM_Value result;
    status = OH_JSVM_CallFunction(env, gloablRecv, funcValue, DIFF_VALUE_NOE, argv, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction05:OH_JSVM_CallFunction status Failed.");
        return nullptr;
    }
    int32_t rst = 0;
    size_t tempNum = 2;
    OH_JSVM_GetValueInt32(env, result, &rst);
    if (rst != tempNum) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction05:call back result is Abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//recv global,CreateFunction interface that requires one input parameter, argc 2， argv len 2， result not null
//return 0,result is consistent with the expected value of the function in CreateFunction
[[maybe_unused]] JSVM_Value TestCallFunction06(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value result = nullptr;
    JSVM_Value funcValue = nullptr;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    param.callback = valueAddOne;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "valueAddOne", NAPI_AUTO_LENGTH, &param, &funcValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction06:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    JSVM_Value gloablRecv = nullptr;
    OH_JSVM_GetGlobal(env, &gloablRecv);
    JSVM_Value param1;
    JSVM_Value param2;
    OH_JSVM_CreateInt32(env, 0, &param1);
    status = OH_JSVM_CreateInt32(env, 1, &param2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction06:OH_JSVM_CreateInt32 status Failed.");
        return nullptr;
    }
    JSVM_Value argv[2] = {param1, param2};
    status = OH_JSVM_CallFunction(env, gloablRecv, funcValue, DIFF_VALUE_TWO, argv, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction06:OH_JSVM_CallFunction status Failed.");
        return nullptr;
    }

    int32_t rst = 0;
    OH_JSVM_GetValueInt32(env, result, &rst);
    if (rst != 1) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction05:call back result is Abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//recv global,CreateFunction interface that requires two input parameters, argc 2,argv len 2,result not null
//return 0,The result cannot be obtained normally
[[maybe_unused]] JSVM_Value EqualValueComparison(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2];
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    bool isStrictEquals = false;
    JSVM_Value retValue = nullptr;
    OH_JSVM_StrictEquals(env, args[0], args[1], &isStrictEquals);
    OH_JSVM_GetBoolean(env, isStrictEquals, &retValue);

    return retValue;
}

[[maybe_unused]] JSVM_Value TestCallFunction07(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value result = nullptr;
    JSVM_Value funcValue = nullptr;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    param.callback = EqualValueComparison;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "EqualValueComparison", NAPI_AUTO_LENGTH, &param, &funcValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction07:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    JSVM_Value gloablRecv = nullptr;
    OH_JSVM_GetGlobal(env, &gloablRecv);
    JSVM_Value param1;
    JSVM_Value param2;
    OH_JSVM_CreateStringUtf8(env, "a", JSVM_AUTO_LENGTH, &param1);
    status = OH_JSVM_CreateStringUtf8(env, "b", JSVM_AUTO_LENGTH, &param2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction07:OH_JSVM_CreateStringUtf8 status Failed.");
        return nullptr;
    }
    JSVM_Value argv[2] = {param1, param2};
    status = OH_JSVM_CallFunction(env, gloablRecv, funcValue, DIFF_VALUE_TWO, argv, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction07:OH_JSVM_CallFunction status Failed.");
        return nullptr;
    }

    bool rst = false;
    OH_JSVM_GetValueBool(env, result, &rst);
    if (rst != false) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction07:Call Back Function Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//recv global,CreateFunction interface that requires two input parameters, argc 1, argv len 1， result not null
//return 0,The result cannot be obtained normally
[[maybe_unused]] JSVM_Value TestCallFunction08(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value result = nullptr;
    JSVM_Value funcvalue = nullptr;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    param.callback = EqualValueComparison;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "EqualValueComparison", NAPI_AUTO_LENGTH, &param, &funcvalue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction08:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    JSVM_Value gloablrecv = nullptr;
    status = OH_JSVM_GetGlobal(env, &gloablrecv);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction08:OH_JSVM_GetGlobal status Failed.");
        return nullptr;
    }
    JSVM_Value param1;
    OH_JSVM_CreateStringUtf8(env, "test", JSVM_AUTO_LENGTH, &param1);
    JSVM_Value argv[1] = {param1};
    status = OH_JSVM_CallFunction(env, gloablrecv, funcvalue, DIFF_VALUE_NOE, argv, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction08:OH_JSVM_CallFunction status Failed.");
        return nullptr;
    }
    if (!result) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction08:OH_JSVM_CallFunction result abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//recv global,The function obtained from JS code that requires one input parameter,argc 1,argv len 1,result not null
//return 0,The result is consistent with the expected value of the function in CreateFunction
[[maybe_unused]] JSVM_Value TestCallFunction09(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char *jsFunction = R"JS(
        function add(a, b) {
            return a + b;
        };
    )JS";

    // compile and run script
    JSVM_Value runResult;
    JSVM_Script script;
    JSVM_Value jsFunctionStr;
    JSVM_Status status = OH_JSVM_CreateStringUtf8(env, jsFunction, JSVM_AUTO_LENGTH, &jsFunctionStr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction09:OH_JSVM_CreateStringUtf8 status abnormal.");
        return nullptr;
    }
    status = OH_JSVM_CompileScript(env, jsFunctionStr, nullptr, 0, false, nullptr, &script);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction09:OH_JSVM_CompileScript status abnormal.");
        return nullptr;
    }
    status = OH_JSVM_RunScript(env, script, &runResult);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction09:OH_JSVM_RunScript status abnormal.");
        return nullptr;
    }
    // get global
    JSVM_Value global;
    status = OH_JSVM_GetGlobal(env, &global);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction09:OH_JSVM_RunScript status abnormal.");
        return nullptr;
    }
    // get property
    JSVM_Value add_func;
    JSVM_Value add_func_str;
    OH_JSVM_CreateStringUtf8(env, "add", JSVM_AUTO_LENGTH, &add_func_str);
    status = OH_JSVM_GetProperty(env, global, add_func_str, &add_func);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction09:OH_JSVM_GetProperty status abnormal.");
        return nullptr;
    }
    // create param
    size_t num1 = 3;
    size_t num2 = 4;
    size_t tempNum = 2;
    JSVM_Value param1;
    JSVM_Value param2;
    OH_JSVM_CreateInt32(env, num1, &param1);
    status = OH_JSVM_CreateInt32(env, num2, &param2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction09:OH_JSVM_CreateInt32 status abnormal.");
        return nullptr;
    }
    JSVM_Value argv[] = {param1, param2};

    // call function
    JSVM_Value result;
    status = OH_JSVM_CallFunction(env, global, add_func, tempNum, argv, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction09:OH_JSVM_CallFunction status abnormal.");
        return nullptr;
    }
    // result check
    int32_t addResult;
    size_t len = 7;
    OH_JSVM_GetValueInt32(env, result, &addResult);
    if (addResult != len) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction09:OH_JSVM_CallFunction addResult abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_CreateFunction:utf8name nullptr,length=0,set callback，data is null,result not null
//return 0,func name is nullptr
[[maybe_unused]] JSVM_Value TestCreateFunction01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value funcvalue = nullptr;
    JSVM_CallbackStruct param;
    JSVM_Status status = OH_JSVM_CreateFunction(env, nullptr, 0, &param, &funcvalue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateFunction01:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//utf8name not null,length>=utf8name,set callback,data null,result not null
//return 0,funcname len = utf8name len
[[maybe_unused]] JSVM_Value TestCreateFunction02(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t funcNameLen = 4;
    const char funcname[] = "func";
    JSVM_Value result = nullptr;
    JSVM_CallbackStruct param;
    JSVM_Status status = OH_JSVM_CreateFunction(env, funcname, funcNameLen + 1, &param, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateFunction02:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }
    JSVM_Value key;
    OH_JSVM_CreateStringUtf8(env, "name", JSVM_AUTO_LENGTH, &key);
    JSVM_Value propResult = nullptr;
    OH_JSVM_GetProperty(env, result, key, &propResult);

    char strValue[10];
    size_t size;
    size_t bufferSize = 10;
    OH_JSVM_GetValueStringUtf8(env, propResult, strValue, bufferSize, &size);
    if (size != funcNameLen + 1) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateFunction02:OH_JSVM_CreateFunction namelen != srcnamelen.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//utf8name not null,length<utf8name,set callback,data null,result not null
//return 0,funcname len = length
[[maybe_unused]] JSVM_Value TestCreateFunction03(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t funcNameLen = 4;
    const char funcname[] = "test";
    JSVM_Value result = nullptr;
    JSVM_CallbackStruct param;
    JSVM_Status status = OH_JSVM_CreateFunction(env, funcname, strlen(funcname)-1, &param, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateFunction03:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    JSVM_Value key;
    status = OH_JSVM_CreateStringUtf8(env, "name", JSVM_AUTO_LENGTH, &key);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateFunction03:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }
    JSVM_Value propResult = nullptr;
    OH_JSVM_GetProperty(env, result, key, &propResult);
    
    char strValue[4];
    size_t size;
    size_t bufferSize = 4;
    OH_JSVM_GetValueStringUtf8(env, propResult, strValue, bufferSize, &size);
    if (size != funcNameLen - 1) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateFunction03:OH_JSVM_CreateFunction namelen != srcnamelen.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//utf8name not null,length>=utf8name,set callback,data not null， result not null
//return 0
[[maybe_unused]] JSVM_Value TestCreateFunction04(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char funcname[] = "test";
    JSVM_Value funcvalue = nullptr;
    JSVM_CallbackStruct param;
    param.data = (void *)"Hello";
    param.callback = EqualValueComparison;

    JSVM_Status status = OH_JSVM_CreateFunction(env, funcname, strlen(funcname), &param, &funcvalue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateFunction04:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//utf8name not null,length>=utf8name,set callback,data not null,result nullptr
//return not 0
[[maybe_unused]] JSVM_Value SayHello(JSVM_Env env, JSVM_CallbackInfo info)
{
    return nullptr;
}

[[maybe_unused]] JSVM_Value TestCreateFunction05(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char funcname[] = "test";
    JSVM_CallbackStruct param;
    param.data = (void *)"Hello";
    param.callback = SayHello;

    JSVM_Status status = OH_JSVM_CreateFunction(env, funcname, strlen(funcname)+1, &param, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateFunction04:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//utf8name not null,length=utf8name,set callback is nullptr,data null,result not null
//retrun 0,error
[[maybe_unused]] JSVM_Value TestCreateFunction06(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char funcname[] = "test";
    JSVM_CallbackStruct param;
    param.callback = nullptr;
    JSVM_Value funcvalue = nullptr;
    JSVM_Status status = OH_JSVM_CreateFunction(env, funcname, strlen(funcname), &param, &funcvalue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateFunction06:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_GetCbInfo:cbinfo is callback cbinfo,argc NULL,argv NULL,thisArg null,data not null
//return 0, returnval is consistent with the data passed to the callback function in the CreateFunction interface
[[maybe_unused]] JSVM_Value Callbackdata(JSVM_Env env, JSVM_CallbackInfo info)
{
    void* data = nullptr;
    OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, nullptr, &data);
    if (strcmp("say", (char *)data) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "Callbackdata:OH_JSVM_CreateFunction data is error.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}

[[maybe_unused]] JSVM_Value TestGetCbInfo01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = Callbackdata;
    param.data = (void *)"say";
    JSVM_Value funcvalue = nullptr;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "Hello", JSVM_AUTO_LENGTH, &param, &funcvalue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetCbInfo01:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//cbinfo is callback cbinfo, argc NULL，argv NULL， thisArg not null，data NULL
//return 0, The objects mounted by thisArg and Callfunction are consistent
[[maybe_unused]] JSVM_Value CallbackThisVar(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
    if (thisVar == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "CallbackThisVar:CallbackThisVar thisVar is nullptr abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}

[[maybe_unused]] JSVM_Value TestGetCbInfo02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = CallbackThisVar;
    param.data = (void *)"say";
    JSVM_Value funcvalue = nullptr;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "CallbackThisVar", JSVM_AUTO_LENGTH, &param, &funcvalue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetCbInfo02:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    JSVM_Value gloablrecv = nullptr;
    status = OH_JSVM_GetGlobal(env, &gloablrecv);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetCbInfo02:OH_JSVM_GetGlobal status Failed.");
        return nullptr;
    }
    JSVM_Value param1;
    status = OH_JSVM_CreateStringUtf8(env, "abc", JSVM_AUTO_LENGTH, &param1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetCbInfo02:OH_JSVM_CreateStringUtf8 status Failed.");
        return nullptr;
    }

    JSVM_Value argv[1] = {param1};
    JSVM_Value result;
    status = OH_JSVM_CallFunction(env, gloablrecv, funcvalue, DIFF_VALUE_NOE, argv, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetCbInfo02:OH_JSVM_CallFunction status Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//cbinfo is callback cbinfo,argc not null,argv not null,argv len > argc set len,thisArg,data NULL
//return 0, argc elements the same as input，argv index>argc，result undefined
[[maybe_unused]] JSVM_Value Callbackargc1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    size_t testLen = 1;
    JSVM_Value argv[5] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    uint32_t ret = 0;
    OH_JSVM_GetValueUint32(env, argv[0], &ret);
    size_t argvLen = 5;
    if (ret != argvLen) {
        OH_JSVM_ThrowError(env, nullptr, "Callbackargc1:Callbackargc args[0] error.");
        return nullptr;
    }
    if (argc <= testLen) {
        OH_JSVM_ThrowError(env, nullptr, "Callbackargc1:Callbackargc argc error.");
        return nullptr;
    }

    return  argv[0];
}

[[maybe_unused]] JSVM_Value TestGetCbInfo03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = Callbackargc1;
    param.data = (void *)"say";
    JSVM_Value funcvalue = nullptr;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "Hello", JSVM_AUTO_LENGTH, &param, &funcvalue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateFunction06:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    JSVM_Value gloablrecv = nullptr;
    OH_JSVM_GetGlobal(env, &gloablrecv);
    JSVM_Value jsIndex1;
    JSVM_Value jsIndex2;
    uint32_t index1 = 5;
    uint32_t index2 = 10;
    OH_JSVM_CreateUint32(env, index1, &jsIndex1);
    status = OH_JSVM_CreateUint32(env, index2, &jsIndex2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction05:OH_JSVM_CreateUint32 status Failed.");
        return nullptr;
    }
    JSVM_Value argv[2] = {jsIndex1, jsIndex2};
    JSVM_Value result;
    status = OH_JSVM_CallFunction(env, gloablrecv, funcvalue, DIFF_VALUE_TWO, argv, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCallFunction05:OH_JSVM_CallFunction status Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//cbinfo is callback cbinfo,argc not null,argv not null,argv len > argc len,thisArg,data NULL
//return 0, argv index>argc,undefined
[[maybe_unused]] JSVM_Value Callbackargc2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value argv[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    if (argc >= sizeof(argv)) {
        OH_JSVM_ThrowError(env, nullptr, "Callbackargc2:Callbackargc argc >= argv index error.");
        return nullptr;
    }

    return argv[0];
}

[[maybe_unused]] JSVM_Value TestGetCbInfo04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = Callbackargc2;
    param.data = (void *)"say";
    JSVM_Value funcvalue = nullptr;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "Hello", JSVM_AUTO_LENGTH, &param, &funcvalue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetCbInfo04:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    JSVM_Value gloablrecv = nullptr;
    OH_JSVM_GetGlobal(env, &gloablrecv);
    JSVM_Value jsIndex1;
    JSVM_Value jsIndex2;
    uint32_t index1 = 128;
    uint32_t index2 = 256;
    OH_JSVM_CreateUint32(env, index1, &jsIndex1);
    OH_JSVM_CreateUint32(env, index2, &jsIndex2);
    JSVM_Value argv[2] = {jsIndex1, jsIndex2};
    JSVM_Value result;
    status = OH_JSVM_CallFunction(env, gloablrecv, funcvalue, 1, argv, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetCbInfo04:OH_JSVM_CallFunction status Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//cbinfo is callback cbinfo,argc not null,argv not null,argv len = argc,thisArg,data NULL
//return 0,argc = argv
[[maybe_unused]] JSVM_Value Callbackargc3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value argv[2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    uint32_t ret = 0;
    OH_JSVM_GetValueUint32(env, argv[0], &ret);
    size_t tempNum = 128;
    if (ret != tempNum) {
        OH_JSVM_ThrowError(env, nullptr, "Callbackargc3:Callbackargc args[0] error.");
        return nullptr;
    }

    return argv[0];
}

[[maybe_unused]] JSVM_Value TestGetCbInfo05(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    param.callback = Callbackargc3;
    param.data = nullptr;
    JSVM_Value funcvalue = nullptr;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "abc", JSVM_AUTO_LENGTH, &param, &funcvalue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetCbInfo05:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    JSVM_Value gloablrecv = nullptr;
    OH_JSVM_GetGlobal(env, &gloablrecv);
    JSVM_Value jsIndex1;
    JSVM_Value jsIndex2;
    uint32_t index1 = 128;
    uint32_t index2 = 256;
    OH_JSVM_CreateUint32(env, index1, &jsIndex1);
    OH_JSVM_CreateUint32(env, index2, &jsIndex2);
    JSVM_Value argv[2] = {jsIndex1, jsIndex2};
    JSVM_Value result;
    status = OH_JSVM_CallFunction(env, gloablrecv, funcvalue, DIFF_VALUE_TWO, argv, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetCbInfo05:OH_JSVM_CallFunction status Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_IsFunction:value is function, isFunction not null
//return 0，isFunction true
[[maybe_unused]] JSVM_Value TestIsFunction01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    JSVM_Value funcvalue = nullptr;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "Hello", JSVM_AUTO_LENGTH, &param, &funcvalue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsFunction01:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    bool isfun = false;
    status = OH_JSVM_IsFunction(env, funcvalue, &isfun);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsFunction01:OH_JSVM_IsFunction status Failed.");
        return nullptr;
    }

    if (!isfun) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsFunction01:Create FuncValue is not Function.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value is not function, isFunction not null
//return 0，isFunction false
[[maybe_unused]] JSVM_Value TestIsFunction02(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char testStr[] = "foo";
    JSVM_Value param = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &param);

    bool isfun = false;
    JSVM_Status status = OH_JSVM_IsFunction(env, param, &isfun);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsFunction02:OH_JSVM_IsFunction status Failed.");
        return nullptr;
    }

    if (isfun) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsFunction02:Function type judgment error.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value nullptr, isFunction not null
//return not 0
[[maybe_unused]] JSVM_Value TestIsFunction03(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char testStr[] = "foo";
    JSVM_Value param = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &param);

    bool isfun = false;
    JSVM_Status status = OH_JSVM_IsFunction(env, nullptr, &isfun);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsFunction03:OH_JSVM_IsFunction status Failed.");
        return nullptr;
    }

    if (isfun) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsFunction03:Function type judgment error.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value function, isFunction nullptr
//return not 0
[[maybe_unused]] JSVM_Value TestIsFunction04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_CallbackStruct param;
    JSVM_Value funcvalue = nullptr;
    JSVM_Status status = OH_JSVM_CreateFunction(env, "test", JSVM_AUTO_LENGTH, &param, &funcvalue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsFunction04:OH_JSVM_CreateFunction status Failed.");
        return nullptr;
    }

    status = OH_JSVM_IsFunction(env, funcvalue, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsFunction04:OH_JSVM_IsFunction status Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}