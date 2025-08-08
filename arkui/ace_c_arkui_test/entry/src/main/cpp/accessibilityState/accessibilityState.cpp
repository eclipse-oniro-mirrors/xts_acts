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
#include <arkui/native_gesture.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUICapiTest {

static napi_value accessibilityState_001(napi_env env, napi_callback_info info)
{
    auto statePrt = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetSelected(statePrt,1);
    auto result = OH_ArkUI_AccessibilityState_IsSelected(statePrt);
    ASSERT_EQ(result, 1);
    NAPI_END;
}
static napi_value accessibilityState_002(napi_env env, napi_callback_info info)
{
    auto statePrt = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetDisabled(statePrt,1);
    auto result = OH_ArkUI_AccessibilityState_IsDisabled(statePrt);
    ASSERT_EQ(result, 1);
    OH_ArkUI_AccessibilityState_Dispose(statePrt);
    NAPI_END;
}
static napi_value accessibilityState_003(napi_env env, napi_callback_info info)
{
    auto statePrt = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetCheckedState(statePrt,1);
    auto result = OH_ArkUI_AccessibilityState_GetCheckedState(statePrt);
    ASSERT_EQ(result, 1);
    OH_ArkUI_AccessibilityState_Dispose(statePrt);
    NAPI_END;
}
} 
