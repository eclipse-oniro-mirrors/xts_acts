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
#include "napi_property_test.h"
const size_t BUF_SIZE_MAX = 128;
const size_t NUM_SIZE_2 = 2;
const size_t NUM_SIZE_3 = 3;
//OH_JSVM_HasProperty
//obj is null，key is not null  status is not JSVM_OK
[[maybe_unused]] JSVM_Value TestHasPropertyTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);

    bool bRst = false;
    JSVM_Value testObj = nullptr;
    JSVM_Status hasProStatus = OH_JSVM_HasProperty(env, testObj, args[0], &bRst);
    if (hasProStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasPropertyTest1: OH_JSVM_HasProperty Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//key is nullptr, obj is not null  status is not JSVM_OK
[[maybe_unused]] JSVM_Value TestHasPropertyTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);

    bool bRst = false;
    JSVM_Value testKey = nullptr;
    JSVM_Status hasProStatus = OH_JSVM_HasProperty(env, args[0], testKey, &bRst);
    if (hasProStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasPropertyTest1: OH_JSVM_HasProperty Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//OH_JSVM_DeleteProperty
//obj is null，key is not null  status is not JSVM_OK
[[maybe_unused]] JSVM_Value TestDeletePropertyTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value args[NUM_SIZE_2] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    
    bool bRst = false;
    JSVM_Value testObj = nullptr;
    JSVM_Status delProStatus = OH_JSVM_DeleteProperty(env, testObj, args[1], &bRst);
    if (delProStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeletePropertyTest1: OH_JSVM_DeleteProperty Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//key is nullptr, obj is not null status is not JSVM_OK
[[maybe_unused]] JSVM_Value TestDeletePropertyTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value args[NUM_SIZE_2] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    
    bool bRst = false;
    JSVM_Value testKey = nullptr;
    JSVM_Status delProStatus = OH_JSVM_DeleteProperty(env, args[0], testKey, &bRst);
    if (delProStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDeletePropertyTest2: OH_JSVM_HasProperty Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//OH_JSVM_HasOwnProperty
//Object is nullptr,key is not null status is not JSVM_OK
[[maybe_unused]] JSVM_Value TestHasOwnPropertyTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value args[NUM_SIZE_2] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    
    bool bRst = false;
    JSVM_Value testObj = nullptr;
    JSVM_Status hasOwnProStatus = OH_JSVM_HasOwnProperty(env, testObj, args[1], &bRst);
    if (hasOwnProStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasOwnPropertyTest1: OH_JSVM_HasProperty Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//key is nullptr,object is not null status is not JSVM_OK
[[maybe_unused]] JSVM_Value TestHasOwnPropertyTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value args[NUM_SIZE_2] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);

    JSVM_ValueType valueType;
    OH_JSVM_Typeof(env, args[0], &valueType);
    if (valueType != JSVM_OBJECT) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasOwnPropertyTest2: OH_JSVM_Typeof value1 Failed");
        return nullptr;
    }
    JSVM_ValueType valuetype2;
    OH_JSVM_Typeof(env, args[1], &valuetype2);
    if (valuetype2 != JSVM_STRING) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasOwnPropertyTest2: OH_JSVM_Typeof value2 Failed");
        return nullptr;
    }
    
    bool bRst = false;
    JSVM_Value testKey = nullptr;
    JSVM_Status hasOwnProStatus = OH_JSVM_HasOwnProperty(env, args[0], testKey, &bRst);
    if (hasOwnProStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasOwnPropertyTest2: OH_JSVM_HasOwnProperty Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//is not own property，set property
[[maybe_unused]] JSVM_Value TestHasOwnPropertyTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    
    const char* strKeyName = "key name";
    JSVM_Value setKeyName = nullptr;
    OH_JSVM_CreateStringUtf8(env, strKeyName, JSVM_AUTO_LENGTH, &setKeyName);
    const char* strKeyValue = "key value";
    JSVM_Value setKeyValue = nullptr;
    OH_JSVM_CreateStringUtf8(env, strKeyValue, JSVM_AUTO_LENGTH, &setKeyValue);
    JSVM_Status setStatus = OH_JSVM_SetProperty(env, args[0], setKeyName, setKeyValue);
    if (setStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasOwnPropertyTest3: OH_JSVM_SetProperty Failed");
        return nullptr;
    }
    JSVM_ValueType valueType;
    OH_JSVM_Typeof(env, args[0], &valueType);
    if (valueType != JSVM_OBJECT) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasOwnPropertyTest3: OH_JSVM_Typeof obj Failed");
        return nullptr;
    }
    JSVM_ValueType valuetype2;
    OH_JSVM_Typeof(env, setKeyName, &valuetype2);
    if (valuetype2 != JSVM_STRING) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasOwnPropertyTest3: OH_JSVM_Typeof key Failed");
        return nullptr;
    }
    
    bool bRst = false;
    JSVM_Status hasOwnProStatus = OH_JSVM_HasOwnProperty(env, args[0], setKeyName, &bRst);
    if (hasOwnProStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasOwnPropertyTest3: OH_JSVM_HasOwnProperty status Failed");
        return nullptr;
    }
    if (!bRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasOwnPropertyTest3: OH_JSVM_HasOwnProperty result Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//OH_JSVM_GetNamedProperty
//Object is nullptr,key is not null status is not JSVM_OK
[[maybe_unused]] JSVM_Value TestGetNamedPropertyTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value args[NUM_SIZE_2] = {nullptr};
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetNamedPropertyTest1: OH_JSVM_GetCbInfo Failed");
        return nullptr;
    }
    char strKey[BUF_SIZE_MAX] = {0};
    size_t keyLength = 0;
    status = OH_JSVM_GetValueStringUtf8(env, args[1], strKey, BUF_SIZE_MAX, &keyLength);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetNamedPropertyTest1: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    JSVM_Value rstValue = nullptr;
    JSVM_Value objPro = nullptr;
    status = OH_JSVM_GetNamedProperty(env, objPro, strKey, &rstValue);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetNamedPropertyTest1: OH_JSVM_GetNamedProperty Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//key is nullptr,object is not null  status is not JSVM_OK
