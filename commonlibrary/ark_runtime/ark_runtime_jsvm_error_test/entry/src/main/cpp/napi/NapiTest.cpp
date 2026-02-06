/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "native_common.h"
#include <ark_runtime/jsvm.h>
#include "napi/NapiJsvmEnum1Test.h"
#include "napi/NapiJsvmEnum2Test.h"
#include "napi/NapiJsvmErrorCodeTest.h"
#include "napi/NapiJsvmErrorCode1Test.h"
#include "napi/NapiJsvmErrorCode2Test.h"
#include "napi/NapiJsvmErrorCode3Test.h"
#include "securec.h"

static int g_aa = 0;
const int RUN_JS_CODE_LENGTH = 1000;
const int DIFF_VALUE_SIX = 6;
const int DIFF_VALUE_THREE = 3;
static char g_dataType[32] = "";


struct DefineObject {
    char name[DIFF_VALUE_SIX];
    JSVM_Ref wrapper_;
};
static thread_local JSVM_Ref g_ref = nullptr;
struct DefineObject *g_defineObject = static_cast<struct DefineObject *>(malloc(sizeof(struct DefineObject)));

static JSVM_Value PrintHello(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value output;
    OH_JSVM_CreateStringUtf8(env, "Hello world!", JSVM_AUTO_LENGTH, &output);
    return output;
}
static JSVM_CallbackStruct helloCb = { PrintHello, nullptr };
static intptr_t g_externalsSnapshot[] = {
    (intptr_t)&helloCb,
    0,
};

