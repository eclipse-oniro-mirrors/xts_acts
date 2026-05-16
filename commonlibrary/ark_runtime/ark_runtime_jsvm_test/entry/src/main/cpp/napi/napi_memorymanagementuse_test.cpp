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
#include "napi_memorymanagementuse_test.h"

static JSVM_Value PrintHello(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value output;
    OH_JSVM_CreateStringUtf8(env, "Hello world!", JSVM_AUTO_LENGTH, &output);
    return output;
}
//OH_JSVM_AdjustExternalMemory:changeInBytes 0 +result not null
[[maybe_unused]] JSVM_Value TestAdjustExternalMemoryCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t change = 0;
    int64_t adjustedValue = 0;
    JSVM_Status status = OH_JSVM_AdjustExternalMemory(env, change, &adjustedValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestAdjustExternalMemoryCase01:AdjustExternalMemory Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//changeInBytes 1024*1024 +result not null
[[maybe_unused]] JSVM_Value TestAdjustExternalMemoryCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t change = 1024 * 1024;
    int64_t adjustedValue = 0;
    JSVM_Status status = OH_JSVM_AdjustExternalMemory(env, change, &adjustedValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestAdjustExternalMemoryCase02:AdjustExternalMemory Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//changeInBytes 1024*1024*1024 +result not null
[[maybe_unused]] JSVM_Value TestAdjustExternalMemoryCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t change = 1024 * 1024 * 1024;
    int64_t adjustedValue = 0;
    JSVM_Status status = OH_JSVM_AdjustExternalMemory(env, change, &adjustedValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestAdjustExternalMemoryCase03:AdjustExternalMemory Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//changeInBytes 1024*1024 +result NULL
[[maybe_unused]] JSVM_Value TestAdjustExternalMemoryCase04(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t change = 0;
    JSVM_Status status = OH_JSVM_AdjustExternalMemory(env, change, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestAdjustExternalMemoryCase04:AdjustExternalMemory Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_MemoryPressureNotification:JSVM_MEMORY_PRESSURE_LEVEL_NONE    no pressure
[[maybe_unused]] JSVM_Value TestMemoryPressureNotificationCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_MemoryPressureNotification(env, JSVM_MEMORY_PRESSURE_LEVEL_NONE);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestMemoryPressureNotificationCase01:MemoryPressureNotification Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//JSVM_MEMORY_PRESSURE_LEVEL_MODERATE    moderate pressure
[[maybe_unused]] JSVM_Value TestMemoryPressureNotificationCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_MemoryPressureNotification(env, JSVM_MEMORY_PRESSURE_LEVEL_MODERATE);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestMemoryPressureNotificationCase02:MemoryPressureNotification Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//JSVM_MEMORY_PRESSURE_LEVEL_CRITICAL    critical pressure
[[maybe_unused]] JSVM_Value TestMemoryPressureNotificationCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_MemoryPressureNotification(env, JSVM_MEMORY_PRESSURE_LEVEL_CRITICAL);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestMemoryPressureNotificationCase03:MemoryPressureNotification Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
// CreateAndUseSnapshot call back
static JSVM_CallbackStruct param[] = {
    {.data = nullptr, .callback = PrintHello},
};
static JSVM_CallbackStruct *method = param;
// CreateAndUseSnapshot method alias,JS call
static JSVM_PropertyDescriptor descriptor[] = {
    {"printHello", nullptr, method++, nullptr, nullptr, nullptr, JSVM_DEFAULT},
};
//API:AdjustExternalMemory allocation of 1GB memory -> MemoryPressureNotification(JSVM_MEMORY_PRESSURE_LEVEL_CRITICAL)
[[maybe_unused]] JSVM_Value TestMemoryManagementuseCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t change = 1024 * 1024 * 1024;
    int64_t adjustedValue = 0;
    JSVM_Status status = OH_JSVM_AdjustExternalMemory(env, change, &adjustedValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestMemoryManagementuseCase01:AdjustExternalMemory Failed.");
        return nullptr;
    }

    status = OH_JSVM_MemoryPressureNotification(env, JSVM_MEMORY_PRESSURE_LEVEL_CRITICAL);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestMemoryManagementuseCase01:MemoryPressureNotification Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}