[[maybe_unused]] JSVM_Value TestGetNamedPropertyTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value args[NUM_SIZE_2] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);

    JSVM_Value rstValue = nullptr;
    const char* strKey = nullptr;
    JSVM_Status status = OH_JSVM_GetNamedProperty(env, args[0], strKey, &rstValue);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetNamedPropertyTest2: OH_JSVM_GetNamedProperty Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//obj is not null，get is not exist key  status is not JSVM_OK---
[[maybe_unused]] JSVM_Value TestGetNamedPropertyTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value args[NUM_SIZE_2] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);

    JSVM_Value rstValue = nullptr;
    const char* strKey = "null value";
    JSVM_Status status = OH_JSVM_GetNamedProperty(env, args[0], strKey, &rstValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetNamedPropertyTest3: OH_JSVM_GetNamedProperty Failed");
        return nullptr;
    }
    char rstBuf[BUF_SIZE_MAX] = {0};
    size_t rstLength = 0;
    OH_JSVM_GetValueStringUtf8(env, rstValue, rstBuf, BUF_SIZE_MAX, &rstLength);
    if (rstLength != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetNamedPropertyTest3: rstLength != 0");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//OH_JSVM_HasNamedProperty
//obj is null，utf8name is not null  status is not JSVM_OK
[[maybe_unused]] JSVM_Value TestHasNamedPropertyTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value args[NUM_SIZE_2] = {nullptr};
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasNamedPropertyTest1: OH_JSVM_GetCbInfo Failed");
        return nullptr;
    }
    char strKey[BUF_SIZE_MAX] = {0};
    size_t keyLength = 0;
    status = OH_JSVM_GetValueStringUtf8(env, args[1], strKey, BUF_SIZE_MAX, &keyLength);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasNamedPropertyTest1: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }

    bool bRstValue = false;
    JSVM_Value objPro = nullptr;
    status = OH_JSVM_HasNamedProperty(env, objPro, strKey, &bRstValue);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasNamedPropertyTest1: OH_JSVM_GetNamedProperty Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//utf8name is nullptr, obj is not null  status is not JSVM_OK
[[maybe_unused]] JSVM_Value TestHasNamedPropertyTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value args[NUM_SIZE_2] = {nullptr};
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasNamedPropertyTest2: OH_JSVM_GetCbInfo Failed");
        return nullptr;
    }
    bool bRstValue = false;
    const char* strKey = nullptr;
    status = OH_JSVM_HasNamedProperty(env, args[0], strKey, &bRstValue);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasNamedPropertyTest2: OH_JSVM_GetNamedProperty Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//obj is not null，utf8name is not exist ,status  is JSVM_OK  result is false
