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

struct AddonData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    napi_ref callback = nullptr;
    double args = 0;
    double result = 0;
};

void OnBeforeGC1(JSVM_VM vm, JSVM_GCType gcType, JSVM_GCCallbackFlags flags, void *data)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "JSVM", "PromiseRegisterHandler  status:%{public}d", flags);
    g_beforeFlag1 = true;
}


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

//JSVM_REGEXP_NONE
napi_value JsvmRegexpNoneCode(napi_env env1, napi_callback_info info)
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
    JSVM_Value result = nullptr;
    OH_JSVM_CreateStringUtf8(env, "JSVM_status::JSVM_OK", JSVM_AUTO_LENGTH, &value);
    OH_JSVM_CreateStringUtf8(env, "JSVM_status::JSVM_OK", JSVM_AUTO_LENGTH, &result);
    OH_JSVM_CreateObject(env, &result);
    auto ret = OH_JSVM_CreateRegExp(env, value, JSVM_RegExpFlags::JSVM_REGEXP_NONE, &result);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

static JSVM_Value Add(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2];
    OH_JSVM_GetCbInfo(env, info, &argc, args, NULL, NULL);
    double num1;
    double num2;
    OH_JSVM_GetValueDouble(env, args[0], &num1);
    OH_JSVM_GetValueDouble(env, args[1], &num2);
    JSVM_Value sum = nullptr;
    OH_JSVM_CreateDouble(env, num1 + num2, &sum);
    return sum;
}

//JSVM_DefineClassOptions - boolean
napi_value JsvmDefineClassOptionsCode(napi_env env1, napi_callback_info info)
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

    JSVM_Value parentClass;
    OH_JSVM_CreateStringUtf8(env, "parentClass", JSVM_AUTO_LENGTH, &parentClass);
    JSVM_CallbackStruct *parentClassConstructor = new JSVM_CallbackStruct;
    parentClassConstructor->data = nullptr;
    parentClassConstructor->callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
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
    JSVM_CallbackStruct *addMethod = new JSVM_CallbackStruct;
    addMethod->data = nullptr;
    addMethod->callback = Add;
    des[1] = {
        .utf8name = "add",
        .method = addMethod,
    };
    JSVM_DefineClassOptions options[1];
    options[0].id = JSVM_DEFINE_CLASS_WITH_COUNT;
    options[0].content.boolean = true;
    JSVM_Value result;
    OH_JSVM_CreateStringUtf8(env, "parentClass", JSVM_AUTO_LENGTH, &result);
    OH_JSVM_DefineClassWithOptions(env, "parentClass", JSVM_AUTO_LENGTH,
        parentClassConstructor, 1, des, parentClass, 1, options, &result);

    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, 0, &napiRet);
    return napiRet;
}

//JSVM_DEFINE_CLASS_NORMAL
napi_value JsvmDefineClassNormalCode(napi_env env1, napi_callback_info info)
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

    JSVM_Value parentClass;
    OH_JSVM_CreateStringUtf8(env, "parentClass", JSVM_AUTO_LENGTH, &parentClass);
    JSVM_CallbackStruct *parentClassConstructor = new JSVM_CallbackStruct;
    parentClassConstructor->data = nullptr;
    parentClassConstructor->callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value {
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
    JSVM_CallbackStruct *addMethod = new JSVM_CallbackStruct;
    addMethod->data = nullptr;
    addMethod->callback = Add;
    des[1] = {
        .utf8name = "add",
        .method = addMethod,
    };
    JSVM_DefineClassOptions options[1];
    options[0].id = JSVM_DEFINE_CLASS_NORMAL;
    options[0].content.boolean = true;
    JSVM_Value result;
    OH_JSVM_CreateStringUtf8(env, "parentClass", JSVM_AUTO_LENGTH, &result);
    OH_JSVM_DefineClassWithOptions(env, "parentClass", JSVM_AUTO_LENGTH,
        parentClassConstructor, 1, des, parentClass, 1, options, &result);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, 0, &napiRet);
    return napiRet;
}

//JSVM_GC_TYPE_MINOR_MARK_COMPACT
napi_value JsvmGcTypeMinorMarkCompactCode(napi_env env1, napi_callback_info info)
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

    auto ret = OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC,
                                       OnBeforeGC1, JSVM_GC_TYPE_MINOR_MARK_COMPACT, NULL);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_GC_TYPE_MARK_SWEEP_COMPACT
napi_value JsvmGcTypeMarkSweepCompactCode(napi_env env1, napi_callback_info info)
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

    auto ret = OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, OnBeforeGC1,
                                       JSVM_GC_TYPE_MARK_SWEEP_COMPACT, NULL);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}


//JSVM_GC_TYPE_INCREMENTAL_MARKING
napi_value JsvmGcTypeIncrementalMarkingCode(napi_env env1, napi_callback_info info)
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

    auto ret = OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC, OnBeforeGC1,
                                       JSVM_GC_TYPE_INCREMENTAL_MARKING, NULL);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

