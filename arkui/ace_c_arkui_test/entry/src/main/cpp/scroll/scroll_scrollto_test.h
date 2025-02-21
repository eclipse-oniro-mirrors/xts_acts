/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#ifndef ARKUI_CAPI_XTS_SCROLL_SCROLLTO_TEST_H
#define ARKUI_CAPI_XTS_SCROLL_SCROLLTO_TEST_H

#include "../common/common.h"

#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUICapiTest {

class ScrollScrollToTest {
public:
    ~ScrollScrollToTest();
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeEase(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeEaseInOut(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeEaseIn(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeEaseOut(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeExtremeDeceleration(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeFastOutLinearIn(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeFastOutSlowIn(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeFriction(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeLinearOutSlowIn(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeRhythm(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeSharp(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeSmooth(napi_env env, napi_callback_info info);
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_SCROLL_SCROLLTO_TEST_H
