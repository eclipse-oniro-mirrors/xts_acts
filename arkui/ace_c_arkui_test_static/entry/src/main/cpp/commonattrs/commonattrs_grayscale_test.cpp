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

#define DEFAULT_VALUE (0.0)
#define MAX_VALUE (1.0)
#define MIN_ABNORMAL_VALUE (-1.0)
#define MAX_ABNORMAL_VALUE (2.0)

namespace ArkUIAniTest {

static ani_double TestCommonAttrsGrayscale001(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_GRAY_SCALE)->value[PARAM_0].f32, DEFAULT_VALUE);
    NAPI_END;
}

static ani_double TestCommonAttrsGrayscale002(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float grayScale = 0.5;
    ArkUI_NumberValue value[] = {{.f32 = grayScale}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_GRAY_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_GRAY_SCALE)->value[PARAM_0].f32, grayScale);
    NAPI_END;
}

static ani_double TestCommonAttrsGrayscale003(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float grayScale = 0.8;
    ArkUI_NumberValue value[] = {{.f32 = grayScale}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_GRAY_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_GRAY_SCALE)->value[PARAM_0].f32, grayScale);
    NAPI_END;
}

static ani_double TestCommonAttrsGrayscale004(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.f32 = MAX_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_GRAY_SCALE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_GRAY_SCALE)->value[PARAM_0].f32, MAX_VALUE);
    NAPI_END;
}

static ani_double TestCommonAttrsGrayscale005(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.f32 = MIN_ABNORMAL_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_GRAY_SCALE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_GRAY_SCALE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_GRAY_SCALE)->value[PARAM_0].f32, MIN_ABNORMAL_VALUE);
    }

    NAPI_END;
}

static ani_double TestCommonAttrsGrayscale006(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.f32 = MAX_ABNORMAL_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_GRAY_SCALE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_GRAY_SCALE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_GRAY_SCALE)->value[PARAM_0].f32, MAX_ABNORMAL_VALUE);
    }

    NAPI_END;
}

} // namespace ArkUIAniTest
