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
#include "jsvm.h"
#include "jsvm_types.h"
#include "napi_datatype_test.h"
const size_t NUM_SIZE_2 = 2;
JSVM_Value TestFunction(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value output;
    void *data = nullptr;
    OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, nullptr, &data);
    OH_JSVM_CreateStringUtf8(env, (char *)data, strlen((char *)data), &output);
    return output;
}
JSVM_CallbackStruct hello_cb = {TestFunction, (void *)"Hello"};
int g_iFlag = 0;
intptr_t g_externals[] = {
    (intptr_t)&hello_cb,
    (intptr_t)&g_iFlag,
};
//JSVM_Status OH_JSVM_Init
[[maybe_unused]] JSVM_Value TestInitTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);

    JSVM_InitOptions initOpt;
    memset_s(&initOpt, sizeof(JSVM_InitOptions), 0, sizeof(JSVM_InitOptions));
    JSVM_Status status = OH_JSVM_Init(nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestInitTest2: OH_JSVM_Init Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CreateVM
[[maybe_unused]] JSVM_Value TestCreateVMTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateVMTest1: OH_JSVM_Init Failed");
        return nullptr;
    }
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateVMTest1: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    if (vm == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateVMTest1: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateVMTest1: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
[[maybe_unused]] JSVM_Value TestCreateVMTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm;
    JSVM_Status status = OH_JSVM_CreateVM(nullptr, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateVMTest2: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    JSVM_VMScope rstVmScope = nullptr;
    status = OH_JSVM_OpenVMScope(vm, &rstVmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateVMTest2: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    status = OH_JSVM_CloseVMScope(vm, rstVmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateVMTest2: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateVMTest2: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//DestroyVM
[[maybe_unused]] JSVM_Value TestDestroyVMTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyVMTest1: OH_JSVM_Init Failed");
        return nullptr;
    }
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyVMTest1: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyVMTest1: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
[[maybe_unused]] JSVM_Value TestDestroyVMTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyVMTest2: OH_JSVM_Init Failed");
        return nullptr;
    }
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyVMTest2: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    status = OH_JSVM_DestroyVM(nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyVMTest2: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//OpenVMScope
[[maybe_unused]] JSVM_Value TestOpenVMScopeTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest1: OH_JSVM_Init Failed");
        return nullptr;
    }
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest1: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest1: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    if (vmScope == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest1: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    //close
    status = OH_JSVM_CloseVMScope(vm, vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest1: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest1: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
[[maybe_unused]] JSVM_Value TestOpenVMScopeTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset_s(&options, sizeof(options), 0, sizeof(options));
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest2: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope first
    JSVM_VMScope vmScope1;
    status = OH_JSVM_OpenVMScope(vm, &vmScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest2: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    if (vmScope1 == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest2: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // open vm scope second
    JSVM_VMScope vmScope2;
    status = OH_JSVM_OpenVMScope(vm, &vmScope2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest2: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    if (vmScope2 == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest2: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    //close scope1
    status = OH_JSVM_CloseVMScope(vm, vmScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest2: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    //close scope2
    status = OH_JSVM_CloseVMScope(vm, vmScope2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest2: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenVMScopeTest2: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CloseVMScope
[[maybe_unused]] JSVM_Value TestCloseVMScopeTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseVMScopeTest1: OH_JSVM_Init Failed");
        return nullptr;
    }
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseVMScopeTest1: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseVMScopeTest1: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // close vm scope
    status = OH_JSVM_CloseVMScope(vm, vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseVMScopeTest1: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    //destroy vm
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseVMScopeTest1: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
[[maybe_unused]] JSVM_Value TestCloseVMScopeTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseVMScopeTest2: OH_JSVM_Init Failed");
        return nullptr;
    }
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseVMScopeTest2: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseVMScopeTest2: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // close vm scope
    status = OH_JSVM_CloseVMScope(vm, vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseVMScopeTest2: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    //destroy vm
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseVMScopeTest3: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// CreateEnv
JSVM_Value assertEqual(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value args[NUM_SIZE_2];
    JSVM_CALL(env, OH_JSVM_GetCbInfo(env, info, &argc, args, NULL, NULL));

    bool isStrictEquals = false;
    OH_JSVM_StrictEquals(env, args[0], args[1], &isStrictEquals);
    return nullptr;
}
[[maybe_unused]] JSVM_Value TestCreateEnvTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset_s(&options, sizeof(options), 0, sizeof(options));
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateEnvTest1: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateEnvTest1: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // create env
    JSVM_Env envTest;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    // propertycount = 0
    status = OH_JSVM_CreateEnv(vm, 0, descriptor, &envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateEnvTest1: OH_JSVM_CreateEnv Failed");
        return nullptr;
    }
    //destroy env
    status = OH_JSVM_DestroyEnv(envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateEnvTest1: OH_JSVM_DestroyEnv Failed");
        return nullptr;
    }
    // close vm scope
    status = OH_JSVM_CloseVMScope(vm, vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateEnvTest1: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    //destroy vm
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateEnvTest1: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
[[maybe_unused]] JSVM_Value TestCreateEnvTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset_s(&options, sizeof(options), 0, sizeof(options));
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateEnvTest2: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateEnvTest2: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // create env
    JSVM_Env envTest;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateEnvTest2: OH_JSVM_CreateEnv Failed");
        return nullptr;
    }
    //destroy env
    status = OH_JSVM_DestroyEnv(envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateEnvTest2: OH_JSVM_DestroyEnv Failed");
        return nullptr;
    }
    // close vm scope
    status = OH_JSVM_CloseVMScope(vm, vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateEnvTest2: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    //destroy vm
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateEnvTest2: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//DestroyEnv
[[maybe_unused]] JSVM_Value TestDestroyEnvTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset_s(&options, sizeof(options), 0, sizeof(options));
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyEnvTest1: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyEnvTest1: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // create env
    JSVM_Env envTest;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyEnvTest1: OH_JSVM_CreateEnv Failed");
        return nullptr;
    }
    //destroy env
    status = OH_JSVM_DestroyEnv(envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyEnvTest1: OH_JSVM_DestroyEnv Failed");
        return nullptr;
    }
    // close vm scope
    status = OH_JSVM_CloseVMScope(vm, vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyEnvTest1: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    //destroy vm
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyEnvTest1: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
[[maybe_unused]] JSVM_Value TestDestroyEnvTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyEnvTest2: OH_JSVM_Init Failed");
        return nullptr;
    }
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyEnvTest2: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyEnvTest2: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // env is null
    JSVM_Env envTest = nullptr;
    // close vm scope
    status = OH_JSVM_CloseVMScope(vm, vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyEnvTest2: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    //destroy vm
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDestroyEnvTest2: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//OpenEnvScope
[[maybe_unused]] JSVM_Value TestOpenEnvScopeTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest1: OH_JSVM_Init Failed");
        return nullptr;
    }
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest1: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest1: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // env is null
    JSVM_Env envTest = nullptr;
    // close vm scope
    status = OH_JSVM_CloseVMScope(vm, vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest1: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    //destroy vm
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest1: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
[[maybe_unused]] JSVM_Value TestOpenEnvScopeTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm = nullptr;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest2: OH_JSVM_Init Failed");
        return nullptr;
    }
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest2: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest2: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // create env
    JSVM_Env envTest;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest2: OH_JSVM_CreateEnv Failed");
        return nullptr;
    }
    // open env scope
    JSVM_EnvScope envScope;
    status = OH_JSVM_OpenEnvScope(envTest, &envScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest2: OH_JSVM_OpenEnvScope Failed");
        return nullptr;
    }
    //close env scope
    status = OH_JSVM_CloseEnvScope(envTest, envScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest2: OH_JSVM_CloseEnvScope Failed");
        return nullptr;
    }
    //destroy env
    status = OH_JSVM_DestroyEnv(envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest2: OH_JSVM_DestroyEnv Failed");
        return nullptr;
    }
    // close vm scope
    status = OH_JSVM_CloseVMScope(vm, vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest2: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    //destroy vm
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest2: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
[[maybe_unused]] JSVM_Value TestOpenEnvScopeTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest3: OH_JSVM_Init Failed");
        return nullptr;
    }
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest3: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest3: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // create env
    JSVM_Env envTest;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest3: OH_JSVM_CreateEnv Failed");
        return nullptr;
    }
    //first open env scope
    JSVM_EnvScope envScope1;
    status = OH_JSVM_OpenEnvScope(envTest, &envScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest3: OH_JSVM_OpenEnvScope Failed");
        return nullptr;
    }
    //second open env scope
    JSVM_EnvScope envScope2;
    status = OH_JSVM_OpenEnvScope(envTest, &envScope2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest3: OH_JSVM_OpenEnvScope second Failed");
        return nullptr;
    }
    //close env scope1
    status = OH_JSVM_CloseEnvScope(envTest, envScope1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest3: OH_JSVM_CloseEnvScope Failed");
        return nullptr;
    }
    //close env scope2
    status = OH_JSVM_CloseEnvScope(envTest, envScope2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest3: OH_JSVM_CloseEnvScope Failed");
        return nullptr;
    }
    //destroy env
    status = OH_JSVM_DestroyEnv(envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest3: OH_JSVM_DestroyEnv Failed");
        return nullptr;
    }
    // close vm scope
    status = OH_JSVM_CloseVMScope(vm, vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest3: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    //destroy vm
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenEnvScopeTest3: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// CloseEnvScope
[[maybe_unused]] JSVM_Value TestCloseEnvScopeTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest1: OH_JSVM_Init Failed");
        return nullptr;
    }
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest1: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest1: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // create env
    JSVM_Env envTest;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest1: OH_JSVM_CreateEnv Failed");
        return nullptr;
    }
    //open env scope
    JSVM_EnvScope envScope;
    status = OH_JSVM_OpenEnvScope(envTest, &envScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest1: OH_JSVM_OpenEnvScope Failed");
        return nullptr;
    }
    //close env scope
    status = OH_JSVM_CloseEnvScope(envTest, envScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest1: OH_JSVM_CloseEnvScope Failed");
        return nullptr;
    }
    //destroy env
    status = OH_JSVM_DestroyEnv(envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest1: OH_JSVM_DestroyEnv Failed");
        return nullptr;
    }
    // close vm scope
    status = OH_JSVM_CloseVMScope(vm, vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest1: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    //destroy vm
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest1: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
[[maybe_unused]] JSVM_Value TestCloseEnvScopeTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest2: OH_JSVM_Init Failed");
        return nullptr;
    }
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest2: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest2: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // create env
    JSVM_Env envTest;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest2: OH_JSVM_CreateEnv Failed");
        return nullptr;
    }
    //open env scope
    JSVM_EnvScope envScope;
    status = OH_JSVM_OpenEnvScope(envTest, &envScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest2: OH_JSVM_OpenEnvScope Failed");
        return nullptr;
    }
    //first close env scope
    status = OH_JSVM_CloseEnvScope(envTest, envScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest2: OH_JSVM_CloseEnvScope first Failed");
        return nullptr;
    }
    //destroy env
    status = OH_JSVM_DestroyEnv(envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest2: OH_JSVM_DestroyEnv Failed");
        return nullptr;
    }
    // close vm scope
    status = OH_JSVM_CloseVMScope(vm, vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest2: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    //destroy vm
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseEnvScopeTest4: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//Init-- create vm -- open vm scope -- create env -- open env scope -- open handlescope
//   -- close handlescope -- close env scope -- destroy env -- close vm scope -- destroy vm
[[maybe_unused]] JSVM_Value TestDataTypeCombinationTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDataTypeCombinationTest1: OH_JSVM_Init Failed");
        return nullptr;
    }
    options.isForSnapshotting = true;
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDataTypeCombinationTest1: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    // open vm scope
    JSVM_VMScope vmScope;
    status = OH_JSVM_OpenVMScope(vm, &vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDataTypeCombinationTest1: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // create env
    JSVM_Env envTest;
    JSVM_CallbackStruct param[1];
    param[0].data = nullptr;
    param[0].callback = assertEqual;
    JSVM_PropertyDescriptor descriptor[] = {
        {"assertEqual", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDataTypeCombinationTest1: OH_JSVM_CreateEnv Failed");
        return nullptr;
    }
    //open env scope
    JSVM_EnvScope envScope;
    status = OH_JSVM_OpenEnvScope(envTest, &envScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDataTypeCombinationTest1: OH_JSVM_OpenEnvScope Failed");
        return nullptr;
    }
    //open handlescope
    JSVM_HandleScope handlescope;
    status = OH_JSVM_OpenHandleScope(envTest, &handlescope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDataTypeCombinationTest1: OH_JSVM_OpenHandleScope Failed");
        return nullptr;
    }
    //close handlescope
    status = OH_JSVM_CloseHandleScope(envTest, handlescope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDataTypeCombinationTest1: OH_JSVM_CloseHandleScope Failed");
        return nullptr;
    }
    //close env scope
    status = OH_JSVM_CloseEnvScope(envTest, envScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDataTypeCombinationTest1: OH_JSVM_CloseEnvScope Failed");
        return nullptr;
    }
    //destroy env
    status = OH_JSVM_DestroyEnv(envTest);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDataTypeCombinationTest1: OH_JSVM_DestroyEnv Failed");
        return nullptr;
    }
    // close vm scope
    status = OH_JSVM_CloseVMScope(vm, vmScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDataTypeCombinationTest1: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    //destroy vm
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDataTypeCombinationTest1: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
