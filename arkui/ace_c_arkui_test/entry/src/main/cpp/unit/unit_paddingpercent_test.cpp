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
#define PADDING_PERCENT_1 0.5
#define PADDING_PERCENT_2 1
#define PADDING_PERCENT_3 0
#define PADDING_PERCENT_4 (-1)
#define PADDING_PERCENT_5 2
#define PADDING_PERCENT_6 5
#define PADDING_PERCENT_7 3
namespace ArkUICapiTest {

static napi_value TestUnitPaddingPercent001(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue paddingValue[] = { { .f32 = PADDING_PERCENT_1 } };
    ArkUI_AttributeItem paddingItem = { paddingValue, sizeof(paddingValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_PADDING_PERCENT, &paddingItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_0].f32, PADDING_PERCENT_1);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_1].f32, PADDING_PERCENT_1);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_2].f32, PADDING_PERCENT_1);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_3].f32, PADDING_PERCENT_1);
    NAPI_END;
}
static napi_value TestUnitPaddingPercent002(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue paddingValue[] = { { .f32 = PADDING_PERCENT_1 }, { .f32 = PADDING_PERCENT_3 },
        { .f32 = PADDING_PERCENT_6 }, { .f32 = PADDING_PERCENT_7 } };
    ArkUI_AttributeItem paddingItem = { paddingValue, sizeof(paddingValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_PADDING_PERCENT, &paddingItem);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestUnitMarginPercent ",
        "TestUnitPaddingPercent002 ret = %{public}d", ret);
    ASSERT_EQ(ret, SUCCESS);
    auto tmp = nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_0].f32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestUnitMarginPercent ",
        "TestUnitPaddingPercent002 PARAM_0 = %{public}f", tmp);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_0].f32, PADDING_PERCENT_1);
    tmp = nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_1].f32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestUnitMarginPercent ",
        "TestUnitPaddingPercent002 PARAM_1 = %{public}f", tmp);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_1].f32, PADDING_PERCENT_3);
    tmp = nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_2].f32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestUnitMarginPercent ",
        "TestUnitPaddingPercent002 PARAM_2 = %{public}f", tmp);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_2].f32, PADDING_PERCENT_6);
    tmp = nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_3].f32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestUnitMarginPercent ",
        "TestUnitPaddingPercent002 PARAM_3 = %{public}f", tmp);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_3].f32, PADDING_PERCENT_7);
    NAPI_END;
}
static napi_value TestUnitPaddingPercent003(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue paddingValue[] = { { .f32 = PADDING_PERCENT_3 } };
    ArkUI_AttributeItem paddingItem = { paddingValue, sizeof(paddingValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_PADDING_PERCENT, &paddingItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_0].f32, PADDING_PERCENT_3);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_1].f32, PADDING_PERCENT_3);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_2].f32, PADDING_PERCENT_3);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_3].f32, PADDING_PERCENT_3);
    NAPI_END;
}
static napi_value TestUnitPaddingPercent004(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue paddingValue[] = { { .f32 = PADDING_PERCENT_4 } };
    ArkUI_AttributeItem paddingItem = { paddingValue, sizeof(paddingValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_PADDING_PERCENT, &paddingItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_0].f32, PADDING_PERCENT_4);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_1].f32, PADDING_PERCENT_4);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_2].f32, PADDING_PERCENT_4);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_3].f32, PADDING_PERCENT_4);
    NAPI_END;
}
static napi_value TestUnitPaddingPercent005(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue paddingValue[] = { { .f32 = PADDING_PERCENT_5 } };
    ArkUI_AttributeItem paddingItem = { paddingValue, sizeof(paddingValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_PADDING_PERCENT, &paddingItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_0].f32, PADDING_PERCENT_5);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_1].f32, PADDING_PERCENT_5);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_2].f32, PADDING_PERCENT_5);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_PADDING_PERCENT)->value[PARAM_3].f32, PADDING_PERCENT_5);
    NAPI_END;
}
} // namespace ArkUICapiTest