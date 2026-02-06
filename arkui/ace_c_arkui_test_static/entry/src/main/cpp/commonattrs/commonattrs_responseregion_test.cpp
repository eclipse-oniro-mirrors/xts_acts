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

static ani_double TestCommonAttrsResponseRegion001(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    float x = PARAM_0;
    float y = PARAM_0;
    float xpercentage = PARAM_50;
    float ypercentage = PARAM_50;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = xpercentage}, {.f32 = ypercentage}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_RESPONSE_REGION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_2].f32, xpercentage);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_3].f32, ypercentage);
    NAPI_END;
}

static ani_double TestCommonAttrsResponseRegion002(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    float x = PARAM_0;
    float y = PARAM_0;
    float z = PARAM_50;
    float w = PARAM_100;
    float xpercentage = PARAM_50;
    float ypercentage = PARAM_0;
    float zpercentage = PARAM_50;
    float wpercentage = PARAM_100;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = w}, {.f32 = xpercentage},
        {.f32 = ypercentage}, {.f32 = zpercentage}, {.f32 = wpercentage}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_RESPONSE_REGION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_3].f32, w);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_4].f32, xpercentage);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_5].f32, ypercentage);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_6].f32, zpercentage);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_7].f32, wpercentage);
    NAPI_END;
}

static ani_double TestCommonAttrsResponseRegion003(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    float x = PARAM_NEGATIVE_50;
    float y = PARAM_0;
    float xpercentage = PARAM_100;
    float ypercentage = PARAM_100;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = xpercentage}, {.f32 = ypercentage}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_RESPONSE_REGION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_2].f32, xpercentage);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_3].f32, ypercentage);
    NAPI_END;
}

static ani_double TestCommonAttrsResponseRegion004(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    float x = PARAM_150;
    float y = PARAM_100;
    float xpercentage = PARAM_100;
    float ypercentage = PARAM_100;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = xpercentage}, {.f32 = ypercentage}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_RESPONSE_REGION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_2].f32, xpercentage);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_3].f32, ypercentage);
    NAPI_END;
}

static ani_double TestCommonAttrsResponseRegion005(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    float x = PARAM_0;
    float y = PARAM_0;
    float xpercentage = PARAM_0;
    float ypercentage = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = xpercentage}, {.f32 = ypercentage}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_RESPONSE_REGION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_2].f32, xpercentage);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_3].f32, ypercentage);
    NAPI_END;
}

static ani_double TestCommonAttrsResponseRegion006(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    float x = PARAM_100;
    float y = PARAM_0;
    float xpercentage = PARAM_200;
    float ypercentage = PARAM_200;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = xpercentage}, {.f32 = ypercentage}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_RESPONSE_REGION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_2].f32, xpercentage);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_3].f32, ypercentage);
    NAPI_END;
}

static ani_double TestCommonAttrsResponseRegion007(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    float x = PARAM_100;
    float y = PARAM_0;
    float xpercentage = PARAM_200;
    float ypercentage = PARAM_200;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = xpercentage}, {.f32 = ypercentage}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_RESPONSE_REGION, &valueItem);
    auto ret = nodeAPI->resetAttribute(button, NODE_RESPONSE_REGION);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_RESPONSE_REGION)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}

} // namespace ArkUIAniTest
