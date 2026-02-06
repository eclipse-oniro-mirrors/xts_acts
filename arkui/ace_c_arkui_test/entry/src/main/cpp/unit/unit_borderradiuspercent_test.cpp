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
#define BORDER_RADIUS_1 0.5
#define BORDER_RADIUS_2 1
#define BORDER_RADIUS_3 0
#define BORDER_RADIUS_4 (-1)
#define BORDER_RADIUS_5 2
#define BORDER_RADIUS_6 0.8
#define BORDER_RADIUS_7 0.1
namespace ArkUICapiTest {

static napi_value TestUnitBorderRadiusPercent001(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue borderRadiusValue[] = { { .f32 = BORDER_RADIUS_1 } };
    ArkUI_AttributeItem borderRadiusItem = { borderRadiusValue,
        sizeof(borderRadiusValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_BORDER_RADIUS_PERCENT, &borderRadiusItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_0].f32, BORDER_RADIUS_1);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_1].f32, BORDER_RADIUS_1);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_2].f32, BORDER_RADIUS_1);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_3].f32, BORDER_RADIUS_1);
    NAPI_END;
}
static napi_value TestUnitBorderRadiusPercent002(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue borderRadiusValue[] = { { .f32 = BORDER_RADIUS_1 }, { .f32 = BORDER_RADIUS_3 },
        { .f32 = BORDER_RADIUS_1 }, { .f32 = BORDER_RADIUS_1 } };
    ArkUI_AttributeItem borderRadiusItem = { borderRadiusValue,
        sizeof(borderRadiusValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_BORDER_RADIUS_PERCENT, &borderRadiusItem);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestUnitBorderRadiusPercent ",
        "TestUnitBorderRadiusPercent002 ret = %{public}d", ret);
    ASSERT_EQ(ret, SUCCESS);
    auto tmp = nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_0].f32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestUnitBorderRadiusPercent ",
        "TestUnitBorderRadiusPercent002 PARAM_0 = %{public}f", tmp);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_0].f32, BORDER_RADIUS_1);
    tmp = nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_1].f32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestUnitBorderRadiusPercent ",
        "TestUnitBorderRadiusPercent002 PARAM_1 = %{public}f", tmp);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_1].f32, BORDER_RADIUS_3);
    tmp = nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_2].f32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestUnitBorderRadiusPercent ",
        "TestUnitBorderRadiusPercent002 PARAM_2 = %{public}f", tmp);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_2].f32, BORDER_RADIUS_1);
    tmp = nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_3].f32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestUnitBorderRadiusPercent ",
        "TestUnitBorderRadiusPercent002 PARAM_3 = %{public}f", tmp);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_3].f32, BORDER_RADIUS_1);
    NAPI_END;
}
static napi_value TestUnitBorderRadiusPercent003(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue borderRadiusValue[] = { { .f32 = BORDER_RADIUS_3 }, { .f32 = BORDER_RADIUS_3 },
        { .f32 = BORDER_RADIUS_3 }, { .f32 = BORDER_RADIUS_1 } };
    ArkUI_AttributeItem borderRadiusItem = { borderRadiusValue,
        sizeof(borderRadiusValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_BORDER_RADIUS_PERCENT, &borderRadiusItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_0].f32, BORDER_RADIUS_3);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_1].f32, BORDER_RADIUS_3);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_2].f32, BORDER_RADIUS_3);
    auto tmp = nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_3].f32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestUnitBorderRadiusPercent ",
        "TestUnitBorderRadiusPercent003 PARAM_3 = %{public}f", tmp);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_3].f32, BORDER_RADIUS_1);
    NAPI_END;
}
static napi_value TestUnitBorderRadiusPercent004(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue borderRadiusValue[] = { { .f32 = BORDER_RADIUS_4 } };
    ArkUI_AttributeItem borderRadiusItem = { borderRadiusValue,
        sizeof(borderRadiusValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_BORDER_RADIUS_PERCENT, &borderRadiusItem);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value TestUnitBorderRadiusPercent005(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue borderRadiusValue[] = { { .f32 = BORDER_RADIUS_5 } };
    ArkUI_AttributeItem borderRadiusItem = { borderRadiusValue,
        sizeof(borderRadiusValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_BORDER_RADIUS_PERCENT, &borderRadiusItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_0].f32, BORDER_RADIUS_5);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_1].f32, BORDER_RADIUS_5);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_2].f32, BORDER_RADIUS_5);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_BORDER_RADIUS_PERCENT)->value[PARAM_3].f32, BORDER_RADIUS_5);
    NAPI_END;
}
} // namespace ArkUICapiTest