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

#include "napi/NapiJsvmEnum2Test.h"
#include "jsvm_common.h"
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include "napi/native_common.h"
#include "securec.h"
#include <ark_runtime/jsvm.h>
#include "cstdint"
#include "cstdio"
#include "napi/NapiJsvmErrorCodeTest.h"
#include <hilog/log.h>

static int g_aa = 0;
const int SIXTEEN = 16;
const int TWO = 2;
static bool g_beforeFlag1 = false;
static bool g_beforeFlag2 = false;
static bool g_beforeFlag3 = false;
static bool g_afterFlag1 = false;
static bool g_afterFlag2 = false;
static int g_nativeData = 2024;


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

//JSVM_WRITABLE
napi_value JsvmWritableCode(napi_env env1, napi_callback_info info)
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
    JSVM_Value return_value;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    JSVM_PropertyDescriptor desc = {"prop", NULL, &param, NULL, NULL, NULL, JSVM_PropertyAttributes::JSVM_WRITABLE};
    JSVM_CALL(env, OH_JSVM_CreateObject(env, &object));
    JSVM_CALL(env, OH_JSVM_CreateObject(env, &return_value));
    desc.utf8name = NULL;
    OH_JSVM_DefineProperties(env, object, 1, NULL);
    desc.utf8name = "prop";
    desc.method = NULL;
    JSVM_PropertyDescriptor Proper[2];
    Proper[0] = {
        .utf8name = "foo",
    };
    JSVM_CallbackStruct *addMethod = new JSVM_CallbackStruct;
    addMethod->data = nullptr;
    Proper[1] = {
        .utf8name = "add",
        .method = addMethod,
    };
    auto ret = OH_JSVM_DefineProperties(env, object, 1, Proper);
    desc.method = &param;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_CONFIGURABLE
napi_value JsvmConfigurableCode(napi_env env1, napi_callback_info info)
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
    JSVM_Value return_value;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    JSVM_PropertyDescriptor desc = {"prop", NULL, &param, NULL, NULL, NULL, JSVM_PropertyAttributes::JSVM_CONFIGURABLE};
    JSVM_CALL(env, OH_JSVM_CreateObject(env, &object));
    JSVM_CALL(env, OH_JSVM_CreateObject(env, &return_value));
    desc.utf8name = NULL;
    OH_JSVM_DefineProperties(env, object, 1, NULL);
    desc.utf8name = "prop";
    desc.method = NULL;
    JSVM_PropertyDescriptor Proper[2];
    Proper[0] = {
        .utf8name = "foo",
    };
    JSVM_CallbackStruct *addMethod = new JSVM_CallbackStruct;
    addMethod->data = nullptr;
    Proper[1] = {
        .utf8name = "add",
        .method = addMethod,
    };
    auto ret = OH_JSVM_DefineProperties(env, object, 1, Proper);
    desc.method = &param;
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_NO_RECEIVER_CHECK
napi_value JsvmNoReceiverCheckCode(napi_env env1, napi_callback_info info)
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
    JSVM_Value return_value;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    JSVM_PropertyDescriptor desc = {"prop", NULL, &param, NULL, NULL, NULL,
        JSVM_PropertyAttributes::JSVM_NO_RECEIVER_CHECK};

    JSVM_CALL(env, OH_JSVM_CreateObject(env, &object));
    JSVM_CALL(env, OH_JSVM_CreateObject(env, &return_value));
    desc.utf8name = NULL;
    OH_JSVM_DefineProperties(env, object, 1, NULL);
    desc.utf8name = "prop";
    desc.method = NULL;
    JSVM_PropertyDescriptor Proper[2];
    Proper[0] = {
        .utf8name = "foo",
    };
    JSVM_CallbackStruct *addMethod = new JSVM_CallbackStruct;
    addMethod->data = nullptr;
    Proper[1] = {
        .utf8name = "add",
        .method = addMethod,
    };
    auto ret = OH_JSVM_DefineProperties(env, object, 1, Proper);
    desc.method = &param;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_STATIC
