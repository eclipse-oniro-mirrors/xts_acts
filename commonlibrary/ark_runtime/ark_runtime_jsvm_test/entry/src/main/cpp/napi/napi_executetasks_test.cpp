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
#include "napi_executetasks_test.h"
const size_t BUF_SIZE_255 = 255;
const size_t NUM_SIZE_3 = 3;
//OH_JSVM_PumpMessageLoop
[[maybe_unused]] JSVM_Value TestPumpMessageLoopTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bRst = false;
    JSVM_Status status = OH_JSVM_PumpMessageLoop(nullptr, &bRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestPumpMessageLoopTest1: OH_JSVM_PumpMessageLoop Failed");
        return nullptr;
    }
    if (bRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestPumpMessageLoopTest1: bRst is true");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//OH_JSVM_PerformMicrotaskCheckpoint
//vm is null
[[maybe_unused]] JSVM_Value TestPerformMicrotaskCheckpointTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bRst = false;
    JSVM_VM vm = nullptr;
    JSVM_CreateVMOptions optionVm;
    memset_s(&optionVm, sizeof(optionVm), 0, sizeof(optionVm));
    JSVM_Status status = OH_JSVM_CreateVM(&optionVm, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr,
            "TestPerformMicrotaskCheckpointTest1: OH_JSVM_PerformMicrotaskCheckpoint Failed");
        return nullptr;
    }
    status = OH_JSVM_PerformMicrotaskCheckpoint(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr,
            "TestPerformMicrotaskCheckpointTest1: OH_JSVM_PerformMicrotaskCheckpoint Failed");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// pump -- perform
[[maybe_unused]] JSVM_Value ConsoleInfo(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1];
    char log[BUF_SIZE_255] = "";
    size_t logLength;
    OH_JSVM_GetCbInfo(env, info, &argc, args, NULL, NULL);

    OH_JSVM_GetValueStringUtf8(env, args[0], log, BUF_SIZE_255, &logLength);
    log[BUF_SIZE_255] = 0;
    printf("JSVM API TEST: %s", log);
    return nullptr;
}
[[maybe_unused]] JSVM_Value TestExecuteTasksCombinationTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    // create vm
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    memset_s(&options, sizeof(options), 0, sizeof(options));
    JSVM_Status status = OH_JSVM_CreateVM(&options, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestExecuteTasksCombinationTest1: OH_JSVM_CreateVM Failed");
        return nullptr;
    }
    JSVM_VMScope vm_scope;
    status = OH_JSVM_OpenVMScope(vm, &vm_scope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestExecuteTasksCombinationTest1: OH_JSVM_OpenVMScope Failed");
        return nullptr;
    }
    // consoleinfo
    JSVM_CallbackStruct param[] = {
        {.data = nullptr, .callback = ConsoleInfo},
    };
    JSVM_PropertyDescriptor descriptor[] = {
        {"consoleinfo", NULL, &param[0], NULL, NULL, NULL, JSVM_DEFAULT},
    };
    JSVM_Env env1;
    status = OH_JSVM_CreateEnv(vm, sizeof(descriptor) / sizeof(descriptor[0]), descriptor, &env1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestExecuteTasksCombinationTest1: OH_JSVM_CreateEnv Failed");
        return nullptr;
    }
    JSVM_EnvScope envScope;
    status = OH_JSVM_OpenEnvScope(env1, &envScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestExecuteTasksCombinationTest1: OH_JSVM_OpenEnvScope Failed");
        return nullptr;
    }
    JSVM_HandleScope handleScope;
    status = OH_JSVM_OpenHandleScope(env1, &handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestExecuteTasksCombinationTest1: OH_JSVM_OpenHandleScope Failed");
        return nullptr;
    }
    const char *strTask = R"JS(
    new Promise((resolve, reject) => {
        resolve(1)
    })
    .then(function(obj) {
        consoleinfo("Called with instance " + obj);
    }).catch(function(err) {
        consoleinfo("Called with error ");
    });
    )JS";
    JSVM_Value sourceCodeValue;
    status = OH_JSVM_CreateStringUtf8(env1, strTask, JSVM_AUTO_LENGTH, &sourceCodeValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestExecuteTasksCombinationTest1: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    JSVM_Script script;
    status = OH_JSVM_CompileScript(env1, sourceCodeValue, nullptr, 0, true, nullptr, &script);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestExecuteTasksCombinationTest1: OH_JSVM_CompileScript Failed");
        return nullptr;
    }
    JSVM_Value result;
    status = OH_JSVM_RunScript(env1, script, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestExecuteTasksCombinationTest1: OH_JSVM_RunScript Failed");
        return nullptr;
    }
    bool rst = false;
    for (int i = 0; i < NUM_SIZE_3; i++) { // 3: cycles
        //如果消息队列中没有任务启动，则rst设置为false。
        JSVM_Status flag1 = OH_JSVM_PumpMessageLoop(vm, &rst);
        JSVM_Status flag2 = OH_JSVM_PerformMicrotaskCheckpoint(vm);
        if (rst && (flag1 == JSVM_OK) && (flag2 == JSVM_OK)) {
            sleep(NUM_SIZE_3);
            break;
        }
    }
    // close and destroy
    status = OH_JSVM_CloseHandleScope(env1, handleScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env1, nullptr, "TestExecuteTasksCombinationTest1: OH_JSVM_CloseHandleScope Failed");
        return nullptr;
    }
    status = OH_JSVM_CloseEnvScope(env1, envScope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestExecuteTasksCombinationTest1: OH_JSVM_CloseEnvScope Failed");
        return nullptr;
    }
    status = OH_JSVM_DestroyEnv(env1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestExecuteTasksCombinationTest1: OH_JSVM_DestroyEnv Failed");
        return nullptr;
    }
    status = OH_JSVM_CloseVMScope(vm, vm_scope);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestExecuteTasksCombinationTest1: OH_JSVM_CloseVMScope Failed");
        return nullptr;
    }
    status = OH_JSVM_DestroyVM(vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestExecuteTasksCombinationTest1: OH_JSVM_DestroyVM Failed");
        return nullptr;
    }
    
    bool result1 = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result1, &value);
    return value;
}