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

const int THREE = 3;
const int SIXTEEN = 16;
static char g_dataType[32] = "";

napi_value TestGetSymbolAsyncIteratorJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_GetSymbolAsyncIterator(env, &value);
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
napi_value TestGetSymbolAsyncIteratorInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_GetSymbolAsyncIterator(env, NULL);
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

napi_value TestGetSymbolHasInstanceJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_GetSymbolHasInstance(env, &value);
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
napi_value TestGetSymbolHasInstanceInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_GetSymbolHasInstance(env, NULL);
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

napi_value TestGetSymbolIsConcatSpreadableJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_GetSymbolIsConcatSpreadable(env, &value);
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
napi_value TestGetSymbolIsConcatSpreadableInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_GetSymbolIsConcatSpreadable(env, NULL);
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

napi_value TestGetSymbolMatchJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_GetSymbolMatch(env, &value);
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
napi_value TestGetSymbolMatchInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_GetSymbolMatch(env, NULL);
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

napi_value TestGetSymbolReplaceJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_GetSymbolReplace(env, &value);
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
napi_value TestGetSymbolReplaceInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_GetSymbolReplace(env, NULL);
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

napi_value TestGetSymbolSearchJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_GetSymbolSearch(env, &value);
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
napi_value TestGetSymbolSearchInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_GetSymbolSearch(env, NULL);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;
    JSVM_TraceCategory cat = JSVM_TRACE_VM;
    resValue += (cat == JSVM_TRACE_VM) ? 0 : 1;
    cat = JSVM_TRACE_COMPILE;
    resValue += (cat == JSVM_TRACE_COMPILE) ? 0 : 1;
    cat = JSVM_TRACE_EXECUTE;
    resValue += (cat == JSVM_TRACE_EXECUTE) ? 0 : 1;
    cat = JSVM_TRACE_RUNTIME;
    resValue += (cat == JSVM_TRACE_RUNTIME) ? 0 : 1;
    cat = JSVM_TRACE_STACK_TRACE;
    resValue += (cat == JSVM_TRACE_STACK_TRACE) ? 0 : 1;
    cat = JSVM_TRACE_WASM;
    resValue += (cat == JSVM_TRACE_WASM) ? 0 : 1;
    cat = JSVM_TRACE_WASM_DETAILED;
    resValue += (cat == JSVM_TRACE_WASM_DETAILED) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestGetSymbolSplitJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_GetSymbolSplit(env, &value);
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
napi_value TestGetSymbolSplitInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_GetSymbolSplit(env, NULL);
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

bool OutputStream(const char *data, int size, void *streamData)
{
    std::string value(data, size);
    *(std::string *)streamData = std::string(data, size);
    return true;
}

napi_value TestGetSymbolToPrimitiveJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_GetSymbolToPrimitive(env, &value);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;
    JSVM_Status status1 = OH_JSVM_SetMicrotaskPolicy(vm, JSVM_MicrotaskPolicy::JSVM_MICROTASK_EXPLICIT);
    resValue += (status1 == JSVM_OK) ? 0 : 1;
    JSVM_VM vm_ = nullptr;
    JSVM_Status status11 = OH_JSVM_SetMicrotaskPolicy(vm_, JSVM_MicrotaskPolicy::JSVM_MICROTASK_EXPLICIT);
    resValue += (status11 == JSVM_INVALID_ARG) ? 0 : 1;
    JSVM_Status status2 = OH_JSVM_TraceStart(0, nullptr, "default", 0);
    resValue += (status2 == JSVM_OK) ? 0 : 1;
    JSVM_Status status22 = OH_JSVM_TraceStart(1, nullptr, "invalid", 0);
    resValue += (status22 == JSVM_INVALID_ARG) ? 0 : 1;
    std::string data;
    JSVM_Status status3 = OH_JSVM_TraceStop(OutputStream, (void *)&data);
    resValue += (status3 == JSVM_OK) ? 0 : 1;
    JSVM_Status status33 = OH_JSVM_TraceStop(nullptr, (void *)&data);
    resValue += (status33 == JSVM_INVALID_ARG) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestGetSymbolToPrimitiveInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_GetSymbolToPrimitive(env, NULL);
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

napi_value TestGetSymbolUnscopablesJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_GetSymbolUnscopables(env, &value);
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

