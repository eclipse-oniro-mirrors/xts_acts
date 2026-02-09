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
#include "napi_basicdatatypes_test.h"

//OH_JSVM_CreateInt32:value int32_max + result not null
[[maybe_unused]] JSVM_Value TestCreateInt32Case01(JSVM_Env env, JSVM_CallbackInfo info)
{
    int32_t srcNum = INT32_MAX;
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateInt32(env, srcNum, &desNum);
    if (status != JSVM_OK || desNum == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateInt32Case01:OH_JSVM_CreateInt32 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value int32_min + result not null
[[maybe_unused]] JSVM_Value TestCreateInt32Case02(JSVM_Env env, JSVM_CallbackInfo info)
{
    int32_t srcNum = INT32_MIN;
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateInt32(env, srcNum, &desNum);
    if (status != JSVM_OK || desNum == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateInt32Case02:OH_JSVM_CreateInt32 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value 0 + result not null
[[maybe_unused]] JSVM_Value TestCreateInt32Case03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateInt32(env, 0, &desNum);
    if (status != JSVM_OK || desNum == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateInt32Case03:OH_JSVM_CreateInt32 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value 0 + result NULL
[[maybe_unused]] JSVM_Value TestCreateInt32Case04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_CreateInt32(env, 0, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateInt32Case04:OH_JSVM_CreateInt32 Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_CreateUint32:value uint32_max + result not null
[[maybe_unused]] JSVM_Value TestCreateUint32Case01(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint32_t srcNum = UINT32_MAX;
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateUint32(env, srcNum, &desNum);
    if (status != JSVM_OK || desNum == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateUint32Case01:OH_JSVM_CreateUint32 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value 1 + result not null
[[maybe_unused]] JSVM_Value TestCreateUint32Case02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateUint32(env, 1, &desNum);
    if (status != JSVM_OK || desNum == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateUint32Case02:OH_JSVM_CreateUint32 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value 0 + result not null
[[maybe_unused]] JSVM_Value TestCreateUint32Case03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateUint32(env, 0, &desNum);
    if (status != JSVM_OK || desNum == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateUint32Case03:OH_JSVM_CreateUint32 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value 0 + result NULL
[[maybe_unused]] JSVM_Value TestCreateUint32Case04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_CreateUint32(env, 0, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateUint32Case04:OH_JSVM_CreateUint32 Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_CreateInt64:value int64_max + result not null
[[maybe_unused]] JSVM_Value TestCreateInt64Case01(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t srcNum = INT64_MAX;
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateInt64(env, srcNum, &desNum);
    if (status != JSVM_OK || desNum == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateInt64Case01:OH_JSVM_CreateInt64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value int64_min + result not null
[[maybe_unused]] JSVM_Value TestCreateInt64Case02(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t srcNum = INT64_MIN;
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateInt64(env, srcNum, &desNum);
    if (status != JSVM_OK || desNum == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateInt64Case02:OH_JSVM_CreateInt64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value 0 + result not null
[[maybe_unused]] JSVM_Value TestCreateInt64Case03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateInt64(env, 0, &desNum);
    if (status != JSVM_OK || desNum == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateInt64Case03:OH_JSVM_CreateInt64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value 0 + result NULL
[[maybe_unused]] JSVM_Value TestCreateInt64Case04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_CreateInt64(env, 0, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateInt64Case04:OH_JSVM_CreateInt64 Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_CreateDouble:value double_max + result not null
#define DBL_MAX    1.7976931348623158e+308 /* max value */
#define DBL_MIN    2.2250738585072014e-308 /* min positive value */
[[maybe_unused]] JSVM_Value TestCreateDoubleCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    double srcNum = DBL_MAX;
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateDouble(env, srcNum, &desNum);
    if (status != JSVM_OK || desNum == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDoubleCase01:OH_JSVM_CreateDouble Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value double_min + result not null
[[maybe_unused]] JSVM_Value TestCreateDoubleCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    double srcNum = DBL_MIN;
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateDouble(env, srcNum, &desNum);
    if (status != JSVM_OK || desNum == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDoubleCase02:OH_JSVM_CreateDouble Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value 0 + result not null
[[maybe_unused]] JSVM_Value TestCreateDoubleCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateDouble(env, 0.0, &desNum);
    if (status != JSVM_OK || desNum == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDoubleCase03:OH_JSVM_CreateDouble Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value 0 + result NULL
[[maybe_unused]] JSVM_Value TestCreateDoubleCase04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_CreateDouble(env, 0.0, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateDoubleCase04:OH_JSVM_CreateDouble Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_GetValueUint32:not uint32 value
[[maybe_unused]] JSVM_Value TestGetValueUint32Case01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value value;
    JSVM_Status status = OH_JSVM_CreateInt32(env, -1, &value);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueUint32Case01:OH_JSVM_CreateInt32 Failed.");
        return nullptr;
    }

    uint32_t rstVal;
    status = OH_JSVM_GetValueUint32(env, value, &rstVal);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueUint32Case01:OH_JSVM_GetValueUint32 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_GetValueInt32:not int32 value
[[maybe_unused]] JSVM_Value TestGetValueInt32Case01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateDouble(env, 1.1, &desNum);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueInt32Case01:OH_JSVM_CreateDouble Failed.");
        return nullptr;
    }

    int32_t rstVal = 0;
    status = OH_JSVM_GetValueInt32(env, desNum, &rstVal);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueInt32Case01:OH_JSVM_GetValueint32 Failed.");
        return nullptr;
    }

    JSVM_Value description;
    size_t strLen = 7;
    status = OH_JSVM_CreateStringUtf8(env, "teststr", strLen, &description);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueInt32Case01:OH_JSVM_CreateStringUtf8 Failed.");
        return nullptr;
    }

    int32_t rstVal1 = 0;
    status = OH_JSVM_GetValueInt32(env, description, &rstVal1);
    if (status != JSVM_NUMBER_EXPECTED) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueInt32Case01:OH_JSVM_GetValueint32 Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_GetValueInt64:not int64 value
[[maybe_unused]] JSVM_Value TestGetValueInt64Case01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateDouble(env, 0.0, &desNum);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueInt64Case01:OH_JSVM_CreateDouble Failed.");
        return nullptr;
    }

    int64_t rstVal;
    status = OH_JSVM_GetValueInt64(env, desNum, &rstVal);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueInt64Case01:OH_JSVM_GetValueInt64 Execution abnormal.");
        return nullptr;
    }

    JSVM_Value description;
    size_t testLen = 4;
    status = OH_JSVM_CreateStringUtf8(env, "test", testLen, &description);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueInt64Case01:OH_JSVM_CreateStringUtf8 Failed.");
        return nullptr;
    }

    int64_t rstVal1 = 0;
    status = OH_JSVM_GetValueInt64(env, description, &rstVal1);
    if (status != JSVM_NUMBER_EXPECTED) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueInt64Case01:OH_JSVM_GetValueint32 Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_GetValueDouble:not double value
[[maybe_unused]] JSVM_Value TestGetValueDoubleCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value value;
    JSVM_Status status = OH_JSVM_CreateInt32(env, -1, &value);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueDoubleCase01:OH_JSVM_CreateInt32 Failed.");
        return nullptr;
    }

    double height;
    status = OH_JSVM_GetValueDouble(env, value, &height);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueDoubleCase01:OH_JSVM_GetValueDouble Execution abnormal.");
        return nullptr;
    }

    JSVM_Value description;
    size_t strLen = 4;
    status = OH_JSVM_CreateStringUtf8(env, "test", strLen, &description);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueDoubleCase01:OH_JSVM_CreateStringUtf8 Failed.");
        return nullptr;
    }

    double rstVal1 = 0;
    status = OH_JSVM_GetValueDouble(env, description, &rstVal1);
    if (status != JSVM_NUMBER_EXPECTED) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueDoubleCase01:OH_JSVM_GetValueDouble Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//CreateInt32 value -> GetValueUint32 int32 convert uint32 ->GetValueInt32 -> GetValueInt64 int32 convert int64 ->
//GetValueDouble int32 convert double
[[maybe_unused]] JSVM_Value TestBasicDataTypesCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    int32_t srcNum = -1;
    JSVM_Value numVal = nullptr;
    JSVM_Status status = OH_JSVM_CreateInt32(env, srcNum, &numVal);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase01:OH_JSVM_CreateInt32 Failed.");
        return nullptr;
    }

    uint32_t dataValue;
    OH_JSVM_GetValueUint32(env, numVal, &dataValue);
    uint32_t numMax = 4294967295;
    if (dataValue != numMax) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase01:OH_JSVM_GetValueUint32 val Failed.");
        return nullptr;
    }

    int32_t retVal;
    status = OH_JSVM_GetValueInt32(env, numVal, &retVal);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase01:OH_JSVM_GetValueInt32 Failed.");
        return nullptr;
    }
    if (retVal != -1) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase01:OH_JSVM_GetValueInt32 val Failed.");
        return nullptr;
    }

    int64_t retVal2;
    status = OH_JSVM_GetValueInt64(env, numVal, &retVal2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase01:OH_JSVM_GetValueInt64 Failed.");
        return nullptr;
    }
    if (retVal2 != -1) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase01:OH_JSVM_GetValueInt64 val Failed.");
        return nullptr;
    }

    double retVal3 = 0.0;
    status = OH_JSVM_GetValueDouble(env, numVal, &retVal3);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase01:OH_JSVM_GetValueDouble Failed.");
        return nullptr;
    }
    if (retVal3 != -1.0) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase01:OH_JSVM_GetValueDouble val Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//CreateUint32 value -> GetValueUint32 -> GetValueInt32 uint32 convert int32 -> GetValueInt64 uint32 convert int64 ->
//GetValueDouble uint32 convert double
[[maybe_unused]] JSVM_Value TestBasicDataTypesCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value jsNum = nullptr;
    uint32_t testNum = 1;
    JSVM_Status status = OH_JSVM_CreateUint32(env, testNum, &jsNum);
    uint32_t retValue;
    status = OH_JSVM_GetValueUint32(env, jsNum, &retValue);
    if (retValue != 1) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase02:OH_JSVM_GetValueUint32 val Failed.");
        return nullptr;
    }

    int32_t retValue1;
    status = OH_JSVM_GetValueInt32(env, jsNum, &retValue1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase02:OH_JSVM_GetValueInt32 Failed.");
        return nullptr;
    }
    if (retValue1 != 1) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase02:OH_JSVM_GetValueInt32 val Failed.");
        return nullptr;
    }

    int64_t retValue2;
    status = OH_JSVM_GetValueInt64(env, jsNum, &retValue2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase02:OH_JSVM_GetValueInt64 Failed.");
        return nullptr;
    }
    if (retValue2 != 1) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase02:OH_JSVM_GetValueInt64 val Failed.");
        return nullptr;
    }

    double retValue3;
    status = OH_JSVM_GetValueDouble(env, jsNum, &retValue3);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase02:OH_JSVM_GetValueDouble Failed.");
        return nullptr;
    }
    if (retValue3 != 1.0) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase02:OH_JSVM_GetValueDouble val Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value returnValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &returnValue);
    return returnValue;
}
//CreateInt64 -> GetValueUint32 int64 convert uint32 ->GetValueInt32 int64 convert int32 ->
//GetValueInt64 int64->GetValueDouble int64 convert double
[[maybe_unused]] JSVM_Value TestBasicDataTypesCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t srcNum = INT64_MAX - 1;
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateInt64(env, srcNum, &desNum);
    if (status != JSVM_OK || desNum == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase03:OH_JSVM_CreateInt64 Failed.");
        return nullptr;
    }

    uint32_t retValue;
    status = OH_JSVM_GetValueUint32(env, desNum, &retValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase03:OH_JSVM_GetValueUint32 Failed.");
        return nullptr;
    }
    if (retValue != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase03:OH_JSVM_GetValueUint32 val Failed.");
        return nullptr;
    }

    int32_t retValue1;
    status = OH_JSVM_GetValueInt32(env, desNum, &retValue1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase03:OH_JSVM_GetValueInt32 Failed.");
        return nullptr;
    }
    if (retValue1 != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase03:OH_JSVM_GetValueInt32 val Failed.");
        return nullptr;
    }

    int64_t retValue2;
    status = OH_JSVM_GetValueInt64(env, desNum, &retValue2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase03:OH_JSVM_GetValueInt64 Failed.");
        return nullptr;
    }
    if (retValue2 != INT64_MAX) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase03:OH_JSVM_GetValueInt64 val Failed.");
        return nullptr;
    }

    double retValue3;
    status = OH_JSVM_GetValueDouble(env, desNum, &retValue3);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase03:OH_JSVM_GetValueDouble Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value returnValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &returnValue);
    return returnValue;
}
//CreateDouble -> GetValueUint32 double convert uint32 -> GetValueInt32 double convert int32 ->
//GetValueInt64 double convert int64 -> GetValueDouble double value
[[maybe_unused]] JSVM_Value TestBasicDataTypesCase04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value desNum = nullptr;
    JSVM_Status status = OH_JSVM_CreateDouble(env, 1.0, &desNum);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase04:OH_JSVM_CreateDouble Failed.");
        return nullptr;
    }

    uint32_t retValue;
    status = OH_JSVM_GetValueUint32(env, desNum, &retValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase04:OH_JSVM_GetValueUint32 Failed.");
        return nullptr;
    }
    if (retValue != 1) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase04:OH_JSVM_GetValueUint32 val Failed.");
        return nullptr;
    }

    int32_t retValue1;
    OH_JSVM_GetValueInt32(env, desNum, &retValue1);
    if (retValue1 != 1) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase04:OH_JSVM_GetValueInt32 val Failed.");
        return nullptr;
    }

    int64_t retValue2;
    status = OH_JSVM_GetValueInt64(env, desNum, &retValue2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase04:OH_JSVM_GetValueInt64 Failed.");
        return nullptr;
    }
    if (retValue2 != 1) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase04:OH_JSVM_GetValueInt64 val Failed.");
        return nullptr;
    }

    double retValue3;
    status = OH_JSVM_GetValueDouble(env, desNum, &retValue3);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase04:OH_JSVM_GetValueDouble Failed.");
        return nullptr;
    }
    if (retValue3 != 1.0) {
        OH_JSVM_ThrowError(env, nullptr, "TestBasicDataTypesCase04:OH_JSVM_GetValueDouble val Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value returnValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &returnValue);
    return returnValue;
}