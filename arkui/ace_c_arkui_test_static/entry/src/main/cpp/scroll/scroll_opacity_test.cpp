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

#define SUCCESS 0
#define ABNORMAL_PARAM 1000
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_MIDDLE 0.5
#define PARAM_ABNORAML (-1)

namespace ArkUIAniTest {

static ani_double TestScrollOpacity001(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_OPACITY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OPACITY)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}

static ani_double TestScrollOpacity002(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_MIDDLE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_OPACITY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OPACITY)->value[PARAM_0].f32, PARAM_MIDDLE);
    NAPI_END;
}

static ani_double TestScrollOpacity003(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_OPACITY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_OPACITY)->value[PARAM_0].f32, PARAM_1);
    NAPI_END;
}

static ani_double TestScrollOpacity004(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_ABNORAML}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_OPACITY, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(scroll, NODE_OPACITY) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_OPACITY)->value[PARAM_0].f32, PARAM_ABNORAML);
    }
    NAPI_END;
}
} // namespace ArkUIAniTest
