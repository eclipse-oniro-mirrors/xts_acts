/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef NATIVEXCOMPONENT_NODE_TYPE_TEST_H
#define NATIVEXCOMPONENT_NODE_TYPE_TEST_H

#include "../common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace NativeXComponentSample {

class NodeXComponentTest {
public:
    ~NodeXComponentTest();
    static napi_value TestAttachNativeRootNodeErrorCode001(napi_env env, napi_callback_info info);
    static napi_value TestAttachNativeRootNodeErrorCode002(napi_env env, napi_callback_info info);

    static napi_value TestGetNativeXComponentReturnNull(napi_env env, napi_callback_info info);
    static napi_value TestSurfaceHolderCreateReturnNull(napi_env env, napi_callback_info info);
    static napi_value TestSurfaceHolderGetUserDataReturnNull(napi_env env, napi_callback_info info);
    static napi_value TestSurfaceCallbackCreateReturnNull(napi_env env, napi_callback_info info);
    static napi_value TestXComponentGetNativeWindowReturnNull(napi_env env, napi_callback_info info);
};
} // namespace NativeXComponentSample
#endif // NATIVEXCOMPONENT_NODE_TYPE_TEST_H