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
#include "napi_error_test.h"
//CreateDate
//return not ok
[[maybe_unused]] JSVM_Value TestCreateDateTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    //create date
    double dateValue = 0;
    JSVM_Value rstDate = nullptr;
    JSVM_Status status = OH_JSVM_CreateDate(env, dateValue, &rstDate);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDateTest1: OH_JSVM_CreateDate Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//OK
[[maybe_unused]] JSVM_Value TestGetDateValueTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    //create date
    double dateValue = 1501924876711;
    JSVM_Value rstDate;
    JSVM_Status status = OH_JSVM_CreateDate(env, dateValue, &rstDate);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetDateValueTest1: OH_JSVM_CreateDate Failed");
        return nullptr;
    }
    double  getDateValue = 0;
    status = OH_JSVM_GetDateValue(env, rstDate, &getDateValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetDateValueTest1: OH_JSVM_GetDateValue Failed");
        return nullptr;
    }
    if (dateValue != getDateValue) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetDateValueTest1: OH_JSVM_GetDateValue dateValue!=getDateValue Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is null ， return n-OK
[[maybe_unused]] JSVM_Value TestIsDateTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value rstDate = nullptr;
    bool bDateType = false;
    JSVM_Status status = OH_JSVM_IsDate(env, rstDate, &bDateType);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDateTest1: OH_JSVM_IsDate Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// create -- is -- get
[[maybe_unused]] JSVM_Value TestDateCombinationTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    //create date
    double dateValue = 1501924876711;
    JSVM_Value rstDate;
    JSVM_Status status = OH_JSVM_CreateDate(env, dateValue, &rstDate);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetDateValueTest1: OH_JSVM_CreateDate Failed");
        return nullptr;
    }
    // is date
    bool bDateType = false;
    status = OH_JSVM_IsDate(env, rstDate, &bDateType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDateCombinationTest1: OH_JSVM_IsDate Failed");
        return nullptr;
    }
    if (!bDateType) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDateTest1: OH_JSVM_IsDate bDateType is false");
        return nullptr;
    }
    double  getDateValue = 0;
    status = OH_JSVM_GetDateValue(env, rstDate, &getDateValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetDateValueTest1: OH_JSVM_GetDateValue Failed");
        return nullptr;
    }
    if (dateValue != getDateValue) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetDateValueTest1: OH_JSVM_GetDateValue dateValue!=getDateValue Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}