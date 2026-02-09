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
#include "napi_arraybuffer_test.h"

//OH_JSVM_CreateArraybuffer:byteLength 0 + data NULL + result not null  -- rst ok
[[maybe_unused]] JSVM_Value TestCreateArrayBufferCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, 0, nullptr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateArrayBufferCase01:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//byteLength 10 + data not null + result not null --  rst ok
[[maybe_unused]] JSVM_Value TestCreateArrayBufferCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t arrayBufferSize = 10;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateArrayBufferCase02:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//byteLength JSVM_AUTO_LENGTH + data not null + result not null -- rst ok
[[maybe_unused]] JSVM_Value TestCreateArrayBufferCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, 1, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateArrayBufferCase03:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//byteLength 10 + data not null + result NULL
[[maybe_unused]] JSVM_Value TestCreateArrayBufferCase04(JSVM_Env env, JSVM_CallbackInfo info)
{
    void *arrayBufferPtr = nullptr;
    const size_t arrayBufferSize = 10;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateArrayBufferCase04:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_GetArraybufferInfo:arraybuffer obj,Obtain expected data and byteLength
[[maybe_unused]] JSVM_Value TestGetArrayBufferCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 4;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetArrayBufferCase01:OH_JSVM_Createarraybuffer Failed.");
        return nullptr;
    }
    void *tmpArrayBufferPtr = nullptr;
    size_t tmparrayBufferLength = 0;
    status = OH_JSVM_GetArraybufferInfo(env, arrayBuffer, &tmpArrayBufferPtr, &tmparrayBufferLength);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetArrayBufferCase01:OH_JSVM_GetArraybufferInfo Failed.");
        return nullptr;
    }

    if (tmparrayBufferLength != arrayBufferSize) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetArrayBufferCase01:arrayBufferLength is abnormal Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//not arraybuffer obj,get information failure
[[maybe_unused]] JSVM_Value TestGetArrayBufferCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *tmpArrayBufferPtr = nullptr;
    size_t tmparrayBufferLength = 0;
    JSVM_Status status = OH_JSVM_GetArraybufferInfo(env, arrayBuffer, &tmpArrayBufferPtr, &tmparrayBufferLength);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetArrayBufferCase02:OH_JSVM_GetArraybufferInfo Result is Abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_IsArraybuffer:value arraybuffer obj + result not null
[[maybe_unused]] JSVM_Value TestIsArrayBufferCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 8;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK || arrayBuffer == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsArrayBufferCase01:OH_JSVM_CreateArraybuffer Failed.");
        return nullptr;
    }

    bool isArrayBuffer = false;
    OH_JSVM_IsArraybuffer(env, arrayBuffer, &isArrayBuffer);
    if (!isArrayBuffer) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsArrayBufferCase01:OH_JSVM_IsArraybuffer Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value not arraybuffer obj + result not null
[[maybe_unused]] JSVM_Value TestIsArrayBufferCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;

    bool isArrayBuffer = false;
    OH_JSVM_IsArraybuffer(env, arrayBuffer, &isArrayBuffer);
    if (isArrayBuffer) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsArrayBufferCase02:OH_JSVM_IsArraybuffer Result is Abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value arraybuffer obj + result null
