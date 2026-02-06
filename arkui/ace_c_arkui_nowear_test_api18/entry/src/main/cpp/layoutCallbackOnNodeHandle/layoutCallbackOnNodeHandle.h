/* Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */




#include "common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUICapiTest {

class LayoutCallbackOnNodeHandleTest {
public:
    ~LayoutCallbackOnNodeHandleTest();
    static napi_value LayoutCallbackOnNodeHandleTest_a(napi_env env, napi_callback_info info);
    static napi_value LayoutCallbackOnNodeHandleTest_a1(napi_env env, napi_callback_info info);
    static napi_value LayoutCallbackOnNodeHandleTest_b(napi_env env, napi_callback_info info);
    static napi_value LayoutCallbackOnNodeHandleTest_b1(napi_env env, napi_callback_info info);
    static napi_value LayoutCallbackOnNodeHandleTest_c(napi_env env, napi_callback_info info);
    static napi_value LayoutCallbackOnNodeHandleTest_d(napi_env env, napi_callback_info info);
    static napi_value LayoutCallbackOnNodeHandleTest_c1(napi_env env, napi_callback_info info);
    static napi_value LayoutCallbackOnNodeHandleTest_d1(napi_env env, napi_callback_info info);
    static napi_value NapiWrapEnhanceTest_d(napi_env env, napi_callback_info info);
    static napi_value NapiWrapEnhanceTest_d1(napi_env env, napi_callback_info info);
};
} // namespace ArkUICapiTest