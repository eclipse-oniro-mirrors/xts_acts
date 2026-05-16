/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ACE_C_ARKUI_TEST_API18_XCOMPONENTLIFECYCLE_TEST_H
#define ACE_C_ARKUI_TEST_API18_XCOMPONENTLIFECYCLE_TEST_H

#include "../common/common.h"

namespace ArkUICapiTest {

class XComponentLifeCycleTest {
public:
    ~XComponentLifeCycleTest();
    static napi_value createNativeNode(napi_env env, napi_callback_info info);
    static napi_value attachToMainTree(napi_env env, napi_callback_info info);
    static napi_value detachFromMainTree(napi_env env, napi_callback_info info);
    static napi_value dispose(napi_env env, napi_callback_info info);
    static napi_value setUserData(napi_env env, napi_callback_info info);
    static napi_value getUserData(napi_env env, napi_callback_info info);
    static napi_value initialize(napi_env env, napi_callback_info info);
    static napi_value finalize(napi_env env, napi_callback_info info);
    static napi_value removeSurfaceCallback(napi_env env, napi_callback_info info);

private:
};
} // namespace ArkUICapiTest
#endif // ACE_C_ARKUI_TEST_API18_XCOMPONENTLIFECYCLE_TEST_H
