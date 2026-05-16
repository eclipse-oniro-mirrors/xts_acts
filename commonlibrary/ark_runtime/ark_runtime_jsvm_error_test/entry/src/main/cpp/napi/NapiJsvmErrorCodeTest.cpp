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

#include "napi/NapiJsvmErrorCodeTest.h"
#include "jsvm_common.h"
#include "napi/native_api.h"
#include "native_common.h"
#include "securec.h"
#include "cstdint"
#include "cstdio"

static int g_aa = 0;
const int SIXTEEN = 16;
const int TWO = 2;

static JSVM_Value hello(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value output;
    void *data = nullptr;
    OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, nullptr, &data);
    OH_JSVM_CreateStringUtf8(env, (char *)data, strlen((char *)data), &output);
    return output;
}
static JSVM_CallbackStruct hello_cb = {hello, (void *)"Hello"};
static intptr_t g_externals[] = {
    (intptr_t)&hello_cb,
    0,
};

JSVM_Status CreateVMInstance(JSVM_VM* vm)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed\n");
        return JSVM_INVALID_ARG;
    }
    init_options.externalReferences = g_externals;

    if (g_aa == 0) {
        OH_JSVM_Init(&init_options);
        g_aa++;
    }

    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed\n");
        return JSVM_INVALID_ARG;
    }

    return OH_JSVM_CreateVM(&options, vm);
}

JSVM_Status CreateVMWithCreateSnapshot(JSVM_VM *vm, JSVM_VMScope *vmScope, JSVM_Env *env)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed\n");
        return JSVM_INVALID_ARG;
    }
    init_options.externalReferences = g_externals;
    if (g_aa == 0) {
        OH_JSVM_Init(&init_options);
        g_aa++;
    }

    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        printf("memset_s failed\n");
        return JSVM_INVALID_ARG;
    }
    options.isForSnapshotting = true;
    OH_JSVM_CreateVM(&options, vm);
    OH_JSVM_OpenVMScope(*vm, vmScope);
    JSVM_PropertyDescriptor descriptor[] = {
        {"hello", nullptr, &hello_cb, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    };
    return OH_JSVM_CreateEnv(*vm, 1, descriptor, env);
}