[[maybe_unused]] JSVM_Value TestIsArrayBufferCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 2;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK || arrayBuffer == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsArrayBufferCase03:OH_JSVM_CreateArraybuffer Failed.");
        return nullptr;
    }

    status = OH_JSVM_IsArraybuffer(env, arrayBuffer, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsArrayBufferCase03:OH_JSVM_IsArraybuffer Result is Abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_DetachArraybuffer:arraybuffer obj,binding typedarray
[[maybe_unused]] JSVM_Value TestDetachArrayBufferCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t arrayBufferSize = 16;
    const size_t typedArrayLength = 1;
    JSVM_Value value = nullptr;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDetachArrayBufferCase01:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    status = OH_JSVM_CreateTypedarray(env, JSVM_INT8_ARRAY, typedArrayLength, arrayBuffer, 0, &value);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDetachArrayBufferCase01:OH_JSVM_CreateTypedarray Failed");
        return nullptr;
    }

    status = OH_JSVM_DetachArraybuffer(env, arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDetachArrayBufferCase01:OH_JSVM_DetachArraybuffer Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//arraybuffer obj, binding dataview
[[maybe_unused]] JSVM_Value TestDetachArrayBufferCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t arrayBufferSize = 2;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDetachArrayBufferCase02:OH_JSVM_Createarraybuffer Failed");
        return nullptr;
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_CreateDataview(env, 0, arrayBuffer, 0, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDetachArrayBufferCase02:OH_JSVM_CreateDataview Failed");
        return nullptr;
    }

    status = OH_JSVM_DetachArraybuffer(env, arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDetachArrayBufferCase02:OH_JSVM_DetachArraybuffer Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//not arraybuffer obj
[[maybe_unused]] JSVM_Value TestDetachArrayBufferCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Status status = OH_JSVM_DetachArraybuffer(env, object);
    if (status != JSVM_ARRAYBUFFER_EXPECTED) {
        OH_JSVM_ThrowError(env, nullptr, "TestDetachArrayBufferCase03:DetachArraybuffer Function is Abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_IsDetachedArraybuffer:value arraybuffer obj binding typedarray + result not null
[[maybe_unused]] JSVM_Value TestIsDetachedArraybufferCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;
    size_t typedArrayLength = 4;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDetachedArraybufferCase01:OH_JSVM_CreateArraybuffer Failed.");
        return nullptr;
    }

    JSVM_Value result;
    status = OH_JSVM_CreateTypedarray(env, JSVM_INT32_ARRAY, typedArrayLength, arrayBuffer, 0, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDetachedArraybufferCase01:OH_JSVM_CreateTypedarray Failed.");
        return nullptr;
    }

    bool isDetachedArrayBuffer = false;
    OH_JSVM_IsDetachedArraybuffer(env, result, &isDetachedArrayBuffer);
    if (isDetachedArrayBuffer) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDetachedArraybufferCase01:OH_JSVM_IsDetachedArraybuffer is abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value arraybuffer obj binding dataview + result not null
[[maybe_unused]] JSVM_Value TestIsDetachedArraybufferCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDetachedArraybufferCase02:OH_JSVM_CreateArraybuffer Failed.");
        return nullptr;
    }

    JSVM_Value result = nullptr;
    status = OH_JSVM_CreateDataview(env, 0, arrayBuffer, 0, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDetachedArraybufferCase02:OH_JSVM_CreateDataview Failed");
        return nullptr;
    }

    bool isDetachedArrayBuffer = false;
    OH_JSVM_IsDetachedArraybuffer(env, result, &isDetachedArrayBuffer);
    if (isDetachedArrayBuffer) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDetachedArraybufferCase02:OH_JSVM_IsDetachedArraybuffer is abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value arraybuffer obj Detach obj + result not null
[[maybe_unused]] JSVM_Value TestIsDetachedArraybufferCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 1;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDetachedArraybufferCase03:OH_JSVM_CreateArraybuffer Failed.");
        return nullptr;
    }
    status = OH_JSVM_DetachArraybuffer(env, arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDetachedArraybufferCase03:OH_JSVM_DetachArraybuffer Failed.");
        return nullptr;
    }

    bool isDetachedArrayBuffer = false;
    OH_JSVM_IsDetachedArraybuffer(env, arrayBuffer, &isDetachedArrayBuffer);
    if (!isDetachedArrayBuffer) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDetachedArraybufferCase03:OH_JSVM_IsDetachedArraybuffer Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value not arraybuffer obj + result not null
[[maybe_unused]] JSVM_Value TestIsDetachedArraybufferCase04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value object;
    OH_JSVM_CreateObject(env, &object);
    JSVM_Status status = OH_JSVM_DetachArraybuffer(env, object);
    if (status != JSVM_ARRAYBUFFER_EXPECTED) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDetachedArraybufferCase04:DetachArraybuffer is Abnormal.");
        return nullptr;
    }

    bool isDetachedArrayBuffer = false;
    OH_JSVM_IsDetachedArraybuffer(env, object, &isDetachedArrayBuffer);
    if (isDetachedArrayBuffer) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDetachedArraybufferCase04:OH_JSVM_IsDetachedArraybuffer is abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value arraybuffer obj + result NULL
