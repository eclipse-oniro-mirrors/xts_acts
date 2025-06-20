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
#ifdef TEST_WRAPPER_OBJECT
#include "jsvmtest.h"

TEST(NumberObject)
{
    JSVM_Value result = jsvm::Run("new Number(42)");
    bool isNumberObject = false;
    JSVMTEST_CALL(OH_JSVM_IsNumberObject(env, result, &isNumberObject));
    CHECK(isNumberObject);
}

TEST(BooleanObject)
{
    JSVM_Value result = jsvm::Run("new Boolean(true)");
    bool isBooleanObject = false;
    JSVMTEST_CALL(OH_JSVM_IsBooleanObject(env, result, &isBooleanObject));
    CHECK(isBooleanObject);
}

TEST(BigIntObject)
{
    JSVM_Value result = jsvm::Run("new Object(42n)");
    bool isBigIntObject = false;
    JSVMTEST_CALL(OH_JSVM_IsBigIntObject(env, result, &isBigIntObject));
    CHECK(isBigIntObject);
}

TEST(StringObject)
{
    JSVM_Value result = jsvm::Run("new String(\"test\")");
    bool isStringObject = false;
    JSVMTEST_CALL(OH_JSVM_IsStringObject(env, result, &isStringObject));
    CHECK(isStringObject);
}

TEST(SymbolObject)
{
    JSVM_Value result = jsvm::Run("Object(Symbol('foo'))");
    bool isSymbolObject = false;
    JSVMTEST_CALL(OH_JSVM_IsSymbolObject(env, result, &isSymbolObject));
    CHECK(isSymbolObject);
}
#endif

