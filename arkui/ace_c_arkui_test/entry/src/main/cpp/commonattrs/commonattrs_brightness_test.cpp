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

static napi_value TestCommonAttrsBrightness001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float brightnessValue = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BRIGHTNESS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static napi_value TestCommonAttrsBrightness002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float brightnessValue = PARAM_1;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BRIGHTNESS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static napi_value TestCommonAttrsBrightness003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float brightnessValue = PARAM_0_POINT_5;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BRIGHTNESS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static napi_value TestCommonAttrsBrightness004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float brightnessValue = PARAM_1_POINT_5;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BRIGHTNESS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static napi_value TestCommonAttrsBrightness005(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float brightnessValue = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BRIGHTNESS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static napi_value TestCommonAttrsBrightness006(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float brightnessValue = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BRIGHTNESS, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    auto ret1 = nodeAPI->getAttribute(image, NODE_BRIGHTNESS);
    ASSERT_EQ(ret1->value[PARAM_0].f32, PARAM_1);
    NAPI_END;
}

static napi_value TestCommonAttrsBrightness007(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float brightnessValue = PARAM_NEGATIVE_20;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BRIGHTNESS, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    auto ret1 = nodeAPI->getAttribute(image, NODE_BRIGHTNESS);
    ASSERT_EQ(ret1->value[PARAM_0].f32, PARAM_1);
    NAPI_END;
}

static napi_value TestCommonAttrsBrightness008(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float brightnessValue = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(image, NODE_BRIGHTNESS, &valueItem);
    auto ret = nodeAPI->resetAttribute(image, NODE_BRIGHTNESS);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BRIGHTNESS)->value[PARAM_0].f32, PARAM_1);
    NAPI_END;
}
} // namespace ArkUICapiTest