napi_value JsvmStaticCode(napi_env env1, napi_callback_info info)
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
    JSVM_Value return_value;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    JSVM_PropertyDescriptor desc = {"prop", NULL, &param, NULL, NULL, NULL, JSVM_PropertyAttributes::JSVM_STATIC};

    JSVM_CALL(env, OH_JSVM_CreateObject(env, &object));
    JSVM_CALL(env, OH_JSVM_CreateObject(env, &return_value));
    desc.utf8name = NULL;
    OH_JSVM_DefineProperties(env, object, 1, NULL);
    desc.utf8name = "prop";
    desc.method = NULL;
    JSVM_PropertyDescriptor Proper[2];
    Proper[0] = {
        .utf8name = "foo",
    };
    JSVM_CallbackStruct *addMethod = new JSVM_CallbackStruct;
    addMethod->data = nullptr;
    Proper[1] = {
        .utf8name = "add",
        .method = addMethod,
    };
    auto ret = OH_JSVM_DefineProperties(env, object, 1, Proper);
    desc.method = &param;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_DEFAULT_METHOD
napi_value JsvmDefaultMethodCode(napi_env env1, napi_callback_info info)
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
    JSVM_Value return_value;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    JSVM_PropertyDescriptor desc = {"prop",
        NULL, &param, NULL, NULL, NULL, JSVM_PropertyAttributes::JSVM_DEFAULT_METHOD};

    JSVM_CALL(env, OH_JSVM_CreateObject(env, &object));
    JSVM_CALL(env, OH_JSVM_CreateObject(env, &return_value));
    desc.utf8name = NULL;
    OH_JSVM_DefineProperties(env, object, 1, NULL);
    desc.utf8name = "prop";
    desc.method = NULL;
    JSVM_PropertyDescriptor Proper[2];
    Proper[0] = {
        .utf8name = "foo",
    };
    JSVM_CallbackStruct *addMethod = new JSVM_CallbackStruct;
    addMethod->data = nullptr;
    Proper[1] = {
        .utf8name = "add",
        .method = addMethod,
    };
    auto ret = OH_JSVM_DefineProperties(env, object, 1, Proper);
    desc.method = &param;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_METHOD_NO_RECEIVER_CHECK
napi_value JsvmMethodNoReceiverCheckCode(napi_env env1, napi_callback_info info)
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
    JSVM_Value return_value;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    JSVM_PropertyDescriptor desc = {"prop",
        NULL, &param, NULL, NULL, NULL, JSVM_PropertyAttributes::JSVM_METHOD_NO_RECEIVER_CHECK};

    JSVM_CALL(env, OH_JSVM_CreateObject(env, &object));
    JSVM_CALL(env, OH_JSVM_CreateObject(env, &return_value));
    desc.utf8name = NULL;
    OH_JSVM_DefineProperties(env, object, 1, NULL);
    desc.utf8name = "prop";
    desc.method = NULL;
    JSVM_PropertyDescriptor Proper[2];
    Proper[0] = {
        .utf8name = "foo",
    };
    JSVM_CallbackStruct *addMethod = new JSVM_CallbackStruct;
    addMethod->data = nullptr;
    Proper[1] = {
        .utf8name = "add",
        .method = addMethod,
    };
    auto ret = OH_JSVM_DefineProperties(env, object, 1, Proper);
    desc.method = &param;
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_DEFAULT_JSPROPERTY
napi_value JsvmDefaultJspropertyCode(napi_env env1, napi_callback_info info)
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
    JSVM_Value return_value;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    JSVM_PropertyDescriptor desc = {"prop",
        NULL, &param, NULL, NULL, NULL, JSVM_PropertyAttributes::JSVM_DEFAULT_JSPROPERTY};

    JSVM_CALL(env, OH_JSVM_CreateObject(env, &object));
    JSVM_CALL(env, OH_JSVM_CreateObject(env, &return_value));
    desc.utf8name = NULL;
    OH_JSVM_DefineProperties(env, object, 1, NULL);
    desc.utf8name = "prop";
    desc.method = NULL;
    JSVM_PropertyDescriptor Proper[2];
    Proper[0] = {
        .utf8name = "foo",
    };
    JSVM_CallbackStruct *addMethod = new JSVM_CallbackStruct;
    addMethod->data = nullptr;
    Proper[1] = {
        .utf8name = "add",
        .method = addMethod,
    };
    auto ret = OH_JSVM_DefineProperties(env, object, 1, Proper);
    desc.method = &param;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_JSPROPERTY_NO_RECEIVER_CHECK