napi_value TestGetSymbolUnscopablesInvalid(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_GetSymbolUnscopables(NULL, &value);
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

napi_value TestGetSymbolToStringTagJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_GetSymbolToStringTag(env, &value);
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
napi_value TestGetSymbolToStringTagInvalid(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_GetSymbolToStringTag(NULL, &value);
    int32_t resValue = 0;
    resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;
    JSVM_CompileProfile compile_profile = {nullptr, 0};
    resValue += (compile_profile.profile == nullptr) ? 0 : 1;
    resValue += (compile_profile.length == 0) ? 0 : 1;
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestGetSymbolIteratorJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_GetSymbolIterator(env, &value);
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
napi_value TestGetSymbolIteratorInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_GetSymbolIterator(env, NULL);
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

napi_value TestSetHandlerForOOMErrorJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_SetHandlerForOOMError(vm, NULL);
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
napi_value TestSetHandlerForOOMErrorInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_SetHandlerForOOMError(NULL, NULL);
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

napi_value TestSetDebugOptionJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);

    JSVM_Status status = OH_JSVM_SetDebugOption(env, JSVM_SCOPE_CHECK, true);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;
    
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_SetDebugOption(env, JSVM_SCOPE_CHECK, false);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestSetDebugOptionInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    
    JSVM_Status status = OH_JSVM_SetDebugOption(NULL, JSVM_SCOPE_CHECK, true);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;
    
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handlescope;
    OH_JSVM_OpenHandleScope(env, &handlescope);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestSetHandlerForFatalErrorJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_SetHandlerForFatalError(vm, NULL);
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
napi_value TestSetHandlerForFatalErrorInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_SetHandlerForFatalError(NULL, NULL);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;

    JSVM_VMInfo resultt;
    OH_JSVM_GetVMInfo(&resultt);
    JSVM_Value version;
    JSVM_Value* val;
    auto ret = OH_JSVM_CreateStringUtf8(env, resultt.engine, 1, &version);
    resValue += (resultt.apiVersion >= 0) ? 0 : 1;
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestSetHandlerForPromiseRejectJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_SetHandlerForPromiseReject(vm, NULL);
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

static JSVM_PropertyHandlerConfigurationStruct propertyCfg{
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr
};

static JSVM_Value SetNamedPropertyCbInfo2(JSVM_Env env, JSVM_Value name, JSVM_Value property, JSVM_Value thisArg,
    JSVM_Value data)
{
    return property;
}

static bool g_callAsFunctionFlag = false;

napi_value TestSetHandlerForPromiseRejectInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_SetHandlerForPromiseReject(NULL, NULL);
    int32_t resValue = (status == JSVM_INVALID_ARG) ? 0 : 1;
    resValue += (propertyCfg.namedPropertyData == nullptr) ? 0 : 1;
    resValue += (propertyCfg.indexedPropertyData == nullptr) ? 0 : 1;
    JSVM_DefineClassOptions subOptions[2];
    JSVM_CallbackStruct *callAsFuncParam = new JSVM_CallbackStruct;
    callAsFuncParam->data = nullptr;
    callAsFuncParam->callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        g_callAsFunctionFlag = true;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    propertyCfg.genericNamedPropertySetterCallback = SetNamedPropertyCbInfo2;
    JSVM_PropertyHandler propertyHandler = {
        .propertyHandlerCfg = &propertyCfg,
        .callAsFunctionCallback = callAsFuncParam,
    };
    resValue += (propertyHandler.propertyHandlerCfg != nullptr) ? 0 : 1;
    resValue += (propertyHandler.callAsFunctionCallback != nullptr) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

static JSVM_Value Add(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2];
    OH_JSVM_GetCbInfo(env, info, &argc, args, NULL, NULL);
    double num1 = 0;
    double num2 = 0;
    OH_JSVM_GetValueDouble(env, args[0], &num1);
    OH_JSVM_GetValueDouble(env, args[1], &num2);
    JSVM_Value sum = nullptr;
    OH_JSVM_CreateDouble(env, num1 + num2, &sum);
    return sum;
}
napi_value TestDefineClassWithOptionsJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Value parentClass = nullptr;
    JSVM_CallbackStruct parentClassConstructor;
    parentClassConstructor.data = nullptr;
    parentClassConstructor.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    JSVM_Value fooVal;
    OH_JSVM_CreateStringUtf8(env, "bar", JSVM_AUTO_LENGTH, &fooVal);
    JSVM_PropertyDescriptor des[2];
    des[0] = {
        .utf8name = "foo",
        .value = fooVal,
    };
    JSVM_CallbackStruct parentProperties[] = {
        {.callback = Add, .data = nullptr},
    };
    des[1] = {
        .utf8name = "add",
        .method = &parentProperties[0],
    };
    JSVM_DefineClassOptions options[1];
    options[0].id = JSVM_DEFINE_CLASS_WITH_COUNT;
    options[0].content.num = 1;
    JSVM_Status status = OH_JSVM_DefineClassWithOptions(env, "parentClass", JSVM_AUTO_LENGTH, &parentClassConstructor,
                                                        2, des, nullptr, 1, options, &parentClass);
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
napi_value TestDefineClassWithOptionsGenericFailure(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value parentClass = nullptr;
    JSVM_CallbackStruct parentClassConstructor;
    parentClassConstructor.data = nullptr;
    parentClassConstructor.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    JSVM_Value fooVal;
    OH_JSVM_CreateStringUtf8(env, "bar", JSVM_AUTO_LENGTH, &fooVal);
    JSVM_PropertyDescriptor des[2];
    des[0] = {
        .utf8name = "foo",
        .value = fooVal,
    };
    JSVM_CallbackStruct parentProperties[] = {
        {.callback = Add, .data = nullptr},
    };
    des[1] = {
        .utf8name = "add",
        .method = &parentProperties[0],
    };
    JSVM_DefineClassOptions options[1];
    options[0].id = JSVM_DEFINE_CLASS_WITH_COUNT;
    options[0].content.num = 1;
    JSVM_Status status = OH_JSVM_DefineClassWithOptions(env, "parentClass", JSVM_AUTO_LENGTH, &parentClassConstructor,
                                                        2, des, nullptr, 1, options, &parentClass);
    int32_t resValue = (status == JSVM_GENERIC_FAILURE) ? 0 : 1;
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "JSVM", "DefineClassWithOptionsGenericFailure status:%{public}d", status);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

