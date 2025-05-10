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

#define X_LOCATION 40
#define Y_LOCATION (-80)
#define WIDTH 80
#define HEIGHT 80
#define X_LOCATION_OTHER 40
#define Y_LOCATION_OTHER (-80)
#define WIDTH_OTHER 80
#define HEIGHT_OTHER 80

namespace ArkUICapiTest {

static napi_value TestTextInputResponseRegion001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = {{.f32 = X_LOCATION}, {.f32 = Y_LOCATION}, {.f32 = WIDTH}, {.f32 = HEIGHT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_RESPONSE_REGION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_RESPONSE_REGION)->value[PARAM_0].f32, X_LOCATION);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_RESPONSE_REGION)->value[PARAM_1].f32, Y_LOCATION);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_RESPONSE_REGION)->value[PARAM_2].f32, WIDTH);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_RESPONSE_REGION)->value[PARAM_3].f32, HEIGHT);
    NAPI_END;
}

static napi_value TestTextInputResponseRegion002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = {{.f32 = X_LOCATION},  {.f32 = Y_LOCATION},       {.f32 = WIDTH},
                                 {.f32 = HEIGHT},      {.f32 = X_LOCATION_OTHER}, {.f32 = Y_LOCATION_OTHER},
                                 {.f32 = WIDTH_OTHER}, {.f32 = HEIGHT_OTHER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_RESPONSE_REGION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_RESPONSE_REGION)->value[PARAM_0].f32, X_LOCATION);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_RESPONSE_REGION)->value[PARAM_1].f32, Y_LOCATION);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_RESPONSE_REGION)->value[PARAM_2].f32, WIDTH);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_RESPONSE_REGION)->value[PARAM_3].f32, HEIGHT);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_RESPONSE_REGION)->value[PARAM_4].f32, X_LOCATION_OTHER);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_RESPONSE_REGION)->value[PARAM_5].f32, Y_LOCATION_OTHER);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_RESPONSE_REGION)->value[PARAM_6].f32, WIDTH_OTHER);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_RESPONSE_REGION)->value[PARAM_7].f32, HEIGHT_OTHER);
    NAPI_END;
}
} // namespace ArkUICapiTest
