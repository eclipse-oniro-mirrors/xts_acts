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

#include "napi/native_api.h"
#include "napi_lifecycle_test.h"

//handlescope:OH_JSVM_OpenHandleScope
//env null,return not ok
[[maybe_unused]] JSVM_Value TestOpenHandleScopeCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_HandleScope handleScope;
    JSVM_Status status = OH_JSVM_OpenHandleScope(nullptr, &handleScope);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase01:OH_JSVM_OpenHandleScope Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//env not null,return ok
static JSVM_Value assertEqual(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2];
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, NULL, NULL);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "assertEqual Failed.");
        return nullptr;
    }

    bool isStrictEquals = false;
    status = OH_JSVM_StrictEquals(env, args[0], args[1], &isStrictEquals);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "OH_JSVM_StrictEquals Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}

[[maybe_unused]] JSVM_Value TestOpenHandleScopeCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != 0) {
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase02:OH_JSVM_CreateVM Failed.");
        return nullptr;
    }

    JSVM_Env env1;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase02:OH_JSVM_CreateEnv Failed.");
        return nullptr;
    }
    JSVM_HandleScope handleScope;
    status = OH_JSVM_OpenHandleScope(env1, &handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase02:OH_JSVM_OpenHandleScope Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//env not null，call this interface twice，first ok, second ok
[[maybe_unused]] JSVM_Value TestOpenHandleScopeCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != 0) {
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase03:OH_JSVM_CreateVM Failed.");
        return nullptr;
    }

    JSVM_Env env1;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase03:OH_JSVM_CreateEnv Failed.");
        return nullptr;
    }
    JSVM_HandleScope handleScope;
    status = OH_JSVM_OpenHandleScope(env1, &handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase03:OH_JSVM_OpenHandleScope 1 Failed.");
        return nullptr;
    }

    status = OH_JSVM_OpenHandleScope(env1, &handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase03:OH_JSVM_OpenHandleScope 2 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//open two scope,create jsvm value,close one scope,expected inability to access jsvm value again
[[maybe_unused]] JSVM_Value TestOpenHandleScopeCase04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != 0) {
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase04:OH_JSVM_CreateVM Failed.");
        return nullptr;
    }

    JSVM_Env env1;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase04:OH_JSVM_CreateEnv Failed.");
        return nullptr;
    }
    JSVM_HandleScope handleScope;
    status = OH_JSVM_OpenHandleScope(env1, &handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase04:OH_JSVM_OpenHandleScope 1 Failed.");
        return nullptr;
    }

    JSVM_HandleScope handleScope1;
    status = OH_JSVM_OpenHandleScope(env1, &handleScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase04:OH_JSVM_OpenHandleScope 2 Failed.");
        return nullptr;
    }

    JSVM_Value rhs;
    status = OH_JSVM_CreateInt32(env, 1, &rhs);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase04:OH_JSVM_CreateInt32 Failed.");
        return nullptr;
    }

    status = OH_JSVM_CloseHandleScope(env1, handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase04:OH_JSVM_CloseHandleScope Failed.");
        return nullptr;
    }

    int32_t num;
    status = OH_JSVM_GetValueInt32(env, rhs, &num);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenHandleScopeCase04:OH_JSVM_GetValueInt32 Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//handlescope:OH_JSVM_CloseHandleScope:scope nullptr,return not ok
