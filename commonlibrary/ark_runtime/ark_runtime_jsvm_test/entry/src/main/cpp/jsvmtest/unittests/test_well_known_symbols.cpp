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
#ifdef TEST_WELL_KNOWN_SYMBOLS
#include "jsvmtest.h"

TEST(ToStringTag)
{
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetSymbolToStringTag(env, &result));
    CHECK(jsvm::StrictEquals(result, jsvm::Run("Symbol.toStringTag")));
}

TEST(toPrimitive)
{
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetSymbolToPrimitive(env, &result));
    CHECK(jsvm::StrictEquals(result, jsvm::Run("Symbol.toPrimitive")));
}

TEST(split)
{
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetSymbolSplit(env, &result));
    CHECK(jsvm::StrictEquals(result, jsvm::Run("Symbol.split")));
}

TEST(search)
{
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetSymbolSearch(env, &result));
    CHECK(jsvm::StrictEquals(result, jsvm::Run("Symbol.search")));
}

TEST(replace)
{
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetSymbolReplace(env, &result));
    CHECK(jsvm::StrictEquals(result, jsvm::Run("Symbol.replace")));
}

TEST(match)
{
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetSymbolMatch(env, &result));
    CHECK(jsvm::StrictEquals(result, jsvm::Run("Symbol.match")));
}

TEST(isConcatSpreadable)
{
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetSymbolIsConcatSpreadable(env, &result));
    CHECK(jsvm::StrictEquals(result, jsvm::Run("Symbol.isConcatSpreadable")));
}

TEST(hasInstance)
{
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetSymbolHasInstance(env, &result));
    CHECK(jsvm::StrictEquals(result, jsvm::Run("Symbol.hasInstance")));
}

TEST(unscopables)
{
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetSymbolUnscopables(env, &result));
    CHECK(jsvm::StrictEquals(result, jsvm::Run("Symbol.unscopables")));
}

TEST(asyncIterator)
{
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetSymbolAsyncIterator(env, &result));
    CHECK(jsvm::StrictEquals(result, jsvm::Run("Symbol.asyncIterator")));
}

TEST(iterator)
{
    JSVM_Value result;
    JSVMTEST_CALL(OH_JSVM_GetSymbolIterator(env, &result));
    CHECK(jsvm::StrictEquals(result, jsvm::Run("Symbol.iterator")));
}

#endif