static JSVM_CallbackStruct param[] = {
    {.callback = TestGetCbInfoJSOK, .data = nullptr},
    {.callback = TestGetNewTargetJSOK, .data = nullptr},
};
static JSVM_PropertyDescriptor jsDescriptor[] = {
    {"testGetCbInfoJSOK", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
    {"testGetNewTargetJSOK", nullptr, nullptr, nullptr, nullptr, nullptr, JSVM_DEFAULT},
};
void WaitPropertyDescriptor()
{
    size_t iSize = sizeof(jsDescriptor) / sizeof(JSVM_PropertyDescriptor);
    for (int i = 0; i < iSize; i++) {
        jsDescriptor[i].name = nullptr;
        jsDescriptor[i].method = &param[i];
        jsDescriptor[i].getter = nullptr;
        jsDescriptor[i].setter = nullptr;
        jsDescriptor[i].value = nullptr;
        jsDescriptor[i].attributes = JSVM_DEFAULT;
    }
}
void GetJsCode(napi_env nEnv, napi_callback_info nInfo, char *buf)
{
    size_t argc = 1;
    napi_value argv[1];
    napi_get_cb_info(nEnv, nInfo, &argc, argv, nullptr, nullptr);
    napi_get_value_string_utf8(nEnv, argv[0], buf, RUN_JS_CODE_LENGTH, nullptr);
}
JSVM_Value New(JSVM_Env env, JSVM_CallbackInfo info)
{
    strcpy_s(g_dataType, sizeof(g_dataType), "Class");
    JSVM_Value newTarget;
    OH_JSVM_GetNewTarget(env, info, &newTarget);
    if (newTarget != nullptr) {
        size_t argc = 1;
        JSVM_Value args[1];
        JSVM_Value jsThis;
        OH_JSVM_GetCbInfo(env, info, &argc, args, &jsThis, nullptr);
        double value = 0.0;
        JSVM_ValueType valuetype;
        OH_JSVM_Typeof(env, args[0], &valuetype);
        if (valuetype != JSVM_UNDEFINED) {
            OH_JSVM_GetValueDouble(env, args[0], &value);
        }

        strcpy_s(g_defineObject->name, sizeof(g_defineObject->name), "lilei");
        return nullptr;
    } else {
        size_t argc = 1;
        JSVM_Value args[1];
        OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
        JSVM_Value cons;
        OH_JSVM_GetReferenceValue(env, g_ref, &cons);
        JSVM_Value instance;
        OH_JSVM_NewInstance(env, cons, argc, args, &instance);
        return instance;
    }
}
JSVM_Value DefineClass(JSVM_Env env, JSVM_Value exports)
{
    JSVM_CallbackStruct param1;
    param1.data = nullptr;
    param1.callback = [](JSVM_Env env, JSVM_CallbackInfo info) -> JSVM_Value { return New(env, info); };
    JSVM_Value cons;
    OH_JSVM_DefineClass(env, "MyObject", JSVM_AUTO_LENGTH, &param1, 0, nullptr, &cons);
    JSVM_Value instanceValue = nullptr;
    OH_JSVM_NewInstance(env, cons, 0, nullptr, &instanceValue);
    return nullptr;
}
napi_value GetObj(napi_env env)
{
    size_t strLen = sizeof("{\"name\": \"") - 1 + strlen(g_defineObject->name) + sizeof("\"}") - 1;
    char *str = (char *)malloc(strLen + 1);
    if (str == nullptr) {
        printf("Memory allocation failed!\n");
        return nullptr;
    }
    int result = sprintf_s(str, strLen + 1, "{\"name\": \"%s\"}", g_defineObject->name);
    if (result < 0 || result >= strLen + 1) {
        return nullptr;
    }
    napi_value jsResult;
    napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &jsResult);
    return jsResult;
}
void RunScriptFail(napi_env &nEnv, JSVM_Env &env)
{
    JSVM_Value exceptionValue;
    JSVM_Status status = OH_JSVM_GetAndClearLastException(env, &exceptionValue);
    if (status == JSVM_OK) {
        JSVM_Value message;
        OH_JSVM_GetNamedProperty(env, exceptionValue, "message", &message);
        size_t length = 0;
        OH_JSVM_GetValueStringUtf8(env, message, nullptr, 0, &length);
        if (length <= 0) {
            printf("Get length error!\n");
        }
        char *buffer = (char *)malloc(length + 1);
        if (buffer == nullptr) {
            printf("Memory allocation failed!\n");
        }
        OH_JSVM_GetValueStringUtf8(env, message, buffer, length + 1, nullptr);
        OH_JSVM_GetNamedProperty(env, exceptionValue, "name", &message);
        size_t nameLength;
        OH_JSVM_GetValueStringUtf8(env, message, nullptr, 0, &nameLength);
        if (nameLength <= 0) {
            printf("Get nameLength error!\n");
        }
        char *nameBuffer = (char *)malloc(nameLength + 1);
        if (nameBuffer == nullptr) {
            printf("Memory allocation failed!\n");
        }
        OH_JSVM_GetValueStringUtf8(env, message, nameBuffer, nameLength + 1, nullptr);
        if (strcmp(nameBuffer, "TypeError") == 0) {
            napi_throw_type_error(nEnv, nameBuffer, buffer);
        } else if (strcmp(nameBuffer, "RangeError") == 0) {
            napi_throw_range_error(nEnv, nameBuffer, buffer);
        } else {
            napi_throw_error(nEnv, "-1", buffer);
        }
        free(nameBuffer);
        free(buffer);
    } else {
        napi_throw_error(nEnv, "-1", nullptr);
    }
}
void ConvertNumber(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    if (strcmp(g_dataType, "double") == 0) {
        double doubleValue;
        JSVM_Status doubleStatus = OH_JSVM_GetValueDouble(jsVmEnv, jSVmValue, &doubleValue);
        if (doubleStatus == JSVM_OK) {
            napi_create_double(napiEnv, doubleValue, napiValue);
        } else {
            napi_create_double(napiEnv, 0, napiValue);
        }
    } else if (strcmp(g_dataType, "int") == 0) {
        int64_t value;
        JSVM_Status int64Status = OH_JSVM_GetValueInt64(jsVmEnv, jSVmValue, &value);
        if (int64Status == JSVM_OK) {
            napi_create_int64(napiEnv, value, napiValue);
        } else {
            napi_create_int64(napiEnv, 0, napiValue);
        }
    } else {
        int64_t value;
        JSVM_Status int64Status = OH_JSVM_GetValueInt64(jsVmEnv, jSVmValue, &value);
        if (int64Status == JSVM_OK) {
            napi_create_int64(napiEnv, value, napiValue);
        } else {
            napi_create_int64(napiEnv, 0, napiValue);
        }
    }
}
void ConvertString(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    if (strcmp(g_dataType, "utf8") == 0) {
        size_t length;
        OH_JSVM_GetValueStringUtf8(jsVmEnv, jSVmValue, nullptr, 0, &length);
        if (length <= 0) {
            return;
        }
        char *buffer = (char *)malloc(length + 1);
        if (buffer == nullptr) {
            return;
        }
        OH_JSVM_GetValueStringUtf8(jsVmEnv, jSVmValue, buffer, length + 1, nullptr);
        napi_create_string_utf8(napiEnv, buffer, length, napiValue);
        free(buffer);
    } else if (strcmp(g_dataType, "utf16") == 0) {
        char16_t buffer[128];
        size_t bufferSize = 128;
        size_t copied = 0;
        OH_JSVM_GetValueStringUtf16(jsVmEnv, jSVmValue, buffer, bufferSize, &copied);
        napi_create_string_utf16(napiEnv, buffer, copied, napiValue);
    } else if (strcmp(g_dataType, "latin") == 0) {
        size_t length;
        OH_JSVM_GetValueStringLatin1(jsVmEnv, jSVmValue, nullptr, 0, &length);
        if (length <= 0) {
            return;
        }
        char *buffer = (char *)malloc(length + 1);
        if (buffer == nullptr) {
            return;
        }
        OH_JSVM_GetValueStringLatin1(jsVmEnv, jSVmValue, buffer, length + 1, nullptr);
        napi_create_string_latin1(napiEnv, buffer, length, napiValue);
        free(buffer);
    } else {
        size_t length;
        OH_JSVM_GetValueStringUtf8(jsVmEnv, jSVmValue, nullptr, 0, &length);
        if (length <= 0) {
            return;
        }
        char *buffer = (char *)malloc(length + 1);
        if (buffer == nullptr) {
            return;
        }
        OH_JSVM_GetValueStringUtf8(jsVmEnv, jSVmValue, buffer, length + 1, nullptr);
        napi_create_string_utf8(napiEnv, buffer, length, napiValue);
        free(buffer);
    }
}
void GetResultType(JSVM_Env env, JSVM_Value result)
{
    JSVM_ValueType valueType;
    OH_JSVM_Typeof(env, result, &valueType);
    switch (valueType) {
        case JSVM_NUMBER: {
            strcpy_s(g_dataType, sizeof(g_dataType), "int");
            break;
        }
        case JSVM_STRING: {
            strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
            break;
        }
        case JSVM_OBJECT: {
            strcpy_s(g_dataType, sizeof(g_dataType), "objectstr");
            break;
        }
        case JSVM_BIGINT: {
            strcpy_s(g_dataType, sizeof(g_dataType), "BigintUint64");
            break;
        }
        default: {
            break;
        }
    }
}
void ConvertBigInt(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    if (strcmp(g_dataType, "BigintInt64") == 0) {
        int64_t intValue;
        bool lossless = false;
        OH_JSVM_GetValueBigintInt64(jsVmEnv, jSVmValue, &intValue, &lossless);
        napi_create_bigint_int64(napiEnv, intValue, napiValue);
    }
    if (strcmp(g_dataType, "BigintUint64") == 0) {
        uint64_t uintValue;
        bool lossless = false;
        OH_JSVM_GetValueBigintUint64(jsVmEnv, jSVmValue, &uintValue, &lossless);
        napi_create_bigint_uint64(napiEnv, uintValue, napiValue);
    }
    if (strcmp(g_dataType, "BigintWords") == 0) {
        int retSignBit = 0;
        size_t retWordCount = 4;
        uint64_t wordsOut[] = {0ULL, 0ULL, 0ULL};
        OH_JSVM_GetValueBigintWords(jsVmEnv, jSVmValue, &retSignBit, &retWordCount, wordsOut);
        napi_create_bigint_words(napiEnv, 0, DIFF_VALUE_THREE, wordsOut, napiValue);
    }
}

void ConvertResults(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue);

void ConvertObjectArray(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    uint32_t length;
    OH_JSVM_GetArrayLength(jsVmEnv, jSVmValue, &length);
    napi_create_array(napiEnv, napiValue);
    for (uint32_t i = 0; i < length; i++) {
        JSVM_Value jsvmElement;
        OH_JSVM_GetElement(jsVmEnv, jSVmValue, i, &jsvmElement);
        GetResultType(jsVmEnv, jsvmElement);
        napi_value napiElement;
        ConvertResults(jsVmEnv, jsvmElement, napiEnv, &napiElement);
        napi_set_element(napiEnv, *napiValue, i, napiElement);
    }
}

