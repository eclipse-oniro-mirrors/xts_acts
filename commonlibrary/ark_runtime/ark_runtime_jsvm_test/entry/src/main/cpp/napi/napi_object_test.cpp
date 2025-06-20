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
#include "napi_object_test.h"
const size_t BUF_SIZE_10 = 10;
const JSVM_TypeTag tagsData[] = {
    {0x9e4b2449547061b3, 0x33999f8a6516c499},
    {0x1d55a794c53a726d, 0x43633f509f9c944e},
    {0, 0}, // default tag
    {0x6a971439f5b2e5d7, 0x531dc28a7e5317c0},
};
//OH_JSVM_CreateObject
//result is null
[[maybe_unused]] JSVM_Value TestCreateObjectTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Status status = OH_JSVM_CreateObject(env, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateObjectTest1: OH_JSVM_CreateObject Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//result is not nullptr
[[maybe_unused]] JSVM_Value TestCreateObjectTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value rstObject;
    JSVM_Status status = OH_JSVM_CreateObject(env, &rstObject);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateObjectTest2: OH_JSVM_CreateObject Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//OH_JSVM_Typeof
//value is null
[[maybe_unused]] JSVM_Value TestTypeofTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value typeValue;
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    JSVM_Status status = OH_JSVM_Typeof(env, nullptr, &rstValueType);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest1: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null， type is JSVM_UNDEFINED
[[maybe_unused]] JSVM_Value TestTypeofTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    JSVM_Status status = OH_JSVM_Typeof(env, argv[0], &rstValueType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest2: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    if (rstValueType != JSVM_UNDEFINED) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest2: OH_JSVM_Typeof type is not JSVM_UNDEFINED");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null， type is JSVM_NULL
[[maybe_unused]] JSVM_Value TestTypeofTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    JSVM_Status status = OH_JSVM_Typeof(env, argv[0], &rstValueType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest3: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    if (rstValueType != JSVM_NULL) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest3: OH_JSVM_Typeof type is not JSVM_NULL");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null， type is JSVM_BOOLEAN
[[maybe_unused]] JSVM_Value TestTypeofTest4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    JSVM_Status status = OH_JSVM_Typeof(env, argv[0], &rstValueType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest4: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    if (rstValueType != JSVM_BOOLEAN) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest4: OH_JSVM_Typeof type is not JSVM_BOOLEAN");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null， type is JSVM_NUMBER
[[maybe_unused]] JSVM_Value TestTypeofTest5(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    JSVM_Status status = OH_JSVM_Typeof(env, argv[0], &rstValueType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest5: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    if (rstValueType != JSVM_NUMBER) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest5: OH_JSVM_Typeof type is not JSVM_NUMBER");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null， type is JSVM_STRING
[[maybe_unused]] JSVM_Value TestTypeofTest6(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    JSVM_Status status = OH_JSVM_Typeof(env, argv[0], &rstValueType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest6: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    if (rstValueType != JSVM_STRING) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest6: OH_JSVM_Typeof type is not JSVM_STRING");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null， type is JSVM_SYMBOL
[[maybe_unused]] JSVM_Value TestTypeofTest7(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    JSVM_Status status = OH_JSVM_Typeof(env, argv[0], &rstValueType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest7: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    if (rstValueType != JSVM_SYMBOL) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest7: OH_JSVM_Typeof type is not JSVM_SYMBOL");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null， type is JSVM_OBJECT
[[maybe_unused]] JSVM_Value TestTypeofTest8(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    JSVM_Status status = OH_JSVM_Typeof(env, argv[0], &rstValueType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest8: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    if (rstValueType != JSVM_OBJECT) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest8: OH_JSVM_Typeof type is not JSVM_OBJECT");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null， type is JSVM_FUNCTION
[[maybe_unused]] JSVM_Value TestTypeofTest9(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    JSVM_Status status = OH_JSVM_Typeof(env, argv[0], &rstValueType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest9: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    if (rstValueType != JSVM_FUNCTION) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest9: OH_JSVM_Typeof type is not JSVM_FUNCTION");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null， type is JSVM_EXTERNAL
[[maybe_unused]] JSVM_Value TestTypeofTest10(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Value rstExternal = nullptr;
    OH_JSVM_CreateExternal(env, nullptr, nullptr, nullptr, &rstExternal);
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    JSVM_Status status = OH_JSVM_Typeof(env, rstExternal, &rstValueType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest10: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    if (rstValueType != JSVM_EXTERNAL) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest10: OH_JSVM_Typeof type is not JSVM_EXTERNAL");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null， type is JSVM_BIGINT
[[maybe_unused]] JSVM_Value TestTypeofTest11(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    JSVM_Status status = OH_JSVM_Typeof(env, argv[0], &rstValueType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest11: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    if (rstValueType != JSVM_BIGINT) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest11: OH_JSVM_Typeof type is not JSVM_BIGINT");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null， result is null
[[maybe_unused]] JSVM_Value TestTypeofTest12(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    JSVM_Status status = OH_JSVM_Typeof(env, argv[0], nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeofTest12: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//OH_JSVM_TypeTagObject
//value is null
[[maybe_unused]] JSVM_Value TestTypeTagObjectTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    JSVM_Status status = OH_JSVM_TypeTagObject(env, nullptr, &tagsData[0]);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeTagObjectTest1: OH_JSVM_TypeTagObject Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null, object is not connected with typeTag
[[maybe_unused]] JSVM_Value TestTypeTagObjectTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    bool bRstTypeTag = false;
    JSVM_Status status = OH_JSVM_CheckObjectTypeTag(env, argv[0], &tagsData[0], &bRstTypeTag);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeTagObjectTest2: OH_JSVM_CheckObjectTypeTag Failed");
        return nullptr;
    }
    if (bRstTypeTag) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeTagObjectTest2: bRstTypeTag is true");
        return nullptr;
    }
    status = OH_JSVM_TypeTagObject(env, argv[0], &tagsData[0]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeTagObjectTest2: OH_JSVM_TypeTagObject Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null, object is connected with typeTag
[[maybe_unused]] JSVM_Value TestTypeTagObjectTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    // first OH_JSVM_TypeTagObject
    JSVM_Status status = OH_JSVM_TypeTagObject(env, argv[0], &tagsData[0]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeTagObjectTest3: OH_JSVM_TypeTagObject Failed");
        return nullptr;
    }
    bool bRstTypeTag = false;
    status = OH_JSVM_CheckObjectTypeTag(env, argv[0], &tagsData[0], &bRstTypeTag);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeTagObjectTest3: OH_JSVM_CheckObjectTypeTag Failed");
        return nullptr;
    }
    if (!bRstTypeTag) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeTagObjectTest3: bRstTypeTag is false");
        return nullptr;
    }
    status = OH_JSVM_TypeTagObject(env, argv[0], &tagsData[0]);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeTagObjectTest3: OH_JSVM_TypeTagObject Failed");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null, typeTag is null
[[maybe_unused]] JSVM_Value TestTypeTagObjectTest4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Status status = OH_JSVM_TypeTagObject(env, argv[0], nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestTypeTagObjectTest4: OH_JSVM_TypeTagObject Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//OH_JSVM_CheckObjectTypeTag
//value is null
[[maybe_unused]] JSVM_Value TestCheckObjectTypeTagTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bRstTypeTag = false;
    JSVM_Status status = OH_JSVM_CheckObjectTypeTag(env, nullptr, &tagsData[0], &bRstTypeTag);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCheckObjectTypeTagTest1: OH_JSVM_CheckObjectTypeTag Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null, object is not connected with typeTag
[[maybe_unused]] JSVM_Value TestCheckObjectTypeTagTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bRstTypeTag = false;
    JSVM_Status status = OH_JSVM_CheckObjectTypeTag(env, argv[0], &tagsData[0], &bRstTypeTag);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCheckObjectTypeTagTest2: OH_JSVM_CheckObjectTypeTag Failed");
        return nullptr;
    }
    if (bRstTypeTag) {
        OH_JSVM_ThrowError(env, nullptr, "TestCheckObjectTypeTagTest2: bRstTypeTag is true");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null, object is connected with typeTag
[[maybe_unused]] JSVM_Value TestCheckObjectTypeTagTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    JSVM_Status status = OH_JSVM_TypeTagObject(env, argv[0], &tagsData[0]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCheckObjectTypeTagTest3: OH_JSVM_TypeTagObject Failed");
        return nullptr;
    }
    bool bRstTypeTag = false;
    status = OH_JSVM_CheckObjectTypeTag(env, argv[0], &tagsData[0], &bRstTypeTag);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCheckObjectTypeTagTest3: OH_JSVM_CheckObjectTypeTag Failed");
        return nullptr;
    }
    if (!bRstTypeTag) {
        OH_JSVM_ThrowError(env, nullptr, "TestCheckObjectTypeTagTest3: bRstTypeTag is false");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null, typeTag is null
[[maybe_unused]] JSVM_Value TestCheckObjectTypeTagTest4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    bool bRstTypeTag = false;
    JSVM_Status status = OH_JSVM_CheckObjectTypeTag(env, argv[0], nullptr, &bRstTypeTag);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCheckObjectTypeTagTest4: OH_JSVM_CheckObjectTypeTag Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//value is not null, typeTag is not null, result is null
[[maybe_unused]] JSVM_Value TestCheckObjectTypeTagTest5(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    bool bRstTypeTag = false;
    JSVM_Status status = OH_JSVM_CheckObjectTypeTag(env, argv[0], &tagsData[0], nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCheckObjectTypeTagTest5: OH_JSVM_CheckObjectTypeTag Failed");
        return nullptr;
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//createObject -> Typeof -> GetPrototype-> TypeTagObject->CheckObjectTypeTag
//-> CheckObjectTypeTag -> Instanceof-> ObjectFreeze -> SetNamedProperty
[[maybe_unused]] JSVM_Value TestObjectCombinationTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    //createObject
    JSVM_Value rstObject;
    JSVM_Status status = OH_JSVM_CreateObject(env, &rstObject);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_CreateObject Failed");
        return nullptr;
    }
    //set property
    const char* strKey = "key";
    JSVM_Value propertyKey;
    status = OH_JSVM_CreateStringUtf8(env, strKey, strlen(strKey), &propertyKey);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    const char* strKeyValue = "key value";
    JSVM_Value propertyKeyValue;
    status = OH_JSVM_CreateStringUtf8(env, strKeyValue, strlen(strKeyValue), &propertyKeyValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    status = OH_JSVM_SetProperty(env, rstObject, propertyKey, propertyKeyValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_SetProperty Failed");
        return nullptr;
    }
    // Typeof
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    status = OH_JSVM_Typeof(env, rstObject, &rstValueType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    if (rstValueType != JSVM_OBJECT) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: type is not JSVM_OBJECT");
        return nullptr;
    }
    //GetPrototype
    JSVM_Value rstGetPrototype;
    status = OH_JSVM_GetPrototype(env, rstObject, &rstGetPrototype);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_GetPrototype Failed");
        return nullptr;
    }
    //TypeTagObject
    status = OH_JSVM_TypeTagObject(env, rstObject, &tagsData[0]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_TypeTagObject Failed");
        return nullptr;
    }
    //CheckObjectTypeTag true
    bool bRstTypeTag1 = false;
    status = OH_JSVM_CheckObjectTypeTag(env, rstObject, &tagsData[0], &bRstTypeTag1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_CheckObjectTypeTag Failed");
        return nullptr;
    }
    if (!bRstTypeTag1) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_CheckObjectTypeTag bRstTypeTag = false");
        return nullptr;
    }
    //CheckObjectTypeTag false
    bool bRstTypeTag2 = false;
    status = OH_JSVM_CheckObjectTypeTag(env, rstObject, &tagsData[1], &bRstTypeTag2);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_CheckObjectTypeTag Failed");
        return nullptr;
    }
    if (bRstTypeTag2) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_CheckObjectTypeTag bRstTypeTag = true");
        return nullptr;
    }
    //OH_JSVM_Instanceof
    bool rstInstanceof = false;
    status = OH_JSVM_Instanceof(env, rstObject, argv[0], &rstInstanceof);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_Instanceof Failed");
        return nullptr;
    }
    if (rstInstanceof) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: rstInstanceof = true");
        return nullptr;
    }
    //OH_JSVM_ObjectFreeze
    status = OH_JSVM_ObjectFreeze(env, rstObject);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_ObjectFreeze Failed");
        return nullptr;
    }
    //OH_JSVM_SetNamedProperty
    const char* strSetName = "add";
    const char* strSetValue = "add property";
    JSVM_Value setValue;
    status = OH_JSVM_CreateStringUtf8(env, strSetValue, JSVM_AUTO_LENGTH, &setValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    status = OH_JSVM_SetNamedProperty(env, rstObject, strSetName, setValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_SetNamedProperty Failed");
        return nullptr;
    }
    //OH_JSVM_HasNamedProperty
    bool bRstHasNamed = false;
    status = OH_JSVM_HasNamedProperty(env, rstObject, strSetName, &bRstHasNamed);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: OH_JSVM_HasNamedProperty Failed");
        return nullptr;
    }
    if (bRstHasNamed) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest1: bRstHasNamed is true");
        return nullptr;
    }
    
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//object，set property，key is CreateSymbol create Symbol-> SymbolFor -> SymbolFor create new Symbol
//-> Typeof -> GetPrototype-> TypeTagObject-> CheckObjectTypeTag -> ObjectSeal-> SetNamedProperty
[[maybe_unused]] JSVM_Value TestObjectCombinationTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    //create object
    JSVM_Value rstObject = nullptr;
    JSVM_Status status = OH_JSVM_CreateObject(env, &rstObject);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_CreateObject Failed");
        return nullptr;
    }
    //OH_JSVM_CreateSymbol
    JSVM_Value rstDes = nullptr;
    const char *strDes = "only";
    OH_JSVM_CreateStringUtf8(env, strDes, JSVM_AUTO_LENGTH, &rstDes);
    JSVM_Value rstSymbol = nullptr;
    status = OH_JSVM_CreateSymbol(env, rstDes, &rstSymbol);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_CreateStringUtf8 Failed");
        return nullptr;
    }
    //set property
    const char *strKeyValue = "only the key value";
    JSVM_Value keyValue = nullptr;
    OH_JSVM_CreateStringUtf8(env, strKeyValue, JSVM_AUTO_LENGTH, &keyValue);
    status = OH_JSVM_SetProperty(env, rstObject, rstSymbol, keyValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_SetProperty Failed");
        return nullptr;
    }
    //OH_JSVM_SymbolFor first
    JSVM_Value rstSymbolFor = nullptr;
    status = OH_JSVM_SymbolFor(env, strDes, JSVM_AUTO_LENGTH, &rstSymbolFor);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_SymbolFor Failed");
        return nullptr;
    }
    //OH_JSVM_SymbolFor second
    const char* strNewDes = "new one";
    JSVM_Value rstNewSymbolFor = nullptr;
    status = OH_JSVM_SymbolFor(env, strNewDes, JSVM_AUTO_LENGTH, &rstNewSymbolFor);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_SymbolFor Failed");
        return nullptr;
    }
    // Typeof
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    status = OH_JSVM_Typeof(env, rstSymbolFor, &rstValueType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    if (rstValueType != JSVM_SYMBOL) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: type is not JSVM_UNDEFINED");
        return nullptr;
    }
    status = OH_JSVM_Typeof(env, rstNewSymbolFor, &rstValueType);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    if (rstValueType != JSVM_SYMBOL) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: type is not JSVM_UNDEFINED");
        return nullptr;
    }
    //GetPrototype
    JSVM_Value rstGetPrototype = nullptr;
    status = OH_JSVM_GetPrototype(env, rstNewSymbolFor, &rstGetPrototype);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_GetPrototype Failed");
        return nullptr;
    }
    //TypeTagObject
    status = OH_JSVM_TypeTagObject(env, rstObject, &tagsData[1]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_TypeTagObject Failed");
        return nullptr;
    }
    //CheckObjectTypeTag true
    bool bRstTypeTag1 = false;
    status = OH_JSVM_CheckObjectTypeTag(env, rstObject, &tagsData[1], &bRstTypeTag1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_CheckObjectTypeTag Failed");
        return nullptr;
    }
    if (!bRstTypeTag1) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_CheckObjectTypeTag bRstTypeTag = false");
        return nullptr;
    }
    //OH_JSVM_ObjectSeal
    status = OH_JSVM_ObjectSeal(env, rstNewSymbolFor);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_ObjectSeal Failed");
        return nullptr;
    }
    //OH_JSVM_SetNamedProperty
    const char* strSetName = "add";
    const char* strSetValue = "add property";
    JSVM_Value setValue;
    OH_JSVM_CreateStringUtf8(env, strSetValue, JSVM_AUTO_LENGTH, &setValue);
    status = OH_JSVM_SetNamedProperty(env, rstNewSymbolFor, strSetName, setValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_SetNamedProperty Failed");
        return nullptr;
    }
    //OH_JSVM_HasNamedProperty
    bool bRstHasNamed = false;
    status = OH_JSVM_HasNamedProperty(env, rstNewSymbolFor, strSetName, &bRstHasNamed);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: OH_JSVM_HasNamedProperty Failed");
        return nullptr;
    }
    if (bRstHasNamed) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest2: bRstHasNamed is true");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//CreateExternal create External -> GetValueExternal  -> Typeof-> GetPrototype -> TypeTagObject
//-> CheckObjectTypeTag
[[maybe_unused]] JSVM_Value TestObjectCombinationTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    //CreateExternal
    void *ptrData = malloc(BUF_SIZE_10);
    memset_s(ptrData, BUF_SIZE_10, 0, BUF_SIZE_10);
    const char* strExternal = "test";
    JSVM_Value externalValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateExternal(
        env, (void *)strExternal, [](JSVM_Env env, void *data, void *hint) {}, (void *)strExternal, &externalValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest3: OH_JSVM_CreateExternal Failed");
        return nullptr;
    }
    //GetValueExternal
    void* ptrRstExternal;
    status = OH_JSVM_GetValueExternal(env, externalValue, &ptrRstExternal);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest3: OH_JSVM_GetValueExternal Failed");
        return nullptr;
    }
    // Typeof
    JSVM_ValueType rstValueType = JSVM_UNDEFINED;
    status = OH_JSVM_Typeof(env, externalValue, &rstValueType);
    if ((status != JSVM_OK) || (rstValueType != JSVM_UNDEFINED)) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest3: OH_JSVM_Typeof Failed");
        return nullptr;
    }
    //GetPrototype
    JSVM_Value rstGetPrototype = nullptr;
    status = OH_JSVM_GetPrototype(env, externalValue, &rstGetPrototype);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest3: OH_JSVM_GetPrototype Failed");
        return nullptr;
    }
    //TypeTagObject
    status = OH_JSVM_TypeTagObject(env, externalValue, &tagsData[0]);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest3: OH_JSVM_TypeTagObject Failed");
        return nullptr;
    }
    //CheckObjectTypeTag true
    bool bRstTypeTag = false;
    status = OH_JSVM_CheckObjectTypeTag(env, externalValue, &tagsData[0], &bRstTypeTag);
    if ((status != JSVM_OK) || (!bRstTypeTag)) {
        OH_JSVM_ThrowError(env, nullptr, "TestObjectCombinationTest3: OH_JSVM_CheckObjectTypeTag Failed");
        return nullptr;
    }
    free(ptrData);
    ptrData = nullptr;
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}