[[maybe_unused]] JSVM_Value TestCloseHandleScopeCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_CloseHandleScope(env, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseHandleScopeCase01:OH_JSVM_CloseHandleScope Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//Call this interface after opening,return ok
[[maybe_unused]] JSVM_Value TestCloseHandleScopeCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != 0) {
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseHandleScopeCase02:OH_JSVM_CreateVM Failed.");
        return nullptr;
    }
    JSVM_Env env1;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseHandleScopeCase02:OH_JSVM_CreateEnv Failed.");
        return nullptr;
    }
    JSVM_HandleScope handleScope;
    status = OH_JSVM_OpenHandleScope(env1, &handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseHandleScopeCase02:OH_JSVM_OpenHandleScope Failed.");
        return nullptr;
    }

    status = OH_JSVM_CloseHandleScope(env1, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseHandleScopeCase02:OH_JSVM_CloseHandleScope Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//open twice,close twice,return ok
[[maybe_unused]] JSVM_Value TestOpenAndCloseHandleScopeCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != 0) {
        return nullptr;
    }
    JSVM_Status status;
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_Env env1;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenAndCloseHandleScopeCase01:OH_JSVM_CreateEnv Failed.");
        return nullptr;
    }
    JSVM_HandleScope handleScope;
    status = OH_JSVM_OpenHandleScope(env1, &handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenAndCloseHandleScopeCase01:OH_JSVM_OpenHandleScope Failed.");
        return nullptr;
    }
    JSVM_HandleScope handleScope1;
    status = OH_JSVM_OpenHandleScope(env1, &handleScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenAndCloseHandleScopeCase01:OH_JSVM_OpenHandleScope Failed.");
        return nullptr;
    }
    status = OH_JSVM_CloseHandleScope(env1, handleScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr,
                           "TestOpenAndCloseHandleScopeCase01:OH_JSVM_CloseHandleScope Handlescope1 Failed.");
        return nullptr;
    }
    status = OH_JSVM_CloseHandleScope(env1, handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr,
                           "TestOpenAndCloseHandleScopeCase01:OH_JSVM_CloseHandleScope Handlescope Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//open,close twice,first ok, second not ok
[[maybe_unused]] JSVM_Value TestOpenAndCloseHandleScopeCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != 0) {
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenAndCloseHandleScopeCase02:OH_JSVM_CreateVM Failed.");
        return nullptr;
    }
    JSVM_Env env1;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenAndCloseHandleScopeCase02:OH_JSVM_CreateEnv Failed.");
        return nullptr;
    }
    JSVM_HandleScope handleScope;
    status = OH_JSVM_OpenHandleScope(env1, &handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenAndCloseHandleScopeCase02:OH_JSVM_OpenHandleScope Failed.");
        return nullptr;
    }

    status = OH_JSVM_CloseHandleScope(env1, handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env,
                           nullptr,
                           "TestOpenAndCloseHandleScopeCase02:OH_JSVM_CloseHandleScope Handlescope1 Failed.");
        return nullptr;
    }

    status = OH_JSVM_CloseHandleScope(env1, handleScope);
    if (status != JSVM_HANDLE_SCOPE_MISMATCH) {
        OH_JSVM_ThrowError(env,
                           nullptr,
                           "TestOpenAndCloseHandleScopeCase02:OH_JSVM_CloseHandleScope Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//EscapableHandleScope:OH_JSVM_OpenEscapableHandleScope:env null,return not ok
[[maybe_unused]] JSVM_Value TestOpenEscapableHandleScopeCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_EscapableHandleScope handleScope1;
    JSVM_Status status = OH_JSVM_OpenEscapableHandleScope(nullptr, &handleScope1);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env,
                           nullptr,
                           "TestOpenEscapableHandleScopeCase01:OH_JSVM_OpenEscapableHandleScope Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//env not null,return ok
static int g_tempNum = 0;
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
[[maybe_unused]] JSVM_Value TestOpenEscapableHandleScopeCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_InitOptions init_options;
    if (memset_s(&init_options, sizeof(init_options), 0, sizeof(init_options)) != 0) {
        return nullptr;
    }
    init_options.externalReferences = g_externals;
    if (g_tempNum == 0) {
        OH_JSVM_Init(&init_options);
        g_tempNum++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != 0) {
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEscapableHandleScopeCase02:OH_JSVM_CreateVM Failed.");
        return nullptr;
    }
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEscapableHandleScopeCase02:OH_JSVM_OpenVMScope Failed.");
        return nullptr;
    }

    JSVM_Env env1;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEscapableHandleScopeCase02:OH_JSVM_CreateEnv Failed.");
        return nullptr;
    }
    JSVM_EnvScope envScope;
    status = OH_JSVM_OpenEnvScope(env1, &envScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEscapableHandleScopeCase02:OH_JSVM_OpenEnvScope Failed.");
        return nullptr;
    }
    JSVM_HandleScope handleScope;
    status = OH_JSVM_OpenHandleScope(env1, &handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEscapableHandleScopeCase02:OH_JSVM_OpenHandleScope Failed.");
        return nullptr;
    }
    JSVM_EscapableHandleScope handleScope1 = nullptr;
    status = OH_JSVM_OpenEscapableHandleScope(env1, &handleScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEscapableHandleScopeCase02:OH_JSVM_OpenEscapableHandleScope Failed.");
        return nullptr;
    }
    OH_JSVM_CloseEscapableHandleScope(env1, handleScope1);
    OH_JSVM_CloseHandleScope(env1, handleScope);
    OH_JSVM_CloseEnvScope(env1, envScope);
    OH_JSVM_DestroyEnv(env1);
    OH_JSVM_CloseVMScope(vm, vmScope);
    OH_JSVM_DestroyVM(vm);

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//env not null,call twice func,first ok, second ok
[[maybe_unused]] JSVM_Value TestOpenEscapableHandleScopeCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != 0) {
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEscapableHandleScopeCase03:OH_JSVM_CreateVM Failed.");
        return nullptr;
    }
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEscapableHandleScopeCase03:OH_JSVM_OpenVMScope Failed.");
        return nullptr;
    }
    JSVM_Env env1;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEscapableHandleScopeCase03:OH_JSVM_CreateEnv Failed.");
        return nullptr;
    }
    JSVM_EnvScope envScope;
    status = OH_JSVM_OpenEnvScope(env1, &envScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEscapableHandleScopeCase03:OH_JSVM_OpenEnvScope Failed.");
        return nullptr;
    }
    JSVM_HandleScope handleScope;
    status = OH_JSVM_OpenHandleScope(env1, &handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEscapableHandleScopeCase03:OH_JSVM_OpenHandleScope Failed.");
        return nullptr;
    }
    JSVM_EscapableHandleScope handleScope1;
    status = OH_JSVM_OpenEscapableHandleScope(env1, &handleScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEscapableHandleScopeCase03:OpenEscapableHandleScope 1 Failed.");
        return nullptr;
    }

    status = OH_JSVM_OpenEscapableHandleScope(env1, &handleScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEscapableHandleScopeCase03:OpenEscapableHandleScope 2 Failed.");
        return nullptr;
    }
    OH_JSVM_CloseEscapableHandleScope(env1, handleScope1);
    OH_JSVM_CloseHandleScope(env1, handleScope);
    OH_JSVM_CloseEnvScope(env1, envScope);
    OH_JSVM_DestroyEnv(env1);
    OH_JSVM_CloseVMScope(vm, vmScope);
    OH_JSVM_DestroyVM(vm);

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//EscapableHandleScope:OH_JSVM_CloseEscapableHandleScope:scope nullptr,return not ok
[[maybe_unused]] JSVM_Value TestCloseEscapableHandleScopeCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_CloseEscapableHandleScope(env, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEscapableHandleScopeCase01:CloseEscapable Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//open,call func,return ok
[[maybe_unused]] JSVM_Value TestCloseEscapableHandleScopeCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_EscapableHandleScope handleScope;
    JSVM_Status status = OH_JSVM_OpenEscapableHandleScope(env, &handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env,
                           nullptr,
                           "TestCloseEscapableHandleScopeCase02:OH_JSVM_OpenEscapableHandleScope 1 Failed.");
        return nullptr;
    }

    status = OH_JSVM_CloseEscapableHandleScope(env, handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env,
                           nullptr,
                           "TestCloseEscapableHandleScopeCase02:OH_JSVM_CloseEscapableHandleScope Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//not open,call func,failed
[[maybe_unused]] JSVM_Value TestCloseEscapableHandleScopeCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_CloseEscapableHandleScope(env, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env,
                           nullptr,
                           "TestCloseEscapableHandleScopeCase03:CloseEscapableHandleScope Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//EscapableHandleScope:OH_JSVM_EscapeHandle:JSVM_EscapableHandleScope scope,
//not call OpenEscapableHandleScope,call this func,return not ok
[[maybe_unused]] JSVM_Value TestEscapeHandleCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_EscapableHandleScope scopeVar = nullptr;
    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Value escapedObj = nullptr;
    JSVM_Status status = OH_JSVM_EscapeHandle(env, scopeVar, obj, &escapedObj);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestEscapeHandleCase01:OH_JSVM_EscapeHandle Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//JSVM_EscapableHandleScope scope null,return not ok
[[maybe_unused]] JSVM_Value TestEscapeHandleCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Value escapedObj = nullptr;
    JSVM_Status status = OH_JSVM_EscapeHandle(env, nullptr, obj, &escapedObj);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestEscapeHandleCase02:OH_JSVM_EscapeHandle Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//JSVM_EscapableHandleScope,open,return ok
[[maybe_unused]] JSVM_Value TestEscapeHandleCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != 0) {
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestEscapeHandleCase03:OH_JSVM_CreateVM Failed.");
        return nullptr;
    }
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestEscapeHandleCase03:OH_JSVM_OpenVMScope Failed.");
        return nullptr;
    }
    JSVM_Env env1;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestEscapeHandleCase03:OH_JSVM_CreateEnv Failed.");
        return nullptr;
    }
    JSVM_EnvScope envScope;
    status = OH_JSVM_OpenEnvScope(env1, &envScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestEscapeHandleCase03:OH_JSVM_OpenEnvScope Failed.");
        return nullptr;
    }
    JSVM_HandleScope handleScope;
    status = OH_JSVM_OpenHandleScope(env1, &handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestEscapeHandleCase03:OH_JSVM_OpenHandleScope Failed.");
        return nullptr;
    }
    JSVM_EscapableHandleScope handleScope1;
    status = OH_JSVM_OpenEscapableHandleScope(env1, &handleScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestEscapeHandleCase03:OH_JSVM_OpenEscapableHandleScope Failed.");
        return nullptr;
    }

    JSVM_Value output = NULL;
    JSVM_Value escapee = NULL;
    OH_JSVM_CreateObject(env, &output);
    status = OH_JSVM_EscapeHandle(env1, handleScope1, output, &escapee);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestEscapeHandleCase03:OH_JSVM_EscapeHandle Failed.");
        return nullptr;
    }
    OH_JSVM_CloseEscapableHandleScope(env1, handleScope1);
    OH_JSVM_CloseHandleScope(env1, handleScope);
    OH_JSVM_CloseEnvScope(env1, envScope);
    OH_JSVM_DestroyEnv(env1);
    OH_JSVM_CloseVMScope(vm, vmScope);
    OH_JSVM_DestroyVM(vm);

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//JSVM_Value escapee obj null,return not ok
[[maybe_unused]] JSVM_Value TestEscapeHandleCase04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != 0) {
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vmScope;
    OH_JSVM_OpenVMScope(vm, &vmScope);
    JSVM_Env env1;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env1, &envScope);
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env1, &handleScope);
    JSVM_EscapableHandleScope handleScope1;
    JSVM_Status status = OH_JSVM_OpenEscapableHandleScope(env1, &handleScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestEscapeHandleCase03:OH_JSVM_OpenEscapableHandleScope Failed.");
        return nullptr;
    }

    JSVM_Value escapee = NULL;
    status = OH_JSVM_EscapeHandle(env, handleScope1, nullptr, &escapee);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestEscapeHandleCase04:OH_JSVM_EscapeHandle Execution exception.");
        return nullptr;
    }

    OH_JSVM_CloseEscapableHandleScope(env1, handleScope1);
    OH_JSVM_CloseHandleScope(env1, handleScope);
    OH_JSVM_CloseEnvScope(env1, envScope);
    OH_JSVM_DestroyEnv(env1);
    OH_JSVM_CloseVMScope(vm, vmScope);
    OH_JSVM_DestroyVM(vm);
    
    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//JSVM_Value escapee valid value，return ok