napi_value JsvmJspropertyNoReceiverlCheckCode(napi_env env1, napi_callback_info info)
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
    JSVM_Value return_value;
    JSVM_CallbackStruct param;
    param.data = nullptr;
    JSVM_PropertyDescriptor desc = {"prop",
        NULL, &param, NULL, NULL, NULL, JSVM_PropertyAttributes::JSVM_JSPROPERTY_NO_RECEIVER_CHECK};

    JSVM_CALL(env, OH_JSVM_CreateObject(env, &object));
    JSVM_CALL(env, OH_JSVM_CreateObject(env, &return_value));
    desc.utf8name = NULL;
    OH_JSVM_DefineProperties(env, object, 1, NULL);
    desc.utf8name = "prop";
    desc.method = NULL;
    JSVM_PropertyDescriptor Proper[2];
    Proper[0] = {
        .utf8name = "foo",
    };
    JSVM_CallbackStruct *addMethod = new JSVM_CallbackStruct;
    addMethod->data = nullptr;
    Proper[1] = {
        .utf8name = "add",
        .method = addMethod,
    };
    auto ret = OH_JSVM_DefineProperties(env, object, 1, Proper);
    desc.method = &param;

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_KEY_ALL_PROPERTIES
napi_value JsvmKeyAllPropertiesCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value props;
    JSVM_Value object = nullptr;
    OH_JSVM_CreateObject(env, &object);
    auto ret = OH_JSVM_GetAllPropertyNames(env, object,
                                           JSVM_KeyCollectionMode::JSVM_KEY_OWN_ONLY,
                                           JSVM_KeyFilter::JSVM_KEY_ALL_PROPERTIES,
                                           JSVM_KeyConversion::JSVM_KEY_KEEP_NUMBERS, &props);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}


//JSVM_KEY_SKIP_STRINGS
napi_value JsvmKeySkipStringsCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value props;
    JSVM_Value object = nullptr;
    OH_JSVM_CreateObject(env, &object);
    auto ret = OH_JSVM_GetAllPropertyNames(env, object, JSVM_KeyCollectionMode::JSVM_KEY_OWN_ONLY,
                                           JSVM_KeyFilter::JSVM_KEY_SKIP_STRINGS,
                                           JSVM_KeyConversion::JSVM_KEY_KEEP_NUMBERS, &props);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}


//JSVM_COMPILE_MODE_DEFAULT
napi_value JsvmCompileModeDefaultCode(napi_env env1, napi_callback_info info)
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
    JSVM_Value jsSrc;
    JSVM_Script script;
    JSVM_ScriptOrigin scriptOrgin {
        .sourceMapUrl = "bundle.js.map",
        .resourceName = "bundle.js"
    };
    JSVM_CompileOptions option[2];
    option[0] = {
        .id = JSVM_COMPILE_MODE,
        .content = { .num = JSVM_COMPILE_MODE_DEFAULT }
    };
    option[1] = {
        .id = JSVM_COMPILE_SCRIPT_ORIGIN,
        .content = { &scriptOrgin }
    };
    OH_JSVM_CreateStringUtf8(env, "src.c_str()", 1, &jsSrc);
    auto ret = OH_JSVM_CompileScriptWithOptions(env, jsSrc, TWO, option, &script);
    JSVM_CodeCache code_cache = {nullptr, 0};
    JSVM_CompileProfile compile_profile = {nullptr, 0};
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

