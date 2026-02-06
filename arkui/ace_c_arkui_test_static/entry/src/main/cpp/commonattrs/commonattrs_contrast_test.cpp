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
#define MAX_VALUE (9.0)
#define FIRST_MIDDLE_VALUE (5.0)
#define MIN_ABNORMAL_VALUE (-1.0)
#define MAX_ABNORMAL_VALUE (11.0)

namespace ArkUIAniTest {

static ani_double TestCommonAttrsContrast001(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.f32 = MIN_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_CONTRAST, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_CONTRAST)->value[PARAM_0].f32, MIN_VALUE);
    NAPI_END;
}

static ani_double TestCommonAttrsContrast002(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_CONTRAST)->value[PARAM_0].f32, DEFAULT_VALUE);
    NAPI_END;
}

static ani_double TestCommonAttrsContrast003(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.f32 = FIRST_MIDDLE_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_CONTRAST, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_CONTRAST)->value[PARAM_0].f32, FIRST_MIDDLE_VALUE);
    NAPI_END;
}

static ani_double TestCommonAttrsContrast004(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.f32 = MAX_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_CONTRAST, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_CONTRAST)->value[PARAM_0].f32, MAX_VALUE);
    NAPI_END;
}

static ani_double TestCommonAttrsContrast005(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.f32 = MIN_ABNORMAL_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_CONTRAST, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_CONTRAST) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_CONTRAST)->value[PARAM_0].f32, MIN_ABNORMAL_VALUE);
    }

    NAPI_END;
}

static ani_double TestCommonAttrsContrast006(ani_env* env, ani_object info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue value[] = {{.f32 = MAX_ABNORMAL_VALUE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_CONTRAST, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_CONTRAST) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_CONTRAST)->value[PARAM_0].f32, MAX_ABNORMAL_VALUE);
    }

    NAPI_END;
}

} // namespace ArkUIAniTest
