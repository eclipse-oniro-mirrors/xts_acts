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

static napi_value TestStackShadow001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue shadow_value[] = {{.i32 = ARKUI_SHADOW_STYLE_OUTER_DEFAULT_XS}};
    ArkUI_AttributeItem shadow_item = {shadow_value, sizeof(shadow_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SHADOW, &shadow_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SHADOW)->value[PARAM_0].i32, ARKUI_SHADOW_STYLE_OUTER_DEFAULT_XS);
    NAPI_END;
}

static napi_value TestStackShadow002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue shadow_value[] = {{.i32 = ARKUI_SHADOW_STYLE_OUTER_DEFAULT_SM}};
    ArkUI_AttributeItem shadow_item = {shadow_value, sizeof(shadow_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SHADOW, &shadow_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SHADOW)->value[PARAM_0].i32, ARKUI_SHADOW_STYLE_OUTER_DEFAULT_SM);
    NAPI_END;
}

static napi_value TestStackShadow003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue shadow_value[] = {{.i32 = ARKUI_SHADOW_STYLE_OUTER_DEFAULT_MD}};
    ArkUI_AttributeItem shadow_item = {shadow_value, sizeof(shadow_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SHADOW, &shadow_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SHADOW)->value[PARAM_0].i32, ARKUI_SHADOW_STYLE_OUTER_DEFAULT_MD);
    NAPI_END;
}

static napi_value TestStackShadow004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue shadow_value[] = {{.i32 = ARKUI_SHADOW_STYLE_OUTER_DEFAULT_LG}};
    ArkUI_AttributeItem shadow_item = {shadow_value, sizeof(shadow_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SHADOW, &shadow_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SHADOW)->value[PARAM_0].i32, ARKUI_SHADOW_STYLE_OUTER_DEFAULT_LG);
    NAPI_END;
}

static napi_value TestStackShadow005(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue shadow_value[] = {{.i32 = ARKUI_SHADOW_STYLE_OUTER_FLOATING_SM}};
    ArkUI_AttributeItem shadow_item = {shadow_value, sizeof(shadow_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SHADOW, &shadow_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SHADOW)->value[PARAM_0].i32, ARKUI_SHADOW_STYLE_OUTER_FLOATING_SM);
    NAPI_END;
}

static napi_value TestStackShadow006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue shadow_value[] = {{.i32 = ARKUI_SHADOW_STYLE_OUTER_FLOATING_MD}};
    ArkUI_AttributeItem shadow_item = {shadow_value, sizeof(shadow_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SHADOW, &shadow_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SHADOW)->value[PARAM_0].i32, ARKUI_SHADOW_STYLE_OUTER_FLOATING_MD);
    NAPI_END;
}

static napi_value TestStackShadow007(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    int32_t shadow = -1;

    ArkUI_NumberValue shadow_value[] = {{.i32 = shadow}};
    ArkUI_AttributeItem shadow_item = {shadow_value, sizeof(shadow_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SHADOW, &shadow_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_SHADOW) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SHADOW)->value[PARAM_0].i32, shadow);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