napi_value JsvmFixJSVMExpectedTest(napi_env env1, napi_callback_info info)
{
    JSVM_Status expected = JSVM_BIGINT_EXPECTED;
    int32_t resValue = (expected == JSVM_BIGINT_EXPECTED) ? 0 : 1;
    expected = JSVM_CANCELLED;
    resValue += (expected == JSVM_CANCELLED) ? 0 : 1;
    expected = JSVM_CALLBACK_SCOPE_MISMATCH;
    resValue += (expected == JSVM_CALLBACK_SCOPE_MISMATCH) ? 0 : 1;
    expected = JSVM_QUEUE_FULL;
    resValue += (expected == JSVM_QUEUE_FULL) ? 0 : 1;
    expected = JSVM_CLOSING;
    resValue += (expected == JSVM_CLOSING) ? 0 : 1;
    expected = JSVM_WOULD_DEADLOCK;
    resValue += (expected == JSVM_WOULD_DEADLOCK) ? 0 : 1;
    expected = JSVM_NO_EXTERNAL_BUFFERS_ALLOWED;
    resValue += (expected == JSVM_NO_EXTERNAL_BUFFERS_ALLOWED) ? 0 : 1;
    expected = JSVM_CANNOT_RUN_JS;
    resValue += (expected == JSVM_CANNOT_RUN_JS) ? 0 : 1;
    JSVM_DefineClassOptions options[1];
    options[0].content.ptr = nullptr;
    resValue += (options[0].content.ptr == nullptr) ? 0 : 1;
    JSVM_GCType gct = JSVM_GC_TYPE_SCAVENGE;
    resValue += (gct == JSVM_GC_TYPE_SCAVENGE) ? 0 : 1;
    JSVM_GCCallbackFlags gccbf = JSVM_NO_GC_CALLBACK_FLAGS;
    resValue += (gccbf == JSVM_NO_GC_CALLBACK_FLAGS) ? 0 : 1;
    gccbf = JSVM_GC_CALLBACK_CONSTRUCT_RETAINED_OBJECT_INFOS;
    resValue += (gccbf == JSVM_GC_CALLBACK_CONSTRUCT_RETAINED_OBJECT_INFOS) ? 0 : 1;
    gccbf = JSVM_GC_CALLBACK_FORCED;
    resValue += (gccbf == JSVM_GC_CALLBACK_FORCED) ? 0 : 1;
    gccbf = JSVM_GC_CALLBACK_SYNCHRONOUS_PHANTOM_CALLBACK_PROCESSING;
    resValue += (gccbf == JSVM_GC_CALLBACK_SYNCHRONOUS_PHANTOM_CALLBACK_PROCESSING) ? 0 : 1;
    gccbf = JSVM_GC_CALLBACK_COLLECT_ALL_AVAILABLE_GARBAGE;
    resValue += (gccbf == JSVM_GC_CALLBACK_COLLECT_ALL_AVAILABLE_GARBAGE) ? 0 : 1;
    gccbf = JSVM_GC_CALLBACK_COLLECT_ALL_EXTERNAL_MEMORY;
    resValue += (gccbf == JSVM_GC_CALLBACK_COLLECT_ALL_EXTERNAL_MEMORY) ? 0 : 1;
    gccbf = JSVM_GC_CALLBACK_SCHEDULE_IDLE_GARBAGE_COLLECTION;
    resValue += (gccbf == JSVM_GC_CALLBACK_SCHEDULE_IDLE_GARBAGE_COLLECTION) ? 0 : 1;
    JSVM_InitializedFlag initialized = JSVM_UNINITIALIZED;
    resValue += (initialized == JSVM_UNINITIALIZED) ? 0 : 1;
    JSVM_WasmOptLevel level = JSVM_WASM_OPT_HIGH;
    resValue += (level == JSVM_WASM_OPT_HIGH) ? 0 : 1;
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

napi_value JsvmApiEnumStructTestCheck(napi_env env1, napi_callback_info info)
{
    int32_t resValue = 0;
    JSVM_MicrotaskPolicy plc = JSVM_MICROTASK_EXPLICIT;
    resValue += (plc == JSVM_MICROTASK_EXPLICIT) ? 0 : 1;
    plc = JSVM_MICROTASK_AUTO;
    resValue += (plc == JSVM_MICROTASK_AUTO) ? 0 : 1;
    JSVM_PromiseRejectEvent rej = JSVM_PROMISE_REJECT_OTHER_REASONS;
    resValue += (rej == JSVM_PROMISE_REJECT_OTHER_REASONS) ? 0 : 1;
    rej = JSVM_PROMISE_REJECT_WITH_NO_HANDLER;
    resValue += (rej == JSVM_PROMISE_REJECT_WITH_NO_HANDLER) ? 0 : 1;
    rej = JSVM_PROMISE_ADD_HANDLER_AFTER_REJECTED;
    resValue += (rej == JSVM_PROMISE_ADD_HANDLER_AFTER_REJECTED) ? 0 : 1;
    rej = JSVM_PROMISE_REJECT_AFTER_RESOLVED;
    resValue += (rej == JSVM_PROMISE_REJECT_AFTER_RESOLVED) ? 0 : 1;
    rej = JSVM_PROMISE_RESOLVE_AFTER_RESOLVED;
    resValue += (rej == JSVM_PROMISE_RESOLVE_AFTER_RESOLVED) ? 0 : 1;
    JSVM_MessageErrorLevel errorlevel = JSVM_MESSAGE_LOG;
    resValue += (errorlevel == JSVM_MESSAGE_LOG) ? 0 : 1;
    errorlevel = JSVM_MESSAGE_DEBUG;
    resValue += (errorlevel == JSVM_MESSAGE_DEBUG) ? 0 : 1;
    errorlevel = JSVM_MESSAGE_INFO;
    resValue += (errorlevel == JSVM_MESSAGE_INFO) ? 0 : 1;
    errorlevel = JSVM_MESSAGE_ERROR;
    resValue += (errorlevel == JSVM_MESSAGE_ERROR) ? 0 : 1;
    errorlevel = JSVM_MESSAGE_WARNING;
    resValue += (errorlevel == JSVM_MESSAGE_WARNING) ? 0 : 1;
    errorlevel = JSVM_MESSAGE_ALL;
    resValue += (errorlevel == JSVM_MESSAGE_ALL) ? 0 : 1;
    JSVM_DefineClassOptionsId id = JSVM_DEFINE_CLASS_WITH_PROPERTY_HANDLER;
    resValue += (id == JSVM_DEFINE_CLASS_WITH_PROPERTY_HANDLER) ? 0 : 1;
    napi_value result;
    NAPI_CALL(env1, napi_create_int32(env1, resValue, &result));
    return result;
}

//JSVM_COMPILE_MODE_CONSUME_CODE_CACHE
napi_value JsvmCompileModeConsumeCodeCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value jsSrc;
    JSVM_Script script = nullptr;
    JSVM_ScriptOrigin scriptOrgin {
        .sourceMapUrl = "bundle.js.map",
        .resourceName = "bundle.js"
    };
    JSVM_CompileOptions option[2];
    option[0] = {
        .id = JSVM_COMPILE_MODE,
        .content = { .num = JSVM_COMPILE_MODE_CONSUME_CODE_CACHE }
    };
    option[1] = {
        .id = JSVM_COMPILE_SCRIPT_ORIGIN,
        .content = { &scriptOrgin }
    };
    OH_JSVM_CreateStringUtf8(env, "src.c_str()", 1, &jsSrc);
    auto ret = OH_JSVM_CompileScriptWithOptions(env, jsSrc, TWO, option, &script);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}