[[maybe_unused]] JSVM_Value TestHasNamedPropertyTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value args[NUM_SIZE_2] = {nullptr};
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasNamedPropertyTest3: OH_JSVM_GetCbInfo Failed");
        return nullptr;
    }
    bool bRstValue = false;
    const char* strKey = "not exist key";
    status = OH_JSVM_HasNamedProperty(env, args[0], strKey, &bRstValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasNamedPropertyTest3: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    if (bRstValue) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasNamedPropertyTest3: OH_JSVM_GetNamedProperty result Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//obj is not null，utf8name is exist, status  is JSVM_OK,,result is true
[[maybe_unused]] JSVM_Value TestHasNamedPropertyTest4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value args[NUM_SIZE_2] = {nullptr};
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasNamedPropertyTest4: OH_JSVM_GetCbInfo Failed");
        return nullptr;
    }
    bool bRstValue = false;
    const char* strKey = "key";
    status = OH_JSVM_HasNamedProperty(env, args[0], strKey, &bRstValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasNamedPropertyTest4: OH_JSVM_GetNamedProperty status Failed");
        return nullptr;
    }
    if (!bRstValue) {
        OH_JSVM_ThrowError(env, nullptr, "TestHasNamedPropertyTest4: OH_JSVM_GetNamedProperty result Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//OH_JSVM_DefineProperties
//Object is nullptr  status is not JSVM_OK
[[maybe_unused]] JSVM_Value TestDefinePropertiesTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDefinePropertiesTest1: OH_JSVM_GetCbInfo Failed");
        return nullptr;
    }
    bool bRstValue = false;
    size_t proCount = 1;
    JSVM_Value stringValue = nullptr;
    const JSVM_PropertyDescriptor arrPro[] = {{"defineStringProperties",
        nullptr, nullptr, nullptr, nullptr, stringValue, JSVM_DEFAULT}};
    JSVM_Value objPro = nullptr;
    status = OH_JSVM_DefineProperties(env, objPro, proCount, arrPro);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDefinePropertiesTest1: OH_JSVM_DefineProperties status Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//size_t propertyCount is 0  status is JSVM_OK
[[maybe_unused]] JSVM_Value TestDefinePropertiesTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDefinePropertiesTest2: OH_JSVM_GetCbInfo Failed");
        return nullptr;
    }
    bool bRstValue = false;
    size_t proCount = 0;
    JSVM_Value stringValue = nullptr;
    const JSVM_PropertyDescriptor arrPro[] = {{"defineStringPropertiesExample",
        nullptr, nullptr, nullptr, nullptr, stringValue, JSVM_DEFAULT}};
    status = OH_JSVM_DefineProperties(env, args[0], proCount, arrPro);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDefinePropertiesTest2: OH_JSVM_DefineProperties status Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// properties = null, status is not JSVM_OK
[[maybe_unused]] JSVM_Value TestDefinePropertiesTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDefinePropertiesTest3: OH_JSVM_GetCbInfo Failed");
        return nullptr;
    }
    bool bRstValue = false;
    size_t proCount = 1;
    JSVM_Value stringValue = nullptr;
    const JSVM_PropertyDescriptor *arrPro = nullptr;
    status = OH_JSVM_DefineProperties(env, args[0], proCount, arrPro);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDefinePropertiesTest3: OH_JSVM_DefineProperties status Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//  properties is descriptor  status is JSVM_OK, HasProperty
