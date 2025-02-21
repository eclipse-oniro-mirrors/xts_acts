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

#define MIN_VALUE (0.0)
#define MAX_VALUE (2.0)
#define FIRST_MIDDLE_VALUE (10.0)
#define SECOND_MIDDLE_VALUE (10000.0)
#define THIRD_MIDDLE_VALUE (-10.0)
#define FOURTH_MIDDLE_VALUE (-10000.0)

namespace ArkUICapiTest {

static napi_value TestImageTranslate001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float x = MIN_VALUE;
    float y = MIN_VALUE;
    float z = MIN_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static napi_value TestImageTranslate002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float x = FIRST_MIDDLE_VALUE;
    float y = FIRST_MIDDLE_VALUE;
    float z = FIRST_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static napi_value TestImageTranslate003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float x = SECOND_MIDDLE_VALUE;
    float y = SECOND_MIDDLE_VALUE;
    float z = SECOND_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static napi_value TestImageTranslate004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float x = THIRD_MIDDLE_VALUE;
    float y = THIRD_MIDDLE_VALUE;
    float z = THIRD_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static napi_value TestImageTranslate005(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float x = FOURTH_MIDDLE_VALUE;
    float y = FOURTH_MIDDLE_VALUE;
    float z = FOURTH_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_TRANSLATE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

} // namespace ArkUICapiTest