//JSVM_GC_TYPE_PROCESS_WEAK_CALLBACKS
napi_value JsvmGcTypeProcessWeakCallbacksCode(napi_env env1, napi_callback_info info)
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

    auto ret = OH_JSVM_AddHandlerForGC(vm, JSVM_CB_TRIGGER_BEFORE_GC,
                                       OnBeforeGC1, JSVM_GC_TYPE_PROCESS_WEAK_CALLBACKS, NULL);
    
    OH_JSVM_CloseHandleScope(env, handlescope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_CloseVMScope(vm, vm_scope);
    OH_JSVM_DestroyVM(vm);
    napi_value napiRet;
    napi_create_int32(env1, ret, &napiRet);
    return napiRet;
}

static void AddExecuteCB(napi_env env, void *data)
{
    AddonData *addonData = (AddonData *)data;
    addonData->result = addonData->args;
}

static void AddCallbackCompleteCB(napi_env env, napi_status status, void *data)
{
    AddonData *addonData = (AddonData *)data;
    napi_value callback = nullptr;
    NAPI_CALL_RETURN_VOID(env, napi_get_reference_value(env, addonData->callback, &callback));
    napi_value result = nullptr;
    NAPI_CALL_RETURN_VOID(env, napi_create_double(env, addonData->result, &result));
    napi_value callbackResult = nullptr;

    int32_t ret = 0;
    NAPI_CALL_RETURN_VOID(env, napi_call_function(env, nullptr, callback, 1, &result, &callbackResult));
    NAPI_CALL_RETURN_VOID(env, napi_get_value_int32(env, callbackResult, &ret));
    int32_t param = 2000;
    NAPI_ASSERT_RETURN_VOID(env, ret == param, "AddCallbackCompleteCB failed");

    if (addonData->callback != nullptr) {
        NAPI_CALL_RETURN_VOID(env, napi_delete_reference(env, addonData->callback));
        addonData->callback = nullptr;
    }

    NAPI_CALL_RETURN_VOID(env, napi_delete_async_work(env, addonData->asyncWork));
    free(addonData);
}

//napi_qos_background
napi_value JsvmNapiQosBackgroundCode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    AddonData* addonData = reinterpret_cast<AddonData*>(malloc(sizeof(AddonData)));
    if (addonData == nullptr) {
        return nullptr;
    }

    NAPI_CALL(env, napi_get_value_double(env, args[0], &addonData->args));
    NAPI_CALL(env, napi_create_reference(env, args[1], 1, &addonData->callback));

    napi_value resourceName = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "AsyncWorkWithQosTest", NAPI_AUTO_LENGTH, &resourceName));
    NAPI_CALL(env, napi_create_async_work(env, nullptr, resourceName, AddExecuteCB, AddCallbackCompleteCB,
        (void *)addonData, &addonData->asyncWork));
    napi_status status = napi_queue_async_work_with_qos(env, addonData->asyncWork, napi_qos_background);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

//napi_qos_utility
napi_value JsvmNapiQosUtilityCode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    AddonData* addonData = reinterpret_cast<AddonData*>(malloc(sizeof(AddonData)));
    if (addonData == nullptr) {
        return nullptr;
    }

    NAPI_CALL(env, napi_get_value_double(env, args[0], &addonData->args));
    NAPI_CALL(env, napi_create_reference(env, args[1], 1, &addonData->callback));

    napi_value resourceName = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "AsyncWorkWithQosTest", NAPI_AUTO_LENGTH, &resourceName));
    NAPI_CALL(env, napi_create_async_work(env, nullptr, resourceName, AddExecuteCB, AddCallbackCompleteCB,
        (void *)addonData, &addonData->asyncWork));
    napi_status status = napi_queue_async_work_with_qos(env, addonData->asyncWork, napi_qos_utility);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}

//napi_qos_user_initiated
napi_value JsvmNapiQosUserInitiaredCode(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    AddonData* addonData = reinterpret_cast<AddonData*>(malloc(sizeof(AddonData)));
    if (addonData == nullptr) {
        return nullptr;
    }

    NAPI_CALL(env, napi_get_value_double(env, args[0], &addonData->args));
    NAPI_CALL(env, napi_create_reference(env, args[1], 1, &addonData->callback));

    napi_value resourceName = nullptr;
    NAPI_CALL(env, napi_create_string_utf8(env, "AsyncWorkWithQosTest", NAPI_AUTO_LENGTH, &resourceName));
    NAPI_CALL(env, napi_create_async_work(env, nullptr, resourceName, AddExecuteCB, AddCallbackCompleteCB,
        (void *)addonData, &addonData->asyncWork));
    napi_status status = napi_queue_async_work_with_qos(env, addonData->asyncWork, napi_qos_user_initiated);
    bool bRet = (status == napi_invalid_arg);
    napi_value retValue;
    napi_create_int32(env, bRet, &retValue);
    return retValue;
}