[[maybe_unused]] JSVM_Value TestDefinePropertiesTest4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDefinePropertiesTest4: OH_JSVM_GetCbInfo Failed");
        return nullptr;
    }
    bool bRstValue = false;
    size_t proCount = 1;
    JSVM_Value stringValue = nullptr;
    status = OH_JSVM_CreateStringUtf8(env, "create string", JSVM_AUTO_LENGTH, &stringValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDefinePropertiesTest4: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    const JSVM_PropertyDescriptor arrPro[] = {{"defineStringPropertiesExample",
        nullptr, nullptr, nullptr, nullptr, stringValue, JSVM_DEFAULT}};
    status = OH_JSVM_DefineProperties(env, args[0], proCount, arrPro);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDefinePropertiesTest4: OH_JSVM_DefineProperties status Failed");
        return nullptr;
    }
    bool bRstHas = false;
    status = OH_JSVM_HasNamedProperty(env, args[0], "defineStringPropertiesExample", &bRstHas);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestDefinePropertiesTest4: OH_JSVM_HasNamedProperty status Failed");
        return nullptr;
    }
    if (!bRstHas) {
        OH_JSVM_ThrowError(env, nullptr, "TestDefinePropertiesTest4: OH_JSVM_HasNamedProperty result Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// Property combination: setProperty-> setProperty-> getProperty-> getProperty
// hasProperty -> hasProperty -> deleteProperty ->deleteProperty
[[maybe_unused]] JSVM_Value TestCombinationPropertyTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_3;
    JSVM_Value args[NUM_SIZE_3] = {nullptr};
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_GetCbInfo Failed");
        return nullptr;
    }
    // call OH_JSVM_SetProperty
    status = OH_JSVM_SetProperty(env, args[0], args[1], args[NUM_SIZE_2]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_SetProperty Failed");
        return nullptr;
    }
    // Call OH_JSVM_SetProperty again
    bool bRstValue = false;
    JSVM_Value stringValue = nullptr;
    const char* strKeyValue = "property value1";
    status = OH_JSVM_CreateStringUtf8(env, strKeyValue, JSVM_AUTO_LENGTH, &stringValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    status = OH_JSVM_SetProperty(env, args[0], args[1], stringValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_SetProperty again Failed");
        return nullptr;
    }
    // Call getProperty
    JSVM_Value rstValue = nullptr;
    status = OH_JSVM_GetProperty(env, args[0], args[1], &rstValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_GetProperty Failed");
        return nullptr;
    }
    char strGetKeyValue[BUF_SIZE_MAX] = {0};
    size_t rstLength = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstValue, strGetKeyValue, BUF_SIZE_MAX, &rstLength);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (strcmp(strKeyValue, strGetKeyValue) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: GetProperty keyvalue!=getkeyvalue Failed");
        return nullptr;
    }
    // Call getProperty again
    JSVM_Value rstValue1 = nullptr;
    status = OH_JSVM_GetProperty(env, args[0], args[1], &rstValue1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_GetProperty Failed");
        return nullptr;
    }
    char strGetKeyValue1[BUF_SIZE_MAX] = {0};
    size_t rstLength1 = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstValue1, strGetKeyValue1, BUF_SIZE_MAX, &rstLength1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (strcmp(strKeyValue, strGetKeyValue1) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: GetProperty keyvalue!=getkeyvalue1 Failed");
        return nullptr;
    }
    // call OH_JSVM_HasProperty
    bool bHasRst = false;
    status = OH_JSVM_HasProperty(env, args[0], args[1], &bHasRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_HasProperty Failed");
        return nullptr;
    }
    if (!bHasRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_HasProperty result is false");
        return nullptr;
    }
    // call OH_JSVM_HasProperty again
    bool bHasRst1 = false;
    status = OH_JSVM_HasProperty(env, args[0], args[1], &bHasRst1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_HasProperty Failed");
        return nullptr;
    }
    if (!bHasRst1) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_HasProperty result is false");
        return nullptr;
    }
    // call OH_JSVM_DeleteProperty
    bool bDelRst = false;
    status = OH_JSVM_DeleteProperty(env, args[0], args[1], &bDelRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_DeleteProperty Failed");
        return nullptr;
    }
    if (!bDelRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_DeleteProperty result is false");
        return nullptr;
    }
    // call OH_JSVM_DeleteProperty again
    bool bDelRst1 = false;
    status = OH_JSVM_DeleteProperty(env, args[0], args[1], &bDelRst1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_DeleteProperty Failed");
        return nullptr;
    }
    if (!bDelRst1) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest1: OH_JSVM_DeleteProperty result is true");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// Property combination: setProperty 2 property->  hasProperty 2 property -> getProperty 2 property
