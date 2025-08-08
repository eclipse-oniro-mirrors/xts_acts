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

#include "jsvmtest.h"

static std::string defineFunction = R"JS(
    var x1 = 0;
    var x2 = 0;
    function f1(x) {
        x1 = x;
        return x + 1;
    }
    function f2(x) {
        x2 = x;
        return x + 1;
    }
)JS";

static std::string init = R"JS(
    x1 = 0;
    x2 = 0;
)JS";

TEST(PromiseThen)
{
    JSVM_Value promise = nullptr;
    JSVM_Deferred deffered;

    JSVMTEST_CALL(OH_JSVM_CreatePromise(env, &deffered, &promise));
    jsvm::Run(defineFunction.c_str());

    JSVM_Value f1 = jsvm::GetProperty(jsvm::Global(), "f1");

    JSVMTEST_CALL(OH_JSVM_PromiseRegisterHandler(env, promise, f1, nullptr, nullptr));

    auto x1 = jsvm::GetProperty(jsvm::Global(), "x1");
    auto x2 = jsvm::GetProperty(jsvm::Global(), "x2");
    CHECK(jsvm::Equals(x1, jsvm::Int32(0)));
    CHECK(jsvm::Equals(x2, jsvm::Int32(0)));

    OH_JSVM_ResolveDeferred(env, deffered, jsvm::Int32(2));
    deffered = nullptr;

    x1 = jsvm::GetProperty(jsvm::Global(), "x1");
    x2 = jsvm::GetProperty(jsvm::Global(), "x2");
    CHECK(jsvm::Equals(x1, jsvm::Int32(2)));
    CHECK(jsvm::Equals(x2, jsvm::Int32(0)));
}

TEST(PromiseThen2)
{
    jsvm::Run(defineFunction.c_str());

    JSVM_Value f1 = jsvm::GetProperty(jsvm::Global(), "f1");
    auto f2 = jsvm::GetProperty(jsvm::Global(), "f2");

    JSVM_Value promise;
    JSVM_Deferred deffered;

    // Resolve
    JSVMTEST_CALL(OH_JSVM_CreatePromise(env, &deffered, &promise));
    JSVMTEST_CALL(OH_JSVM_PromiseRegisterHandler(env, promise, f1, f2, nullptr));

    auto x1 = jsvm::GetProperty(jsvm::Global(), "x1");
    auto x2 = jsvm::GetProperty(jsvm::Global(), "x2");
    CHECK(jsvm::Equals(x1, jsvm::Int32(0)));
    CHECK(jsvm::Equals(x2, jsvm::Int32(0)));

    OH_JSVM_ResolveDeferred(env, deffered, jsvm::Int32(2));
    deffered = nullptr;

    x1 = jsvm::GetProperty(jsvm::Global(), "x1");
    x2 = jsvm::GetProperty(jsvm::Global(), "x2");
    CHECK(jsvm::Equals(x1, jsvm::Int32(2)));
    CHECK(jsvm::Equals(x2, jsvm::Int32(0)));

    jsvm::Run(init.c_str());
    // Reject
    JSVMTEST_CALL(OH_JSVM_CreatePromise(env, &deffered, &promise));
    JSVMTEST_CALL(OH_JSVM_PromiseRegisterHandler(env, promise, f1, f2, nullptr));

    x1 = jsvm::GetProperty(jsvm::Global(), "x1");
    x2 = jsvm::GetProperty(jsvm::Global(), "x2");
    CHECK(jsvm::Equals(x1, jsvm::Int32(0)));
    CHECK(jsvm::Equals(x2, jsvm::Int32(0)));

    OH_JSVM_RejectDeferred(env, deffered, jsvm::Int32(3));
    deffered = nullptr;

    x1 = jsvm::GetProperty(jsvm::Global(), "x1");
    x2 = jsvm::GetProperty(jsvm::Global(), "x2");
    CHECK(jsvm::Equals(x1, jsvm::Int32(0)));
    CHECK(jsvm::Equals(x2, jsvm::Int32(3)));
}

TEST(PromiseThenChain)
{
    jsvm::Run(defineFunction.c_str());

    JSVM_Value f1 = jsvm::GetProperty(jsvm::Global(), "f1");
    auto f2 = jsvm::GetProperty(jsvm::Global(), "f2");

    JSVM_Value promise, promise1, x1, x2;
    JSVM_Deferred deffered = nullptr;

    // Resolve
    JSVMTEST_CALL(OH_JSVM_CreatePromise(env, &deffered, &promise));
    JSVMTEST_CALL(OH_JSVM_PromiseRegisterHandler(env, promise, f1, nullptr, &promise1));
    JSVMTEST_CALL(OH_JSVM_PromiseRegisterHandler(env, promise1, f2, nullptr, nullptr));

    x1 = jsvm::GetProperty(jsvm::Global(), "x1");
    x2 = jsvm::GetProperty(jsvm::Global(), "x2");
    CHECK(jsvm::Equals(x1, jsvm::Int32(0)));
    CHECK(jsvm::Equals(x2, jsvm::Int32(0)));

    OH_JSVM_ResolveDeferred(env, deffered, jsvm::Int32(2));
    deffered = nullptr;

    x1 = jsvm::GetProperty(jsvm::Global(), "x1");
    x2 = jsvm::GetProperty(jsvm::Global(), "x2");
    CHECK(jsvm::Equals(x1, jsvm::Int32(2)));
    CHECK(jsvm::Equals(x2, jsvm::Int32(3)));
}

TEST(PromiseCatch)
{
    jsvm::Run(defineFunction.c_str());

    JSVM_Value f1 = jsvm::GetProperty(jsvm::Global(), "f1");

    JSVM_Value promise;
    JSVM_Value promise1;
    JSVM_Deferred deffered = nullptr;

    // Resolve
    JSVMTEST_CALL(OH_JSVM_CreatePromise(env, &deffered, &promise));
    JSVMTEST_CALL(OH_JSVM_PromiseRegisterHandler(env, promise, nullptr, f1, &promise1));

    auto x1 = jsvm::GetProperty(jsvm::Global(), "x1");
    auto x2 = jsvm::GetProperty(jsvm::Global(), "x2");
    CHECK(jsvm::Equals(x1, jsvm::Int32(0)));
    CHECK(jsvm::Equals(x2, jsvm::Int32(0)));

    JSVMTEST_CALL(OH_JSVM_RejectDeferred(env, deffered, jsvm::Int32(2)));
    deffered = nullptr;

    x1 = jsvm::GetProperty(jsvm::Global(), "x1");
    x2 = jsvm::GetProperty(jsvm::Global(), "x2");
    CHECK(jsvm::Equals(x1, jsvm::Int32(2)));
    CHECK(jsvm::Equals(x2, jsvm::Int32(0)));
}
