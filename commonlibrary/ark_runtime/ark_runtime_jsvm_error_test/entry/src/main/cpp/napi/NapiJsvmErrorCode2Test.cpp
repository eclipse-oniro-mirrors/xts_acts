/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

#include "napi/NapiJsvmErrorCode2Test.h"
#include "jsvm_common.h"
#include "napi/native_api.h"
#include "native_common.h"
#include "securec.h"
#include <ark_runtime/jsvm.h>
#include "cstdint"
#include "cstdio"
#include <hilog/log.h>
#include <cstring>
#include <ostream>

const int ONE = 1;
const int SIXTEEN = 16;
static char g_dataType[32] = "";

napi_value TestIsRegExpJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value value;
    OH_JSVM_CreateStringUtf8(env, "tester", JSVM_AUTO_LENGTH, &value);
    bool isresult = false;
    JSVM_Status status = OH_JSVM_IsRegExp(env, value, &isresult);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestIsRegExpInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    
    bool isresult = false;
    JSVM_Status status = OH_JSVM_IsRegExp(env, NULL, &isresult);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestIsConstructorJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value value;
    OH_JSVM_CreateStringUtf8(env, "tester", JSVM_AUTO_LENGTH, &value);
    bool isresult = false;
    JSVM_Status status = OH_JSVM_IsConstructor(env, value, &isresult);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestIsConstructorInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    bool isresult = false;
    JSVM_Status status = OH_JSVM_IsConstructor(env, NULL, &isresult);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateRegExpJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    
    JSVM_Value value = nullptr;
    const char testStr[] = "ab+c";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Value resultRex = nullptr;
    JSVM_Status status = OH_JSVM_CreateRegExp(env, value, JSVM_REGEXP_UNICODE, &resultRex);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCreateRegExpExpected(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value value = nullptr;
    OH_JSVM_CreateMap(env, &value);
    JSVM_Value resultRex = nullptr;
    JSVM_Status status = OH_JSVM_CreateRegExp(env, value, JSVM_REGEXP_UNICODE, &resultRex);
    int32_t resValue = (status == JSVM_STRING_EXPECTED) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCreateRegExpPending(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    OH_JSVM_ThrowError(env, nullptr, "TestCreateRegExpPending:OH_JSVM_CreateRegExp Failed.");
    JSVM_Value value = nullptr;
    const char testStr[] = "ab+c";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Value resultRex = nullptr;
    JSVM_Status status = OH_JSVM_CreateRegExp(env, value, JSVM_REGEXP_UNICODE, &resultRex);
    int32_t resValue = (status == JSVM_PENDING_EXCEPTION) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCreateRegExpInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value resultRex = nullptr;
    JSVM_Status status = OH_JSVM_CreateRegExp(env, NULL, JSVM_REGEXP_UNICODE, &resultRex);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCreateRegExpGenericFailure(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value value = nullptr;
    const char testStr[] = "(";
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &value);
    JSVM_Value resultRex = nullptr;
    JSVM_Status status = OH_JSVM_CreateRegExp(env, value, JSVM_REGEXP_UNICODE, &resultRex);
    int32_t resValue = (status == JSVM_GENERIC_FAILURE) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestObjectGetPrototypeOfInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value resultvalue;
    JSVM_Status status = OH_JSVM_ObjectGetPrototypeOf(env, NULL, &resultvalue);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestObjectSetPrototypeOfInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value obj;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Status status = OH_JSVM_ObjectSetPrototypeOf(env, obj, NULL);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateFunctionWithScriptJSOK(napi_env env1, napi_callback_info info)
{
        JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    
    const char *jsFunction = R"JS(
        function hlleoPrint() {
              console.log("hello log");
        };
    )JS";
    JSVM_Value jsFunctionStr;
    OH_JSVM_CreateStringUtf8(env, jsFunction, JSVM_AUTO_LENGTH, &jsFunctionStr);
    JSVM_Value func = nullptr;
    JSVM_Value *arg;
    JSVM_Status status = OH_JSVM_CreateFunctionWithScript(env, "add", JSVM_AUTO_LENGTH, 0, arg, jsFunctionStr, &func);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCreateFunctionWithScriptInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    
    JSVM_Value func = nullptr;
    JSVM_Value *arg;
    JSVM_Status status = OH_JSVM_CreateFunctionWithScript(env, "add", JSVM_AUTO_LENGTH, 0, arg, NULL, &func);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCreateFunctionWithScriptGenericFailure(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    const char *jsFunction = R"JS(
        function hlleoPrint(
    )JS";
    JSVM_Value jsFunctionStr;
    OH_JSVM_CreateStringUtf8(env, jsFunction, JSVM_AUTO_LENGTH, &jsFunctionStr);
    JSVM_Value func = nullptr;
    JSVM_Value *arg;
    JSVM_Status status = OH_JSVM_CreateFunctionWithScript(env, "add", JSVM_AUTO_LENGTH, 0, arg, jsFunctionStr, &func);
    int32_t resValue = (status == JSVM_GENERIC_FAILURE) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestRetainScriptInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Status status = OH_JSVM_RetainScript(env, NULL);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestReleaseScriptJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    const char *jsFunction = R"JS(
        function add(a, b) {
            return a + b;
        };
    )JS";
    JSVM_Script script;
    JSVM_Value jsFunctionStr;
    OH_JSVM_CreateStringUtf8(env, jsFunction, JSVM_AUTO_LENGTH, &jsFunctionStr);
    OH_JSVM_CompileScript(env, jsFunctionStr, nullptr, 0, false, nullptr, &script);
    OH_JSVM_RetainScript(env, script);
    JSVM_Status status = OH_JSVM_ReleaseScript(env, script);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestReleaseScriptInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Status status = OH_JSVM_ReleaseScript(env, NULL);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestOpenInspectorWithNameJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Status status = OH_JSVM_OpenInspectorWithName(env, 1234, "test");
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestOpenInspectorWithNamePending(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    OH_JSVM_ThrowError(env, nullptr, "TestOpenInspectorWithNameExpected:OH_JSVM_OpenInspectorWithName Failed.");
    JSVM_Status status = OH_JSVM_OpenInspectorWithName(env, -1, "test");
    int32_t resValue = (status == JSVM_PENDING_EXCEPTION) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCompileWasmModulePending(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    OH_JSVM_ThrowError(env, nullptr, "TestCompileWasmModulePending:OH_JSVM_CompileWasmModule Failed.");
    JSVM_Value wasmModule;
    JSVM_Status status = OH_JSVM_CompileWasmModule(env, nullptr, 0, nullptr, 0, nullptr, &wasmModule);
    int32_t resValue = (status == JSVM_PENDING_EXCEPTION) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCompileWasmModuleModeExpected(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value wasmModule;
    JSVM_Status status = OH_JSVM_CompileWasmModule(env, nullptr, 0, nullptr, 0, nullptr, &wasmModule);
    int32_t resValue = (status == JSVM_JIT_MODE_EXPECTED) ? 0 : 1;
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "JSVM", "TestCompileWasmModuleModeExpected status:%{public}d", status);

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCompileWasmModuleInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value wasmModule;
    JSVM_Status status = OH_JSVM_CompileWasmModule(env, nullptr, 0, nullptr, 0, nullptr, &wasmModule);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCompileWasmModuleGenericFailure(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    
    const uint8_t badBytes[] = { 0x01, 0x02, 0x03, 0x04 };
    bool cacheRejected = false;
    JSVM_Value wasmModule;
    JSVM_Status status =
        OH_JSVM_CompileWasmModule(env, badBytes, sizeof(badBytes), nullptr, 0, &cacheRejected, &wasmModule);
    int32_t resValue = (status == JSVM_GENERIC_FAILURE) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCompileWasmFunctionPending(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    OH_JSVM_ThrowError(env, nullptr, "TestCompileWasmFunctionPending:OH_JSVM_WaitForDebugger Failed.");
    JSVM_Status status = OH_JSVM_CompileWasmFunction(env, nullptr, 0, JSVM_WASM_OPT_BASELINE);
    int32_t resValue = (status == JSVM_PENDING_EXCEPTION) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCompileWasmFunctionModeExpected(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    
    JSVM_Status status = OH_JSVM_CompileWasmFunction(env, nullptr, 0, JSVM_WASM_OPT_BASELINE);
    int32_t resValue = (status == JSVM_JIT_MODE_EXPECTED) ? 0 : 1;
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "JSVM", "TestCompileWasmFunctionModeExpected status:%{public}d", status);

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
// 获取 wasm 字节码 (add 模块)
static std::vector<uint8_t> GetAddWasmBuffer()
{
    // 以下 wasmBuffer 对应的 wasm 字节码文本格式如下所示，只包含了一个函数 add
    // (module
    //   (func $add (param $lhs i32) (param $rhs i32) (result i32)
    //     local.get $lhs
    //     local.get $rhs
    //     i32.add
    //   )
    //   (export "add" (func $add))
    // )
    std::vector<uint8_t> wasmBuffer = {0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00, 0x01, 0x07, 0x01,
                                       0x60, 0x02, 0x7f, 0x7f, 0x01, 0x7f, 0x03, 0x02, 0x01, 0x00, 0x07,
                                       0x07, 0x01, 0x03, 0x61, 0x64, 0x64, 0x00, 0x00, 0x0a, 0x09, 0x01,
                                       0x07, 0x00, 0x20, 0x00, 0x20, 0x01, 0x6a, 0x0b};
    return wasmBuffer;
}
napi_value TestCompileWasmFunctionGenericFailure(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    std::vector<uint8_t> wasmBuffer = GetAddWasmBuffer();
    uint8_t *wasmBytecode = wasmBuffer.data();
    size_t wasmBytecodeLength = wasmBuffer.size();
    JSVM_Value wasmModule;
    OH_JSVM_CompileWasmModule(env, wasmBytecode, wasmBytecodeLength, NULL, 0, NULL, &wasmModule);
    JSVM_Status status = OH_JSVM_CompileWasmFunction(env, wasmModule, 100, JSVM_WASM_OPT_BASELINE);
    int32_t resValue = (status == JSVM_GENERIC_FAILURE) ? 0 : 1;
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "JSVM", "TestCompileWasmFunctionGenericFailure status:%{public}d", status);

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateWasmCacheModeExpected(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    const uint8_t *cacheData = nullptr;
    size_t cacheLength = 0;
    JSVM_Value wasmModule = nullptr;
    JSVM_Status status = OH_JSVM_CreateWasmCache(env, wasmModule, &cacheData, &cacheLength);
    int32_t resValue = (status == JSVM_JIT_MODE_EXPECTED) ? 0 : 1;
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "JSVM", "TestCreateWasmCacheModeExpected status:%{public}d", status);

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCreateWasmCacheInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    const uint8_t *cacheData = nullptr;
    size_t cacheLength = 0;
    JSVM_Value wasmModule = nullptr;
    JSVM_Status status = OH_JSVM_CreateWasmCache(env, wasmModule, &cacheData, &cacheLength);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCreateWasmCacheGenericFailure(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    std::vector<uint8_t> wasmBuffer = GetAddWasmBuffer();
    uint8_t *wasmBytecode = wasmBuffer.data();
    size_t wasmBytecodeLength = wasmBuffer.size();
    JSVM_Value wasmModule;
    OH_JSVM_CompileWasmModule(env, wasmBytecode, wasmBytecodeLength, NULL, 0, NULL, &wasmModule);
    const uint8_t *cacheData = nullptr;
    size_t cacheLength = -1;
    JSVM_Status status = OH_JSVM_CreateWasmCache(env, wasmModule, &cacheData, &cacheLength);
    int32_t resValue = (status == JSVM_GENERIC_FAILURE) ? 0 : 1;
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "JSVM", "TestCreateWasmCacheGenericFailure status:%{public}d", status);

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateExternalStringLatin1JSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    char src[] = "a = 100; a = a + 1";
    JSVM_Value str;
    bool copied = false;
    JSVM_Status status = OH_JSVM_CreateExternalStringLatin1(env, src, strlen(src), nullptr, nullptr, &str, &copied);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCreateExternalStringLatin1Invalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    char src[] = "a = 100; a = a + 1";
    JSVM_Value str;
    bool copied = false;
    JSVM_Status status = OH_JSVM_CreateExternalStringLatin1(env, NULL, strlen(src), nullptr, nullptr, &str, &copied);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateExternalStringUtf16JSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    char16_t src[] = u"a = 'hello'; a = a + ' world'";
    JSVM_Value str;
    bool copied = false;
    JSVM_Status status = OH_JSVM_CreateExternalStringUtf16(env, src, std::char_traits<char16_t>::length(src), nullptr,
                                                           nullptr, &str, &copied);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCreateExternalStringUtf16Invalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    char16_t src[] = u"a = 'hello'; a = a + ' world'";
    JSVM_Value str;
    bool copied = false;
    JSVM_Status status = OH_JSVM_CreateExternalStringUtf16(env, NULL, std::char_traits<char16_t>::length(src), nullptr,
                                                           nullptr, &str, &copied);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreatePrivateJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Data key;
    JSVM_Status status = OH_JSVM_CreatePrivate(env, nullptr, &key);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCreatePrivateExpected(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value value;
    OH_JSVM_CreateInt32(env, 0, &value);
    JSVM_Data key;
    JSVM_Status status = OH_JSVM_CreatePrivate(env, value, &key);
    int32_t resValue = (status == JSVM_STRING_EXPECTED) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestCreatePrivateInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Status status = OH_JSVM_CreatePrivate(env, nullptr, nullptr);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestSetPrivatePending(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    OH_JSVM_ThrowError(env, nullptr, "testCreateProxyPending:OH_JSVM_CreateProxy Failed.");
    JSVM_Data key;
    OH_JSVM_CreatePrivate(env, nullptr, &key);
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value property;
    OH_JSVM_CreateInt32(env, 1, &property);
    JSVM_Status status = OH_JSVM_SetPrivate(env, object, key, property);
    int32_t resValue = (status == JSVM_PENDING_EXCEPTION) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestSetPrivateGenericFailure(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Data key;
    OH_JSVM_CreatePrivate(env, nullptr, &key);
    JSVM_Data key1;
    OH_JSVM_CreatePrivate(env, nullptr, &key1);
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value property;
    OH_JSVM_CreateInt32(env, 1, &property);
    JSVM_Status status = OH_JSVM_SetPrivate(env, object, key1, property);
    int32_t resValue = (status == JSVM_GENERIC_FAILURE) ? 0 : 1;
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "JSVM", "TestSetPrivateGenericFailure status:%{public}d", status);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestGetPrivatePending(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Data key;
    OH_JSVM_CreatePrivate(env, nullptr, &key);
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value property;
    OH_JSVM_CreateInt32(env, 1, &property);
    OH_JSVM_SetPrivate(env, object, key, property);
    OH_JSVM_ThrowError(env, nullptr, "testCreateProxyPending:OH_JSVM_CreateProxy Failed.");
    JSVM_Value getResult;
    JSVM_Status status = OH_JSVM_GetPrivate(env, object, key, &getResult);
    int32_t resValue = (status == JSVM_PENDING_EXCEPTION) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestGetPrivateGenericFailure(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Data key;
    OH_JSVM_CreatePrivate(env, nullptr, &key);
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value getResult;
    JSVM_Status status = OH_JSVM_GetPrivate(env, object, key, &getResult);
    int32_t resValue = (status == JSVM_GENERIC_FAILURE) ? 0 : 1;
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "JSVM", "TestGetPrivateGenericFailure status:%{public}d", status);

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestDeletePrivateJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Data key;
    OH_JSVM_CreatePrivate(env, nullptr, &key);
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value property;
    OH_JSVM_CreateInt32(env, 1, &property);
    OH_JSVM_SetPrivate(env, object, key, property);
    JSVM_Status status = OH_JSVM_DeletePrivate(env, object, key);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestDeletePrivatePending(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Data key;
    OH_JSVM_CreatePrivate(env, nullptr, &key);
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value property;
    OH_JSVM_CreateInt32(env, 1, &property);
    OH_JSVM_ThrowError(env, nullptr, "TestDeletePrivatePending:OH_JSVM_DeletePrivate Failed.");
    OH_JSVM_SetPrivate(env, object, key, property);
    JSVM_Status status = OH_JSVM_DeletePrivate(env, object, key);
    int32_t resValue = (status == JSVM_PENDING_EXCEPTION) ? 0 : 1;
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestDeletePrivateGenericFailure(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Data key;
    OH_JSVM_CreatePrivate(env, nullptr, &key);
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Status status = OH_JSVM_DeletePrivate(env, object, key);
    int32_t resValue = (status == JSVM_GENERIC_FAILURE) ? 0 : 1;
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "JSVM", "TestDeletePrivateGenericFailure status:%{public}d", status);

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateDataReferenceInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Data key = nullptr;
    OH_JSVM_CreatePrivate(env, nullptr, &key);
    JSVM_Status status = OH_JSVM_CreateDataReference(env, key, 1, nullptr);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestGetReferenceDataInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Data key = nullptr;
    OH_JSVM_CreatePrivate(env, nullptr, &key);
    JSVM_Ref ref = nullptr;
    OH_JSVM_CreateDataReference(env, key, 1, &ref);
    JSVM_Data refResult = nullptr;
    JSVM_Status status = OH_JSVM_GetReferenceData(env, ref, nullptr);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestIsBigIntObjectJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    int64_t testValue = INT64_MAX;
    JSVM_Value resultValue = nullptr;
    OH_JSVM_CreateBigintInt64(env, testValue, &resultValue);
    bool isBigIntObject = false;
    JSVM_Status status = OH_JSVM_IsBigIntObject(env, resultValue, &isBigIntObject);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestIsBigIntObjectInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    bool isBigIntObject = false;
    JSVM_Status status = OH_JSVM_IsBigIntObject(env, NULL, &isBigIntObject);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestIsBooleanObjectJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value resultValue = nullptr;
    OH_JSVM_GetBoolean(env, true, &resultValue);
    bool isBoolObject = false;
    JSVM_Status status = OH_JSVM_IsBooleanObject(env, resultValue, &isBoolObject);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestIsBooleanObjectInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    bool isBoolObject = false;
    JSVM_Status status = OH_JSVM_IsBooleanObject(env, NULL, &isBoolObject);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestIsStringObjectJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value resultValue = nullptr;
    OH_JSVM_GetBoolean(env, true, &resultValue);
    bool isStringObject = false;
    JSVM_Status status = OH_JSVM_IsStringObject(env, resultValue, &isStringObject);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestIsStringObjectInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    bool isStringObject = false;
    JSVM_Status status = OH_JSVM_IsStringObject(env, NULL, &isStringObject);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestIsNumberObjectJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value resultValue = nullptr;
    OH_JSVM_GetBoolean(env, true, &resultValue);
    bool isNumberObject = false;
    JSVM_Status status = OH_JSVM_IsNumberObject(env, resultValue, &isNumberObject);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestIsNumberObjectInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    bool isNumberObject = false;
    JSVM_Status status = OH_JSVM_IsNumberObject(env, NULL, &isNumberObject);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestIsSymbolObjectJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    JSVM_Value resultValue = nullptr;
    OH_JSVM_GetBoolean(env, true, &resultValue);
    bool isSymbolObject = false;
    JSVM_Status status = OH_JSVM_IsSymbolObject(env, resultValue, &isSymbolObject);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestIsSymbolObjectInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    bool isSymbolObject = false;
    JSVM_Status status = OH_JSVM_IsSymbolObject(env, NULL, &isSymbolObject);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}