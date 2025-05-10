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
#include "napi_string_test.h"

const size_t BUF_SIZE_MAX = 128;
const size_t BUF_SIZE_50 = 50;
const size_t BUF_SIZE_20 = 20;
const size_t BUF_SIZE_10 = 10;
const size_t BUF_SIZE_5 = 5;
const size_t BUF_SIZE_3 = 3;

[[maybe_unused]] JSVM_Value TestGetValueStringUtf8Test1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);

    char resultStr[BUF_SIZE_MAX] = {0};
    size_t size = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf8(env, args[0], resultStr, 128, &size);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test1: GetValueStringUtf8 Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringUtf8Test2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);
    const size_t strBufsize = BUF_SIZE_MAX;
    char resultStr[strBufsize];
    size_t size = 0;
    const char *testStr = "Hello world";
    JSVM_Value setValueName = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setValueName);
    if (creatStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test2: CreateStringUtf8 Failed");
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_GetValueStringUtf8(env, setValueName, resultStr, strBufsize, &size);
    if (size != strlen(testStr)) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test2: GetValueStringUtf8 Failed");
    }
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test2: GetValueStringUtf8 Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringUtf8Test3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const size_t strBufsize = 5;
    char resultStr[strBufsize];
    size_t size = 0;
    char *testStr = "Hello world";
    JSVM_Value setValueName = nullptr;
    JSVM_Status createStatus = OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setValueName);
    if (createStatus != JSVM_OK) {
        printf("OH_JSVM_CreateStringUtf8 Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test3: CreateStringUtf8 Failed");
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_GetValueStringUtf8(env, setValueName, resultStr, sizeof(resultStr), &size);
    if (strlen(resultStr) != size) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test3: GetValueStringUtf8 size Failed");
    }
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test3: GetValueStringUtf8 Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringUtf8Test4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const size_t strBufsize = BUF_SIZE_20;
    char resultStr[strBufsize];
    size_t size = 0;
    char *testStr = "Hello world";
    JSVM_Value setValueName = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setValueName);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateStringUtf8 Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test4: CreateStringUtf8 Failed");
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_GetValueStringUtf8(env, setValueName, resultStr, strBufsize, &size);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test4: GetValueStringUtf8 status Failed");
    }
    if (size != strlen(testStr)) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test4: GetValueStringUtf8 size Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringUtf8Test5(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const size_t strBufsize = BUF_SIZE_50;
    char resultStr[strBufsize];
    size_t size = 0;
    char *testStr = "Helloworld";
    JSVM_Value setValueName = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setValueName);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateStringUtf8 Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test5: CreateStringUtf8 Failed");
        return nullptr;
    }
    size_t strLen = strlen(testStr) - BUF_SIZE_3;
    JSVM_Status status = OH_JSVM_GetValueStringUtf8(env, setValueName, resultStr, strLen, &size);
    if (size != strlen(resultStr)) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test5: GetValueStringUtf8 size Failed");
    }
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test5: GetValueStringUtf8 status Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringUtf8Test6(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const size_t strBufsize = BUF_SIZE_50;
    char resultStr[strBufsize] = {0};
    size_t size = 0;
    char *testStr = "Helloworld";
    JSVM_Value setValueName = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setValueName);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateStringUtf8 Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test6: CreateStringUtf8 Failed");
        return nullptr;
    }
    size_t strLength = strlen(testStr);
    JSVM_Status status = OH_JSVM_GetValueStringUtf8(env, setValueName, resultStr, strLength, &size);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test6: GetValueStringUtf8 Failed");
        return nullptr;
    }
    if (size != strlen(resultStr)) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test6: GetValueStringUtf8 Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// OH_JSVM_CreateStringUtf8 interface
