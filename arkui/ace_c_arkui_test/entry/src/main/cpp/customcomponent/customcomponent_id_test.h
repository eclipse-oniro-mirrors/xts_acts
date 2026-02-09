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

#ifndef ARKUI_CAPI_XTS_CUSTOMCOMPONENT_ID_TEST_H
#define ARKUI_CAPI_XTS_CUSTOMCOMPONENT_ID_TEST_H

#include "../common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUICapiTest {

using namespace std;

class CustomComponentIdTest {
public:
    ~CustomComponentIdTest();
    static void OnEventReceive(ArkUI_NodeEvent *event);
    static ArkUI_NodeHandle CreateSubCustomComponentNode(ArkUI_NativeNodeAPI_1 *node_api, const char *id,
                                                         uint32_t eventId);
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_CUSTOMCOMPONENT_ID_TEST_H
