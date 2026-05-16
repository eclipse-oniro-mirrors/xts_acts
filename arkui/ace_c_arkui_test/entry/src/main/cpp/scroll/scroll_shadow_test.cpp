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

#define SUCCESS 0
#define ABNORMAL_PARAM 1000

namespace ArkUICapiTest {

static napi_value TestScrollShadow001(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SHADOW_STYLE_OUTER_DEFAULT_XS}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SHADOW, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SHADOW)->value[PARAM_0].i32, ARKUI_SHADOW_STYLE_OUTER_DEFAULT_XS);
    NAPI_END;
}

static napi_value TestScrollShadow002(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SHADOW_STYLE_OUTER_DEFAULT_SM}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SHADOW, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SHADOW)->value[PARAM_0].i32, ARKUI_SHADOW_STYLE_OUTER_DEFAULT_SM);
    NAPI_END;
}

static napi_value TestScrollShadow003(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SHADOW_STYLE_OUTER_DEFAULT_MD}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SHADOW, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SHADOW)->value[PARAM_0].i32, ARKUI_SHADOW_STYLE_OUTER_DEFAULT_MD);
    NAPI_END;
}

static napi_value TestScrollShadow004(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SHADOW_STYLE_OUTER_DEFAULT_LG}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SHADOW, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SHADOW)->value[PARAM_0].i32, ARKUI_SHADOW_STYLE_OUTER_DEFAULT_LG);
    NAPI_END;
}

static napi_value TestScrollShadow005(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SHADOW_STYLE_OUTER_FLOATING_SM}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SHADOW, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SHADOW)->value[PARAM_0].i32, ARKUI_SHADOW_STYLE_OUTER_FLOATING_SM);
    NAPI_END;
}

static napi_value TestScrollShadow006(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SHADOW_STYLE_OUTER_FLOATING_MD}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SHADOW, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SHADOW)->value[PARAM_0].i32, ARKUI_SHADOW_STYLE_OUTER_FLOATING_MD);
    NAPI_END;
}
} // namespace ArkUICapiTest