[[maybe_unused]] JSVM_Value TestCreateStringUtf8Test1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    size_t size = BUF_SIZE_20;
    char strInput[BUF_SIZE_20] = {0};
    JSVM_Value strRstName = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf8(env, nullptr, size, &strRstName);
    if (rstStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf8Test1: CreateStringUtf8 Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestCreateStringUtf8Test2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    size_t size = BUF_SIZE_5;
    const char *strInput = "Create String";
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf8(env, strInput, size, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf8test2: CreateStringUtf8 Failed");
        return nullptr;
    }

    size_t getSize = BUF_SIZE_20;
    char resultStr[BUF_SIZE_20] = {0};
    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf8(env, strRstValue, resultStr, getSize, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf8test2: CreateStringUtf8 Failed");
        return nullptr;
    }
    if (rstSize != strlen(resultStr)) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf8test2: CreateStringUtf8 Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestCreateStringUtf8Test3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const char *strInput = "Create String";
    size_t size = strlen(strInput);
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf8(env, strInput, size, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf8test3: CreateStringUtf8 Failed");
        return nullptr;
    }

    size_t getSize = BUF_SIZE_MAX;
    char resultStr[BUF_SIZE_MAX] = {0};
    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf8(env, strRstValue, resultStr, getSize, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf8test3: CreateStringUtf8 Failed");
        return nullptr;
    }
    if (rstSize != size) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf8test2: CreateStringUtf8 Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestCreateStringUtf8Test4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const char *strInput = "Create String";
    size_t size = strlen(strInput) + 3;
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf8(env, strInput, size, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf8test4: CreateStringUtf8 Failed");
        return nullptr;
    }

    size_t getSize = BUF_SIZE_MAX;
    char resultStr[BUF_SIZE_MAX] = {0};
    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf8(env, strRstValue, resultStr, getSize, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf8test4: CreateStringUtf8 status Failed");
        return nullptr;
    }
    if (rstSize != size) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf8test4: CreateStringUtf8 size Failed");
    }
    if (strcmp(resultStr, strInput) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf8test4: CreateStringUtf8 size Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// OH_JSVM_CreateStringUtf16
[[maybe_unused]] JSVM_Value TestCreateStringUtf16Test1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    size_t size = BUF_SIZE_20;
    const char16_t strInput[BUF_SIZE_20] = {0};
    JSVM_Value strRstName = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf16(env, nullptr, size, &strRstName);
    if (rstStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf16test1: CreateStringUtf16 status Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestCreateStringUtf16Test2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    size_t size = BUF_SIZE_10;
    const char16_t *strInput = u"Create UTF16 String";
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf16(env, strInput, size, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf16test2: CreateStringUtf16 Failed");
        return nullptr;
    }

    size_t getSize = BUF_SIZE_MAX;
    char16_t resultStr[BUF_SIZE_MAX] = {0};
    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf16(env, strRstValue, resultStr, getSize, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf16test2: CreateStringUtf16 status Failed");
        return nullptr;
    }
    size_t strRstLen = 0;
    while (resultStr[strRstLen] != u'\0') {
        strRstLen++;
    }
    if (rstSize != strRstLen) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf16test2: CreateStringUtf16 size Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestCreateStringUtf16Test3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const char16_t *strInput = u"Create UT16 String";
    size_t size = 0;
    while (strInput[size] != u'\0') {
        ++size;
    }
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf16(env, strInput, size, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf16Test3: CreateStringUtf16 Failed");
        return nullptr;
    }

    size_t getSize = BUF_SIZE_MAX;
    char16_t resultStr[getSize];
    errno_t memsetRst = memset_s(resultStr, getSize * sizeof(char16_t), 0x00, getSize * sizeof(char16_t));
    if (memsetRst != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf16Test3: memset_s Failed");
        return nullptr;
    }

    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf16(env, strRstValue, resultStr, getSize, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf16Test3: CreateStringUtf16 Failed");
        return nullptr;
    }
    if (rstSize != size) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf16Test3: CreateStringUtf16 Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestCreateStringUtf16Test4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const char16_t *strInput = u"Create UTF16 String";
    size_t size = 0;
    while (strInput[size] != u'\0') {
        ++size;
    }
    size = size + BUF_SIZE_3;
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf16(env, strInput, size, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf16Test4: CreateStringUtf16 Failed");
        return nullptr;
    }

    size_t getSize = BUF_SIZE_MAX;
    char16_t resultStr[BUF_SIZE_MAX];
    errno_t memsetRst = memset_s(resultStr, getSize * sizeof(char16_t), 0x00, getSize * sizeof(char16_t));
    if (memsetRst != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf16Test4: memset_s Failed");
        return nullptr;
    }
    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf16(env, strRstValue, resultStr, getSize, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf16Test4: CreateStringUtf16 Failed");
        return nullptr;
    }
    size_t i = 0;
    bool bCmpString = true;
    while (resultStr[i] != u'\0') {
        if (resultStr[i] == strInput[i]) {
            i++;
        } else {
            bCmpString = false;
        }
    }
    if (!bCmpString) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf16Test4: CreateStringUtf16 string Failed");
    }

    if (rstSize != size) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringUtf16Test4: CreateStringUtf16 size Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// OH_JSVM_GetValueStringUtf16
[[maybe_unused]] JSVM_Value TestGetValueStringUtf16Test1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);

    char16_t resultStr[BUF_SIZE_MAX];
    size_t size = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf16(env, args[0], resultStr, sizeof(resultStr), &size);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16test1: GetValueStringUtf16 Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringUtf16Test2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const char16_t *strInput = u"Create UTF16 String";
    size_t size = 0;
    while (strInput[size] != u'\0') {
        ++size;
    }
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf16(env, strInput, size, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test2: CreateStringUtf16 Failed");
        return nullptr;
    }

    size_t getSize = BUF_SIZE_MAX;
    char16_t resultStr[getSize];
    errno_t memsetRst = memset_s(resultStr, getSize * sizeof(char16_t), 0x00, getSize * sizeof(char16_t));
    if (memsetRst != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test2: memset_s Failed");
        return nullptr;
    }

    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf16(env, strRstValue, resultStr, getSize, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test2: GetValueStringUtf16 status Failed");
        return nullptr;
    }
    if (rstSize != size) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test2: GetValueStringUtf16 size Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringUtf16Test3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const char16_t *strInput = u"Create UTF16 String";
    size_t size = 0;
    while (strInput[size] != u'\0') {
        ++size;
    }
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf16(env, strInput, size, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test3: CreateStringUtf16 Failed");
        return nullptr;
    }

    size_t getSize = size - BUF_SIZE_3;
    char16_t resultStr[getSize];
    errno_t memsetRst = memset_s(resultStr, getSize * sizeof(char16_t), 0x00, getSize * sizeof(char16_t));
    if (memsetRst != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test3: memset_s Failed");
        return nullptr;
    }
    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf16(env, strRstValue, resultStr, getSize, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test3: GetValueStringUtf16 status Failed");
        return nullptr;
    }
    if (rstSize > getSize) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test3: GetValueStringUtf16 size Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringUtf16Test4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const char16_t *strInput = u"Create UTF16 String";
    size_t size = 0;
    while (strInput[size] != u'\0') {
        ++size;
    }
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf16(env, strInput, size, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test4: CreateStringUtf16 Failed");
        return nullptr;
    }

    size_t getSize = size + BUF_SIZE_3;
    char16_t resultStr[getSize];
    errno_t memsetRst = memset_s(resultStr, getSize * sizeof(char16_t), 0x00, getSize * sizeof(char16_t));
    if (memsetRst != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test4: memset_s Failed");
        return nullptr;
    }
    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf16(env, strRstValue, resultStr, getSize, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test4: GetValueStringUtf16 status Failed");
        return nullptr;
    }

    if (rstSize != size) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test4: GetValueStringUtf16 size Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringUtf16Test5(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const char16_t *strInput = u"Create UTF16 String";
    size_t size = 0;
    while (strInput[size] != u'\0') {
        ++size;
    }
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf16(env, strInput, size, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test5: CreateStringUtf16 Failed");
        return nullptr;
    }

    size_t getSize = size;
    char16_t resultStr[getSize];
    errno_t memsetRst = memset_s(resultStr, getSize * sizeof(char16_t), 0x00, getSize * sizeof(char16_t));
    if (memsetRst != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test5: memset_s Failed");
        return nullptr;
    }
    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf16(env, strRstValue, resultStr, getSize - BUF_SIZE_3, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test5: GetValueStringUtf16 status Failed");
        return nullptr;
    }
    if (rstSize >= getSize) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test5: GetValueStringUtf16 size Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringUtf16Test6(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const char16_t *strInput = u"Create UTF16 String";
    size_t size = 0;
    while (strInput[size] != u'\0') {
        ++size;
    }
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf16(env, strInput, size, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test6: CreateStringUtf16 Failed");
        return nullptr;
    }

    size_t getSize = size;
    char16_t resultStr[getSize];
    errno_t memsetRst = memset_s(resultStr, getSize * sizeof(char16_t), 0x00, getSize * sizeof(char16_t));
    if (memsetRst != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test6: memset_s Failed");
        return nullptr;
    }
    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringUtf16(env, strRstValue, resultStr, getSize, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test6: GetValueStringUtf16 status Failed");
        return nullptr;
    }
    size_t rstLength = 0;
    while (resultStr[rstLength] != u'\0') {
        ++rstLength;
    }
    if (rstSize != rstLength) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf16Test6: GetValueStringUtf16 size Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// OH_JSVM_CreateStringLatin1 interface
[[maybe_unused]] JSVM_Value TestCreateStringLatin1Test1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    size_t size = 20;
    JSVM_Value strRstString = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringLatin1(env, nullptr, size, &strRstString);
    if (rstStatus == JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringLatin1test1: CreateStringUtf8 Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestCreateStringLatin1Test2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    size_t stLength = BUF_SIZE_5;
    const char *strInput = "Create Latin-1 String";
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringLatin1(env, strInput, stLength, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringLatin1test2: CreateStringLatin1 Failed");
        return nullptr;
    }

    size_t getSize = BUF_SIZE_MAX;
    char resultStr[BUF_SIZE_MAX] = {0};
    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringLatin1(env, strRstValue, resultStr, getSize, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringLatin1test2: GetValueStringLatin1 Failed");
        return nullptr;
    }
    if (rstSize != stLength) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringLatin1test2: GetValueStringLatin1 Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestCreateStringLatin1Test3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const char *strInput = "Create Latin-1 String";
    size_t stLength = strlen(strInput);
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringLatin1(env, strInput, stLength, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringLatin1test3: OH_JSVM_CreateStringLatin1 Failed");
        return nullptr;
    }

    size_t getSize = BUF_SIZE_MAX;
    char resultStr[BUF_SIZE_MAX] = {0};
    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringLatin1(env, strRstValue, resultStr, getSize, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringLatin1test3: OH_JSVM_GetValueStringLatin1 status Failed");
        return nullptr;
    }
    if (rstSize != stLength) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringLatin1test3: OH_JSVM_GetValueStringLatin1 status Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestCreateStringLatin1Test4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const char *strInput = "Create Latin-1 String";
    size_t stLength = strlen(strInput) + 3;
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringLatin1(env, strInput, stLength, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringLatin1test4: OH_JSVM_CreateStringLatin1 Failed");
        return nullptr;
    }

    size_t getSize = BUF_SIZE_MAX;
    char resultStr[BUF_SIZE_MAX] = {0};
    size_t rstSize = 0;
    JSVM_Status status = OH_JSVM_GetValueStringLatin1(env, strRstValue, resultStr, getSize, &rstSize);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringLatin1test4: GetValueStringLatin1 status Failed");
        return nullptr;
    }
    if (strcmp(resultStr, strInput) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringLatin1test4: GetValueStringLatin1 string Failed");
    }
    if (rstSize != stLength) {
        OH_JSVM_ThrowError(env, nullptr, "TestCreateStringLatin1test4: GetValueStringLatin1 size Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}
// OH_JSVM_GetValueStringLatin1 interface
[[maybe_unused]] JSVM_Value TestGetValueStringLatin1Test1(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    JSVM_Value thisVar = nullptr;
    OH_JSVM_GetCbInfo(env, info, &argc, args, &thisVar, nullptr);

    char resultStr[BUF_SIZE_MAX] = {0};
    size_t size = 0;
    JSVM_Status status = OH_JSVM_GetValueStringLatin1(env, args[0], resultStr, BUF_SIZE_MAX, &size);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1test1: OH_JSVM_GetValueStringLatin1 Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringLatin1Test2(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const size_t strBufsize = BUF_SIZE_MAX;
    char resultStr[strBufsize] = {0};
    size_t size = 0;
    const char *testStr = "create Latin1 string";
    JSVM_Value setValueName = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateStringLatin1(env, testStr, strlen(testStr), &setValueName);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateStringLatin1 Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1test2: OH_JSVM_CreateStringLatin1 Failed");
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_GetValueStringLatin1(env, setValueName, resultStr, strBufsize, &size);
    if (size != strlen(testStr)) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1test2: OH_JSVM_GetValueStringLatin1 Failed");
    }
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1test2: OH_JSVM_GetValueStringLatin1 Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringLatin1Test3(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const char *testStr = "create Latin1 string";
    JSVM_Value setValueName = nullptr;
    JSVM_Status createStatus = OH_JSVM_CreateStringLatin1(env, testStr, strlen(testStr), &setValueName);
    if (createStatus != JSVM_OK) {
        printf("OH_JSVM_CreateStringLatin1 Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1test3: OH_JSVM_CreateStringLatin1 Failed");
        return nullptr;
    }

    const size_t strBufsize = BUF_SIZE_5;
    char resultStr[strBufsize] = {0};
    size_t size = 0;
    JSVM_Status status = OH_JSVM_GetValueStringLatin1(env, setValueName, resultStr, sizeof(resultStr), &size);
    if (strlen(resultStr) != size) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1test3: OH_JSVM_GetValueStringLatin1 size Failed");
    }
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1test3: OH_JSVM_GetValueStringLatin1 status Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringLatin1Test4(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const size_t strBufsize = BUF_SIZE_MAX;
    char resultStr[strBufsize];
    errno_t memsetRst = memset_s(resultStr, strBufsize * sizeof(char), 0x00, strBufsize * sizeof(char));
    if (memsetRst != EOK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1Test4: memset_s Failed");
        return nullptr;
    }
    size_t size = 0;
    const char *testStr = "create Latin1 string";
    JSVM_Value setValueName = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateStringLatin1(env, testStr, strlen(testStr), &setValueName);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateStringLatin1 Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1Test4: OH_JSVM_CreateStringLatin1 Failed");
        return nullptr;
    }
    JSVM_Status status = OH_JSVM_GetValueStringLatin1(env, setValueName, resultStr, strBufsize, &size);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1Test4: OH_JSVM_GetValueStringLatin1 status Failed");
    }
    if (size < strlen(testStr)) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1Test4: OH_JSVM_GetValueStringLatin1 size Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringLatin1Test5(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    char *testStr = "create Latin1 string";
    JSVM_Value setValueName = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateStringLatin1(env, testStr, strlen(testStr), &setValueName);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateStringLatin1 Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1Test5: OH_JSVM_CreateStringLatin1 Failed");
        return nullptr;
    }

    size_t strLen = strlen(testStr) - 3;
    size_t size = 0;
    size_t strBufsize = BUF_SIZE_MAX;
    char resultStr[BUF_SIZE_MAX] = {0};
    JSVM_Status status = OH_JSVM_GetValueStringLatin1(env, setValueName, resultStr, strLen, &size);
    if (size != strlen(resultStr)) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1Test5: OH_JSVM_GetValueStringLatin1 size Failed");
    }
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1Test5: OH_JSVM_GetValueStringLatin1 status Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestGetValueStringLatin1Test6(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1] = {nullptr};
    OH_JSVM_GetCbInfo(env, info, &argc, args, nullptr, nullptr);

    const char *testStr = "create Latin1 string";
    JSVM_Value setValueName = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateStringLatin1(env, testStr, strlen(testStr), &setValueName);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateStringUtf8 Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1test6: CreateStringUtf8 Failed");
        return nullptr;
    }

    size_t strLength = strlen(testStr) + 1;
    char resultStr[BUF_SIZE_MAX] = {0};
    size_t size = 0;
    JSVM_Status status = OH_JSVM_GetValueStringLatin1(env, setValueName, resultStr, strLength, &size);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1test6: OH_JSVM_GetValueStringLatin1 statu Failed");
        return nullptr;
    }
    if (strcmp(resultStr, testStr) != 0) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1test6: OH_JSVM_GetValueStringLatin1 string Failed");
    }
    if (size != strlen(resultStr)) {
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringLatin1test6: OH_JSVM_GetValueStringLatin1 size Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestIsStringTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t strBufsize = BUF_SIZE_MAX;
    char resultStr[strBufsize];
    size_t size = 0;
    const char *testStr = "create UTF8";
    JSVM_Value setValueName = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setValueName);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateStringUtf8 Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestGetValueStringUtf8test2: CreateStringUtf8 Failed");
        return nullptr;
    }
    bool bIsStr = false;
    JSVM_Status status = OH_JSVM_IsString(env, setValueName, &bIsStr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsStringtest1: OH_JSVM_IsString status Failed");
    }
    if (!bIsStr) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsStringtest1: OH_JSVM_IsString bool Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestIsStringTest2(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char16_t *strInput = u"Create UT16 String";
    size_t size = 0;
    while (strInput[size] != u'\0') {
        ++size;
    }
    JSVM_Value strRstValue = nullptr;
    JSVM_Status rstStatus = OH_JSVM_CreateStringUtf16(env, strInput, size, &strRstValue);
    if (rstStatus != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsStringtest2: CreateStringUtf16 Failed");
        return nullptr;
    }

    bool bIsStr = false;
    JSVM_Status status = OH_JSVM_IsString(env, strRstValue, &bIsStr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsStringtest2: OH_JSVM_IsString status Failed");
        return nullptr;
    }
    if (!bIsStr) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsStringtest2: OH_JSVM_IsString bool Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestIsStringTest3(JSVM_Env env, JSVM_CallbackInfo info)
{
    const char *testStr = "create Latin1 string";
    JSVM_Value setValueName = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateStringLatin1(env, testStr, strlen(testStr), &setValueName);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateStringLatin1 Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestIsStringtest3: OH_JSVM_CreateStringLatin1 Failed");
        return nullptr;
    }
    bool bIsStr = false;
    JSVM_Status status = OH_JSVM_IsString(env, setValueName, &bIsStr);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsStringtest3: OH_JSVM_IsString status Failed");
    }
    if (!bIsStr) {
        OH_JSVM_ThrowError(env, nullptr, "TestIsStringtest3: OH_JSVM_IsString bool Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}

[[maybe_unused]] JSVM_Value TestOtherTest1(JSVM_Env env, JSVM_CallbackInfo info)
{
    const size_t strBufsize = BUF_SIZE_MAX;
    char16_t resultStr[strBufsize] = {0};
    size_t size = 0;
    const char *testStr = "create UTF8";
    JSVM_Value setValueName = nullptr;
    JSVM_Status creatStatus = OH_JSVM_CreateStringUtf8(env, testStr, strlen(testStr), &setValueName);
    if (creatStatus != JSVM_OK) {
        printf("OH_JSVM_CreateStringUtf8 Failed");
        OH_JSVM_ThrowError(env, nullptr, "TestOthertest1: CreateStringUtf8 Failed");
        return nullptr;
    }
    bool bIsStr = false;
    JSVM_Status status = OH_JSVM_GetValueStringUtf16(env, setValueName, resultStr, strBufsize, &size);
    if (status != JSVM_OK) {
        OH_JSVM_ThrowError(env, nullptr, "TestOthertest1: OH_JSVM_GetValueStringUtf16 status Failed");
    }

    bool result = true;
    JSVM_Value value = nullptr;
    OH_JSVM_GetBoolean(env, result, &value);
    return value;
}