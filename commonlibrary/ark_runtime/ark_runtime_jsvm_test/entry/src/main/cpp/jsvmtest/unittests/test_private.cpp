/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <ostream>

#include "jsvm.h"
#include "jsvm_types.h"
#include "jsvm_utils.h"
#include "jsvmtest.h"
#include "test_utils.h"

static std::string g_fakelog = "";

static JSVM_Value LogFunc(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1];
    JSVMTEST_CALL(OH_JSVM_GetCbInfo(env, info, &argc, argv, NULL, NULL));
    return jsvm::Str("log");
}

TEST(test_function_private)
{
    JSVM_Data key;
    JSVMTEST_CALL(OH_JSVM_CreatePrivate(env, nullptr, &key));
    auto obj = jsvm::Object();
    JSVMTEST_CALL(OH_JSVM_SetPrivate(env, obj, key, jsvm::Str("a")));
    static JSVM_CallbackStruct cb = {LogFunc, NULL};
    JSVM_Value log;
    JSVMTEST_CALL(OH_JSVM_CreateFunction(env, "log", JSVM_AUTO_LENGTH, &cb, &log));
    JSVMTEST_CALL(OH_JSVM_SetPrivate(env, obj, key, log));
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetPrivate(env, obj, key, &result));
    auto ret = jsvm::Call(result);
    CHECK(jsvm::Equals(ret, jsvm::Str("log")));
}

TEST(test_str_private)
{
    JSVM_Data key;
    JSVMTEST_CALL(OH_JSVM_CreatePrivate(env, nullptr, &key));
    auto obj = jsvm::Object();
    JSVMTEST_CALL(OH_JSVM_SetPrivate(env, obj, key, jsvm::Str("a")));
    static JSVM_CallbackStruct cb = {LogFunc, NULL};
    JSVMTEST_CALL(OH_JSVM_SetPrivate(env, obj, key, jsvm::Str("log")));
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetPrivate(env, obj, key, &result));
    CHECK(jsvm::Equals(result, jsvm::Str("log")));
}

TEST(test_different_private_with_same_key)
{
    JSVM_Data key;
    JSVMTEST_CALL(OH_JSVM_CreatePrivate(env, jsvm::Str("a"), &key));
    JSVM_Data key1;
    JSVMTEST_CALL(OH_JSVM_CreatePrivate(env, jsvm::Str("a"), &key1));
    auto obj = jsvm::Object();
    JSVMTEST_CALL(OH_JSVM_SetPrivate(env, obj, key, jsvm::Str("a")));
    JSVMTEST_CALL(OH_JSVM_SetPrivate(env, obj, key1, jsvm::Str("b")));
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetPrivate(env, obj, key, &result));
    JSVM_Value result1;
    JSVMTEST_CALL(OH_JSVM_GetPrivate(env, obj, key1, &result1));
    CHECK(!jsvm::Equals(result, result1));
}

TEST(test_set_private_with_nullptr_key)
{
    JSVM_Data key = nullptr;
    auto obj = jsvm::Object();
    auto status = OH_JSVM_SetPrivate(env, obj, key, jsvm::Str("a"));
    CHECK(status == JSVM_INVALID_ARG);
}

TEST(test_set_private_with_nullptr_value)
{
    JSVM_Data key = nullptr;
    auto obj = jsvm::Object();
    JSVMTEST_CALL(OH_JSVM_CreatePrivate(env, jsvm::Str("a"), &key));
    auto status = OH_JSVM_SetPrivate(env, obj, key, nullptr);
    CHECK(status == JSVM_INVALID_ARG);
}

TEST(test_set_private_with_non_object)
{
    JSVM_Data key = nullptr;
    auto obj = jsvm::True();
    JSVMTEST_CALL(OH_JSVM_CreatePrivate(env, jsvm::Str("a"), &key));
    auto status = OH_JSVM_SetPrivate(env, obj, key, jsvm::Str("a"));
    CHECK(status == JSVM_OBJECT_EXPECTED);
}

TEST(test_set_private_with_non_private)
{
    JSVM_Data key = nullptr;
    auto obj = jsvm::Object();
    JSVMTEST_CALL(OH_JSVM_CreateSymbol(env, jsvm::Str("a"), (JSVM_Value *)&key));
    auto status = OH_JSVM_SetPrivate(env, obj, key, jsvm::Str("a"));
    CHECK(status == JSVM_INVALID_ARG);
}