napi_value TestCreateVMJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    JSVM_Status status = CreateVMInstance(&vm);
    
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;
   
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateProxyJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value target;
    JSVM_Value handler;
    JSVM_Value getFunc;
    JSVM_Value proxy;
    OH_JSVM_CreateObject(env, &target);
    OH_JSVM_CreateObject(env, &handler);

    JSVM_Status status = OH_JSVM_CreateProxy(env, target, handler, &proxy);

    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateProxyPending(napi_env env1, napi_callback_info info)
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

    JSVM_Value target;
    JSVM_Value handler;
    JSVM_Value getFunc;
    JSVM_Value proxy;
    OH_JSVM_CreateObject(env, &target);
    OH_JSVM_CreateObject(env, &handler);
    
    OH_JSVM_ThrowError(env, nullptr, "testCreateProxyPending:OH_JSVM_CreateProxy Failed.");
    JSVM_Status status = OH_JSVM_CreateProxy(env, target, handler, &proxy);

    int32_t resValue;
    if (status == JSVM_PENDING_EXCEPTION) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateProxyInvalid(napi_env env1, napi_callback_info info)
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

    JSVM_Value target;
    JSVM_Value handler;
    JSVM_Value getFunc;
    JSVM_Value proxy;
    OH_JSVM_CreateObject(env, &target);
    OH_JSVM_CreateObject(env, &handler);
    
    JSVM_Status status = OH_JSVM_CreateProxy(env, target, NULL, &proxy);

    int32_t resValue;
    if (status == JSVM_INVALID_ARG) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateProxyObejct(napi_env env1, napi_callback_info info)
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

    JSVM_Value target;
    JSVM_Value handler;
    JSVM_Value getFunc;
    JSVM_Value proxy;
    OH_JSVM_CreateInt32(env, 0, &target);
    OH_JSVM_CreateObject(env, &handler);

    JSVM_Status status = OH_JSVM_CreateProxy(env, target, handler, &proxy);

    int32_t resValue;
    if (status == JSVM_OBJECT_EXPECTED) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestIsProxyJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value target;
    JSVM_Value handler;
    JSVM_Value proxy;
    OH_JSVM_CreateObject(env, &target);
    OH_JSVM_CreateObject(env, &handler);

    OH_JSVM_CreateProxy(env, target, handler, &proxy);
    bool isProxy = false;
    JSVM_Status status = OH_JSVM_IsProxy(env, proxy, &isProxy);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestIsProxyInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    
    bool isProxy = false;
    JSVM_Status status = OH_JSVM_IsProxy(env, NULL, &isProxy);
    int32_t resValue;
    if (status == JSVM_INVALID_ARG) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }
    
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestProxyGetTargetJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value target;
    JSVM_Value handler;
    JSVM_Value proxy;
    OH_JSVM_CreateObject(env, &target);
    OH_JSVM_CreateObject(env, &handler);

    OH_JSVM_CreateProxy(env, target, handler, &proxy);

    JSVM_Value getTargetResult;
    JSVM_Status status = OH_JSVM_ProxyGetTarget(env, proxy, &getTargetResult);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestProxyGetTargetInvalid(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value getTargetResult;
    JSVM_Status status = OH_JSVM_ProxyGetTarget(env, NULL, &getTargetResult);
    int32_t resValue;
    if (status == JSVM_INVALID_ARG) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestProxyGetTargetInvalidType(napi_env env1, napi_callback_info info)
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
    int32_t resValue;
    if (status == JSVM_INVALID_TYPE) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestOpenVMScopeJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    
    JSVM_VMScope vmScope;
    JSVM_Status status = OH_JSVM_OpenVMScope(vm, &vmScope);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
    }
    OH_JSVM_CloseVMScope(vm, vmScope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCloseVMScopeJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    
    JSVM_VMScope vmScope;
    OH_JSVM_OpenVMScope(vm, &vmScope);

    JSVM_Status status = OH_JSVM_CloseVMScope(vm, vmScope);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
    }
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateEnvJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_Status status = OH_JSVM_CreateEnv(vm, 0, nullptr, &env);

    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateEnvFromSnapshotJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    JSVM_Status status = OH_JSVM_CreateEnvFromSnapshot(vm, JSVM_AUTO_LENGTH, &env);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestDestroyEnvJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    
    JSVM_Status status = OH_JSVM_DestroyEnv(env);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestOpenEnvScopeJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    
    JSVM_EnvScope envScope;
    JSVM_Status status = OH_JSVM_OpenEnvScope(env, &envScope);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCloseEnvScopeJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);

    JSVM_Status status = OH_JSVM_CloseEnvScope(env, envScope);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;

    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestGetVMJSOK(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    
    JSVM_VM testVm;
    JSVM_Status status = OH_JSVM_GetVM(env, &testVm);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCompileScriptJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_CompileScript(env, jsFunctionStr, nullptr, 0, false, nullptr, &script);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }
    
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateCodeCacheJSOK(napi_env env1, napi_callback_info info)
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
    
    uint8_t *cache;
    size_t length;
    JSVM_Status status = OH_JSVM_CreateCodeCache(env, script, (const uint8_t**)&cache, &length);
    int32_t resValue = (status == JSVM_OK) ? 0 : 1;
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestThrowJSOK(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value errorCode = nullptr;
    OH_JSVM_CreateStringUtf8(env, "-1", JSVM_AUTO_LENGTH, &errorCode);
    JSVM_Value errorMessage = nullptr;
    OH_JSVM_CreateStringUtf8(env, "HasError", JSVM_AUTO_LENGTH, &errorMessage);
    JSVM_Value error = nullptr;
    OH_JSVM_CreateError(env, errorCode, errorMessage, &error);
    JSVM_Status status = OH_JSVM_Throw(env, error);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestOpenHandleScopeJSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_OpenHandleScope(env, &handlescope);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestOpenEscapableHandleScopeJSOK(napi_env env1, napi_callback_info info)
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
    
    JSVM_EscapableHandleScope handlescope1;
    JSVM_Status status = OH_JSVM_OpenEscapableHandleScope(env, &handlescope1);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }
    OH_JSVM_CloseEscapableHandleScope(env, handlescope1);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCloseEscapableHandleScopeJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_EscapableHandleScope handlescope1;
    OH_JSVM_OpenEscapableHandleScope(env, &handlescope1);
    JSVM_Status status = OH_JSVM_CloseEscapableHandleScope(env, handlescope1);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestGetReferenceValueJSOK(napi_env env1, napi_callback_info info)
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
    OH_JSVM_CreateDouble(env, 0.0, &value);
    JSVM_Ref reference = nullptr;
    OH_JSVM_CreateReference(env, value, 1, &reference);
    JSVM_Value resulttemp = nullptr;
    JSVM_Status status = OH_JSVM_GetReferenceValue(env, reference, &resulttemp);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateArrayJSOK(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value ret;
    JSVM_Status status = OH_JSVM_CreateArray(env, &ret);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestAllocateArrayBufferBackingStoreDataInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    
    void *backingStore;
    JSVM_Value arrayBuffer;
    JSVM_Status status = OH_JSVM_AllocateArrayBufferBackingStoreData(100, JSVM_ZERO_INITIALIZED, NULL);
    int32_t resValue;
    if (status == JSVM_INVALID_ARG) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }
    
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestAllocateArrayBufferBackingStoreDataGenericFailure(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    
    void *backingStore;
    JSVM_Value arrayBuffer;
    JSVM_Status status = OH_JSVM_AllocateArrayBufferBackingStoreData((size_t)-1, JSVM_ZERO_INITIALIZED, &backingStore);
    int32_t resValue;
    if (status == JSVM_GENERIC_FAILURE) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }
    
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestFreeArrayBufferBackingStoreDataInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    
    JSVM_Status status = OH_JSVM_FreeArrayBufferBackingStoreData(NULL);
    int32_t resValue;
    if (status == JSVM_INVALID_ARG) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }
    
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);

    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateArrayBufferFromBackingStoreDataInvalid(napi_env env1, napi_callback_info info)
{
    JSVM_VM vm;
    CreateVMInstance(&vm);
    JSVM_VMScope vm_scope;
    OH_JSVM_OpenVMScope(vm, &vm_scope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, 0, nullptr, &env);
    
    void *storeData = nullptr;
    size_t storeLen = SIXTEEN;
    OH_JSVM_AllocateArrayBufferBackingStoreData(storeLen, JSVM_ZERO_INITIALIZED, &storeData);
    JSVM_Value arrayBuffer;
    JSVM_Status status = OH_JSVM_CreateArrayBufferFromBackingStoreData(env, storeData, storeLen, 0, storeLen, NULL);
    int32_t resValue;
    if (status == JSVM_INVALID_ARG) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }
    
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateDateJSOK(napi_env env1, napi_callback_info info)
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
    double time = 202508181203150;
    JSVM_Status status = OH_JSVM_CreateDate(env, time, &createResult);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
        printf("Status: %d\n", status);
    }

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateExternalJSOK(napi_env env1, napi_callback_info info)
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

    const char testStr[] = "test";
    JSVM_Value external = nullptr;
    JSVM_Status status = OH_JSVM_CreateExternal(
        env, (void *)testStr, [](JSVM_Env env, void *data, void *hint) {}, (void *)testStr, &external);
    int32_t resValue;
    if (status == JSVM_OK) {
        resValue = 0;
    } else {
        resValue = 1;
    }
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestCreateSymbolJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value resultValue;
    const char *des = "only";
    OH_JSVM_CreateStringUtf8(env, des, JSVM_AUTO_LENGTH, &resultValue);
    JSVM_Value returnSymbol;
    JSVM_Status status = OH_JSVM_CreateSymbol(env, resultValue, &returnSymbol);
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

