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

#define BORDERRADIUS 16
#define BORDERRADIUS_TOP 8
#define BORDERRADIUS_BOTTOM 16
#define BORDERRADIUS_LEFT 10
#define BORDERRADIUS_RIGHT 20
#define ABNORMAL_PARAM (-100)

namespace ArkUICapiTest {

static napi_value TestTextAreaBorderRadius001(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = BORDERRADIUS}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_BORDER_RADIUS)->value[PARAM_0].f32, BORDERRADIUS);
    NAPI_END;
}

static napi_value TestTextAreaBorderRadius002(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = BORDERRADIUS_TOP},
                                 {.f32 = BORDERRADIUS_BOTTOM},
                                 {.f32 = BORDERRADIUS_LEFT},
                                 {.f32 = BORDERRADIUS_RIGHT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_BORDER_RADIUS)->value[PARAM_0].f32, BORDERRADIUS_TOP);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_BORDER_RADIUS)->value[PARAM_1].f32, BORDERRADIUS_BOTTOM);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_BORDER_RADIUS)->value[PARAM_2].f32, BORDERRADIUS_LEFT);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_BORDER_RADIUS)->value[PARAM_3].f32, BORDERRADIUS_RIGHT);
    NAPI_END;
}

static napi_value TestTextAreaBorderRadius003(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {
        {.f32 = ABNORMAL_PARAM}, {.f32 = ABNORMAL_PARAM}, {.f32 = ABNORMAL_PARAM}, {.f32 = ABNORMAL_PARAM}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(textArea, NODE_BORDER_RADIUS)->value[PARAM_0].f32, ABNORMAL_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(textArea, NODE_BORDER_RADIUS)->value[PARAM_1].f32, ABNORMAL_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(textArea, NODE_BORDER_RADIUS)->value[PARAM_2].f32, ABNORMAL_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(textArea, NODE_BORDER_RADIUS)->value[PARAM_3].f32, ABNORMAL_PARAM);
    NAPI_END;
}
} // namespace ArkUICapiTest