[[maybe_unused]] JSVM_Value TestIsDetachedArraybufferCase05(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    size_t arrayBufferSize = 16;

    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDetachedArraybufferCase05:OH_JSVM_CreateArraybuffer Failed.");
        return nullptr;
    }

    status = OH_JSVM_IsDetachedArraybuffer(env, arrayBuffer, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsDetachedArraybufferCase05:OH_JSVM_IsDetachedArraybuffer Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//APICombination：createArraybuffer Createarraybuffer -> IsArraybuffer，true -> createTypedarray -> GetArraybufferInfo
//-> IsTypedarray, true -> IsDetachedArraybuffer，false -> DetachArraybuffer -> IsTypedarray, false
//-> IsDetachedArraybuffer,true
[[maybe_unused]] JSVM_Value TestCreateAnyBufferDetachedCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value arrayBuffer = nullptr;
    void *arrayBufferPtr = nullptr;
    const size_t arrayBufferSize = 4;
    JSVM_Status status = OH_JSVM_CreateArraybuffer(env, arrayBufferSize, &arrayBufferPtr, &arrayBuffer);
    if (status != JSVM_OK || arrayBuffer == nullptr) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAnyBufferDetachedCase01:CreateArraybuffer Failed.");
        return nullptr;
    }

    bool isArrayBuffer = false;
    status = OH_JSVM_IsArraybuffer(env, arrayBuffer, &isArrayBuffer);
    if (!isArrayBuffer) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAnyBufferDetachedCase01:OH_JSVM_IsArraybuffer Failed.");
        return nullptr;
    }

    const size_t typedArrayLength = 1;
    JSVM_Value _value;
    status = OH_JSVM_CreateTypedarray(env, JSVM_INT32_ARRAY, typedArrayLength, arrayBuffer, 0, &_value);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAnyBufferDetachedCase01:OH_JSVM_CreateTypedarray Failed.");
        return nullptr;
    }

    void *data;
    size_t byteLength = 0;
    status = OH_JSVM_GetArraybufferInfo(env, _value, &data, &byteLength);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAnyBufferDetachedCase01:OH_JSVM_GetArraybufferInfo Abnormal.");
        return nullptr;
    }

    JSVM_TypedarrayType type;
    size_t length = 0;
    void *data1 = nullptr;
    JSVM_Value retArrayBuffer;
    size_t byteOffset = -1;
    status = OH_JSVM_GetTypedarrayInfo(env, _value, &type, &length, &data1, &retArrayBuffer, &byteOffset);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAnyBufferDetachedCase01:OH_JSVM_GetTypedarrayInfo Failed.");
        return nullptr;
    }
    
    bool isTypedArray = false;
    status = OH_JSVM_IsTypedarray(env, _value, &isTypedArray);
    if (!isTypedArray) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAnyBufferDetachedCase01:is not typed array Failed.");
        return nullptr;
    }

    bool isDetachedArrayBuffer = false;
    status = OH_JSVM_IsDetachedArraybuffer(env, arrayBuffer, &isDetachedArrayBuffer);
    if (isDetachedArrayBuffer) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAnyBufferDetachedCase01:OH_JSVM_IsDetachedArraybuffer abnormal.");
        return nullptr;
    }

    status = OH_JSVM_DetachArraybuffer(env, arrayBuffer);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAnyBufferDetachedCase01:OH_JSVM_DetachArraybuffer Failed.");
        return nullptr;
    }

    status = OH_JSVM_IsTypedarray(env, arrayBuffer, &isTypedArray);
    if (isTypedArray) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAnyBufferDetachedCase01:typed array abnormal.");
        return nullptr;
    }

    status = OH_JSVM_IsDetachedArraybuffer(env, arrayBuffer, &isDetachedArrayBuffer);
    if (!isDetachedArrayBuffer) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAnyBufferDetachedCase01:OH_JSVM_IsDetachedArraybuffer Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}