//->deleteProperty 1 property->  hasProperty other property-> getProperty other property
[[maybe_unused]] JSVM_Value TestCombinationPropertyTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_3;
    JSVM_Value args[NUM_SIZE_3] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // call OH_JSVM_SetProperty
    JSVM_Status status = OH_JSVM_SetProperty(env, args[0], args[1], args[NUM_SIZE_2]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_SetProperty Failed");
        return nullptr;
    }
    // Call OH_JSVM_SetProperty again
    JSVM_Value stringValue = nullptr;
    const char* strKeyValue = "setKeyValue1";
    OH_JSVM_CreateStringUtf8(env, strKeyValue, JSVM_AUTO_LENGTH, &stringValue);
    JSVM_Value stringKey = nullptr;
    const char* strKey = "setkey1";
    OH_JSVM_CreateStringUtf8(env, strKey, JSVM_AUTO_LENGTH, &stringKey);
    status = OH_JSVM_SetProperty(env, args[0], stringKey, stringValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_SetProperty again Failed");
        return nullptr;
    }
    // call OH_JSVM_HasProperty
    bool bHasRst = false;
    status = OH_JSVM_HasProperty(env, args[0], args[1], &bHasRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_HasProperty Failed");
        return nullptr;
    }
    if (!bHasRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_HasProperty result is false");
        return nullptr;
    }
    // call OH_JSVM_HasProperty again
    bool bHasRst1 = false;
    status = OH_JSVM_HasProperty(env, args[0], stringKey, &bHasRst1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_HasProperty1 Failed");
        return nullptr;
    }
    if (!bHasRst1) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_HasProperty result1 is false");
        return nullptr;
    }
    // Call getProperty
    JSVM_Value rstValue = nullptr;
    status = OH_JSVM_GetProperty(env, args[0], args[1], &rstValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_GetProperty Failed");
        return nullptr;
    }
    char strGetKeyValue[BUF_SIZE_MAX] = {0};
    size_t rstLength = 0;
    OH_JSVM_GetValueStringUtf8(env, rstValue, strGetKeyValue, BUF_SIZE_MAX, &rstLength);
    char strGetKeyValueFirst[BUF_SIZE_MAX] = {0};
    size_t rstFirstLength = 0;
    status = OH_JSVM_GetValueStringUtf8(env, args[NUM_SIZE_2], strGetKeyValueFirst, BUF_SIZE_MAX, &rstFirstLength);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (strcmp(strGetKeyValueFirst, strGetKeyValue) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: GetProperty keyvalue!=getkeyvalue Failed");
        return nullptr;
    }
    // Call getProperty again
    JSVM_Value rstValue1 = nullptr;
    status = OH_JSVM_GetProperty(env, args[0], stringKey, &rstValue1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_GetProperty Failed");
        return nullptr;
    }
    char strGetKeyValue1[BUF_SIZE_MAX] = {0};
    size_t rstLength1 = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstValue1, strGetKeyValue1, BUF_SIZE_MAX, &rstLength1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (strcmp(strKeyValue, strGetKeyValue1) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: GetProperty keyvalue!=getkeyvalue1 Failed");
        return nullptr;
    }
    // call OH_JSVM_DeleteProperty
    bool bDelRst = false;
    status = OH_JSVM_DeleteProperty(env, args[0], args[1], &bDelRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_DeleteProperty Failed");
        return nullptr;
    }
    if (!bDelRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_DeleteProperty result is false");
        return nullptr;
    }
    // call OH_JSVM_HasProperty
    bool bHasRstLast = false;
    status = OH_JSVM_HasProperty(env, args[0], stringKey, &bHasRstLast);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_HasProperty Failed");
        return nullptr;
    }
    if (!bHasRstLast) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_HasProperty result is false");
        return nullptr;
    }
    // Call getProperty last
    JSVM_Value rstValueLast = nullptr;
    status = OH_JSVM_GetProperty(env, args[0], stringKey, &rstValueLast);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_GetProperty Failed");
        return nullptr;
    }
    char strGetKeyValueLast[BUF_SIZE_MAX] = {0};
    size_t rstLengthLast = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstValueLast, strGetKeyValueLast, BUF_SIZE_MAX, &rstLengthLast);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (strcmp(strKeyValue, strGetKeyValueLast) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest2: GetProperty keyvalue!=getkeyvalue1 Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// Property  combination: setProperty 2 property->  hasProperty 2 property->   getProperty 2 property
//->   deleteProperty 1 property ->hasProperty delete property->  getProperty delete property
[[maybe_unused]] JSVM_Value TestCombinationPropertyTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_3;
    JSVM_Value args[NUM_SIZE_3] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    // call OH_JSVM_SetProperty
    JSVM_Status status = OH_JSVM_SetProperty(env, args[0], args[1], args[NUM_SIZE_2]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_SetProperty Failed");
        return nullptr;
    }
    // Call OH_JSVM_SetProperty again
    JSVM_Value stringValue = nullptr;
    const char* strKeyValue = "setKeyValue1";
    OH_JSVM_CreateStringUtf8(env, strKeyValue, JSVM_AUTO_LENGTH, &stringValue);
    JSVM_Value stringKey = nullptr;
    const char* strKey = "setkey1";
    OH_JSVM_CreateStringUtf8(env, strKey, JSVM_AUTO_LENGTH, &stringKey);
    status = OH_JSVM_SetProperty(env, args[0], stringKey, stringValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_SetProperty again Failed");
        return nullptr;
    }
    // call OH_JSVM_HasProperty
    bool bHasRst = false;
    status = OH_JSVM_HasProperty(env, args[0], args[1], &bHasRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_HasProperty Failed");
        return nullptr;
    }
    if (!bHasRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_HasProperty result is false");
        return nullptr;
    }
    // call OH_JSVM_HasProperty again
    bool bHasRst1 = false;
    status = OH_JSVM_HasProperty(env, args[0], stringKey, &bHasRst1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_HasProperty1 Failed");
        return nullptr;
    }
    if (!bHasRst1) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_HasProperty result1 is false");
        return nullptr;
    }
    // Call getProperty
    JSVM_Value rstValue = nullptr;
    status = OH_JSVM_GetProperty(env, args[0], args[1], &rstValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_GetProperty Failed");
        return nullptr;
    }
    char strGetKeyValue[BUF_SIZE_MAX] = {0};
    size_t rstLength = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstValue, strGetKeyValue, BUF_SIZE_MAX, &rstLength);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    char strGetKeyValueFirst[BUF_SIZE_MAX] = {0};
    size_t rstFirstLength = 0;
    status = OH_JSVM_GetValueStringUtf8(env, args[NUM_SIZE_2], strGetKeyValueFirst, BUF_SIZE_MAX, &rstFirstLength);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (strcmp(strGetKeyValueFirst, strGetKeyValue) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: GetProperty keyvalue!=getkeyvalue Failed");
        return nullptr;
    }
    // Call getProperty again
    JSVM_Value rstValue1 = nullptr;
    status = OH_JSVM_GetProperty(env, args[0], stringKey, &rstValue1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_GetProperty Failed");
        return nullptr;
    }
    char strGetKeyValue1[BUF_SIZE_MAX] = {0};
    size_t rstLength1 = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstValue1, strGetKeyValue1, BUF_SIZE_MAX, &rstLength1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (strcmp(strKeyValue, strGetKeyValue1) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: GetProperty keyvalue!=getkeyvalue1 Failed");
        return nullptr;
    }
    // call OH_JSVM_DeleteProperty
    bool bDelRst = false;
    status = OH_JSVM_DeleteProperty(env, args[0], args[1], &bDelRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_DeleteProperty Failed");
        return nullptr;
    }
    if (!bDelRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_DeleteProperty result is false");
        return nullptr;
    }
    // call OH_JSVM_HasProperty
    bool bHasRstLast = false;
    status = OH_JSVM_HasProperty(env, args[0], args[1], &bHasRstLast);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_HasProperty Failed");
        return nullptr;
    }
    if (bHasRstLast) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_HasProperty result is false");
        return nullptr;
    }
    // Call getProperty last
    JSVM_Value rstValueLast = nullptr;
    status = OH_JSVM_GetProperty(env, args[0], args[1], &rstValueLast);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_GetProperty Failed");
        return nullptr;
    }
    char strGetKeyValue2[BUF_SIZE_MAX] = {0};
    size_t rstLength2 = 0;
    bool bRst = false;
    status = OH_JSVM_IsUndefined(env, rstValueLast, &bRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest3: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// Property  combination: setPropert 2 property->  hasProperty 2 property-> getProperty 2 property
//-> deleteProperty 1 property-> setProperty 1 property->  hasProperty 1 property->  getProperty delete property
[[maybe_unused]] JSVM_Value TestCombinationPropertyTest4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_3;
    JSVM_Value args[NUM_SIZE_3] = {nullptr};
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_GetCbInfo Failed");
        return nullptr;
    }
    // call OH_JSVM_SetProperty
    status = OH_JSVM_SetProperty(env, args[0], args[1], args[NUM_SIZE_2]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_SetProperty Failed");
        return nullptr;
    }
    // Call OH_JSVM_SetProperty again
    JSVM_Value stringValue = nullptr;
    const char* strKeyValue = "setKeyValue1";
    OH_JSVM_CreateStringUtf8(env, strKeyValue, JSVM_AUTO_LENGTH, &stringValue);
    JSVM_Value stringKey = nullptr;
    const char* strKey = "setkey1";
    OH_JSVM_CreateStringUtf8(env, strKey, JSVM_AUTO_LENGTH, &stringKey);
    status = OH_JSVM_SetProperty(env, args[0], stringKey, stringValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_SetProperty again Failed");
        return nullptr;
    }
    // call OH_JSVM_HasProperty
    bool bHasRst = false;
    status = OH_JSVM_HasProperty(env, args[0], args[1], &bHasRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_HasProperty Failed");
        return nullptr;
    }
    if (!bHasRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_HasProperty result is false");
        return nullptr;
    }
    // call OH_JSVM_HasProperty again
    bool bHasRst1 = false;
    OH_JSVM_HasProperty(env, args[0], stringKey, &bHasRst1);
    if (!bHasRst1) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_HasProperty result1 is false");
        return nullptr;
    }
    // Call getProperty
    JSVM_Value rstValue = nullptr;
    status = OH_JSVM_GetProperty(env, args[0], args[1], &rstValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_GetProperty Failed");
        return nullptr;
    }
    char strGetKeyValue[BUF_SIZE_MAX] = {0};
    size_t rstLength = 0;
    OH_JSVM_GetValueStringUtf8(env, rstValue, strGetKeyValue, BUF_SIZE_MAX, &rstLength);
    char strGetKeyValueFirst[BUF_SIZE_MAX] = {0};
    size_t rstFirstLength = 0;
    OH_JSVM_GetValueStringUtf8(env, args[NUM_SIZE_2], strGetKeyValueFirst, BUF_SIZE_MAX, &rstFirstLength);
    if (strcmp(strGetKeyValueFirst, strGetKeyValue) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: GetProperty keyvalue!=getkeyvalue Failed");
        return nullptr;
    }
    // Call getProperty again
    JSVM_Value rstValue1 = nullptr;
    status = OH_JSVM_GetProperty(env, args[0], stringKey, &rstValue1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_GetProperty Failed");
        return nullptr;
    }
    char strGetKeyValue1[BUF_SIZE_MAX] = {0};
    size_t rstLength1 = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstValue1, strGetKeyValue1, BUF_SIZE_MAX, &rstLength1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (strcmp(strKeyValue, strGetKeyValue1) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: GetProperty keyvalue!=getkeyvalue1 Failed");
        return nullptr;
    }
    // call OH_JSVM_DeleteProperty
    bool bDelRst = false;
    status = OH_JSVM_DeleteProperty(env, args[0], args[1], &bDelRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_DeleteProperty Failed");
        return nullptr;
    }
    if (!bDelRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_DeleteProperty result is false");
        return nullptr;
    }
    // Call OH_JSVM_SetProperty last
    JSVM_Value stringValueLast = nullptr;
    const char* strKeyValueLast = "setKeyValueLast";
    status = OH_JSVM_CreateStringUtf8(env, strKeyValueLast, JSVM_AUTO_LENGTH, &stringValueLast);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    JSVM_Value stringKeyLast = nullptr;
    const char* strKeyLast = "setkeylast";
    status = OH_JSVM_CreateStringUtf8(env, strKeyLast, JSVM_AUTO_LENGTH, &stringKeyLast);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    status = OH_JSVM_SetProperty(env, args[0], stringKeyLast, stringValueLast);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_SetProperty again Failed");
        return nullptr;
    }
    // call OH_JSVM_HasProperty
    bool bHasRstLast = false;
    status = OH_JSVM_HasProperty(env, args[0], stringKeyLast, &bHasRstLast);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_HasProperty Failed");
        return nullptr;
    }
    if (!bHasRstLast) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_HasProperty result is false");
        return nullptr;
    }
    // Call getProperty last
    JSVM_Value rstValueLast = nullptr;
    status = OH_JSVM_GetProperty(env, args[0], stringKeyLast, &rstValueLast);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationPropertyTest4: OH_JSVM_GetProperty Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//namedProperty  combination: SetNamedProperty ->setProperty-> GetNamedProperty-> GetNamedProperty