[[maybe_unused]] JSVM_Value TestEscapeHandleCase05(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != 0) {
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vmScope;
    OH_JSVM_OpenVMScope(vm, &vmScope);
    JSVM_Env env1;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env1, &envScope);
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env1, &handleScope);
    JSVM_EscapableHandleScope handleScope1;
    JSVM_Status status = OH_JSVM_OpenEscapableHandleScope(env1, &handleScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestEscapeHandleCase05:OH_JSVM_OpenEscapableHandleScope Failed.");
        return nullptr;
    }

    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env1, &obj);
    JSVM_Value value = nullptr;
    OH_JSVM_CreateStringUtf8(env1, "test jsvm_escapehandle", JSVM_AUTO_LENGTH, &value);
    OH_JSVM_SetNamedProperty(env1, obj, "name", value);

    JSVM_Value escapedObj = NULL;
    status = OH_JSVM_EscapeHandle(env1, handleScope1, obj, &escapedObj);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestEscapeHandleCase05:OH_JSVM_EscapeHandle Failed.");
        return nullptr;
    }

    OH_JSVM_CloseEscapableHandleScope(env1, handleScope1);
    OH_JSVM_CloseHandleScope(env1, handleScope);
    OH_JSVM_CloseEnvScope(env1, envScope);
    OH_JSVM_DestroyEnv(env1);
    OH_JSVM_CloseVMScope(vm, vmScope);
    OH_JSVM_DestroyVM(vm);

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//API:EscapeHandle combination test:open twice,call close,return ok
[[maybe_unused]] JSVM_Value TestOpenClosedEscapeCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_EscapableHandleScope scopeVar = nullptr;
    JSVM_Status status = OH_JSVM_OpenEscapableHandleScope(env, &scopeVar);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenClosedEscapeCase01:OpenEscapable 1 Failed.");
        return nullptr;
    }

    JSVM_EscapableHandleScope scopeVar1 = nullptr;
    status = OH_JSVM_OpenEscapableHandleScope(env, &scopeVar1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenClosedEscapeCase01:OpenEscapable 2 Failed.");
        return nullptr;
    }

    status = OH_JSVM_CloseEscapableHandleScope(env, scopeVar1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenClosedEscapeCase01:CloseEscapable 1 Failed.");
        return nullptr;
    }

    status = OH_JSVM_CloseEscapableHandleScope(env, scopeVar);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenClosedEscapeCase01:CloseEscapable 2 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//create two handlescope1 and handlescope2,create multiple obj,
