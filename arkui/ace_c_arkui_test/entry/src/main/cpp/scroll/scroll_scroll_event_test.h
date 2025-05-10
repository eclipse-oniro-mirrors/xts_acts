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

#ifndef ARKUI_CAPI_XTS_SCROLL_SCROLL_EVENT_TEST_H
#define ARKUI_CAPI_XTS_SCROLL_SCROLL_EVENT_TEST_H

#include "../common/common.h"

#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUICapiTest {

class ScrollScrollEventTest {
public:
    ~ScrollScrollEventTest();
    static napi_value CreateNativeNodeOnWillScroll(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeOnDidScroll(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeOnWillDidScroll(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeOnReachStart(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeOnReachEnd(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeScrollBy001(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeScrollBy002(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeScrollBy003(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeScrollBy004(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeScrollBy005(napi_env env, napi_callback_info info);
    static napi_value CreateNativeNodeScrollBy006(napi_env env, napi_callback_info info);
    static std::vector<int32_t> g_OnScrollStart;
    static std::vector<int32_t> g_OnScrollEnd;
    static napi_value GetOnWillDidData(napi_env env, napi_callback_info info);
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_SCROLL_SCROLL_EVENT_TEST_H