//-> HasNamedProperty ->HasNamedProperty
[[maybe_unused]] JSVM_Value TestCombinationNamedPropertyTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_3;
    JSVM_Value args[NUM_SIZE_3] = {nullptr};
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: OH_JSVM_GetCbInfo Failed");
        return nullptr;
    }
    // call OH_JSVM_SetNamedProperty
    char strNamedProperty[BUF_SIZE_MAX] = {0};
    size_t strLengthNamedProperty = 0;
    status = OH_JSVM_GetValueStringUtf8(env, args[1], strNamedProperty, BUF_SIZE_MAX, &strLengthNamedProperty);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    status = OH_JSVM_SetNamedProperty(env, args[0], strNamedProperty, args[NUM_SIZE_2]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: OH_JSVM_SetNamedProperty Failed");
        return nullptr;
    }
    // call OH_JSVM_SetNamedProperty again
    JSVM_Value stringValue = nullptr;
    const char* strKeyValue = "setKeyValue";
    status = OH_JSVM_CreateStringUtf8(env, strKeyValue, JSVM_AUTO_LENGTH, &stringValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    status = OH_JSVM_SetNamedProperty(env, args[0], strNamedProperty, stringValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: OH_JSVM_SetNamedProperty Failed");
        return nullptr;
    }
    // OH_JSVM_GetNamedProperty
    JSVM_Value rstValue = nullptr;
    status = OH_JSVM_GetNamedProperty(env, args[0], strNamedProperty, &rstValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: OH_JSVM_SetNamedProperty Failed");
        return nullptr;
    }
    char strGetKeyValue[BUF_SIZE_MAX] = {0};
    size_t rstLength = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstValue, strGetKeyValue, BUF_SIZE_MAX, &rstLength);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (strcmp(strKeyValue, strGetKeyValue) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: GetProperty keyvalue!=getkeyvalue1");
        return nullptr;
    }
    // OH_JSVM_GetNamedProperty again
    JSVM_Value rstValue1 = nullptr;
    status = OH_JSVM_GetNamedProperty(env, args[0], strNamedProperty, &rstValue1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: OH_JSVM_SetNamedProperty Failed");
        return nullptr;
    }
    char strGetKeyValue1[BUF_SIZE_MAX] = {0};
    size_t rstLength1 = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstValue1, strGetKeyValue1, BUF_SIZE_MAX, &rstLength1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (strcmp(strKeyValue, strGetKeyValue1) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1:GetProperty keyvalue!=getkeyvalue1");
        return nullptr;
    }
    // call OH_JSVM_HasNamedProperty
    bool bHasRst = false;
    status = OH_JSVM_HasNamedProperty(env, args[0], strNamedProperty, &bHasRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: OH_JSVM_HasProperty Failed");
        return nullptr;
    }
    if (!bHasRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: OH_JSVM_HasProperty result is false");
        return nullptr;
    }
    // call OH_JSVM_HasNamedProperty again
    bool bHasRst1 = false;
    status = OH_JSVM_HasNamedProperty(env, args[0], strNamedProperty, &bHasRst1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: OH_JSVM_HasProperty Failed");
        return nullptr;
    }
    if (!bHasRst1) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest1: OH_JSVM_HasProperty result is false");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//namedProperty  combination: setNamedProperty 2 property-> hasNamedProperty 2 property-> getNamedProperty 2 property