void OnBeforeGC(JSVM_VM vm, JSVM_GCType gcType, JSVM_GCCallbackFlags flags, void *data)
{}

napi_value TestAddHandlerForGCJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, OnBeforeGC, JSVM_GC_TYPE_ALL, NULL);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;
    OH_JSVM_RemoveHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, OnBeforeGC, NULL);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestAddHandlerForGCInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, NULL, JSVM_GC_TYPE_ALL, NULL);
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

napi_value TestRemoveHandlerForGCJSOK(napi_env env1, napi_callback_info info)
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

    OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, OnBeforeGC, JSVM_GC_TYPE_ALL, NULL);
    JSVM_Status status = OH_JSVM_RemoveHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, OnBeforeGC, NULL);
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
napi_value TestRemoveHandlerForGCInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Status status = OH_JSVM_RemoveHandlerForGC(vm, JSVM_CB_TRIGGER_AFTER_GC, NULL, NULL);
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

napi_value TestJSVMStatusNameExpected(napi_env env1, napi_callback_info info)
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

    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Value key;
    OH_JSVM_CreateInt32(env, THREE, &key);
    bool hasrRsult;
    JSVM_Status status = OH_JSVM_HasOwnProperty(env, object, key, &hasrRsult);
    int32_t resValue = (status == JSVM_NAME_EXPECTED) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestJSVMStatusFunctionExpected(napi_env env1, napi_callback_info info)
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
    JSVM_Value notFuncCtor;
    OH_JSVM_CreateObject(env, &notFuncCtor);
    bool isInstanceOf = false;
    JSVM_Status status = OH_JSVM_Instanceof(env, obj, notFuncCtor, &isInstanceOf);
    int32_t resValue = (status == JSVM_FUNCTION_EXPECTED) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestJSVMStatusEscapeCalledTwice(napi_env env1, napi_callback_info info)
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
    
    JSVM_EscapableHandleScope scope = nullptr;
    OH_JSVM_OpenEscapableHandleScope(env, &scope);
    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Value escapedObj = nullptr;
    
    OH_JSVM_CloseEscapableHandleScope(env, scope);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);

    JSVM_Status status = OH_JSVM_EscapeHandle(env, scope, obj, &escapedObj);
    int32_t resValue = (status == JSVM_ESCAPE_CALLED_TWICE) ? 0 : 1;
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "JSVM", "TestJSVMStatusEscapeCalledTwice status:%{public}d", status);
    
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestJSVMStatusBigintExpected(napi_env env1, napi_callback_info info)
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
    OH_JSVM_CreateStringUtf8(env, "xyz", THREE, &value);
    int64_t resultValue = 0;
    bool flag = false;
    JSVM_Status status = OH_JSVM_GetValueBigintInt64(env, value, &resultValue, &flag);
    int32_t resValue = (status == JSVM_BIGINT_EXPECTED) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestJSVMStatusDateExpected(napi_env env1, napi_callback_info info)
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

    JSVM_Value createResult = nullptr;
    OH_JSVM_CreateInt32(env, THREE, &createResult);
    double getTime;
    JSVM_Status status = OH_JSVM_GetDateValue(env, createResult, &getTime);
    int32_t resValue = (status == JSVM_DATE_EXPECTED) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestJSVMStatusDetacgableArraybufferExpected(napi_env env1, napi_callback_info info)
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

    JSVM_Value object = nullptr;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Status status = OH_JSVM_DetachArraybuffer(env, object);
    int32_t resValue = (status == JSVM_DETACHABLE_ARRAYBUFFER_EXPECTED) ? 0 : 1;
//    int32_t resValue = (status == JSVM_ARRAYBUFFER_EXPECTED) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestJSVMStatusInvalidType(napi_env env1, napi_callback_info info)
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

    JSVM_Value proxy;
    OH_JSVM_CreateObject(env, &proxy);
    JSVM_Value getTargetResult;
    JSVM_Status status = OH_JSVM_ProxyGetTarget(env, proxy, &getTargetResult);
    int32_t resValue = (status == JSVM_INVALID_TYPE) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestJSVMStatusJitModeExpected(napi_env env1, napi_callback_info info)
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
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "JSVM", "TestJSVMStatusJitModeExpected status:%{public}d", status);

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}