void ConvertObjectArraybuffer(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    JSVM_Value byteLen;
    OH_JSVM_GetNamedProperty(jsVmEnv, jSVmValue, "byteLength", &byteLen);
    int32_t length;
    OH_JSVM_GetValueInt32(jsVmEnv, byteLen, &length);
    void *data;
    napi_create_arraybuffer(napiEnv, length, &data, napiValue);
}
void ConvertObjectDate(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    double value;
    OH_JSVM_GetDateValue(jsVmEnv, jSVmValue, &value);
    napi_create_date(napiEnv, value, napiValue);
}
void ConvertObjectArrayBufferInfo(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    JSVM_Value proLen;
    OH_JSVM_GetNamedProperty(jsVmEnv, jSVmValue, "byteLength", &proLen);
    int32_t len;
    OH_JSVM_GetValueInt32(jsVmEnv, proLen, &len);

    napi_create_object(napiEnv, napiValue);
    napi_value length;
    napi_create_uint32(napiEnv, len, &length);
    napi_set_named_property(napiEnv, *napiValue, "byteLength", length);
    JSVM_Value vmBufferData;
    OH_JSVM_GetNamedProperty(jsVmEnv, jSVmValue, "buffer", &vmBufferData);
    size_t buffLength;
    void *data;
    OH_JSVM_GetArraybufferInfo(jsVmEnv, vmBufferData, &data, &buffLength);
    napi_value bufferData;
    napi_create_arraybuffer(napiEnv, len, &data, &bufferData);
    napi_set_named_property(napiEnv, *napiValue, "buffer", bufferData);
}
size_t GetArraySize(JSVM_TypedarrayType typeNum)
{
    size_t elementSize = 0;
    switch (typeNum) {
        case JSVM_INT8_ARRAY:
        case JSVM_UINT8_ARRAY:
        case JSVM_UINT8_CLAMPED_ARRAY:
            elementSize = sizeof(int8_t);
            break;
        case JSVM_INT16_ARRAY:
        case JSVM_UINT16_ARRAY:
            elementSize = sizeof(int16_t);
            break;
        case JSVM_INT32_ARRAY:
        case JSVM_UINT32_ARRAY:
            elementSize = sizeof(int32_t);
            break;
        case JSVM_FLOAT32_ARRAY:
            elementSize = sizeof(float);
            break;
        case JSVM_FLOAT64_ARRAY:
            elementSize = sizeof(double);
            break;
        case JSVM_BIGINT64_ARRAY:
        case JSVM_BIGUINT64_ARRAY:
            elementSize = sizeof(int64_t);
            break;
        default:
            elementSize = sizeof(int8_t);
            break;
    }
    return elementSize;
}
napi_typedarray_type GetArrayType(JSVM_TypedarrayType typeNum)
{
    napi_typedarray_type arrayType;
    if (typeNum >= JSVM_INT8_ARRAY && typeNum <= JSVM_BIGUINT64_ARRAY) {
        arrayType = static_cast<napi_typedarray_type>(typeNum);
    } else {
        arrayType = napi_int8_array;
    }
    return arrayType;
}
void ConvertObjectTypeArray(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    void *data;
    JSVM_TypedarrayType type;
    size_t byteOffset;
    size_t length;
    size_t elementSize = 0;
    JSVM_Value arraybuffer;
    OH_JSVM_GetTypedarrayInfo(jsVmEnv, jSVmValue, &type, &length, &data, &arraybuffer, &byteOffset);
    napi_typedarray_type arraytype;
    elementSize = GetArraySize(type);
    arraytype = GetArrayType(type);
    napi_value arrayBuffer;
    napi_create_arraybuffer(napiEnv, length * elementSize, (void **)&data, &arrayBuffer);
    napi_create_typedarray(napiEnv, arraytype, length, arrayBuffer, 0, napiValue);
}
void ConvertJsObject(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    JSVM_Value nameValue;
    JSVM_Value propNameValue;
    OH_JSVM_CreateStringUtf8(jsVmEnv, "name", JSVM_AUTO_LENGTH, &propNameValue);

    OH_JSVM_GetProperty(jsVmEnv, jSVmValue, propNameValue, &nameValue);
    size_t bufsize = 0;
    OH_JSVM_GetValueStringUtf8(jsVmEnv, nameValue, nullptr, 0, &bufsize);
    if (bufsize <= 0) {
        printf("Bufsize error!\n");
    }
    char *buf = (char *)malloc(bufsize + 1);
    if (buf == nullptr) {
        printf("Memory allocation failed!\n");
    }
    OH_JSVM_GetValueStringUtf8(jsVmEnv, nameValue, buf, bufsize + 1, &bufsize);
    napi_create_object(napiEnv, napiValue);
    napi_value name;
    napi_create_string_utf8(napiEnv, "name", NAPI_AUTO_LENGTH, &name);
    napi_value value;
    napi_create_string_utf8(napiEnv, buf, NAPI_AUTO_LENGTH, &value);
    napi_set_property(napiEnv, *napiValue, name, value);

    JSVM_Value idValue;
    JSVM_Value propIDValue;
    OH_JSVM_CreateStringUtf8(jsVmEnv, "id", JSVM_AUTO_LENGTH, &propIDValue);
    OH_JSVM_GetProperty(jsVmEnv, jSVmValue, propIDValue, &idValue);
    size_t idSize = 0;
    OH_JSVM_GetValueStringUtf8(jsVmEnv, idValue, nullptr, 0, &idSize);
    if (idSize > 0) {
        char *idBuf = (char *)malloc(idSize + 1);
        if (idBuf == nullptr) {
            printf("Memory allocation failed!\n");
        }
        OH_JSVM_GetValueStringUtf8(jsVmEnv, idValue, idBuf, idSize + 1, &idSize);
        napi_value id;
        napi_create_string_utf8(napiEnv, "id", NAPI_AUTO_LENGTH, &id);
        napi_value id_value;
        napi_create_string_utf8(napiEnv, idBuf, NAPI_AUTO_LENGTH, &id_value);
        napi_set_property(napiEnv, *napiValue, id, id_value);
    }
}
void ConvertObjectObjStr(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    JSVM_Value propNames = nullptr;
    OH_JSVM_GetPropertyNames(jsVmEnv, jSVmValue, &propNames);
    bool isArray = false;
    OH_JSVM_IsArray(jsVmEnv, propNames, &isArray);
    uint32_t arrayLength = 0;
    OH_JSVM_GetArrayLength(jsVmEnv, propNames, &arrayLength);
    napi_create_object(napiEnv, napiValue);
    for (uint32_t i = 0; i < arrayLength; i++) {
        strcpy_s(g_dataType, sizeof(g_dataType), "utf8");
        JSVM_Value propName = nullptr;
        OH_JSVM_GetElement(jsVmEnv, propNames, i, &propName);
        napi_value propNameNapi;
        ConvertString(jsVmEnv, propName, napiEnv, &propNameNapi);
        JSVM_Value propValue = nullptr;
        OH_JSVM_GetProperty(jsVmEnv, jSVmValue, propName, &propValue);
        napi_value propValueNapi;
        GetResultType(jsVmEnv, propValue);
        ConvertResults(jsVmEnv, propValue, napiEnv, &propValueNapi);
        napi_set_property(napiEnv, *napiValue, propNameNapi, propValueNapi);
    }
}
void ConvertObject(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    if (strcmp(g_dataType, "array") == 0) {
        ConvertObjectArray(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
    if (strcmp(g_dataType, "arraybuffer") == 0) {
        ConvertObjectArraybuffer(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
    if (strcmp(g_dataType, "date") == 0) {
        ConvertObjectDate(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
    if (strcmp(g_dataType, "arraybufferinfo") == 0) {
        ConvertObjectArrayBufferInfo(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
    if (strcmp(g_dataType, "typearray") == 0) {
        ConvertObjectTypeArray(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
    if (strcmp(g_dataType, "object") == 0) {
        ConvertJsObject(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
    if (strcmp(g_dataType, "objectstr") == 0) {
        ConvertObjectObjStr(jsVmEnv, jSVmValue, napiEnv, napiValue);
    }
}

void ConvertResults(JSVM_Env jsVmEnv, JSVM_Value jSVmValue, napi_env napiEnv, napi_value *napiValue)
{
    JSVM_ValueType resultType;
    OH_JSVM_Typeof(jsVmEnv, jSVmValue, &resultType);
    switch (resultType) {
        case JSVM_UNDEFINED: {
            napi_get_undefined(napiEnv, napiValue);
            break;
        }
        case JSVM_NULL: {
            napi_get_null(napiEnv, napiValue);
            break;
        }
        case JSVM_BOOLEAN: {
            bool value = false;
            OH_JSVM_GetValueBool(jsVmEnv, jSVmValue, &value);
            napi_get_boolean(napiEnv, value, napiValue);
            break;
        }
        case JSVM_NUMBER: {
            ConvertNumber(jsVmEnv, jSVmValue, napiEnv, napiValue);
            break;
        }
        case JSVM_STRING: {
            ConvertString(jsVmEnv, jSVmValue, napiEnv, napiValue);
            break;
        }
        case JSVM_OBJECT: {
            ConvertObject(jsVmEnv, jSVmValue, napiEnv, napiValue);
            break;
        }
        case JSVM_EXTERNAL: {
            void **result = nullptr;
            JSVM_Status externalStatus = OH_JSVM_GetValueExternal(jsVmEnv, jSVmValue, result);
            if (externalStatus == JSVM_OK) {
                napi_create_external(napiEnv, result, nullptr, nullptr, napiValue);
            }
            break;
        }
        case JSVM_BIGINT: {
            ConvertBigInt(jsVmEnv, jSVmValue, napiEnv, napiValue);
            break;
        }
        default: {
            break;
        }
    }
}

napi_value ExecuteJsScript(napi_env nEnv, JSVM_Env env, char *buf)
{
    const char *sourceCodeStr = buf;
    JSVM_Value sourceCodeValue = nullptr;
    OH_JSVM_CreateStringUtf8(env, sourceCodeStr, strlen(sourceCodeStr), &sourceCodeValue);
    JSVM_Script script;
    OH_JSVM_CompileScript(env, sourceCodeValue, nullptr, 0, true, nullptr, &script);
    JSVM_Value jsVmResult = nullptr;
    napi_value nResult = nullptr;
    if (strcmp(sourceCodeStr, "defineClass") == 0) {
        JSVM_Value obj = nullptr;
        DefineClass(env, obj);
        nResult = GetObj(nEnv);
    } else {
        JSVM_Value sourceCodeValue = nullptr;
        OH_JSVM_CreateStringUtf8(env, sourceCodeStr, strlen(sourceCodeStr), &sourceCodeValue);
        JSVM_Script script;
        OH_JSVM_CompileScript(env, sourceCodeValue, nullptr, 0, true, nullptr, &script);
        JSVM_Status res = OH_JSVM_RunScript(env, script, &jsVmResult);
        if (res != JSVM_OK) {
            RunScriptFail(nEnv, env);
        }
        ConvertResults(env, jsVmResult, nEnv, &nResult);
    }
    return nResult;
}
static napi_value RunJsVm(napi_env nEnv, napi_callback_info nInfo)
{
    char *buf = static_cast<char *>(malloc(RUN_JS_CODE_LENGTH));
    WaitPropertyDescriptor();
    if (buf == nullptr) {
        return nullptr;
    }
    GetJsCode(nEnv, nInfo, buf);
    JSVM_InitOptions initOptions;
    if (memset_s(&initOptions, sizeof(initOptions), 0, sizeof(initOptions)) != EOK) {
        return nullptr;
    }
    initOptions.externalReferences = g_externalsSnapshot;
    if (g_aa == 0) {
        g_aa++;
        OH_JSVM_Init(&initOptions);
    }
    JSVM_VM vm;
    JSVM_CreateVMOptions options;
    if (memset_s(&options, sizeof(options), 0, sizeof(options)) != EOK) {
        return nullptr;
    }
    OH_JSVM_CreateVM(&options, &vm);
    JSVM_VMScope vmScope;
    OH_JSVM_OpenVMScope(vm, &vmScope);
    JSVM_Env env;
    OH_JSVM_CreateEnv(vm, sizeof(jsDescriptor) / sizeof(jsDescriptor[0]), jsDescriptor, &env);
    JSVM_EnvScope envScope;
    OH_JSVM_OpenEnvScope(env, &envScope);
    JSVM_HandleScope handleScope;
    OH_JSVM_OpenHandleScope(env, &handleScope);
    napi_value nResult = ExecuteJsScript(nEnv, env, buf);
    if (nResult == nullptr) {
        return nullptr;
    }
    OH_JSVM_CloseHandleScope(env, handleScope);
    OH_JSVM_CloseEnvScope(env, envScope);
    OH_JSVM_CloseVMScope(vm, vmScope);
    OH_JSVM_DestroyEnv(env);
    OH_JSVM_DestroyVM(vm);
    return nResult;
}

typedef struct {
    const char* name;
    napi_callback cb;
} FunctionDef;

static FunctionDef g_jsvmFunctions1[] = {
    {"testCreateVMJSOK", TestCreateVMJSOK},
    {"testOpenVMScopeJSOK", TestOpenVMScopeJSOK},
    {"testCloseVMScopeJSOK", TestCloseVMScopeJSOK},
    {"testCreateProxyJSOK", TestCreateProxyJSOK},
    {"testCreateProxyInvalid", TestCreateProxyInvalid},
    {"testCreateProxyObejct", TestCreateProxyObejct},
    {"testCreateProxyPending", TestCreateProxyPending},
    {"testCreateEnvJSOK", TestCreateEnvJSOK},
    {"testCreateEnvFromSnapshotJSOK", TestCreateEnvFromSnapshotJSOK},
    {"testDestroyEnvJSOK", TestDestroyEnvJSOK},
    {"testOpenEnvScopeJSOK", TestOpenEnvScopeJSOK},
    {"testCloseEnvScopeJSOK", TestCloseEnvScopeJSOK},
    {"testGetVMJSOK", TestGetVMJSOK},
    {"testIsProxyJSOK", TestIsProxyJSOK},
    {"testIsProxyInvalid", TestIsProxyInvalid},
    {"testProxyGetTargetJSOK", TestProxyGetTargetJSOK},
    {"testProxyGetTargetInvalid", TestProxyGetTargetInvalid},
    {"testProxyGetTargetInvalidType", TestProxyGetTargetInvalidType},
    {"testCompileScriptJSOK", TestCompileScriptJSOK},
    {"testCreateCodeCacheJSOK", TestCreateCodeCacheJSOK},
    {"testThrowJSOK", TestThrowJSOK},
    {"testOpenHandleScopeJSOK", TestOpenHandleScopeJSOK},
    {"testOpenEscapableHandleScopeJSOK", TestOpenEscapableHandleScopeJSOK},
    {"testCloseEscapableHandleScopeJSOK", TestCloseEscapableHandleScopeJSOK},
    {"testGetReferenceValueJSOK", TestGetReferenceValueJSOK},
    {"testCreateArrayJSOK", TestCreateArrayJSOK},
    {"testAllocateArrayBufferBackingStoreDataInvalid", TestAllocateArrayBufferBackingStoreDataInvalid},
    {"testAllocateArrayBufferBackingStoreDataGenericFailure", TestAllocateArrayBufferBackingStoreDataGenericFailure},
    {"testFreeArrayBufferBackingStoreDataInvalid", TestFreeArrayBufferBackingStoreDataInvalid},
    {"testCreateArrayBufferFromBackingStoreDataInvalid", TestCreateArrayBufferFromBackingStoreDataInvalid},
    {"testCreateDateJSOK", TestCreateDateJSOK},
    {"testCreateExternalJSOK", TestCreateExternalJSOK},
    {"testCreateSymbolJSOK", TestCreateSymbolJSOK},
    {"testCreateBigintInt64JSOK", TestCreateBigintInt64JSOK},
    {"testGetArrayLengthJSOK", TestGetArrayLengthJSOK},
    {"testGetPrototypeJSOK", TestGetPrototypeJSOK},
    {"testGetDateValueJSOK", TestGetDateValueJSOK},
    {"testGetDateValueExpected", TestGetDateValueExpected},
    {"testGetValueBoolJSOK", TestGetValueBoolJSOK},
    {"testGetValueDoubleExpected", TestGetValueDoubleExpected},
};

static FunctionDef g_jsvmFunctions2[] = {
    {"testGetValueBigintInt64Expected", TestGetValueBigintInt64Expected},
    {"testGetValueBigintUint64JSOK", TestGetValueBigintUint64JSOK},
    {"testGetValueBigintUint64Expected", TestGetValueBigintUint64Expected},
    {"testGetValueExternalInvalid", TestGetValueExternalInvalid},
    {"testGetValueInt32Expected", TestGetValueInt32Expected},
    {"testGetValueInt64Expected", TestGetValueInt64Expected},
    {"testGetValueStringLatin1JSOK", TestGetValueStringLatin1JSOK},
    {"testGetValueStringLatin1Expected", TestGetValueStringLatin1Expected},
    {"testGetValueStringUtf8JSOK", TestGetValueStringUtf8JSOK},
    {"testGetValueStringUtf8Expected", TestGetValueStringUtf8Expected},
    {"testGetValueStringUtf16JSOK", TestGetValueStringUtf16JSOK},
    {"testGetValueStringUtf16Expected", TestGetValueStringUtf16Expected},
    {"testGetValueUint32JSOK", TestGetValueUint32JSOK},
    {"testGetValueUint32Expected", TestGetValueUint32Expected},
    {"testGetBooleanJSOK", TestGetBooleanJSOK},
    {"testGetNullJSOK", TestGetNullJSOK},
    {"testGetUndefinedJSOK", TestGetUndefinedJSOK},
    {"testCoerceToBoolJSOK", TestCoerceToBoolJSOK},
    {"testCoerceToNumberJSOK", TestCoerceToNumberJSOK},
    {"testCoerceToObjectJSOK", TestCoerceToObjectJSOK},
    {"testCoerceToStringJSOK", TestCoerceToStringJSOK},
    {"testInstanceofJSOK", TestInstanceofJSOK},
    {"testIsArrayJSOK", TestIsArrayJSOK},
    {"testIsArraybufferJSOK", TestIsArraybufferJSOK},
    {"testIsDataviewJSOK", TestIsDataviewJSOK},
    {"testEqualsJSOK", TestEqualsJSOK},
    {"testDetachArraybufferExpected", TestDetachArraybufferExpected},
    {"testIsDetachedArraybufferJSOK", TestIsDetachedArraybufferJSOK},
    {"testGetPropertyNamesJSOK", TestGetPropertyNamesJSOK},
    {"testGetAllPropertyNamesJSOK", TestGetAllPropertyNamesJSOK},
    {"testGetPropertyJSOK", TestGetPropertyJSOK},
    {"testSetElementJSOK", TestSetElementJSOK},
    {"testHasElementJSOK", TestHasElementJSOK},
    {"testDeleteElementJSOK", TestDeleteElementJSOK},
    {"testObjectFreezeJSOK", TestObjectFreezeJSOK},
    {"testObjectSealJSOK", TestObjectSealJSOK},
    {"testNewInstanceJSOK", TestNewInstanceJSOK},
    {"testDefineClassJSOK", TestDefineClassJSOK},
    {"testRemoveWrapJSOK", TestRemoveWrapJSOK},
    {"runJsVm", RunJsVm},
};

static FunctionDef g_jsvmFunctions3[] = {
    {"testTypeTagObjectInvalid", TestTypeTagObjectInvalid},
    {"testAddFinalizerJSOK", TestAddFinalizerJSOK},
    {"testGetVersionJSOK", TestGetVersionJSOK},
    {"testGetVMInfoJSOK", TestGetVMInfoJSOK},
    {"testMemoryPressureNotificationJSOK", TestMemoryPressureNotificationJSOK},
    {"testCreatePromiseJSOK", TestCreatePromiseJSOK},
    {"testResolveDeferreJSOK", TestResolveDeferreJSOK},
    {"testRejectDeferredJSOK", TestRejectDeferredJSOK},
    {"testPromiseRegisterHandlerJSOK", TestPromiseRegisterHandlerJSOK},
    {"testPromiseRegisterHandlerInvalidtype", TestPromiseRegisterHandlerInvalidtype},
    {"testPromiseRegisterHandlerPending", TestPromiseRegisterHandlerPending},
    {"testPromiseRegisterHandlerInvalid", TestPromiseRegisterHandlerInvalid},
    {"testPromiseRegisterHandlerGenericFailure", TestPromiseRegisterHandlerGenericFailure},
    {"testCreateSnapshotJSOK", TestCreateSnapshotJSOK},
    {"testGetHeapStatisticsJSOK", TestGetHeapStatisticsJSOK},
    {"testStartCpuProfilerJSOK", TestStartCpuProfilerJSOK},
    {"testStopCpuProfilerJSOK", TestStopCpuProfilerJSOK},
    {"testTakeHeapSnapshotJSOK", TestTakeHeapSnapshotJSOK},
    {"testOpenInspectorJSOK", TestOpenInspectorJSOK},
    {"testOpenInspectorPending", TestOpenInspectorPending},
    {"testCloseInspectorPending", TestCloseInspectorPending},
    {"testWaitForDebuggerJSOK", TestWaitForDebuggerJSOK},
    {"testWaitForDebuggerPending", TestWaitForDebuggerPending},
    {"testIsLockedJSOK", TestIsLockedJSOK},
    {"testAcquireLockJSOK", TestAcquireLockJSOK},
    {"testReleaseLockJSOK", TestReleaseLockJSOK},
    {"testIsCallableJSOK", TestIsCallableJSOK},
    {"testIsNullJSOK", TestIsNullJSOK},
    {"testIsNullOrUndefinedJSOK", TestIsNullOrUndefinedJSOK},
    {"testIsBooleanJSOK", TestIsBooleanJSOK},
    {"testIsNumberJSOK", TestIsNumberJSOK},
    {"testIsStringJSOK", TestIsStringJSOK},
    {"testIsSymbolJSOK", TestIsSymbolJSOK},
    {"testIsBigIntJSOK", TestIsBigIntJSOK},
    {"testCreateMapJSOK", TestCreateMapJSOK},
    {"testCreateMapInvalid", TestCreateMapInvalid},
    {"testIsMapJSOK", TestIsMapJSOK},
    {"testIsMapInvalid", TestIsMapInvalid},
    {"testCreateSetInvalid", TestCreateSetInvalid},
    {"testIsSetInvalid", TestIsSetInvalid},
};

static FunctionDef g_jsvmFunctions4[] = {
    {"testCompileScriptWithOptionsInvalid", TestCompileScriptWithOptionsInvalid},
    {"testCoerceToBigIntJSOK", TestCoerceToBigIntJSOK},
    {"testCoerceToBigIntInvalid", TestCoerceToBigIntInvalid},
    {"testCoerceToBigIntExpected", TestCoerceToBigIntExpected},
    {"testIsRegExpJSOK", TestIsRegExpJSOK},
    {"testIsRegExpInvalid", TestIsRegExpInvalid},
    {"testIsConstructorJSOK", TestIsConstructorJSOK},
    {"testIsConstructorInvalid", TestIsConstructorInvalid},
    {"testCreateRegExpJSOK", TestCreateRegExpJSOK},
    {"testCreateRegExpExpected", TestCreateRegExpExpected},
    {"testCreateRegExpPending", TestCreateRegExpPending},
    {"testCreateRegExpInvalid", TestCreateRegExpInvalid},
    {"testCreateRegExpGenericFailure", TestCreateRegExpGenericFailure},
    {"testObjectGetPrototypeOfInvalid", TestObjectGetPrototypeOfInvalid},
    {"testObjectSetPrototypeOfInvalid", TestObjectSetPrototypeOfInvalid},
    {"testCreateFunctionWithScriptJSOK", TestCreateFunctionWithScriptJSOK},
    {"testCreateFunctionWithScriptInvalid", TestCreateFunctionWithScriptInvalid},
    {"testCreateFunctionWithScriptGenericFailure", TestCreateFunctionWithScriptGenericFailure},
    {"testRetainScriptInvalid", TestRetainScriptInvalid},
    {"testReleaseScriptJSOK", TestReleaseScriptJSOK},
    {"testReleaseScriptInvalid", TestReleaseScriptInvalid},
    {"testOpenInspectorWithNameJSOK", TestOpenInspectorWithNameJSOK},
    {"testOpenInspectorWithNamePending", TestOpenInspectorWithNamePending},
    {"testCompileWasmModulePending", TestCompileWasmModulePending},
    {"testCompileWasmModuleModeExpected", TestCompileWasmModuleModeExpected},
    {"testCompileWasmModuleInvalid", TestCompileWasmModuleInvalid},
    {"testCompileWasmModuleGenericFailure", TestCompileWasmModuleGenericFailure},
    {"testCompileWasmFunctionPending", TestCompileWasmFunctionPending},
    {"testCompileWasmFunctionModeExpected", TestCompileWasmFunctionModeExpected},
    {"testCompileWasmFunctionGenericFailure", TestCompileWasmFunctionGenericFailure},
    {"testCreateWasmCacheModeExpected", TestCreateWasmCacheModeExpected},
    {"testCreateWasmCacheInvalid", TestCreateWasmCacheInvalid},
    {"testCreateWasmCacheGenericFailure", TestCreateWasmCacheGenericFailure},
    {"testCreateExternalStringLatin1JSOK", TestCreateExternalStringLatin1JSOK},
    {"testCreateExternalStringLatin1Invalid", TestCreateExternalStringLatin1Invalid},
    {"testCreateExternalStringUtf16JSOK", TestCreateExternalStringUtf16JSOK},
    {"testCreateExternalStringUtf16Invalid", TestCreateExternalStringUtf16Invalid},
    {"testCreatePrivateJSOK", TestCreatePrivateJSOK},
    {"testCreatePrivateExpected", TestCreatePrivateExpected},
    {"testCreatePrivateInvalid", TestCreatePrivateInvalid},
};
static FunctionDef g_jsvmFunctions5[] = {
    {"testSetPrivatePending", TestSetPrivatePending},
    {"testSetPrivateGenericFailure", TestSetPrivateGenericFailure},
    {"testGetPrivatePending", TestGetPrivatePending},
    {"testGetPrivateGenericFailure", TestGetPrivateGenericFailure},
    {"testDeletePrivateJSOK", TestDeletePrivateJSOK},
    {"testDeletePrivatePending", TestDeletePrivatePending},
    {"testDeletePrivateGenericFailure", TestDeletePrivateGenericFailure},
    {"testCreateDataReferenceInvalid", TestCreateDataReferenceInvalid},
    {"testGetReferenceDataInvalid", TestGetReferenceDataInvalid},
    {"testIsBigIntObjectJSOK", TestIsBigIntObjectJSOK},
    {"testIsBigIntObjectInvalid", TestIsBigIntObjectInvalid},
    {"testIsBooleanObjectJSOK", TestIsBooleanObjectJSOK},
    {"testIsBooleanObjectInvalid", TestIsBooleanObjectInvalid},
    {"testIsStringObjectJSOK", TestIsStringObjectJSOK},
    {"testIsStringObjectInvalid", TestIsStringObjectInvalid},
    {"testIsNumberObjectJSOK", TestIsNumberObjectJSOK},
    {"testIsNumberObjectInvalid", TestIsNumberObjectInvalid},
    {"testIsSymbolObjectJSOK", TestIsSymbolObjectJSOK},
    {"testIsSymbolObjectInvalid", TestIsSymbolObjectInvalid},
    {"testGetSymbolAsyncIteratorJSOK", TestGetSymbolAsyncIteratorJSOK},
    {"testGetSymbolAsyncIteratorInvalid", TestGetSymbolAsyncIteratorInvalid},
    {"testGetSymbolHasInstanceJSOK", TestGetSymbolHasInstanceJSOK},
    {"testGetSymbolHasInstanceInvalid", TestGetSymbolHasInstanceInvalid},
    {"testGetSymbolIsConcatSpreadableJSOK", TestGetSymbolIsConcatSpreadableJSOK},
    {"testGetSymbolIsConcatSpreadableInvalid", TestGetSymbolIsConcatSpreadableInvalid},
    {"testGetSymbolMatchJSOK", TestGetSymbolMatchJSOK},
    {"testGetSymbolMatchInvalid", TestGetSymbolMatchInvalid},
    {"testGetSymbolReplaceJSOK", TestGetSymbolReplaceJSOK},
    {"testGetSymbolReplaceInvalid", TestGetSymbolReplaceInvalid},
    {"testGetSymbolSearchJSOK", TestGetSymbolSearchJSOK},
    {"testGetSymbolSearchInvalid", TestGetSymbolSearchInvalid},
    {"testGetSymbolSplitJSOK", TestGetSymbolSplitJSOK},
    {"testGetSymbolSplitInvalid", TestGetSymbolSplitInvalid},
    {"testGetSymbolToPrimitiveJSOK", TestGetSymbolToPrimitiveJSOK},
    {"testGetSymbolToPrimitiveInvalid", TestGetSymbolToPrimitiveInvalid},
    {"testGetSymbolUnscopablesJSOK", TestGetSymbolUnscopablesJSOK},
    {"testGetSymbolUnscopablesInvalid", TestGetSymbolUnscopablesInvalid},
    {"testGetSymbolToStringTagJSOK", TestGetSymbolToStringTagJSOK},
    {"testGetSymbolToStringTagInvalid", TestGetSymbolToStringTagInvalid},
    {"testGetSymbolIteratorJSOK", TestGetSymbolIteratorJSOK},
};
static FunctionDef g_jsvmFunctions6[] = {
    {"testGetSymbolIteratorInvalid", TestGetSymbolIteratorInvalid},
    {"testSetHandlerForOOMErrorJSOK", TestSetHandlerForOOMErrorJSOK},
    {"testSetHandlerForOOMErrorInvalid", TestSetHandlerForOOMErrorInvalid},
    {"testSetDebugOptionJSOK", TestSetDebugOptionJSOK},
    {"testSetDebugOptionInvalid", TestSetDebugOptionInvalid},
    {"testSetHandlerForFatalErrorJSOK", TestSetHandlerForFatalErrorJSOK},
    {"testSetHandlerForFatalErrorInvalid", TestSetHandlerForFatalErrorInvalid},
    {"testSetHandlerForPromiseRejectJSOK", TestSetHandlerForPromiseRejectJSOK},
    {"testSetHandlerForPromiseRejectInvalid", TestSetHandlerForPromiseRejectInvalid},
    {"testDefineClassWithOptionsJSOK", TestDefineClassWithOptionsJSOK},
    {"testDefineClassWithOptionsGenericFailure", TestDefineClassWithOptionsGenericFailure},
    {"testAddHandlerForGCJSOK", TestAddHandlerForGCJSOK},
    {"testAddHandlerForGCInvalid", TestAddHandlerForGCInvalid},
    {"testRemoveHandlerForGCJSOK", TestRemoveHandlerForGCJSOK},
    {"testRemoveHandlerForGCInvalid", TestRemoveHandlerForGCInvalid},
    
    {"testJSVMStatusNameExpected", TestJSVMStatusNameExpected},
    {"testJSVMStatusFunctionExpected", TestJSVMStatusFunctionExpected},
    {"testJSVMStatusEscapeCalledTwice", TestJSVMStatusEscapeCalledTwice},
    {"testJSVMStatusBigintExpected", TestJSVMStatusBigintExpected},
    {"testJSVMStatusDateExpected", TestJSVMStatusDateExpected},
    {"testJSVMStatusDetacgableArraybufferExpected", TestJSVMStatusDetacgableArraybufferExpected},
    {"testJSVMStatusInvalidType", TestJSVMStatusInvalidType},
    {"testJSVMStatusJitModeExpected", TestJSVMStatusJitModeExpected},

};

static FunctionDef g_jsvmFunctions7[] = {
    {"JsvmWritableCode", JsvmWritableCode},
    {"JsvmConfigurableCode", JsvmConfigurableCode},
    {"JsvmNoReceiverCheckCode", JsvmNoReceiverCheckCode},
    {"JsvmStaticCode", JsvmStaticCode},
    {"JsvmDefaultMethodCode", JsvmDefaultMethodCode},
    {"JsvmMethodNoReceiverCheckCode", JsvmMethodNoReceiverCheckCode},
    {"JsvmDefaultJspropertyCode", JsvmDefaultJspropertyCode},
    {"JsvmJspropertyNoReceiverlCheckCode", JsvmJspropertyNoReceiverlCheckCode},
    {"JsvmKeyAllPropertiesCode", JsvmKeyAllPropertiesCode},
    {"JsvmKeySkipStringsCode", JsvmKeySkipStringsCode},
    {"JsvmCompileModeDefaultCode", JsvmCompileModeDefaultCode},
    {"JsvmCompileModeConsumeCodeCode", JsvmCompileModeConsumeCodeCode},
    {"JsvmCompileModeProduceCompileProfileCode", JsvmCompileModeProduceCompileProfileCode},
    {"JsvmCompileModeConsumeCompileProfileCode", JsvmCompileModeConsumeCompileProfileCode},
    {"JsvmCompileCodeCacheCode", JsvmCompileCodeCacheCode},
    {"JsvmCompileCompileProfileCode", JsvmCompileCompileProfileCode},
    {"JsvmCompileEnableSourceMapCode", JsvmCompileEnableSourceMapCode},
    {"JsvmHeapStatisticsTotalHeapSizeCode", JsvmHeapStatisticsTotalHeapSizeCode},
    {"JsvmHeapStatisticsTotalHeapSizeExecutableCode", JsvmHeapStatisticsTotalHeapSizeExecutableCode},
    {"JsvmHeapStatisticsTotalPhysicalSizeCode", JsvmHeapStatisticsTotalPhysicalSizeCode},
    {"JsvmHeapStatisticsTotalAvailableSizeCode", JsvmHeapStatisticsTotalAvailableSizeCode},
    {"JsvmHeapStatisticsUsedHeapSizeCode", JsvmHeapStatisticsUsedHeapSizeCode},
    {"JsvmHeapStatisticsHeapSizeLimitCode", JsvmHeapStatisticsHeapSizeLimitCode},
    {"JsvmHeapStatisticsMallocedMemoryCode", JsvmHeapStatisticsMallocedMemoryCode},
    {"JsvmHeapStatisticsExternalMemoryCode", JsvmHeapStatisticsExternalMemoryCode},
    {"JsvmHeapStatisticsPeakMallocedMemoryCode", JsvmHeapStatisticsPeakMallocedMemoryCode},
    {"JsvmHeapStatisticsNumberOfDetachedContextCode", JsvmHeapStatisticsNumberOfDetachedContextCode},
    {"JsvmHeapStatisticsTotalGlobalHandlesSizeCode", JsvmHeapStatisticsTotalGlobalHandlesSizeCode},
    {"JsvmHeapStatisticsUsedGlobalHandlesSizeCode", JsvmHeapStatisticsUsedGlobalHandlesSizeCode},
    {"JsvmInitOptionsArgcCode", JsvmInitOptionsArgcCode},
    {"JsvmInitOptionsArgvCode", JsvmInitOptionsArgvCode},
    {"JsvmInitOptionsRemoveFlagsCode", JsvmInitOptionsRemoveFlagsCode},
    {"JsvmCreateVmOptionsMaxOldGenerationSizeCode", JsvmCreateVmOptionsMaxOldGenerationSizeCode},
    {"JsvmCreateVmOptionsMaxYoungGenerationSizeCode", JsvmCreateVmOptionsMaxYoungGenerationSizeCode},
    {"JsvmCreateVmOptionsInitialOldGenerationSizeCode", JsvmCreateVmOptionsInitialOldGenerationSizeCode},
    {"JsvmCreateVmOptionsInitialYoungGenerationSizeCode", JsvmCreateVmOptionsInitialYoungGenerationSizeCode},
    {"JsvmCreateVmOptionsSnapshotBlobDataCode", JsvmCreateVmOptionsSnapshotBlobDataCode},
    {"JsvmCreateVmOptionsSnapshotBlobSizeCode", JsvmCreateVmOptionsSnapshotBlobSizeCode},
    {"JsvmVmInfoEngineCode", JsvmVmInfoEngineCode},
    {"JsvmVmInfoVersionCode", JsvmVmInfoVersionCode},
    {"JsvmVmInfoCachedDataVersionTagCode", JsvmVmInfoCachedDataVersionTagCode},
    {"JsvmExtendedErrorInfoEngineReservedCode", JsvmExtendedErrorInfoEngineReservedCode},
    {"JsvmExtendedErrorInfoEngineErrorCode", JsvmExtendedErrorInfoEngineErrorCode},
    {"JsvmRegexpNoneCode", JsvmRegexpNoneCode},
    {"JsvmDefineClassNormalCode", JsvmDefineClassNormalCode},
    {"JsvmDefineClassOptionsCode", JsvmDefineClassOptionsCode},
    {"JsvmGcTypeMinorMarkCompactCode", JsvmGcTypeMinorMarkCompactCode},
    {"JsvmGcTypeMarkSweepCompactCode", JsvmGcTypeMarkSweepCompactCode},
    {"JsvmGcTypeIncrementalMarkingCode", JsvmGcTypeIncrementalMarkingCode},
    {"JsvmGcTypeProcessWeakCallbacksCode", JsvmGcTypeProcessWeakCallbacksCode},
    {"JsvmNapiQosBackgroundCode", JsvmNapiQosBackgroundCode},
    {"JsvmNapiQosUtilityCode", JsvmNapiQosUtilityCode},
    {"JsvmNapiQosUserInitiaredCode", JsvmNapiQosUserInitiaredCode},
};


static napi_value RegisterFunctions(napi_env env, napi_value exports, FunctionDef *list, size_t count)
{
    napi_property_descriptor props[count];
    for (size_t i = 0; i < count; i++) {
        props[i] = DECLARE_NAPI_FUNCTION(list[i].name, list[i].cb);
    }
    NAPI_CALL(env, napi_define_properties(env, exports, count, props));
    return nullptr;
}

EXTERN_C_START

static napi_value Init(napi_env env, napi_value exports)
{
    RegisterFunctions(env, exports, g_jsvmFunctions1, sizeof(g_jsvmFunctions1) / sizeof(g_jsvmFunctions1[0]));
    RegisterFunctions(env, exports, g_jsvmFunctions2, sizeof(g_jsvmFunctions2) / sizeof(g_jsvmFunctions2[0]));
    RegisterFunctions(env, exports, g_jsvmFunctions3, sizeof(g_jsvmFunctions3) / sizeof(g_jsvmFunctions3[0]));
    RegisterFunctions(env, exports, g_jsvmFunctions4, sizeof(g_jsvmFunctions4) / sizeof(g_jsvmFunctions4[0]));
    RegisterFunctions(env, exports, g_jsvmFunctions5, sizeof(g_jsvmFunctions5) / sizeof(g_jsvmFunctions5[0]));
    RegisterFunctions(env, exports, g_jsvmFunctions6, sizeof(g_jsvmFunctions6) / sizeof(g_jsvmFunctions6[0]));
    RegisterFunctions(env, exports, g_jsvmFunctions7, sizeof(g_jsvmFunctions7) / sizeof(g_jsvmFunctions7[0]));

    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