TEST(test_get_non_exist_private)
{
    JSVM_Data key;
    JSVMTEST_CALL(OH_JSVM_CreatePrivate(env, nullptr, &key));
    auto obj = jsvm::Object();
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetPrivate(env, obj, key, &result));
    CHECK(jsvm::Equals(result, jsvm::Undefined()));
}

TEST(test_get_private_with_nullptr_key)
{
    JSVM_Data key = nullptr;
    auto obj = jsvm::Object();
    JSVM_Value value;
    auto status = OH_JSVM_GetPrivate(env, obj, key, &value);
    CHECK(status == JSVM_INVALID_ARG);
}

TEST(test_get_private_with_nullptr_value)
{
    JSVM_Data key = nullptr;
    auto obj = jsvm::Object();
    JSVMTEST_CALL(OH_JSVM_CreatePrivate(env, jsvm::Str("a"), &key));
    auto status = OH_JSVM_GetPrivate(env, obj, key, nullptr);
    CHECK(status == JSVM_INVALID_ARG);
}

TEST(test_get_private_with_non_object)
{
    JSVM_Data key = nullptr;
    auto obj = jsvm::True();
    JSVMTEST_CALL(OH_JSVM_CreatePrivate(env, jsvm::Str("a"), &key));
    JSVM_Value value;
    auto status = OH_JSVM_GetPrivate(env, obj, key, &value);
    CHECK(status == JSVM_OBJECT_EXPECTED);
}

TEST(test_get_private_with_non_private)
{
    JSVM_Data key = nullptr;
    auto obj = jsvm::Object();
    JSVMTEST_CALL(OH_JSVM_CreateSymbol(env, jsvm::Str("a"), (JSVM_Value *)&key));
    JSVM_Value value;
    auto status = OH_JSVM_GetPrivate(env, obj, key, &value);
    CHECK(status == JSVM_INVALID_ARG);
}

TEST(test_delete_non_exist_private)
{
    JSVM_Data key;
    JSVMTEST_CALL(OH_JSVM_CreatePrivate(env, nullptr, &key));
    auto obj = jsvm::Object();
    JSVMTEST_CALL(OH_JSVM_DeletePrivate(env, obj, key));
}

TEST(test_delete_nullptr_key)
{
    JSVM_Data key = nullptr;
    auto obj = jsvm::Object();
    auto status = OH_JSVM_DeletePrivate(env, obj, key);
    CHECK(status == JSVM_INVALID_ARG);
}

TEST(test_delete_with_non_object)
{
    JSVM_Data key = nullptr;
    auto obj = jsvm::True();
    JSVMTEST_CALL(OH_JSVM_CreatePrivate(env, jsvm::Str("a"), &key));
    auto status = OH_JSVM_DeletePrivate(env, obj, key);
    CHECK(status == JSVM_OBJECT_EXPECTED);
}

TEST(test_delete_private_with_non_private)
{
    JSVM_Data key = nullptr;
    auto obj = jsvm::Object();
    JSVMTEST_CALL(OH_JSVM_CreateSymbol(env, jsvm::Str("a"), (JSVM_Value *)&key));
    auto status = OH_JSVM_DeletePrivate(env, obj, key);
    CHECK(status == JSVM_INVALID_ARG);
}

TEST(test_GetReferenceData_create_get_checkresult) {
    // create obj
    JSVM_Value obj;
    OH_JSVM_CreateObject(env, &obj);

    // create private
    JSVM_Data key = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreatePrivate(env, jsvm::Str("a"), &key));

    // set private
    JSVM_Status status = OH_JSVM_SetPrivate(env, obj, key, jsvm::Str("hello"));
    CHECK(status == JSVM_OK);

    // create ref
    JSVM_Ref ref = nullptr;
    status = OH_JSVM_CreateDataReference(env, key, 1, &ref);
    CHECK(status == JSVM_OK);

    // get ref
    JSVM_Data refResult = nullptr;
    status = OH_JSVM_GetReferenceData(env, ref, &refResult);
    CHECK(status == JSVM_OK);

    // use ref result check data
    JSVM_Value result = nullptr;
    status = OH_JSVM_GetPrivate(env, obj, refResult, &result);
    CHECK(status == JSVM_OK);
    CHECK(jsvm::ToString(result) == "hello");
}