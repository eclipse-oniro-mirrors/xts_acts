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

TEST(CreateProxy)
{
    std::string registerObject = R"JS(
      target = {
        message1: "hello",
        message2: "everyone",
      };

      handler1 = {};
      handler2 = {
        get(target, prop, receiver) {
          return "world";
        },
      };
    )JS";

    jsvm::Run(registerObject.c_str());
    auto obj = jsvm::GetProperty(jsvm::Global(), "target");
    auto handler1 = jsvm::GetProperty(jsvm::Global(), "handler1");
    auto handler2 = jsvm::GetProperty(jsvm::Global(), "handler2");

    JSVM_Value proxy1 = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateProxy(env, obj, handler1, &proxy1));

    JSVM_Value proxy2 = nullptr;
    JSVMTEST_CALL(OH_JSVM_CreateProxy(env, obj, handler2, &proxy2));

    jsvm::SetProperty(jsvm::Global(), "proxy1", proxy1);
    jsvm::SetProperty(jsvm::Global(), "proxy2", proxy2);

    std::string checkProxy1 = R"JS(
      proxy1.message1 == target.message1 && proxy1.message2 == target.message2;
    )JS";

    auto result = jsvm::Run(checkProxy1.c_str());
    CHECK(jsvm::IsTrue(result));

    std::string checkProxy2 = R"JS(
      proxy2.message1 == "world" && proxy2.message2 == "world" &&
      proxy2.anyProperty == "world";
    )JS";

    result = jsvm::Run(checkProxy2.c_str());
    CHECK(jsvm::IsTrue(result));
}

TEST(IsProxy)
{
    jsvm::Run(R"JS(
      target = {
        message1: "hello",
        message2: "everyone",
      };

      handler1 = {};
      proxy1 = new Proxy(target, handler1);
    )JS");

    bool isProxy = false;

    auto value = jsvm::GetProperty(jsvm::Global(), "target");
    JSVMTEST_CALL(OH_JSVM_IsProxy(env, value, &isProxy));
    CHECK(!isProxy && "target is not JS Proxy");

    value = jsvm::GetProperty(jsvm::Global(), "handler1");
    JSVMTEST_CALL(OH_JSVM_IsProxy(env, value, &isProxy));
    CHECK(!isProxy && "handler1 is not JS Proxy");

    value = jsvm::GetProperty(jsvm::Global(), "proxy1");
    JSVMTEST_CALL(OH_JSVM_IsProxy(env, value, &isProxy));
    CHECK(isProxy && "proxy1 is JS Proxy");
}

TEST(GetProxyTarget)
{
    jsvm::Run(R"JS(
      target = {
        message1: "hello",
        message2: "everyone",
      };

      handler1 = {};
      proxy1 = new Proxy(target, handler1);
    )JS");

    auto target = jsvm::GetProperty(jsvm::Global(), "target");
    auto proxy1 = jsvm::GetProperty(jsvm::Global(), "proxy1");

    JSVM_Value result = nullptr;
    JSVMTEST_CALL(OH_JSVM_ProxyGetTarget(env, proxy1, &result));

    CHECK(jsvm::StrictEquals(target, result));
}
