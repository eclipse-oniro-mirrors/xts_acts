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

#include <string>
#include "jsvmtest.h"

static std::string g_scriptEvalMicrotask = R"JS(
    evaluateMicrotask = false;
    Promise.resolve().then(()=>{
        evaluateMicrotask = true;
    });
    evaluateMicrotask
)JS";

// Default microtask policy is JSVM_MICROTASK_AUTO
TEST(MicrotaskPolicyDefault)
{
    auto result = jsvm::Run(g_scriptEvalMicrotask.c_str());
    CHECK(jsvm::IsFalse(result));
    result = jsvm::GetProperty(jsvm::Global(), "evaluateMicrotask");
    CHECK(jsvm::IsTrue(result));
}

// Test Set Microtask Policy to explicit
TEST(MicrotaskPolicyExplicit)
{
    OH_JSVM_SetMicrotaskPolicy(vm, JSVM_MicrotaskPolicy::JSVM_MICROTASK_EXPLICIT);
    auto result = jsvm::Run(g_scriptEvalMicrotask.c_str());
    CHECK(jsvm::IsFalse(result));
    result = jsvm::GetProperty(jsvm::Global(), "evaluateMicrotask");
    CHECK(jsvm::IsFalse(result));
    OH_JSVM_PerformMicrotaskCheckpoint(vm);
    result = jsvm::GetProperty(jsvm::Global(), "evaluateMicrotask");
    CHECK(jsvm::IsTrue(result));
}

// Test Set Microtask Policy to auto
TEST(MicrotaskPolicyAuto)
{
    OH_JSVM_SetMicrotaskPolicy(vm, JSVM_MicrotaskPolicy::JSVM_MICROTASK_EXPLICIT);
    OH_JSVM_SetMicrotaskPolicy(vm, JSVM_MicrotaskPolicy::JSVM_MICROTASK_AUTO);
    auto result = jsvm::Run(g_scriptEvalMicrotask.c_str());
    CHECK(jsvm::IsFalse(result));
    result = jsvm::GetProperty(jsvm::Global(), "evaluateMicrotask");
    CHECK(jsvm::IsTrue(result));
}

TEST(SetInvalidPolicy)
{
    JSVM_MicrotaskPolicy invalidPolicy = (JSVM_MicrotaskPolicy)2;
    auto status = OH_JSVM_SetMicrotaskPolicy(vm, invalidPolicy);
    CHECK(status != JSVM_OK);
}