//JSVM_COMPILE_MODE_PRODUCE_COMPILE_PROFILE
napi_value JsvmCompileModeProduceCompileProfileCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value jsSrc;
    JSVM_Script script = nullptr;
    JSVM_ScriptOrigin scriptOrgin {
        .sourceMapUrl = "bundle.js.map",
        .resourceName = "bundle.js"
    };
    JSVM_CompileOptions option[2];
    option[0] = {
        .id = JSVM_COMPILE_MODE,
        .content = { .num = JSVM_COMPILE_MODE_PRODUCE_COMPILE_PROFILE }
    };
    option[1] = {
        .id = JSVM_COMPILE_SCRIPT_ORIGIN,
        .content = { &scriptOrgin }
    };
    OH_JSVM_CreateStringUtf8(env, "src.c_str()", 1, &jsSrc);
    auto ret = OH_JSVM_CompileScriptWithOptions(env, jsSrc, TWO, option, &script);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_COMPILE_MODE_CONSUME_COMPILE_PROFILE
napi_value JsvmCompileModeConsumeCompileProfileCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value jsSrc;
    JSVM_Script script = nullptr;
    JSVM_ScriptOrigin scriptOrgin {
        .sourceMapUrl = "bundle.js.map",
        .resourceName = "bundle.js"
    };
    JSVM_CompileOptions option[2];
    option[0] = {
        .id = JSVM_COMPILE_MODE,
        .content = { .num = JSVM_COMPILE_MODE_CONSUME_COMPILE_PROFILE }
    };
    option[1] = {
        .id = JSVM_COMPILE_SCRIPT_ORIGIN,
        .content = { &scriptOrgin }
    };
    OH_JSVM_CreateStringUtf8(env, "src.c_str()", 1, &jsSrc);
    auto ret = OH_JSVM_CompileScriptWithOptions(env, jsSrc, TWO, option, &script);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_COMPILE_CODE_CACHE
napi_value JsvmCompileCodeCacheCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value jsSrc;
    JSVM_Script script = nullptr;
    JSVM_ScriptOrigin scriptOrgin {
        .sourceMapUrl = "bundle.js.map",
        .resourceName = "bundle.js"
    };
    JSVM_CompileOptions option[2];
    option[0] = {
        .id = JSVM_COMPILE_MODE,
        .content = { .num = JSVM_COMPILE_MODE_PRODUCE_COMPILE_PROFILE }
    };
    option[1] = {
        .id = JSVM_COMPILE_CODE_CACHE,
        .content = { &scriptOrgin }
    };
    OH_JSVM_CreateStringUtf8(env, "src.c_str()", 1, &jsSrc);
    auto ret = OH_JSVM_CompileScriptWithOptions(env, jsSrc, TWO, option, &script);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_COMPILE_COMPILE_PROFILE
napi_value JsvmCompileCompileProfileCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value jsSrc;
    JSVM_Script script = nullptr;
    JSVM_ScriptOrigin scriptOrgin {
        .sourceMapUrl = "bundle.js.map",
        .resourceName = "bundle.js"
    };
    JSVM_CompileOptions option[2];
    option[0] = {
        .id = JSVM_COMPILE_MODE,
        .content = { .num = JSVM_COMPILE_MODE_PRODUCE_COMPILE_PROFILE }
    };
    option[1] = {
        .id = JSVM_COMPILE_COMPILE_PROFILE,
        .content = { &scriptOrgin }
    };
    OH_JSVM_CreateStringUtf8(env, "src.c_str()", 1, &jsSrc);
    auto ret = OH_JSVM_CompileScriptWithOptions(env, jsSrc, TWO, option, &script);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_COMPILE_ENABLE_SOURCE_MAP
napi_value JsvmCompileEnableSourceMapCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_Value jsSrc;
    JSVM_Script script = nullptr;
    JSVM_ScriptOrigin scriptOrgin {
        .sourceMapUrl = "bundle.js.map",
        .resourceName = "bundle.js"
    };
    JSVM_CompileOptions option[2];
    option[0] = {
        .id = JSVM_COMPILE_MODE,
        .content = { .num = JSVM_COMPILE_MODE_PRODUCE_COMPILE_PROFILE }
    };
    option[1] = {
        .id = JSVM_COMPILE_ENABLE_SOURCE_MAP,
        .content = { &scriptOrgin }
    };
    OH_JSVM_CreateStringUtf8(env, "src.c_str()", 1, &jsSrc);
    auto ret = OH_JSVM_CompileScriptWithOptions(env, jsSrc, TWO, option, &script);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//totalHeapSize
napi_value JsvmHeapStatisticsTotalHeapSizeCode(napi_env env1, napi_callback_info info)
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
    
    OH_JSVM_GetVM(env, &vm);
    JSVM_HeapStatistics result;
    OH_JSVM_GetHeapStatistics(vm, &result);
    JSVM_Value nativeContextsCnt = nullptr;
    auto ret = OH_JSVM_CreateInt64(env, result.totalHeapSize, &nativeContextsCnt);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//totalHeapSizeExecutable
napi_value JsvmHeapStatisticsTotalHeapSizeExecutableCode(napi_env env1, napi_callback_info info)
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
    
    OH_JSVM_GetVM(env, &vm);
    JSVM_HeapStatistics result;
    OH_JSVM_GetHeapStatistics(vm, &result);
    JSVM_Value nativeContextsCnt = nullptr;
    auto ret = OH_JSVM_CreateInt64(env, result.totalHeapSizeExecutable, &nativeContextsCnt);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//totalPhysicalSize
napi_value JsvmHeapStatisticsTotalPhysicalSizeCode(napi_env env1, napi_callback_info info)
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
    
    OH_JSVM_GetVM(env, &vm);
    JSVM_HeapStatistics result;
    OH_JSVM_GetHeapStatistics(vm, &result);
    JSVM_Value nativeContextsCnt = nullptr;
    auto ret = OH_JSVM_CreateInt64(env, result.totalPhysicalSize, &nativeContextsCnt);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//totalAvailableSize
napi_value JsvmHeapStatisticsTotalAvailableSizeCode(napi_env env1, napi_callback_info info)
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
    
    OH_JSVM_GetVM(env, &vm);
    JSVM_HeapStatistics result;
    OH_JSVM_GetHeapStatistics(vm, &result);
    JSVM_Value nativeContextsCnt = nullptr;
    auto ret = OH_JSVM_CreateInt64(env, result.totalAvailableSize, &nativeContextsCnt);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//usedHeapSize
napi_value JsvmHeapStatisticsUsedHeapSizeCode(napi_env env1, napi_callback_info info)
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
    
    OH_JSVM_GetVM(env, &vm);
    JSVM_HeapStatistics result;
    OH_JSVM_GetHeapStatistics(vm, &result);
    JSVM_Value nativeContextsCnt = nullptr;
    auto ret = OH_JSVM_CreateInt64(env, result.usedHeapSize, &nativeContextsCnt);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//heapSizeLimit
napi_value JsvmHeapStatisticsHeapSizeLimitCode(napi_env env1, napi_callback_info info)
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
    
    OH_JSVM_GetVM(env, &vm);
    JSVM_HeapStatistics result;
    OH_JSVM_GetHeapStatistics(vm, &result);
    JSVM_Value nativeContextsCnt = nullptr;
    auto ret = OH_JSVM_CreateInt64(env, result.heapSizeLimit, &nativeContextsCnt);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//mallocedMemory
