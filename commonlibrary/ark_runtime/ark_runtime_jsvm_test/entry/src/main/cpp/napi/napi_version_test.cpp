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
#include "napi_version_test.h"

//OH_JSVM_GetVersion
//call this func,return jsvm ok
[[maybe_unused]] JSVM_Value TestGetVersionCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint32_t result;
    JSVM_Status status = OH_JSVM_GetVersion(env, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetVersionCase01:OH_JSVM_GetVersion Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_GetVMInfo:call func,return jsvm ok
[[maybe_unused]] JSVM_Value TestGetVMInfoCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_VMInfo result;
    JSVM_Status status = OH_JSVM_GetVMInfo(&result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetVMInfoCase01:OH_JSVM_GetVMInfo Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//API:getversion -- getvminfo ok
[[maybe_unused]] JSVM_Value TestGetVMInfoCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint32_t rst;
    JSVM_Status status = OH_JSVM_GetVersion(env, &rst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetVMInfoCase02:OH_JSVM_GetVersion Failed.");
        return nullptr;
    }

    JSVM_VMInfo result;
    status = OH_JSVM_GetVMInfo(&result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetVMInfoCase02:OH_JSVM_GetVMInfo Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}