[[maybe_unused]] JSVM_Value TestCombinationNamedPropertyTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    JSVM_Status status = OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_GetCbInfo Failed");
        return nullptr;
    }
    // first call OH_JSVM_SetNamedProperty
    // create new obj
    JSVM_Value createObj;
    status = OH_JSVM_CreateObject(env, &createObj);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_CreateObject Failed");
        return nullptr;
    }
    // first set property
    const char* strKeyName = "key name";
    const char* strKeyValue = "key value";
    JSVM_Value keyValue = nullptr;
    status = OH_JSVM_CreateStringUtf8(env, strKeyValue, JSVM_AUTO_LENGTH, &keyValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    status = OH_JSVM_SetNamedProperty(env, createObj, strKeyName, keyValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_SetNamedProperty Failed");
        return nullptr;
    }
    //  second call OH_JSVM_SetNamedProperty
    const char* strKeyName1 = "key name second";
    const char* strKeyValue1 = "key value second";
    JSVM_Value keyValue1 = nullptr;
    status = OH_JSVM_CreateStringUtf8(env, strKeyValue1, JSVM_AUTO_LENGTH, &keyValue1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    status = OH_JSVM_SetNamedProperty(env, createObj, strKeyName1, keyValue1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_SetNamedProperty Failed");
        return nullptr;
    }
    // first call OH_JSVM_HasNamedProperty
    bool bHasRst = false;
    status = OH_JSVM_HasNamedProperty(env, createObj, strKeyName, &bHasRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_HasProperty Failed");
        return nullptr;
    }
    if (!bHasRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_HasProperty result is false");
        return nullptr;
    }
    // second call OH_JSVM_HasNamedProperty
    bool bHasRst1 = false;
    status = OH_JSVM_HasNamedProperty(env, createObj, strKeyName1, &bHasRst1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_HasProperty Failed");
        return nullptr;
    }
    if (!bHasRst1) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_HasProperty result is false");
        return nullptr;
    }
    // OH_JSVM_GetNamedProperty
    JSVM_Value rstValue = nullptr;
    status = OH_JSVM_GetNamedProperty(env, createObj, strKeyName, &rstValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_SetNamedProperty Failed");
        return nullptr;
    }
    char strGetKeyValue[BUF_SIZE_MAX] = {0};
    size_t rstLength = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstValue, strGetKeyValue, BUF_SIZE_MAX, &rstLength);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (strcmp(strKeyValue, strGetKeyValue) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: GetProperty keyvalue!=getkeyvalue1");
        return nullptr;
    }
    // second OH_JSVM_GetNamedProperty
    JSVM_Value rstValue1 = nullptr;
    status = OH_JSVM_GetNamedProperty(env, createObj, strKeyName1, &rstValue1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_SetNamedProperty Failed");
        return nullptr;
    }
    char strGetKeyValue1[BUF_SIZE_MAX] = {0};
    size_t rstLength1 = 0;
    status = OH_JSVM_GetValueStringUtf8(env, rstValue1, strGetKeyValue1, BUF_SIZE_MAX, &rstLength1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: OH_JSVM_GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (strcmp(strKeyValue1, strGetKeyValue1) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCombinationNamedPropertyTest2: GetProperty keyvalue!=getkeyvalue1");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}