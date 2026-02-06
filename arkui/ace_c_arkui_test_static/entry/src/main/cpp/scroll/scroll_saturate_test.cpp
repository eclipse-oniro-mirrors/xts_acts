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
#define MAX_VALUE 50

namespace ArkUIAniTest {

static ani_double TestScrollSaturate001(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float saturate = 2.0;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SATURATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}

static ani_double TestScrollSaturate002(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float saturate = 0.5;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SATURATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}

static ani_double TestScrollSaturate003(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float saturate = MAX_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SATURATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}

static ani_double TestScrollSaturate004(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float saturate = 0;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SATURATION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    NAPI_END;
}

static ani_double TestScrollSaturate005(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float saturate = -1;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SATURATION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(scroll, NODE_SATURATION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    }
    NAPI_END;
}

static ani_double TestScrollSaturate006(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float saturate = MAX_VALUE + 1;
    ArkUI_NumberValue value[] = {{.f32 = saturate}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SATURATION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(scroll, NODE_SATURATION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_SATURATION)->value[PARAM_0].f32, saturate);
    }
    NAPI_END;
}
} // namespace ArkUIAniTest
