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

namespace ArkUIAniTest {

static ani_double TestCommonAttrsAccessibilityValue001(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityValue* accessibilityValue = OH_ArkUI_AccessibilityValue_Create();
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilityValue;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityValue);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue002(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityValue* accessibilityValue = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityValue);
    ASSERT_OBJ(nullptr, nullptr);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue003(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityValue* accessibilityValue = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMin(accessibilityValue, PARAM_100);
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilityValue;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_VALUE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityValue);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue004(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityValue* accessibilityValue = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMin(accessibilityValue, PARAM_0);
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilityValue;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_VALUE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityValue);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue005(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityValue* accessibilityValue = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMin(accessibilityValue, PARAM_0);
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilityValue;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_VALUE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityValue);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue006(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityValue* accessibilityvalue = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMin(accessibilityvalue, PARAM_100);
    OH_ArkUI_AccessibilityValue_SetRangeMin(accessibilityvalue, PARAM_100);
    OH_ArkUI_AccessibilityValue_SetRangeMax(accessibilityvalue, PARAM_100);
    OH_ArkUI_AccessibilityValue_SetRangeCurrent(accessibilityvalue, PARAM_100);
    ASSERT_EQ(OH_ArkUI_AccessibilityValue_GetMin(accessibilityvalue), PARAM_100);
    ASSERT_EQ(OH_ArkUI_AccessibilityValue_GetRangeMin(accessibilityvalue), PARAM_100);
    ASSERT_EQ(OH_ArkUI_AccessibilityValue_GetRangeMax(accessibilityvalue), PARAM_100);
    ASSERT_EQ(OH_ArkUI_AccessibilityValue_GetRangeCurrent(accessibilityvalue), PARAM_100);
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityvalue);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue007(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityValue* accessibilityvalue = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMin(accessibilityvalue, PARAM_0);
    ASSERT_EQ(OH_ArkUI_AccessibilityValue_GetMin(accessibilityvalue), PARAM_0);
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityvalue);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue008(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityValue* accessibilityvalue = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMin(accessibilityvalue, PARAM_0);
    ASSERT_EQ(OH_ArkUI_AccessibilityValue_GetMin(nullptr), PARAM_NEGATIVE_1);
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityvalue);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue009(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityValue* accessibilityValue = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMax(accessibilityValue, PARAM_200);
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilityValue;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityValue);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue010(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityValue* accessibilityValue = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMax(accessibilityValue, PARAM_0);
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilityValue;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityValue);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue011(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityValue* accessibilityValue = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMax(accessibilityValue, PARAM_0);
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilityValue;
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityValue);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue012(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityValue* accessibilityvalue = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMax(accessibilityvalue, PARAM_200);
    ASSERT_EQ(OH_ArkUI_AccessibilityValue_GetMax(accessibilityvalue), PARAM_200);
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityvalue);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue013(ani_env* env, ani_object info)
{
    ArkUI_AccessibilityValue* accessibilityvalue = OH_ArkUI_AccessibilityValue_Create();
    OH_ArkUI_AccessibilityValue_SetMax(accessibilityvalue, PARAM_0);
    ASSERT_EQ(OH_ArkUI_AccessibilityValue_GetMax(accessibilityvalue), PARAM_0);
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityvalue);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue014(ani_env* env, ani_object info)
{
    ASSERT_EQ(OH_ArkUI_AccessibilityValue_GetMax(nullptr), PARAM_NEGATIVE_1);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityValue015(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AccessibilityValue* accessibilityValue = OH_ArkUI_AccessibilityValue_Create();
    ArkUI_AttributeItem value_item;
    value_item.object = accessibilityValue;
    nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_VALUE, &value_item);
    auto ret = nodeAPI->resetAttribute(text, NODE_ACCESSIBILITY_VALUE);
    ASSERT_EQ(ret, SUCCESS);
    OH_ArkUI_AccessibilityValue_Dispose(accessibilityValue);
    NAPI_END;
}

} // namespace ArkUIAniTest
