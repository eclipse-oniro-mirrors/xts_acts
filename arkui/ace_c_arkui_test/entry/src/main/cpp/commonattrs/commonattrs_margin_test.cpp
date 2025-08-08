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

namespace ArkUICapiTest {

static napi_value TestCommonAttrsMargin001(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float margin = SIZE_10;
    ArkUI_NumberValue value[] = {{.f32 = margin}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_MARGIN, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_0].f32, margin);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_1].f32, margin);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_2].f32, margin);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_3].f32, margin);
    NAPI_END;
}

static napi_value TestCommonAttrsMargin002(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float marginUp = SIZE_10;
    float marginDown = SIZE_20;
    float marginLeft = SIZE_30;
    float marginRight = SIZE_40;
    ArkUI_NumberValue value[PARAM_4] = {
        {.f32 = marginUp}, {.f32 = marginRight}, {.f32 = marginDown}, {.f32 = marginLeft}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_MARGIN, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_0].f32, marginUp);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_1].f32, marginRight);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_2].f32, marginDown);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_3].f32, marginLeft);
    NAPI_END;
}

static napi_value TestCommonAttrsMargin003(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float margin = PARAM_NEGATIVE_50;
    ArkUI_NumberValue value[] = {{.f32 = margin}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_MARGIN, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_0].f32, margin);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_1].f32, margin);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_2].f32, margin);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_3].f32, margin);
    NAPI_END;
}

static napi_value TestCommonAttrsMargin004(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float marginUp = PARAM_NEGATIVE_10;
    float marginDown = SIZE_20;
    float marginLeft = PARAM_NEGATIVE_30;
    float marginRight = SIZE_40;
    ArkUI_NumberValue value[PARAM_4] = {
        {.f32 = marginUp}, {.f32 = marginRight}, {.f32 = marginDown}, {.f32 = marginLeft}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_MARGIN, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_0].f32, marginUp);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_1].f32, marginRight);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_2].f32, marginDown);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_MARGIN)->value[PARAM_3].f32, marginLeft);
    NAPI_END;
}

} // namespace ArkUICapiTest
