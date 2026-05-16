/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include <string>

constexpr size_t ZERO = 0;
constexpr size_t ONE = 1;
constexpr size_t TWO = 2;
constexpr size_t THREE = 3;
constexpr size_t SIXTEEN = 16;
constexpr size_t EIGHTEEN = 18;

struct AddBeforeData {
    napi_ref namespaceRef;
    napi_ref oldFuncRef;
    napi_ref beforeRef;
};

static napi_value HookedFuncCallback(napi_env env, napi_callback_info info)
{
    size_t argc = SIXTEEN;
    napi_value args[SIXTEEN];
    napi_value thisArg;
    void* data = nullptr;

    napi_get_cb_info(env, info, &argc, args, &thisArg, &data);

    AddBeforeData* hookData = static_cast<AddBeforeData*>(data);
    if (hookData == nullptr) {
        napi_value undefined;
        napi_get_undefined(env, &undefined);
        return undefined;
    }

    napi_value beforeFunc;
    napi_get_reference_value(env, hookData->beforeRef, &beforeFunc);

    napi_value global;
    napi_get_global(env, &global);

    napi_call_function(env, global, beforeFunc, argc, args, nullptr);

    napi_value oldFunc;
    napi_get_reference_value(env, hookData->oldFuncRef, &oldFunc);

    napi_value result;
    napi_call_function(env, global, oldFunc, argc, args, &result);

    return result;
}

static void FreeAddBeforeData(napi_env env, void* data, void* hint)
{
    AddBeforeData* hookData = static_cast<AddBeforeData*>(data);
    if (hookData != nullptr) {
        napi_delete_reference(env, hookData->namespaceRef);
        napi_delete_reference(env, hookData->oldFuncRef);
        napi_delete_reference(env, hookData->beforeRef);
        delete hookData;
    }
}

static napi_value AddBefore(napi_env env, napi_callback_info info)
{
    size_t argc = THREE;
    napi_value args[THREE] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype namespaceType;
    napi_typeof(env, args[ZERO], &namespaceType);
    if (namespaceType != napi_object) {
        napi_throw_error(env, nullptr, "Parameter error. The namespace cannot be null or undefined");
        return nullptr;
    }

    size_t methodNameLen = ZERO;
    napi_get_value_string_utf8(env, args[ONE], nullptr, ZERO, &methodNameLen);
    std::string methodName(methodNameLen + ONE, '\0');
    napi_get_value_string_utf8(env, args[ONE], &methodName[ZERO], methodNameLen + ONE, &methodNameLen);
    methodName.resize(methodNameLen);

    napi_value oldFunc;
    napi_get_named_property(env, args[ZERO], methodName.c_str(), &oldFunc);

    napi_valuetype oldFuncType;
    napi_typeof(env, oldFunc, &oldFuncType);
    if (oldFuncType != napi_function) {
        napi_throw_error(env, nullptr, "Parameter error. methodName is not a function");
        return nullptr;
    }

    napi_valuetype beforeType;
    napi_typeof(env, args[TWO], &beforeType);
    if (beforeType != napi_function) {
        napi_throw_error(env, nullptr, "Parameter error. The type of before must be function");
        return nullptr;
    }

    AddBeforeData* hookData = new AddBeforeData();
    napi_create_reference(env, args[ZERO], ONE, &hookData->namespaceRef);
    napi_create_reference(env, oldFunc, ONE, &hookData->oldFuncRef);
    napi_create_reference(env, args[TWO], ONE, &hookData->beforeRef);

    napi_value newFunc;
    napi_create_function(env, "hookedFunc", NAPI_AUTO_LENGTH, HookedFuncCallback, hookData, &newFunc);

    napi_add_finalizer(env, newFunc, hookData, FreeAddBeforeData, nullptr, nullptr);

    napi_set_named_property(env, args[ZERO], methodName.c_str(), newFunc);

    return nullptr;
}

struct AddAfterData {
    napi_ref oldFuncRef;
    napi_ref afterRef;
};

static napi_value AddAfterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = SIXTEEN;
    napi_value args[SIXTEEN];
    napi_value thisArg;
    void* data = nullptr;

    napi_get_cb_info(env, info, &argc, args, &thisArg, &data);

    AddAfterData* hookData = static_cast<AddAfterData*>(data);
    if (hookData == nullptr) {
        napi_value undefined;
        napi_get_undefined(env, &undefined);
        return undefined;
    }

    napi_value global;
    napi_get_global(env, &global);

    napi_value oldFunc;
    napi_get_reference_value(env, hookData->oldFuncRef, &oldFunc);

    napi_value ret;
    napi_call_function(env, global, oldFunc, argc, args, &ret);

    napi_value afterFunc;
    napi_get_reference_value(env, hookData->afterRef, &afterFunc);

    napi_value afterArgs[EIGHTEEN];
    afterArgs[ZERO] = thisArg;
    afterArgs[ONE] = ret;
    for (size_t i = ZERO; i < argc; i++) {
        afterArgs[i + TWO] = args[i];
    }

    napi_value result;
    napi_call_function(env, global, afterFunc, argc + TWO, afterArgs, &result);

    return result;
}