//handlescope1 call escapehandle,handlescope2 use this obj
[[maybe_unused]] JSVM_Value TestOpenClosedEscapeCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != 0) {
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vmScope;
    OH_JSVM_OpenVMScope(vm, &vmScope);
    JSVM_Env env1;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env1, &envScope);
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env1, &handleScope);
    JSVM_EscapableHandleScope handleScope1;
    JSVM_Status status = OH_JSVM_OpenEscapableHandleScope(env1, &handleScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenClosedEscapeCase02:OpenEscapable Failed.");
        return nullptr;
    }

    JSVM_EscapableHandleScope handleScope2 = nullptr;
    status = OH_JSVM_OpenEscapableHandleScope(env1, &handleScope2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenClosedEscapeCase02:OpenEscapable Failed.");
        return nullptr;
    }

    JSVM_Value testObj;
    OH_JSVM_CreateObject(env1, &testObj);

    const char testStr[] = "too";
    JSVM_Value value;
    OH_JSVM_CreateStringUtf8(env1, testStr, strlen(testStr), &value);
    OH_JSVM_SetNamedProperty(env1, testObj, "test", value);
    JSVM_Value resultVar = nullptr;
    status = OH_JSVM_EscapeHandle(env1, handleScope1, testObj, &resultVar);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenClosedEscapeCase02:OH_JSVM_EscapeHandle 1 Failed.");
        return nullptr;
    }

    resultVar = nullptr;
    status = OH_JSVM_EscapeHandle(env1, handleScope2, testObj, &resultVar);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenClosedEscapeCase02:OH_JSVM_EscapeHandle 2 Failed.");
        return nullptr;
    }

    OH_JSVM_CloseEscapableHandleScope(env1, handleScope1);
    OH_JSVM_CloseHandleScope(env1, handleScope);
    OH_JSVM_CloseEnvScope(env1, envScope);
    OH_JSVM_DestroyEnv(env1);
    OH_JSVM_CloseVMScope(vm, vmScope);
    OH_JSVM_DestroyVM(vm);

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_CreateReference
//value nullptr,call test func,return not ok
[[maybe_unused]] JSVM_Value TestCreateReferenceCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Ref reference;
    JSVM_Status status = OH_JSVM_CreateReference(env, nullptr, 1, &reference);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateReferenceCase01:OH_JSVM_CreateReference Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//jsvm value is normal data,initialRefcount 0,return ok