napi_value TestCreateBigintInt64JSOK(napi_env env1, napi_callback_info info)
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
    JSVM_Status status = OH_JSVM_CreateBigintInt64(env, testValue, &resultValue);
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

napi_value TestGetArrayLengthJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value ret;
    OH_JSVM_CreateArray(env, &ret);
    bool isArray = false;
    OH_JSVM_IsArray(env, ret, &isArray);
    if (!isArray) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetArrayLengthJSOK: OH_JSVM_GetArrayLength Failed");
        return nullptr;
    }
    uint32_t length;
    JSVM_Status status = OH_JSVM_GetArrayLength(env, ret, &length);
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

napi_value TestGetPrototypeJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value customClass = nullptr;
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
        JSVM_Value thisVar = nullptr;
        OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, &thisVar, nullptr);
        return thisVar;
    };
    OH_JSVM_DefineClass(env, "TestWrapClass", NAPI_AUTO_LENGTH, &param1, 0, nullptr, &customClass);
    JSVM_Value customClassPrototype = nullptr;
    JSVM_Status status = OH_JSVM_GetPrototype(env, customClass, &customClassPrototype);
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

napi_value TestGetDateValueJSOK(napi_env env1, napi_callback_info info)
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
    double time = 202508181203150;
    OH_JSVM_CreateDate(env, time, &createResult);
    double getTime;
    JSVM_Status status = OH_JSVM_GetDateValue(env, createResult, &getTime);
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

