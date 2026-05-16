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
#ifndef SCROLL_TO_VISIBLE_H
#define SCROLL_TO_VISIBLE_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <cstdint>
#include <napi/native_api.h>
#include <arkui/native_node.h>
#include "common/common.h"

namespace ArkUICapiTest {
    class ScrollToVisibleTest {
    public:
        ~ScrollToVisibleTest();
        static napi_value GetTextInputScrollToVisibleTest(napi_env env, napi_callback_info info);
        static napi_value GetTextAreaScrollToVisibleTest(napi_env env, napi_callback_info info);
        static napi_value CreateScrollToVisibleNode(napi_env env, napi_callback_info info);
    };
}

#endif // SCROLL_TO_VISIBLE_H