[[maybe_unused]] JSVM_Value TestCreateReferenceCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Ref reference;
    JSVM_Status status = OH_JSVM_CreateReference(env, obj, 0, &reference);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateReferenceCase02:OH_JSVM_CreateReference Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//jsvm value is normal data,initialRefcount 1,return ok,result not nullptr
[[maybe_unused]] JSVM_Value TestCreateReferenceCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Ref reference;
    JSVM_Status status = OH_JSVM_CreateReference(env, obj, 1, &reference);
    if (status != JSVM_OK || reference == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateReferenceCase03:OH_JSVM_CreateReference Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_DeleteReference
//ref null,return not ok
[[maybe_unused]] JSVM_Value TestDeleteReferenceCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_DeleteReference(env, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteReferenceCase02:OH_JSVM_DeleteReference Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_CreateReference create ref,return ok
[[maybe_unused]] JSVM_Value TestDeleteReferenceCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value obj = nullptr;
    OH_JSVM_CreateObject(env, &obj);
    JSVM_Ref reference;
    JSVM_Status status = OH_JSVM_CreateReference(env, obj, 1, &reference);
    if (status != JSVM_OK || reference == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteReferenceCase02:OH_JSVM_CreateReference Failed.");
        return nullptr;
    }

    status = OH_JSVM_DeleteReference(env, reference);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeleteReferenceCase02:OH_JSVM_DeleteReference Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_ReferenceRef:ref nullptr, return not ok
[[maybe_unused]] JSVM_Value TestReferenceRefCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint32_t resultRefCount = 0;
    JSVM_Status status = OH_JSVM_ReferenceRef(env, nullptr, &resultRefCount);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceRefCase01:OH_JSVM_ReferenceRef Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//create ref,increase citation count，return ok
[[maybe_unused]] JSVM_Value TestReferenceRefCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testObj = nullptr;
    JSVM_Ref resultRef = nullptr;
    OH_JSVM_CreateObject(env, &testObj);
    JSVM_Status status = OH_JSVM_CreateReference(env, testObj, 1, &resultRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceRefCase02:OH_JSVM_CreateReference Failed.");
        return nullptr;
    }

    uint32_t resultRefCount = 0;
    status = OH_JSVM_ReferenceRef(env, resultRef, &resultRefCount);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceRefCase02:OH_JSVM_ReferenceRef Failed.");
        return nullptr;
    }
    size_t testNum = 2;
    if (resultRefCount != testNum) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceRefCase02:OH_JSVM_ReferenceRef resultRefCount Error.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//repeated call,return ok
[[maybe_unused]] JSVM_Value TestReferenceRefCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value testObj = nullptr;
    JSVM_Ref resultRef = nullptr;
    OH_JSVM_CreateObject(env, &testObj);
    JSVM_Status status = OH_JSVM_CreateReference(env, testObj, 1, &resultRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceRefCase03:OH_JSVM_CreateReference Failed.");
        return nullptr;
    }

    uint32_t resultRefCount = 0;
    status = OH_JSVM_ReferenceRef(env, resultRef, &resultRefCount);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceRefCase03:OH_JSVM_ReferenceRef 1 Failed.");
        return nullptr;
    }
    status = OH_JSVM_ReferenceRef(env, resultRef, &resultRefCount);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceRefCase03:OH_JSVM_ReferenceRef 2 Failed.");
        return nullptr;
    }
    status = OH_JSVM_ReferenceRef(env, resultRef, &resultRefCount);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceRefCase03:OH_JSVM_ReferenceRef 3 Failed.");
        return nullptr;
    }
    size_t testNum = 4;
    if (resultRefCount != testNum) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceRefCase03:OH_JSVM_ReferenceRef resultRefCount Error.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_ReferenceUnref:ref nullptr,return not ok