static void FreeAddAfterData(napi_env env, void* data, void* hint)
{
    AddAfterData* hookData = static_cast<AddAfterData*>(data);
    if (hookData != nullptr) {
        napi_delete_reference(env, hookData->oldFuncRef);
        napi_delete_reference(env, hookData->afterRef);
        delete hookData;
    }
}

static napi_value AddAfter(napi_env env, napi_callback_info info)
{
    size_t argc = THREE;
    napi_value args[THREE] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype namespaceType;
    napi_typeof(env, args[ZERO], &namespaceType);
    if (namespaceType != napi_object) {
        napi_throw_error(env, nullptr, "Parameter error. The namespace cannot be null or undefined");
        return nullptr;
    }

    size_t methodNameLen = ZERO;
    napi_get_value_string_utf8(env, args[ONE], nullptr, ZERO, &methodNameLen);
    std::string methodName(methodNameLen + ONE, '\0');
    napi_get_value_string_utf8(env, args[ONE], &methodName[ZERO], methodNameLen + ONE, &methodNameLen);
    methodName.resize(methodNameLen);

    napi_value oldFunc;
    napi_get_named_property(env, args[ZERO], methodName.c_str(), &oldFunc);

    napi_valuetype oldFuncType;
    napi_typeof(env, oldFunc, &oldFuncType);
    if (oldFuncType != napi_function) {
        napi_throw_error(env, nullptr, "Parameter error. methodName is not a function");
        return nullptr;
    }

    napi_valuetype afterType;
    napi_typeof(env, args[TWO], &afterType);
    if (afterType != napi_function) {
        napi_throw_error(env, nullptr, "Parameter error. The type of after must be function");
        return nullptr;
    }

    AddAfterData* hookData = new AddAfterData();
    napi_create_reference(env, oldFunc, ONE, &hookData->oldFuncRef);
    napi_create_reference(env, args[TWO], ONE, &hookData->afterRef);

    napi_value newFunc;
    napi_create_function(env, "addAfterFunc", NAPI_AUTO_LENGTH, AddAfterCallback, hookData, &newFunc);

    napi_add_finalizer(env, newFunc, hookData, FreeAddAfterData, nullptr, nullptr);

    napi_set_named_property(env, args[ZERO], methodName.c_str(), newFunc);

    return nullptr;
}

struct ReplaceData {
    napi_ref insteadRef;
};

static napi_value ReplaceCallback(napi_env env, napi_callback_info info)
{
    size_t argc = SIXTEEN;
    napi_value args[SIXTEEN];
    void* data = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, &data);

    ReplaceData* hookData = static_cast<ReplaceData*>(data);
    if (hookData == nullptr) {
        napi_value undefined;
        napi_get_undefined(env, &undefined);
        return undefined;
    }

    napi_value insteadFunc;
    napi_get_reference_value(env, hookData->insteadRef, &insteadFunc);

    napi_value global;
    napi_get_global(env, &global);

    napi_value result;
    napi_call_function(env, global, insteadFunc, argc, args, &result);

    return result;
}

static void FreeReplaceData(napi_env env, void* data, void* hint)
{
    ReplaceData* hookData = static_cast<ReplaceData*>(data);
    if (hookData != nullptr) {
        napi_delete_reference(env, hookData->insteadRef);
        delete hookData;
    }
}

static napi_value Replace(napi_env env, napi_callback_info info)
{
    size_t argc = THREE;
    napi_value args[THREE] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype namespaceType;
    napi_typeof(env, args[ZERO], &namespaceType);
    if (namespaceType != napi_object) {
        napi_throw_error(env, nullptr, "Parameter error. The namespace cannot be null or undefined");
        return nullptr;
    }

    size_t methodNameLen = ZERO;
    napi_get_value_string_utf8(env, args[ONE], nullptr, ZERO, &methodNameLen);
    std::string methodName(methodNameLen + ONE, '\0');
    napi_get_value_string_utf8(env, args[ONE], &methodName[ZERO], methodNameLen + ONE, &methodNameLen);
    methodName.resize(methodNameLen);

    napi_value oldFunc;
    napi_get_named_property(env, args[ZERO], methodName.c_str(), &oldFunc);

    napi_valuetype oldFuncType;
    napi_typeof(env, oldFunc, &oldFuncType);
    if (oldFuncType != napi_function) {
        napi_throw_error(env, nullptr, "Parameter error. methodName is not a function");
        return nullptr;
    }

    napi_valuetype insteadType;
    napi_typeof(env, args[TWO], &insteadType);
    if (insteadType != napi_function) {
        napi_throw_error(env, nullptr, "Parameter error. The type of instead must be function");
        return nullptr;
    }

    ReplaceData* hookData = new ReplaceData();
    napi_create_reference(env, args[TWO], ONE, &hookData->insteadRef);

    napi_value newFunc;
    napi_create_function(env, "replaceFunc", NAPI_AUTO_LENGTH, ReplaceCallback, hookData, &newFunc);

    napi_add_finalizer(env, newFunc, hookData, FreeReplaceData, nullptr, nullptr);

    napi_set_named_property(env, args[ZERO], methodName.c_str(), newFunc);

    return nullptr;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "addBefore", nullptr, AddBefore, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "addAfter", nullptr, AddAfter, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "replace", nullptr, Replace, nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
