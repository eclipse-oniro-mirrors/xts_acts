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

#define FIRST_ANGLE_VALUE 0.0
#define SECOND_ANGLE_VALUE 300.0
#define THIRD_ANGLE_VALUE (-180.0)
#define FOURTH_ANGLE_VALUE 60.0

namespace ArkUICapiTest {

static napi_value TestImageRotate001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float x = PARAM_0;
    float y = PARAM_0;
    float z = PARAM_0;
    float angle = FIRST_ANGLE_VALUE;
    float perspective = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = perspective}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_ROTATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_4].f32, perspective);
    NAPI_END;
}

static napi_value TestImageRotate002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float x = PARAM_0;
    float y = PARAM_0;
    float z = PARAM_1;
    float angle = SECOND_ANGLE_VALUE;
    float perspective = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = perspective}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_ROTATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_4].f32, perspective);
    NAPI_END;
}

static napi_value TestImageRotate003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float x = PARAM_1;
    float y = PARAM_0;
    float z = PARAM_1;
    float angle = THIRD_ANGLE_VALUE;
    float perspective = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = perspective}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_ROTATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_4].f32, perspective);
    NAPI_END;
}

static napi_value TestImageRotate004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float x = PARAM_0;
    float y = PARAM_1;
    float z = PARAM_1;
    float angle = FOURTH_ANGLE_VALUE;
    float perspective = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = perspective}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_ROTATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_ROTATE)->value[PARAM_4].f32, perspective);
    NAPI_END;
}

} // namespace ArkUICapiTest