napi_value JsvmHeapStatisticsMallocedMemoryCode(napi_env env1, napi_callback_info info)
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
    
    OH_JSVM_GetVM(env, &vm);
    JSVM_HeapStatistics result;
    OH_JSVM_GetHeapStatistics(vm, &result);
    JSVM_Value nativeContextsCnt = nullptr;
    auto ret = OH_JSVM_CreateInt64(env, result.mallocedMemory, &nativeContextsCnt);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//externalMemory
napi_value JsvmHeapStatisticsExternalMemoryCode(napi_env env1, napi_callback_info info)
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
    
    OH_JSVM_GetVM(env, &vm);
    JSVM_HeapStatistics result;
    OH_JSVM_GetHeapStatistics(vm, &result);
    JSVM_Value nativeContextsCnt = nullptr;
    auto ret = OH_JSVM_CreateInt64(env, result.externalMemory, &nativeContextsCnt);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//peakMallocedMemory
napi_value JsvmHeapStatisticsPeakMallocedMemoryCode(napi_env env1, napi_callback_info info)
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
    
    OH_JSVM_GetVM(env, &vm);
    JSVM_HeapStatistics result;
    OH_JSVM_GetHeapStatistics(vm, &result);
    JSVM_Value nativeContextsCnt = nullptr;
    auto ret = OH_JSVM_CreateInt64(env, result.peakMallocedMemory, &nativeContextsCnt);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//numberOfDetachedContexts
napi_value JsvmHeapStatisticsNumberOfDetachedContextCode(napi_env env1, napi_callback_info info)
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
    
    OH_JSVM_GetVM(env, &vm);
    JSVM_HeapStatistics result;
    OH_JSVM_GetHeapStatistics(vm, &result);
    JSVM_Value nativeContextsCnt = nullptr;
    auto ret = OH_JSVM_CreateInt64(env, result.numberOfDetachedContexts, &nativeContextsCnt);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//totalGlobalHandlesSize
napi_value JsvmHeapStatisticsTotalGlobalHandlesSizeCode(napi_env env1, napi_callback_info info)
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
    
    OH_JSVM_GetVM(env, &vm);
    JSVM_HeapStatistics result;
    OH_JSVM_GetHeapStatistics(vm, &result);
    JSVM_Value nativeContextsCnt = nullptr;
    auto ret = OH_JSVM_CreateInt64(env, result.totalGlobalHandlesSize, &nativeContextsCnt);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//usedGlobalHandlesSize
napi_value JsvmHeapStatisticsUsedGlobalHandlesSizeCode(napi_env env1, napi_callback_info info)
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
    
    OH_JSVM_GetVM(env, &vm);
    JSVM_HeapStatistics result;
    OH_JSVM_GetHeapStatistics(vm, &result);
    JSVM_Value nativeContextsCnt = nullptr;
    auto ret = OH_JSVM_CreateInt64(env, result.usedGlobalHandlesSize, &nativeContextsCnt);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//argc
