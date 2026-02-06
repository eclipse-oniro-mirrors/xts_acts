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
#include "napi_strictqeuals_test.h"
const size_t NUM_SIZE_2 = 2;
//OH_JSVM_StrictEquals
//lhs is int，rhs is int，same value，result is nullptr
[[maybe_unused]] JSVM_Value TestStrictEqualsTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    int32_t intLhs = 333;
    JSVM_Value rstLhsValue = nullptr;
    int32_t intRhs = 333;
    JSVM_Value rstRhsValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateInt32(env, intLhs, &rstLhsValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest1: OH_JSVM_CreateInt32 Failed");
        return nullptr;
    }
    status = OH_JSVM_CreateInt32(env, intRhs, &rstRhsValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest1: OH_JSVM_CreateInt32 Failed");
        return nullptr;
    }
    status = OH_JSVM_StrictEquals(env, rstLhsValue, rstRhsValue, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest1: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is double，rhs is int，same value，result is not null
[[maybe_unused]] JSVM_Value TestStrictEqualsTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    double doubleLhs = 333.00;
    JSVM_Value rstLhsValue = nullptr;
    int32_t intRhs = 333;
    JSVM_Value rstRhsValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateDouble(env, doubleLhs, &rstLhsValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest1: OH_JSVM_CreateInt32 Failed");
        return nullptr;
    }
    status = OH_JSVM_CreateInt32(env, intRhs, &rstRhsValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest1: OH_JSVM_CreateInt32 Failed");
        return nullptr;
    }
    bool bEqualsRst = false;
    status = OH_JSVM_StrictEquals(env, rstLhsValue, rstRhsValue, &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest1: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (!bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest1: bEqualsRst == false");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is nullptr, rhs is nullptr, result is not null
[[maybe_unused]] JSVM_Value TestStrictEqualsTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, nullptr, nullptr, &bEqualsRst);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest3: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is undefined, undefined, result is not null
[[maybe_unused]] JSVM_Value TestStrictEqualsTest4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest4: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (!bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest4: bEqualsRst == true");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is set object，rhs is set，same value，result is not null
[[maybe_unused]] JSVM_Value TestStrictEqualsTest5(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest5: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (!bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest5: bEqualsRst is false");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is boolean，rhs is boolean，same value，result is not null
[[maybe_unused]] JSVM_Value TestStrictEqualsTest6(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest6: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (!bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest6: bEqualsRst is false");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is string，rhs is string，same value，result is not null
[[maybe_unused]] JSVM_Value TestStrictEqualsTest7(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest7: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (!bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest7: bEqualsRst is false");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is symbol，rhs is symbol，same value，result is not null
[[maybe_unused]] JSVM_Value TestStrictEqualsTest8(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest8: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (!bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest8: bEqualsRst is false");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is function，rhs is function，same value，result is not null
[[maybe_unused]] JSVM_Value TestStrictEqualsTest9(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest9: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (!bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest9: bEqualsRst is false");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is bigint ，rhs is bigint ，same value，result is  not null，result is true
[[maybe_unused]] JSVM_Value TestStrictEqualsTest10(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest10: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (!bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest10: bEqualsRst is false");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is regexp ，rhs is regexp ，same value，result is  not null，result is true--待确认
[[maybe_unused]] JSVM_Value TestStrictEqualsTest11(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest11: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (!bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest11: bEqualsRst is false");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is set ，rhs is set ，different value，result is  not null，result is false
[[maybe_unused]] JSVM_Value TestStrictEqualsTest12(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest12: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest12: bEqualsRst is true");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is boolean ，rhs is boolean ，different value，result is  not null，result is false
[[maybe_unused]] JSVM_Value TestStrictEqualsTest13(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest13: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest13: bEqualsRst is true");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is string ，rhs is string ，different value，result is  not null. result is false
[[maybe_unused]] JSVM_Value TestStrictEqualsTest14(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest14: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest14: bEqualsRst is true");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is symbol ，rhs分别 is symbol ，different value，result is  not null，result is false
[[maybe_unused]] JSVM_Value TestStrictEqualsTest15(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest15: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest15: bEqualsRst is true");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is function ，rhs is function ，different value，result is  not null，result is false
[[maybe_unused]] JSVM_Value TestStrictEqualsTest16(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest16: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest16: bEqualsRst is true");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is bigint ，rhs is bigint ，different value同，result is  not null，result is false
[[maybe_unused]] JSVM_Value TestStrictEqualsTest17(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest17: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest17: bEqualsRst is true");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is regexp ，rhs is regexp ，different value，result is  not null, result is false
[[maybe_unused]] JSVM_Value TestStrictEqualsTest18(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);
    
    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest18: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
    if (bEqualsRst) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest18: bEqualsRst is true");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
//lhs is null, rhs is null, result is  not null
[[maybe_unused]] JSVM_Value TestStrictEqualsTest19(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = NUM_SIZE_2;
    JSVM_Value argv[NUM_SIZE_2] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, argv, nullptr, nullptr);

    bool bEqualsRst = false;
    JSVM_Status status = OH_JSVM_StrictEquals(env, argv[0], argv[1], &bEqualsRst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestStrictEqualsTest19: OH_JSVM_StrictEquals Failed");
        return nullptr;
    }
        
    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}