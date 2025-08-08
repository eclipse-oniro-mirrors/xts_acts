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
#include <arkui/native_type.h>

namespace ArkUICapiTest {

static napi_value TestCommonAttrsAccessibilityState001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilitystate;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_STATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    ASSERT_OBJ(nullptr, nullptr);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetDisabled(accessibilitystate, PARAM_1);
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilitystate;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_STATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetDisabled(accessibilitystate, PARAM_0);
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilitystate;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_STATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState005(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetDisabled(accessibilitystate, PARAM_1);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsDisabled(accessibilitystate), PARAM_1);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState006(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetDisabled(accessibilitystate, PARAM_0);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsDisabled(accessibilitystate), PARAM_0);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState007(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetDisabled(accessibilitystate, PARAM_NEGATIVE_1);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsDisabled(accessibilitystate), PARAM_NEGATIVE_1);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState008(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetDisabled(accessibilitystate, PARAM_2);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsDisabled(accessibilitystate), PARAM_2);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetSelected(accessibilitystate, PARAM_1);
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilitystate;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_STATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetSelected(accessibilitystate, PARAM_0);
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilitystate;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_STATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState011(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetSelected(accessibilitystate, PARAM_1);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsSelected(accessibilitystate), PARAM_1);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState012(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetSelected(accessibilitystate, PARAM_0);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsSelected(accessibilitystate), PARAM_0);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState013(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetSelected(accessibilitystate, PARAM_NEGATIVE_1);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsSelected(accessibilitystate), PARAM_NEGATIVE_1);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState014(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetSelected(accessibilitystate, PARAM_2);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsSelected(accessibilitystate), PARAM_2);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState015(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetCheckedState(accessibilitystate, ARKUI_ACCESSIBILITY_CHECKED);
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilitystate;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_STATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState016(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetCheckedState(accessibilitystate, ARKUI_ACCESSIBILITY_UNCHECKED);
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilitystate;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_STATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState017(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetCheckedState(accessibilitystate, ARKUI_ACCESSIBILITY_CHECKED);
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilitystate;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_STATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState018(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetCheckedState(accessibilitystate, ARKUI_ACCESSIBILITY_UNCHECKED);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_GetCheckedState(accessibilitystate), ARKUI_ACCESSIBILITY_UNCHECKED);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState019(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetCheckedState(accessibilitystate, PARAM_NEGATIVE_1);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_GetCheckedState(accessibilitystate), PARAM_NEGATIVE_1);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState020(napi_env env, napi_callback_info info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetCheckedState(accessibilitystate, PARAM_2);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_GetCheckedState(accessibilitystate), PARAM_2);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityState021(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilitystate;
    nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_STATE, &value_item);
    auto ret = nodeAPI->resetAttribute(text, NODE_ACCESSIBILITY_STATE);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

} // namespace ArkUICapiTest
