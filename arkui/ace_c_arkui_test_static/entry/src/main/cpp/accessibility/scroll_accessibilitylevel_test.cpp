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

static ani_double TestScrollAccessibilityLevel001(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    int32_t accessibilityLevel = ARKUI_ACCESSIBILITY_MODE_AUTO;
    ArkUI_NumberValue value[] = {{.i32 = accessibilityLevel}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_ACCESSIBILITY_MODE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ACCESSIBILITY_MODE)->value[PARAM_0].i32, accessibilityLevel);
    NAPI_END;
}

static ani_double TestScrollAccessibilityLevel002(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    int32_t accessibilityLevel = ARKUI_ACCESSIBILITY_MODE_ENABLED;
    ArkUI_NumberValue value[] = {{.i32 = accessibilityLevel}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_ACCESSIBILITY_MODE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ACCESSIBILITY_MODE)->value[PARAM_0].i32, accessibilityLevel);
    NAPI_END;
}

static ani_double TestScrollAccessibilityLevel003(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    int32_t accessibilityLevel = ARKUI_ACCESSIBILITY_MODE_DISABLED;
    ArkUI_NumberValue value[] = {{.i32 = accessibilityLevel}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_ACCESSIBILITY_MODE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ACCESSIBILITY_MODE)->value[PARAM_0].i32, accessibilityLevel);
    NAPI_END;
}

static ani_double TestScrollAccessibilityLevel004(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    int32_t accessibilityLevel = ARKUI_ACCESSIBILITY_MODE_DISABLED_FOR_DESCENDANTS;
    ArkUI_NumberValue value[] = {{.i32 = accessibilityLevel}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_ACCESSIBILITY_MODE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_ACCESSIBILITY_MODE)->value[PARAM_0].i32, accessibilityLevel);
    NAPI_END;
}

static ani_double TestScrollAccessibilityLevel005(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    int32_t accessibilityLevel = PARAM_10;
    ArkUI_NumberValue value[] = {{.i32 = accessibilityLevel}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_ACCESSIBILITY_MODE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_ACCESSIBILITY_MODE)->value[PARAM_0].i32, accessibilityLevel);
    NAPI_END;
}

static ani_double TestScrollAccessibilityLevel006(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    int32_t accessibilityLevel = PARAM_NEGATIVE_10;
    ArkUI_NumberValue value[] = {{.i32 = accessibilityLevel}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_ACCESSIBILITY_MODE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_ACCESSIBILITY_MODE)->value[PARAM_0].i32, accessibilityLevel);
    NAPI_END;
}
} // namespace ArkUIAniTest
