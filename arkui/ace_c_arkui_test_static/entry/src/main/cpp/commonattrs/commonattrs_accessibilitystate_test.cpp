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

#include "common/common.h"
#include "ani/ani.h"
#include <arkui/native_type.h>
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double TestCommonAttrsAccessibilityState001(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsAccessibilityState002(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    ASSERT_OBJ(nullptr, nullptr);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityState003(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsAccessibilityState004(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsAccessibilityState005(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetDisabled(accessibilitystate, PARAM_1);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsDisabled(accessibilitystate), PARAM_1);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityState006(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetDisabled(accessibilitystate, PARAM_0);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsDisabled(accessibilitystate), PARAM_0);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityState007(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetDisabled(accessibilitystate, PARAM_NEGATIVE_1);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsDisabled(accessibilitystate), PARAM_NEGATIVE_1);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityState008(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetDisabled(accessibilitystate, PARAM_2);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsDisabled(accessibilitystate), PARAM_2);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityState009(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsAccessibilityState010(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsAccessibilityState011(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetSelected(accessibilitystate, PARAM_1);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsSelected(accessibilitystate), PARAM_1);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityState012(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetSelected(accessibilitystate, PARAM_0);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsSelected(accessibilitystate), PARAM_0);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityState013(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetSelected(accessibilitystate, PARAM_NEGATIVE_1);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsSelected(accessibilitystate), PARAM_NEGATIVE_1);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityState014(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetSelected(accessibilitystate, PARAM_2);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_IsSelected(accessibilitystate), PARAM_2);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityState015(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsAccessibilityState016(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsAccessibilityState017(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsAccessibilityState018(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetCheckedState(accessibilitystate, ARKUI_ACCESSIBILITY_UNCHECKED);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_GetCheckedState(accessibilitystate), ARKUI_ACCESSIBILITY_UNCHECKED);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityState019(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetCheckedState(accessibilitystate, PARAM_NEGATIVE_1);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_GetCheckedState(accessibilitystate), PARAM_NEGATIVE_1);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityState020(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityState* accessibilitystate = OH_ArkUI_AccessibilityState_Create();
    OH_ArkUI_AccessibilityState_SetCheckedState(accessibilitystate, PARAM_2);
    ASSERT_EQ(OH_ArkUI_AccessibilityState_GetCheckedState(accessibilitystate), PARAM_2);
    OH_ArkUI_AccessibilityState_Dispose(accessibilitystate);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityState021(ani_env* env, ani_object info)
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

} // namespace ArkUIAniTest
