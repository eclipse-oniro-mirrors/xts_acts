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

#define DEFAULT_VALUE (1.0)
#define MIN_VALUE (0.0)
#define FIRST_MIDDLE_VALUE (0.5)
#define SECOND_MIDDLE_VALUE (0.8)
#define MIN_ABNORMAL_VALUE (-1.0)
#define MAX_ABNORMAL_VALUE (2.0)

namespace ArkUIAniTest {

static ani_double TestCustomComponentSepia001(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.f32 = MIN_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_SEPIA, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_SEPIA)->value[PARAM_0].f32, MIN_VALUE);
    NAPI_END;
}

static ani_double TestCustomComponentSepia002(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float sepia = 0.5;
    ArkUI_NumberValue value[] = {{.f32 = sepia}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_SEPIA, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_SEPIA)->value[PARAM_0].f32, sepia);
    NAPI_END;
}

static ani_double TestCustomComponentSepia003(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float sepia = 0.8;
    ArkUI_NumberValue value[] = {{.f32 = sepia}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_SEPIA, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_SEPIA)->value[PARAM_0].f32, sepia);
    NAPI_END;
}

static ani_double TestCustomComponentSepia004(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float sepia = 1.0;
    ArkUI_NumberValue value[] = {{.f32 = sepia}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_SEPIA, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_SEPIA)->value[PARAM_0].f32, sepia);
    NAPI_END;
}

static ani_double TestCustomComponentSepia005(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.f32 = MIN_ABNORMAL_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_SEPIA, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(custom, NODE_SEPIA) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_SEPIA)->value[PARAM_0].f32, MIN_ABNORMAL_VALUE);
    }

    NAPI_END;
}

static ani_double TestCustomComponentSepia006(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.f32 = MAX_ABNORMAL_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_SEPIA, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(custom, NODE_SEPIA) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_SEPIA)->value[PARAM_0].f32, MAX_ABNORMAL_VALUE);
    }

    NAPI_END;
}

} // namespace ArkUIAniTest
