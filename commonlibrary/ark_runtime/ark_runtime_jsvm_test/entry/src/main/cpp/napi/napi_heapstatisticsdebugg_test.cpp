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
#include "napi_heapstatisticsdebugg_test.h"

static JSVM_Value hello(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value output;
    void *data = nullptr;
    OH_JSVM_GetCbInfo(env, info, nullptr, nullptr, nullptr, &data);
    OH_JSVM_CreateStringUtf8(env, (char *)data, strlen((char *)data), &output);
    return output;
}

//OH_JSVM_GetHeapStatistics:Call the interface to be tested,return ok
[[maybe_unused]] JSVM_Value TestGetHeapStatisticsCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM testVm;
    OH_JSVM_GetVM(env, &testVm);
    JSVM_HeapStatistics result;
    JSVM_Status status = OH_JSVM_GetHeapStatistics(testVm, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetHeapStatisticsCase01:OH_JSVM_GetHeapStatistics Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_StartCpuProfiler:Call the interface to be tested,return ok,result not nullptr
[[maybe_unused]] JSVM_Value TestStartCpuProfilerCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    JSVM_Status status = OH_JSVM_CreateVM(nullptr, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStartCpuProfilerCase01:OH_JSVM_CreateVM Failed.");
        return nullptr;
    }

    JSVM_CpuProfiler cpuProfiler = nullptr;
    status = OH_JSVM_StartCpuProfiler(vm, &cpuProfiler);
    if (status != JSVM_OK || cpuProfiler == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestStartCpuProfilerCase01:OH_JSVM_StartCpuProfiler Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_StopCpuProfiler:call OH_JSVM_StartCpuProfiler,Call the interface to be tested,return ok
static bool OutputStream(const char *data, int size, void *streamData)
{
    return true;
}

[[maybe_unused]] JSVM_Value TestStopCpuProfilerCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    OH_JSVM_CreateVM(nullptr, &vm);
    JSVM_CpuProfiler cpuProfiler;
    JSVM_Status status = OH_JSVM_StartCpuProfiler(vm, &cpuProfiler);
    if (status != JSVM_OK || cpuProfiler == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestStopCpuProfilerCase01:OH_JSVM_StartCpuProfiler Failed.");
        return nullptr;
    }

    void *data = nullptr;
    status = OH_JSVM_StopCpuProfiler(vm, cpuProfiler, OutputStream, data);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStopCpuProfilerCase01:OH_JSVM_StopCpuProfiler Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//input valid value (callback function used to process the returned tuning data),return ok
[[maybe_unused]] JSVM_Value TestTakeHeapSnapshotCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VM vm;
    JSVM_Status status = OH_JSVM_CreateVM(nullptr, &vm);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTakeHeapSnapshotCase01:OH_JSVM_CreateVM Failed.");
        return nullptr;
    }
    void *data = nullptr;

    status = OH_JSVM_TakeHeapSnapshot(vm, OutputStream, data);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTakeHeapSnapshotCase01:OH_JSVM_TakeHeapSnapshot Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//host valid value, port as a negative number, return ok
[[maybe_unused]] JSVM_Value TestOpenInspectorCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    int16_t num = -128;
    JSVM_Status status = OH_JSVM_OpenInspector(env, "localhost", num);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenInspectorCase01:OH_JSVM_OpenInspector Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//host valid value,port 65536,return  ok
[[maybe_unused]] JSVM_Value TestOpenInspectorCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint16_t num = 65536;
    JSVM_Status status = OH_JSVM_OpenInspector(env, "localhost", num);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenInspectorCase02:OH_JSVM_OpenInspector Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//host valid value,port is a reserved port number,return ok
[[maybe_unused]] JSVM_Value TestOpenInspectorCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    int16_t num = 0;
    JSVM_Status status = OH_JSVM_OpenInspector(env, "localhost", num);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenInspectorCase03:OH_JSVM_OpenInspector Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_CloseInspector:no open inspectors in the env,call test func,return not ok
[[maybe_unused]] JSVM_Value TestCloseInspectorCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_CloseInspector(env);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseInspectorCase01:OH_JSVM_CloseInspector Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//an open inspector in the env,call test func,return ok
[[maybe_unused]] JSVM_Value TestCloseInspectorCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    int32_t num = 65534;
    JSVM_Status status = OH_JSVM_OpenInspector(env, "localhost", num);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseInspectorCase02:OH_JSVM_OpenInspector Failed.");
        return nullptr;
    }

    status = OH_JSVM_CloseInspector(env);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseInspectorCase02:OH_JSVM_CloseInspector Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//there are multiple open inspectors in the env,call test func,return ok
[[maybe_unused]] JSVM_Value TestCloseInspectorCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    int32_t num = 65534;
    JSVM_Status status = OH_JSVM_OpenInspector(env, "localhost", num);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseInspectorCase03:OH_JSVM_OpenInspector Failed.");
        return nullptr;
    }

    int32_t num1 = 300;
    status = OH_JSVM_OpenInspector(env, "localhost", num1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseInspectorCase03:OH_JSVM_OpenInspector Failed.");
        return nullptr;
    }

    status = OH_JSVM_CloseInspector(env);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCloseInspectorCase03:OH_JSVM_CloseInspector Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_OpenInspectorWithName:pid is a valid value,return ok
[[maybe_unused]] JSVM_Value TestOpenInspectorWithNameCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_OpenInspectorWithName(env, 9000, "test");
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOpenInspectorWithNameCase01:OH_JSVM_OpenInspectorWithName Failed.");
        return nullptr;
    }
    
    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//name null,return ok
[[maybe_unused]] JSVM_Value TestOpenInspectorWithNameCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_OpenInspectorWithName(env, 1, "");
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env,
                           nullptr,
                           "TestOpenInspectorWithNameCase02:OH_JSVM_OpenInspectorWithName Execution abnormal.");
        return nullptr;
    }
    
    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//The API combination is not written, which involves single step debugging and manual configuration