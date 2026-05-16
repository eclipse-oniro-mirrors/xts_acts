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
#include "napi_bigint_test.h"

//OH_JSVM_CreateBigintInt64:value int64_max + result not null
[[maybe_unused]] JSVM_Value TestCreateBigintInt64Case01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value returnValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintInt64(env, INT64_MAX, &returnValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateBigintInt64Case01:OH_JSVM_CreateBigintInt64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value int64_min + result not null
[[maybe_unused]] JSVM_Value TestCreateBigintInt64Case02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value returnValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintInt64(env, INT64_MIN, &returnValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateBigintInt64Case02:OH_JSVM_CreateBigintInt64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value 0 + result not null
[[maybe_unused]] JSVM_Value TestCreateBigintInt64Case03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value returnValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintInt64(env, 0, &returnValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateBigintInt64Case03:OH_JSVM_CreateBigintInt64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value 0 + result NULL
[[maybe_unused]] JSVM_Value TestCreateBigintInt64Case04(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_CreateBigintInt64(env, 0, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateBigintInt64Case04:OH_JSVM_CreateBigintInt64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_CreateBigintUint64:value uint64_max + result not null
[[maybe_unused]] JSVM_Value TestCreateBigintUint64Case01(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value returnValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintUint64(env, UINT64_MAX, &returnValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateBigintUint64Case01:OH_JSVM_CreateBigintUint64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value 0 + result not null
[[maybe_unused]] JSVM_Value TestCreateBigintUint64Case02(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Value returnValue = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintUint64(env, 0, &returnValue);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateBigintUint64Case02:OH_JSVM_CreateBigintInt64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value 0 + result NULL
[[maybe_unused]] JSVM_Value TestCreateBigintUint64Case03(JSVM_Env env, JSVM_CallbackInfo info)
{
    JSVM_Status status = OH_JSVM_CreateBigintUint64(env, 0, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateBigintUint64Case03:OH_JSVM_CreateBigintInt64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_CreateBigintWords:signBit 0 + wordCount 3 + words {uint64_max,0,1} + result not null
[[maybe_unused]] JSVM_Value TestCreateBigintWordsCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    int signBit = 0;
    size_t wordCount = 3;
    uint64_t words[] = {UINT64_MAX, 0, 1};
    JSVM_Value result1 = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintWords(env, signBit, wordCount, words, &result1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateBigintWordsCase01:OH_JSVM_CreateBigintWords Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//signBit not 0 + wordCount 3 + words {uint64_max,0,1} + result not null
[[maybe_unused]] JSVM_Value TestCreateBigintWordsCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    int signBit = 1;
    size_t wordCount = 3;
    uint64_t words[] = {UINT64_MAX, 0, 1};
    JSVM_Value result1 = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintWords(env, signBit, wordCount, words, &result1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateBigintWordsCase02:OH_JSVM_CreateBigintWords Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//signBit 0 + wordCount 0 + words {uint64_max,0,1} + result not null
[[maybe_unused]] JSVM_Value TestCreateBigintWordsCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    int signBit = 0;
    size_t wordCount = 0;
    uint64_t words[] = {UINT64_MAX, 0, 1};
    JSVM_Value result1 = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintWords(env, signBit, wordCount, words, &result1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateBigintWordsCase03:OH_JSVM_CreateBigintWords Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//signBit 0 + wordCount 4 + words {uint64_max,0,1} + result not null
[[maybe_unused]] JSVM_Value TestCreateBigintWordsCase04(JSVM_Env env, JSVM_CallbackInfo info)
{
    int signBit = 0;
    size_t wordCount = 4;
    uint64_t words[] = {UINT64_MAX, 0, 1};
    JSVM_Value result1 = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintWords(env, signBit, wordCount, words, &result1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateBigintWordsCase04:OH_JSVM_CreateBigintWords Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//signBit 0 + wordCount 3 + words {uint64_max,0,1} + result NULL
[[maybe_unused]] JSVM_Value TestCreateBigintWordsCase05(JSVM_Env env, JSVM_CallbackInfo info)
{
    int signBit = 0;
    size_t wordCount = 3;
    uint64_t words[] = {UINT64_MAX, 0, 1};
    JSVM_Status status = OH_JSVM_CreateBigintWords(env, signBit, wordCount, words, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateBigintWordsCase05:OH_JSVM_CreateBigintWords Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_GetValueBigintInt64:"value int64_max+1" + result nogt null + lossless not null
[[maybe_unused]] JSVM_Value TestGetValueBigintInt64Case01(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t testValue = INT64_MAX + 1;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintInt64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintInt64Case01:OH_JSVM_CreateBigintInt64 Failed.");
        return nullptr;
    }

    int64_t resultValue = 0;
    bool flag = false;
    status = OH_JSVM_GetValueBigintInt64(env, result, &resultValue, &flag);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintInt64Case01:OH_JSVM_GetValueBigintInt64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//"value int64_max" + result not null + lossless not null
[[maybe_unused]] JSVM_Value TestGetValueBigintInt64Case02(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t testValue = INT64_MAX;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintInt64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintInt64Case02:OH_JSVM_CreateBigintInt64 Failed.");
        return nullptr;
    }

    int64_t resultValue = 0;
    bool flag = false;
    status = OH_JSVM_GetValueBigintInt64(env, result, &resultValue, &flag);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintInt64Case02:OH_JSVM_GetValueBigintInt64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//"value int64_min" + result not null + lossless not null
[[maybe_unused]] JSVM_Value TestGetValueBigintInt64Case03(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t testValue = INT64_MIN;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintInt64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintInt64Case03:CreateBigintInt64 Execution abnormal.");
        return nullptr;
    }

    int64_t resultValue = 0;
    bool flag = false;
    status = OH_JSVM_GetValueBigintInt64(env, result, &resultValue, &flag);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintInt64Case03:CreateBigintWords Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//"value int64_min-1" + result not null + lossless not null
[[maybe_unused]] JSVM_Value TestGetValueBigintInt64Case04(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t testValue = INT64_MIN - 1;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintInt64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintInt64Case04:CreateBigintInt64 Execution abnormal.");
        return nullptr;
    }

    int64_t resultValue = 0;
    bool flag = false;
    status = OH_JSVM_GetValueBigintInt64(env, result, &resultValue, &flag);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintInt64Case04:CreateBigintWords Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//"value int64_max" + result NULL + lossless not null
[[maybe_unused]] JSVM_Value TestGetValueBigintInt64Case05(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t testValue = INT64_MAX;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintInt64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintInt64Case05:CreateBigintInt64 Execution abnormal.");
        return nullptr;
    }
    
    bool flag = false;
    status = OH_JSVM_GetValueBigintInt64(env, result, nullptr, &flag);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintInt64Case05:CreateBigintWords Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//"value int64_max" + result not null + lossless NULL
[[maybe_unused]] JSVM_Value TestGetValueBigintInt64Case06(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t testValue = INT64_MAX;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintInt64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintInt64Case06:OH_JSVM_CreateBigintInt64 Failed.");
        return nullptr;
    }

    int64_t resultValue = 0;
    status = OH_JSVM_GetValueBigintInt64(env, result, &resultValue, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintInt64Case06:GetValueBigintInt64 Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_GetValueBigintUint64:"value Uint64_max+1" + result not null + lossless not null
[[maybe_unused]] JSVM_Value TestGetValueBigintUint64Case01(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint64_t testValue = UINT64_MAX + 1;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintUint64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintUint64Case01:OH_JSVM_CreateBigintUint64 Failed.");
        return nullptr;
    }

    uint64_t resultValue1 = 0;
    bool flag1 = false;
    status = OH_JSVM_GetValueBigintUint64(env, result, &resultValue1, &flag1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintUint64Case01:OH_JSVM_GetValueBigintUint64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//"value Uint64_max" + result not null + lossless not null
[[maybe_unused]] JSVM_Value TestGetValueBigintUint64Case02(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint64_t testValue = UINT64_MAX;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintUint64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintUint64Case02:OH_JSVM_CreateBigintUint64 Failed.");
        return nullptr;
    }

    uint64_t resultValue1 = 0;
    bool flag1 = false;
    status = OH_JSVM_GetValueBigintUint64(env, result, &resultValue1, &flag1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintUint64Case02:OH_JSVM_GetValueBigintUint64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//"value 0" + result not null + lossless not null
[[maybe_unused]] JSVM_Value TestGetValueBigintUint64Case03(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint64_t testValue = 0;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintUint64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintUint64Case03:OH_JSVM_CreateBigintUint64 Failed.");
        return nullptr;
    }

    uint64_t resultValue1 = 0;
    bool flag1 = false;
    status = OH_JSVM_GetValueBigintUint64(env, result, &resultValue1, &flag1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintUint64Case03:OH_JSVM_GetValueBigintUint64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//"value -1" + result not null + lossless not null
[[maybe_unused]] JSVM_Value TestGetValueBigintUint64Case04(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint64_t testValue = -1;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintUint64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintUint64Case04:OH_JSVM_CreateBigintUint64 Failed.");
        return nullptr;
    }

    uint64_t resultValue1 = 0;
    bool flag1 = false;
    status = OH_JSVM_GetValueBigintUint64(env, result, &resultValue1, &flag1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintUint64Case04:OH_JSVM_GetValueBigintUint64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//"value 0" + result NULL + lossless not null
[[maybe_unused]] JSVM_Value TestGetValueBigintUint64Case05(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint64_t testValue = 0;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintUint64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintUint64Case05:OH_JSVM_CreateBigintUint64 Failed.");
        return nullptr;
    }

    bool flag1 = false;
    status = OH_JSVM_GetValueBigintUint64(env, result, nullptr, &flag1);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintUint64Case05:OH_JSVM_GetValueBigintUint64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//"value 0" + result not null + lossless NULL
[[maybe_unused]] JSVM_Value TestGetValueBigintUint64Case06(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint64_t testValue = 0;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintUint64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintUint64Case06:OH_JSVM_CreateBigintUint64 Failed.");
        return nullptr;
    }

    uint64_t resultValue1 = 0;
    status = OH_JSVM_GetValueBigintUint64(env, result, &resultValue1, nullptr);
    if (status != JSVM_INVALID_ARG) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintUint64Case06:OH_JSVM_GetValueBigintUint64 Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//OH_JSVM_GetValueBigintWords:value is BigInt + signBit/wordCount/words not null
[[maybe_unused]] JSVM_Value TestGetValueBigintWordsCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    int signBit = 0;
    size_t wordCount = 2;
    uint64_t words[] = {1ULL, 1ULL};

    JSVM_Value rst = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintWords(env, signBit, wordCount, words, &rst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintWordsCase01:OH_JSVM_CreateBigintWords Failed.");
        return nullptr;
    }

    int retSignBit = -1;
    size_t retWordCount = 2;
    uint64_t wordsOut[] = {0ULL, 0ULL};
    status = OH_JSVM_GetValueBigintWords(env, rst, &retSignBit, &retWordCount, wordsOut);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintWordsCase01:OH_JSVM_GetValueBigintWords Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value is BigInt + signBit NULL + wordCount not null + words not null
[[maybe_unused]] JSVM_Value TestGetValueBigintWordsCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    int signBit = 0;
    size_t wordCount = 2;
    uint64_t words[] = {1ULL, 1ULL};

    JSVM_Value rst = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintWords(env, signBit, wordCount, words, &rst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintWordsCase02:OH_JSVM_CreateBigintWords Failed.");
        return nullptr;
    }

    size_t retWordCount = 2;
    uint64_t wordsOut[] = {0ULL, 0ULL};
    status = OH_JSVM_GetValueBigintWords(env, rst, nullptr, &retWordCount, wordsOut);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintWordsCase02:GetValueBigintWords Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value is BigInt + signBit not null + wordCount NULL + words not null
[[maybe_unused]] JSVM_Value TestGetValueBigintWordsCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    int signBit = 0;
    size_t wordCount = 2;
    uint64_t words[] = {1ULL, 1ULL};

    JSVM_Value rst = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintWords(env, signBit, wordCount, words, &rst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintWordsCase03:OH_JSVM_CreateBigintWords Failed.");
        return nullptr;
    }

    int retSignBit = 1;
    uint64_t wordsOut[] = {0ULL, 0ULL};
    status = OH_JSVM_GetValueBigintWords(env, rst, &retSignBit, nullptr, wordsOut);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintWordsCase03:GetValueBigintWords Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value is BigInt + signBit not null + wordCount not null + words NULL
[[maybe_unused]] JSVM_Value TestGetValueBigintWordsCase04(JSVM_Env env, JSVM_CallbackInfo info)
{
    int signBit = 0;
    size_t wordCount = 2;
    uint64_t words[] = {1ULL, 1ULL};

    JSVM_Value rst = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintWords(env, signBit, wordCount, words, &rst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintWordsCase04:OH_JSVM_CreateBigintWords Failed.");
        return nullptr;
    }

    int retSignBit = -1;
    size_t retWordCount = 2;
    status = OH_JSVM_GetValueBigintWords(env, rst, &retSignBit, &retWordCount, nullptr);
    if (status == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintWordsCase04:GetValueBigintWords Execution abnormal.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//value is BigInt + signBit NULL + wordCount not null + words NULL
[[maybe_unused]] JSVM_Value TestGetValueBigintWordsCase05(JSVM_Env env, JSVM_CallbackInfo info)
{
    int signBit = 0;
    size_t wordCount = 1;
    uint64_t words[] = {0ULL};

    JSVM_Value rst = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintWords(env, signBit, wordCount, words, &rst);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintWordsCase05:OH_JSVM_CreateBigintWords Failed.");
        return nullptr;
    }

    size_t retWordCount = 2;
    status = OH_JSVM_GetValueBigintWords(env, rst, nullptr, &retWordCount, nullptr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueBigintWordsCase05:GetValueBigintWords Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//APICombination:CreateBigintInt64 -> GetValueBigintInt64 Same as the input value of int64 -> GetValueBigintUint64->
//GetValueBigintWords signBit Return the actual value, wordCount is 1, words Return the actual value
[[maybe_unused]] JSVM_Value TestCreateAndGetBigIntProgramCase01(JSVM_Env env, JSVM_CallbackInfo info)
{
    int64_t testValue = -10;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintInt64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase01:OH_JSVM_CreateBigintInt64 Failed.");
        return nullptr;
    }

    bool flag = false;
    int64_t resultValue = 0;
    status = OH_JSVM_GetValueBigintInt64(env, result, &resultValue, &flag);
    if (status != JSVM_OK || !flag || resultValue != testValue) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase01:OH_JSVM_GetValueBigintInt64 Failed.");
        return nullptr;
    }

    uint64_t resultValue1 = 0;
    bool flag1 = false;
    status = OH_JSVM_GetValueBigintUint64(env, result, &resultValue1, &flag1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase01:OH_JSVM_GetValueBigintUint64 Failed.");
        return nullptr;
    }
    if (flag1) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase01:OH_JSVM_GetValueBigintUint64 data loss.");
        return nullptr;
    }

    int retSignBit = -1;
    size_t retWordCount = 5;
    uint64_t wordsOut[] = {0ULL, 0ULL};
    status = OH_JSVM_GetValueBigintWords(env, result, &retSignBit, &retWordCount, wordsOut);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase01:OH_JSVM_GetValueBigintWords Failed.");
        return nullptr;
    }
    size_t testNum = 10;
    if (retWordCount != 1 || wordsOut[0] != testNum) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase01:GetValueBigintWords count error.");
        return nullptr;
    }
    
    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//CreateBigintUint64 -> GetValueBigintUint64 -> GetValueBigintInt64 -> GetValueBigintWords ->
//signBit is 0,wordCount is 1,words return actual value
[[maybe_unused]] JSVM_Value TestCreateAndGetBigIntProgramCase02(JSVM_Env env, JSVM_CallbackInfo info)
{
    uint64_t testValue = 10;
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintUint64(env, testValue, &result);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase02:OH_JSVM_CreateBigintUint64 Failed.");
        return nullptr;
    }

    uint64_t resultValue = 0;
    bool flag = false;
    status = OH_JSVM_GetValueBigintUint64(env, result, &resultValue, &flag);
    if (status != JSVM_OK || !flag) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase02:OH_JSVM_GetValueBigintUint64 Failed.");
        return nullptr;
    }
    if (resultValue != testValue) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase02:GetValueBigintUint64 Value Failed.");
        return nullptr;
    }

    bool flag1 = false;
    int64_t resultValue1 = 0;
    status = OH_JSVM_GetValueBigintInt64(env, result, &resultValue1, &flag1);
    if (status != JSVM_OK || !flag1 || resultValue1 != testValue) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase02:OH_JSVM_GetValueBigintInt64 Failed.");
        return nullptr;
    }

    int retSignBit = 1;
    size_t retWordCount = 2;
    uint64_t wordsOut[] = {1ULL, 0ULL};
    status = OH_JSVM_GetValueBigintWords(env, result, &retSignBit, &retWordCount, wordsOut);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase02:OH_JSVM_GetValueBigintWords Failed.");
        return nullptr;
    }
    if (retSignBit != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase02:GetValueBigintWords retSignBit error.");
        return nullptr;
    }
    if (retWordCount != 1 || wordsOut[0] != testValue) {
        OH_JSVM_ThrowError(env,
                           nullptr,
                           "TestCreateAndGetBigIntProgramCase02:GetValueBigintWords retWordCount Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}
//CreateBigintWords uint64 argc <-> Js Bigint -> GetValueBigintInt64,compare values -> GetValueBigintUint64
//-> GetValueBigintWords,signBit actual symbol value,wordCount is argc length,words actual value.
[[maybe_unused]] JSVM_Value TestCreateAndGetBigIntProgramCase03(JSVM_Env env, JSVM_CallbackInfo info)
{
    int signBit = 0;
    size_t wordCount = 2;
    size_t testNum = 4;
    uint64_t words[] = {4, 5};
    JSVM_Value result = nullptr;
    JSVM_Status status = OH_JSVM_CreateBigintWords(env, signBit, wordCount, words, &result);
    int64_t resultValue = 0;
    bool flag = false;
    status = OH_JSVM_GetValueBigintInt64(env, result, &resultValue, &flag);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase03:OH_JSVM_GetValueBigintInt64 Failed.");
        return nullptr;
    }
    if (resultValue != testNum) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase03:OH_JSVM_GetValueBigintInt64 Failed.");
        return nullptr;
    }
    uint64_t resultValue1 = 0;
    bool flag1 = false;
    status = OH_JSVM_GetValueBigintUint64(env, result, &resultValue1, &flag1);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase03:OH_JSVM_GetValueBigintUint64 Failed.");
        return nullptr;
    }
    if (flag1) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase03:GetValueBigintUint64 flag Abnormal.");
        return nullptr;
    }
    if (resultValue1 != testNum) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase03:GetValueBigintUint64 Value Abnormal.");
        return nullptr;
    }

    int retSignBit = 1;
    size_t retWordCount = 3;
    uint64_t wordsOut[] = {0ULL, 0ULL};
    status = OH_JSVM_GetValueBigintWords(env, result, &retSignBit, &retWordCount, wordsOut);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase03:OH_JSVM_GetValueBigintWords Failed.");
        return nullptr;
    }
    if (retWordCount != wordCount || wordsOut[0] != testNum) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateAndGetBigIntProgramCase03:GetValueBigintWords WordCount Failed.");
        return nullptr;
    }

    bool setValue = true;
    JSVM_Value retValue = nullptr;
    OH_JSVM_GetBoolean(env, setValue, &retValue);
    return retValue;
}