[[maybe_unused]] JSVM_Value TestReferenceUnrefCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint32_t resultRefCount = 0;
    JSVM_Status status = OH_JSVM_ReferenceUnref(env, nullptr, &resultRefCount);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceUnrefCase01:OH_JSVM_ReferenceUnref Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//create ref,call this func,reduce the number of citations,return ok
[[maybe_unused]] JSVM_Value TestReferenceUnrefCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value rstObj = nullptr;
    JSVM_Ref resultRef = nullptr;
    OH_JSVM_CreateObject(env, &rstObj);
    JSVM_Status status = OH_JSVM_CreateReference(env, rstObj, 1, &resultRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceUnrefCase02:OH_JSVM_CreateReference Failed.");
        return nullptr;
    }

    uint32_t resultRefCount = 0;
    status = OH_JSVM_ReferenceRef(env, resultRef, &resultRefCount);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceUnrefCase02:OH_JSVM_ReferenceRef Failed.");
        return nullptr;
    }

    status = OH_JSVM_ReferenceUnref(env, resultRef, &resultRefCount);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceUnrefCase02:OH_JSVM_ReferenceUnref Failed.");
        return nullptr;
    }
    if (resultRefCount != 1) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceUnrefCase02:OH_JSVM_ReferenceUnref resultRefCount Error.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//repeate call,call the test interface when the ref reference count is 0,return not ok
[[maybe_unused]] JSVM_Value TestReferenceUnrefCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value objVar = nullptr;
    JSVM_Ref rstRef = nullptr;
    OH_JSVM_CreateObject(env, &objVar);
    JSVM_Status status = OH_JSVM_CreateReference(env, objVar, 0, &rstRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceUnrefCase03:OH_JSVM_CreateReference Failed.");
        return nullptr;
    }

    uint32_t rstRefCount = 0;
    status = OH_JSVM_ReferenceRef(env, rstRef, &rstRefCount);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceUnrefCase03:OH_JSVM_ReferenceRef Failed.");
        return nullptr;
    }

    status = OH_JSVM_ReferenceUnref(env, rstRef, &rstRefCount);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceUnrefCase03:OH_JSVM_ReferenceUnref Failed.");
        return nullptr;
    }

    status = OH_JSVM_ReferenceUnref(env, rstRef, &rstRefCount);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestReferenceUnrefCase03:OH_JSVM_ReferenceUnref Execution exception.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_GetReferenceValue:ref nullptr,return ok,result nullptr