napi_value TestGetDateValueExpected(napi_env env1, napi_callback_info info)
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
    OH_JSVM_CreateInt32(env, TWO, &createResult);
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

napi_value TestGetValueBoolJSOK(napi_env env1, napi_callback_info info)
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
    
    bool value1 = true;
    JSVM_Value boolValue;
    OH_JSVM_GetBoolean(env, value1, &boolValue);
    bool value2;
    JSVM_Status status = OH_JSVM_GetValueBool(env, boolValue, &value2);
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

napi_value TestGetValueDoubleExpected(napi_env env1, napi_callback_info info)
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
    OH_JSVM_CreateStringUtf8(env, "xyz", TWO, &value);
    double doubleValue;
    JSVM_Status status = OH_JSVM_GetValueDouble(env, value, &doubleValue);
    int32_t resValue = (status == JSVM_NUMBER_EXPECTED) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}


napi_value TestGetValueBigintInt64Expected(napi_env env1, napi_callback_info info)
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
    OH_JSVM_CreateStringUtf8(env, "xyz", TWO, &value);
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

napi_value TestGetValueBigintUint64JSOK(napi_env env1, napi_callback_info info)
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

    uint64_t testValue = UINT64_MAX;
    JSVM_Value resultValue = nullptr;
    OH_JSVM_CreateBigintUint64(env, testValue, &resultValue);
    uint64_t resultValue1 = 0;
    bool flag1 = false;
    JSVM_Status status = OH_JSVM_GetValueBigintUint64(env, resultValue, &resultValue1, &flag1);
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

napi_value TestGetValueBigintUint64Expected(napi_env env1, napi_callback_info info)
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
    OH_JSVM_CreateStringUtf8(env, "xyz", TWO, &value);
    uint64_t resultValue1 = 0;
    bool flag1 = false;
    JSVM_Status status = OH_JSVM_GetValueBigintUint64(env, value, &resultValue1, &flag1);
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


napi_value TestGetValueExternalInvalid(napi_env env1, napi_callback_info info)
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
    
    void *dataValue;
    JSVM_Status status = OH_JSVM_GetValueExternal(env, nullptr, &dataValue);
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

napi_value TestGetValueInt32Expected(napi_env env1, napi_callback_info info)
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
    OH_JSVM_CreateStringUtf8(env, "xyz", TWO, &value);
    int32_t value1;
    JSVM_Status status = OH_JSVM_GetValueInt32(env, value, &value1);
    int32_t resValue = (status == JSVM_NUMBER_EXPECTED) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value TestGetValueInt64Expected(napi_env env1, napi_callback_info info)
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
    OH_JSVM_CreateStringUtf8(env, "xyz", TWO, &value);
    int64_t value1;
    JSVM_Status status = OH_JSVM_GetValueInt64(env, value, &value1);
    int32_t resValue = (status == JSVM_NUMBER_EXPECTED) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestGetValueStringLatin1JSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value description;
    OH_JSVM_CreateStringLatin1(env, "teststr", TWO, &description);
    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;
    JSVM_Status status = OH_JSVM_GetValueStringLatin1(env, description, buffer, bufferSize, &copied);
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
napi_value TestGetValueStringLatin1Expected(napi_env env1, napi_callback_info info)
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

    JSVM_Value description;
    OH_JSVM_CreateInt32(env, 0, &description);
    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;
    JSVM_Status status = OH_JSVM_GetValueStringLatin1(env, description, buffer, bufferSize, &copied);
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

