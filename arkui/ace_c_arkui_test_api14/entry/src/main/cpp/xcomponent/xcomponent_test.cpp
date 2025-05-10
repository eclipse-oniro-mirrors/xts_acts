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

#include "common/common.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_node.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node_napi.h>

namespace ArkUICapiTest {

bool onKeyEventCBWR(OH_NativeXComponent *component, void *window)
{
    return true;
}

napi_value testNativeXComponent_RegisterKeyEventCallbackWithResult001(napi_env env, napi_callback_info info)
{
    NAPI_START(xcomponent, ARKUI_NODE_XCOMPONENT);
    auto *nativeXComponent = OH_NativeXComponent_GetNativeXComponent(xcomponent);

    auto ret = OH_NativeXComponent_RegisterKeyEventCallbackWithResult(nativeXComponent, onKeyEventCBWR);
    ASSERT_EQ(ret, OH_NATIVEXCOMPONENT_RESULT_SUCCESS);

    NAPI_END;
}

}