[[maybe_unused]] JSVM_Value TestGetReferenceValueCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_GetReferenceValue(env, nullptr, &result);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetReferenceValueCase01:OH_JSVM_GetReferenceValue Failed.");
        return nullptr;
    }
    if (result != nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetReferenceValueCase01:Result is not nullptr.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_CreateReference create ref,return ok
[[maybe_unused]] JSVM_Value TestGetReferenceValueCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Ref reference = nullptr;
    JSVM_Value value = nullptr;
    OH_JSVM_GetNull(env, &value);
    JSVM_Status status = OH_JSVM_CreateReference(env, value, 1, &reference);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetReferenceValueCase02:OH_JSVM_CreateReference Failed.");
        return nullptr;
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_GetReferenceValue(env, reference, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetReferenceValueCase02:OH_JSVM_GetReferenceValue Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//Reference API:open handlescope -- create obj -- create reference -- increase citation count -- reduce citation count
//--get reference info -- delete reference -- get reference, no result -- close handlescope
[[maybe_unused]] JSVM_Value TestHandleAndRefCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_HandleScope handleScope;
    JSVM_Status status = OH_JSVM_OpenHandleScope(env, &handleScope);
    JSVM_Value val = nullptr;
    bool flag = true;
    OH_JSVM_GetBoolean(env, flag, &val);
    JSVM_Ref rstRef = nullptr;
    status = OH_JSVM_CreateReference(env, val, 1, &rstRef);
    uint32_t rstRefNum = 0;
    status = OH_JSVM_ReferenceRef(env, rstRef, &rstRefNum);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase01:OH_JSVM_ReferenceRef Failed.");
        return nullptr;
    }

    status = OH_JSVM_ReferenceUnref(env, rstRef, &rstRefNum);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase01:OH_JSVM_ReferenceUnref Failed.");
        return nullptr;
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_GetReferenceValue(env, rstRef, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase01:OH_JSVM_GetReferenceValue Failed.");
        return nullptr;
    }

    status = OH_JSVM_DeleteReference(env, rstRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase01:OH_JSVM_DeleteReference Failed.");
        return nullptr;
    }

    status = OH_JSVM_CloseHandleScope(env, handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase01:OH_JSVM_CloseHandleScope Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//open escapehandlescope -- create obj -- escapehanle -- create reference -- increase citation count -- reduce
//citation count -- get reference info -- get reference,no result -- delete reference -- closed escapehandlescope
[[maybe_unused]] JSVM_Value TestHandleAndRefCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_InitOptions initOptions;
    if (memset_s(&initOptions, sizeof(initOptions), 0, sizeof(initOptions)) != 0) {
        return nullptr;
    }
    initOptions.externalReferences = g_externals;
    if (g_tempNum == 0) {
        OH_JSVM_Init(&initOptions);
        g_tempNum++;
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != 0) {
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vmScope;
    OH_JSVM_OpenVMScope(vm, &vmScope);
    JSVM_Env env1;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env1, &envScope);
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env1, &handleScope);
    JSVM_EscapableHandleScope handleScope1;
    JSVM_Status status = OH_JSVM_OpenEscapableHandleScope(env1, &handleScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase02:OH_JSVM_OpenEscapableHandleScope Failed.");
        return nullptr;
    }

    JSVM_Value objValue;
    OH_JSVM_CreateObject(env1, &objValue);

    const char testStr[] = "function";
    JSVM_Value value = nullptr;
    OH_JSVM_CreateStringUtf8(env1, testStr, strlen(testStr), &value);
    OH_JSVM_SetNamedProperty(env1, objValue, "test", value);
    JSVM_Value resultVar = nullptr;
    status = OH_JSVM_EscapeHandle(env, handleScope1, objValue, &resultVar);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase02:OH_JSVM_EscapeHandle Failed.");
        return nullptr;
    }

    JSVM_Ref rstRef = nullptr;
    status = OH_JSVM_CreateReference(env1, objValue, 1, &rstRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase02:OH_JSVM_CreateReference Failed.");
        return nullptr;
    }

    uint32_t rstNum = 0;
    status = OH_JSVM_ReferenceRef(env1, rstRef, &rstNum);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase02:OH_JSVM_ReferenceRef Failed.");
        return nullptr;
    }

    status = OH_JSVM_ReferenceUnref(env1, rstRef, &rstNum);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase02:OH_JSVM_ReferenceUnref Failed.");
        return nullptr;
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_GetReferenceValue(env1, rstRef, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase02:OH_JSVM_GetReferenceValue Failed.");
        return nullptr;
    }

    status = OH_JSVM_DeleteReference(env1, rstRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase02:OH_JSVM_DeleteReference Failed.");
        return nullptr;
    }

    status = OH_JSVM_CloseEscapableHandleScope(env1, handleScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase02:OH_JSVM_CloseEscapableHandleScope Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//create multiple reference,delete multiple referencee,result normal
[[maybe_unused]] JSVM_Value TestHandleAndRefCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value value = NULL;
    OH_JSVM_CreateObject(env, &value);

    JSVM_Ref rstRef = nullptr;
    JSVM_Status status = OH_JSVM_CreateReference(env, value, 1, &rstRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_CreateReference Failed.");
        return nullptr;
    }

    JSVM_Value value1 = nullptr;
    bool flag = true;
    OH_JSVM_GetBoolean(env, flag, &value1);
    JSVM_Ref rstRef1 = nullptr;
    status = OH_JSVM_CreateReference(env, value1, 1, &rstRef1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_CreateReference 1 Failed.");
        return nullptr;
    }

    JSVM_Value value2 = nullptr;
    OH_JSVM_GetNull(env, &value2);
    JSVM_Ref rstRef2 = nullptr;
    status = OH_JSVM_CreateReference(env, value2, 1, &rstRef2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_CreateReference 2 Failed.");
        return nullptr;
    }

    JSVM_Value value3 = nullptr;
    OH_JSVM_GetUndefined(env, &value3);
    JSVM_Ref rstRef3 = nullptr;
    status = OH_JSVM_CreateReference(env, value3, 1, &rstRef3);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_CreateReference 3 Failed.");
        return nullptr;
    }

    JSVM_Value value4;
    OH_JSVM_CreateInt32(env, 0, &value4);
    JSVM_Ref rstRef4 = nullptr;
    status = OH_JSVM_CreateReference(env, value4, 1, &rstRef4);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_CreateReference 4 Failed.");
        return nullptr;
    }

    size_t arrayLength = 2;
    JSVM_Value value5;
    OH_JSVM_CreateArrayWithLength(env, arrayLength, &value5);
    for (uint32_t i = 0; i < arrayLength; i++) {
        JSVM_Value element;
        OH_JSVM_CreateUint32(env, i + 1, &element);
        OH_JSVM_SetElement(env, value5, i, element);
    }
    JSVM_Ref rstRef5 = nullptr;
    status = OH_JSVM_CreateReference(env, value5, 1, &rstRef5);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_CreateReference 5 Failed.");
        return nullptr;
    }

    const char testStr[] = "func";
    JSVM_Value newResult = nullptr;
    OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &newResult);
    JSVM_Value value6;
    OH_JSVM_CoerceToObject(env, newResult, &value6);
    JSVM_Ref rstRef6 = nullptr;
    status = OH_JSVM_CreateReference(env, value6, 1, &rstRef6);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_CreateReference 6 Failed.");
        return nullptr;
    }

    status = OH_JSVM_DeleteReference(env, rstRef);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_DeleteReference Failed.");
        return nullptr;
    }

    status = OH_JSVM_DeleteReference(env, rstRef1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_DeleteReference 1 Failed.");
        return nullptr;
    }

    status = OH_JSVM_DeleteReference(env, rstRef2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_DeleteReference 2 Failed.");
        return nullptr;
    }

    status = OH_JSVM_DeleteReference(env, rstRef3);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_DeleteReference 3 Failed.");
        return nullptr;
    }

    status = OH_JSVM_DeleteReference(env, rstRef4);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_DeleteReference 4 Failed.");
        return nullptr;
    }

    status = OH_JSVM_DeleteReference(env, rstRef5);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_DeleteReference 5 Failed.");
        return nullptr;
    }

    status = OH_JSVM_DeleteReference(env, rstRef6);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHandleAndRefCase03:OH_JSVM_DeleteReference 6 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}