napi_value JsvmInitOptionsArgcCode(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    intptr_t externals[] = {
    (intptr_t)&hello_cb,
    0
    };
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    init_options.argc = 0;
    auto ret = OH_JSVM_Init(&init_options);
    
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//argv
napi_value JsvmInitOptionsArgvCode(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    intptr_t externals[] = {
    (intptr_t)&hello_cb,
    0
    };
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    init_options.argv = 0;
    auto ret = OH_JSVM_Init(&init_options);
    
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//removeFlags
napi_value JsvmInitOptionsRemoveFlagsCode(napi_env env1, napi_callback_info info)
{
    JSVM_InitOptions init_options;
    intptr_t externals[] = {
    (intptr_t)&hello_cb,
    0, 2, 3
    };
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    init_options.externalReferences = externals;
    init_options.removeFlags = false;
    auto ret = OH_JSVM_Init(&init_options);
    
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//maxOldGenerationSize
napi_value JsvmCreateVmOptionsMaxOldGenerationSizeCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_CreateVMOptions vmOptions;
    if (memset_s(&vmOptions, sizeof(vmOptions), 0, sizeof(vmOptions)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    vmOptions.isForSnapshotting = false;
    vmOptions.maxOldGenerationSize = 1;
    auto ret = OH_JSVM_CreateVM(&vmOptions, &vm);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//maxYoungGenerationSize
napi_value JsvmCreateVmOptionsMaxYoungGenerationSizeCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_CreateVMOptions vmOptions;
    if (memset_s(&vmOptions, sizeof(vmOptions), 0, sizeof(vmOptions)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    vmOptions.isForSnapshotting = false;
    vmOptions.maxYoungGenerationSize = 1;
    auto ret = OH_JSVM_CreateVM(&vmOptions, &vm);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//initialOldGenerationSize
napi_value JsvmCreateVmOptionsInitialOldGenerationSizeCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_CreateVMOptions vmOptions;
    if (memset_s(&vmOptions, sizeof(vmOptions), 0, sizeof(vmOptions)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    vmOptions.isForSnapshotting = false;
    vmOptions.initialOldGenerationSize = 1;
    auto ret = OH_JSVM_CreateVM(&vmOptions, &vm);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//initialYoungGenerationSize
napi_value JsvmCreateVmOptionsInitialYoungGenerationSizeCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_CreateVMOptions vmOptions;
    if (memset_s(&vmOptions, sizeof(vmOptions), 0, sizeof(vmOptions)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    vmOptions.isForSnapshotting = false;
    vmOptions.initialYoungGenerationSize = 1;
    auto ret = OH_JSVM_CreateVM(&vmOptions, &vm);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//snapshotBlobData
napi_value JsvmCreateVmOptionsSnapshotBlobDataCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_CreateVMOptions vmOptions;
    if (memset_s(&vmOptions, sizeof(vmOptions), 0, sizeof(vmOptions)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    vmOptions.isForSnapshotting = false;
    vmOptions.snapshotBlobData = 0;
    auto ret = OH_JSVM_CreateVM(&vmOptions, &vm);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//snapshotBlobSize
napi_value JsvmCreateVmOptionsSnapshotBlobSizeCode(napi_env env1, napi_callback_info info)
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
    
    JSVM_CreateVMOptions vmOptions;
    if (memset_s(&vmOptions, sizeof(vmOptions), 0, sizeof(vmOptions)) != EOK) {
        printf("memset_s failed");
        return nullptr;
    }
    vmOptions.isForSnapshotting = false;
    vmOptions.snapshotBlobSize = 1;
    auto ret = OH_JSVM_CreateVM(&vmOptions, &vm);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//engine
napi_value JsvmVmInfoEngineCode(napi_env env1, napi_callback_info info)
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

    JSVM_VMInfo result;
    OH_JSVM_GetVMInfo(&result);
    JSVM_Value version;
    JSVM_Value* val;
    auto ret = OH_JSVM_CreateStringUtf8(env, result.engine, 1, &version);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//version
napi_value JsvmVmInfoVersionCode(napi_env env1, napi_callback_info info)
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

    JSVM_VMInfo result;
    OH_JSVM_GetVMInfo(&result);
    JSVM_Value version;
    JSVM_Value* val;
    auto ret = OH_JSVM_CreateStringUtf8(env, result.version, 1, &version);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//cachedDataVersionTag
napi_value JsvmVmInfoCachedDataVersionTagCode(napi_env env1, napi_callback_info info)
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

    JSVM_VMInfo result;
    OH_JSVM_GetVMInfo(&result);
    JSVM_Value version;
    auto ret = OH_JSVM_CreateUint32(env, result.cachedDataVersionTag, &version);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//engineReserved
napi_value JsvmExtendedErrorInfoEngineReservedCode(napi_env env1, napi_callback_info info)
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
    
    const JSVM_ExtendedErrorInfo *errorInfo = nullptr;
    OH_JSVM_GetLastErrorInfo(env, &errorInfo);
    JSVM_Value propValue;
    auto ret = OH_JSVM_CreateStringUtf8(env,
        (errorInfo->engineReserved == 0 ? "JSVM_status::JSVM_OK" : errorInfo->errorMessage), JSVM_AUTO_LENGTH,
        &propValue);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//engineErrorCode
napi_value JsvmExtendedErrorInfoEngineErrorCode(napi_env env1, napi_callback_info info)
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
    
    const JSVM_ExtendedErrorInfo *errorInfo = nullptr;
    OH_JSVM_GetLastErrorInfo(env, &errorInfo);
    OH_JSVM_GetLastErrorInfo(env, &errorInfo);
    JSVM_Value propValue;
    auto ret = OH_JSVM_CreateStringUtf8(env,
        (errorInfo->engineErrorCode == 0 ? "JSVM_status::JSVM_OK" : errorInfo->errorMessage), JSVM_AUTO_LENGTH,
        &propValue);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}