napi_value TestGetValueStringUtf8JSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value description;
    OH_JSVM_CreateStringUtf8(env, "teststr", TWO, &description);
    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf8(env, description, buffer, bufferSize, &copied);
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
napi_value TestGetValueStringUtf8Expected(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value description;
    OH_JSVM_CreateInt32(env, 0, &description);
    char buffer[128];
    size_t bufferSize = 128;
    size_t copied = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf8(env, description, buffer, bufferSize, &copied);
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

napi_value TestGetValueStringUtf16JSOK(napi_env env1, napi_callback_info info)
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

    const char16_t *str = u"he";
    JSVM_Value result4;
    OH_JSVM_CreateStringUtf16(env, str, TWO, &result4);
    char16_t buffer1[128];    // 128: char16_t type of element size
    size_t bufferSize1 = 128; // 128: char16_t type of element size
    size_t copied1 = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf16(env, result4, buffer1, bufferSize1, &copied1);
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
napi_value TestGetValueStringUtf16Expected(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value description;
    OH_JSVM_CreateInt32(env, 0, &description);
    char16_t buffer1[128];    // 128: char16_t type of element size
    size_t bufferSize1 = 128; // 128: char16_t type of element size
    size_t copied1 = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf16(env, description, buffer1, bufferSize1, &copied1);
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

napi_value TestGetValueUint32JSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value output2;
    OH_JSVM_CreateUint32(env, 0, &output2);
    uint32_t value2;
    JSVM_Status status = OH_JSVM_GetValueUint32(env, output2, &value2);
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
napi_value TestGetValueUint32Expected(napi_env env1, napi_callback_info info)
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
    OH_JSVM_CreateStringUtf8(env, "xyz", TWO, &value);
    uint32_t value2;
    JSVM_Status status = OH_JSVM_GetValueUint32(env, value, &value2);
    int32_t resValue = (status == JSVM_NUMBER_EXPECTED) ? 0 : 1;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}
napi_value TestGetBooleanJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value rhs = nullptr;
    bool value = true;
    JSVM_Status status = OH_JSVM_GetBoolean(env, value, &rhs);
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

napi_value TestGetNullJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value lhs = nullptr;
    JSVM_Status status = OH_JSVM_GetNull(env, &lhs);
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

napi_value TestGetUndefinedJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value rhs = nullptr;
    JSVM_Status status = OH_JSVM_GetUndefined(env, &rhs);
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

napi_value TestCoerceToBoolJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value value1;
    OH_JSVM_CreateInt32(env, 0, &value1);
    JSVM_Value value2;
    JSVM_Status status = OH_JSVM_CoerceToBool(env, value1, &value2);
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

napi_value TestCoerceToNumberJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value value3;
    OH_JSVM_CreateStringUtf8(env, "12", TWO, &value3);
    JSVM_Value value4;
    JSVM_Status status = OH_JSVM_CoerceToNumber(env, value3, &value4);
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

napi_value TestCoerceToObjectJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value ret;
    OH_JSVM_CreateArray(env, &ret);
    JSVM_Value value5;
    JSVM_Status status = OH_JSVM_CoerceToObject(env, ret, &value5);
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

napi_value TestCoerceToStringJSOK(napi_env env1, napi_callback_info info)
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

    JSVM_Value value1;
    OH_JSVM_CreateInt32(env, 0, &value1);
    JSVM_Value value6;
    JSVM_Status status = OH_JSVM_CoerceToString(env, value1, &value6);
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