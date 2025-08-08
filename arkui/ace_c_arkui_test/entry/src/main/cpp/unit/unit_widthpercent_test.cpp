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
#define WIDTH_PERCENT_1 0.5
#define WIDTH_PERCENT_2 1
#define WIDTH_PERCENT_3 0
#define WIDTH_PERCENT_4 (-1)
#define WIDTH_PERCENT_5 2
namespace ArkUICapiTest {

static napi_value TestUnitWidthPercent001(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue widthValue[] = { { .f32 = WIDTH_PERCENT_1 } };
    ArkUI_AttributeItem widthItem = { widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_WIDTH_PERCENT, &widthItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_WIDTH_PERCENT)->value[PARAM_0].f32, WIDTH_PERCENT_1);
    NAPI_END;
}
static napi_value TestUnitWidthPercent002(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue widthValue[] = { { .f32 = WIDTH_PERCENT_2 } };
    ArkUI_AttributeItem widthItem = { widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_WIDTH_PERCENT, &widthItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_WIDTH_PERCENT)->value[PARAM_0].f32, WIDTH_PERCENT_2);
    NAPI_END;
}
static napi_value TestUnitWidthPercent003(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue widthValue[] = { { .f32 = WIDTH_PERCENT_3 } };
    ArkUI_AttributeItem widthItem = { widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_WIDTH_PERCENT, &widthItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_WIDTH_PERCENT)->value[PARAM_0].f32, WIDTH_PERCENT_3);
    NAPI_END;
}
static napi_value TestUnitWidthPercent004(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue widthValue[] = { { .f32 = WIDTH_PERCENT_4 } };
    ArkUI_AttributeItem widthItem = { widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_WIDTH_PERCENT, &widthItem);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestUnitWidthPercent ", "TestUnitWidthPercent004 ret = %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
static napi_value TestUnitWidthPercent005(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue widthValue[] = { { .f32 = WIDTH_PERCENT_5 } };
    ArkUI_AttributeItem widthItem = { widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_WIDTH_PERCENT, &widthItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_WIDTH_PERCENT)->value[PARAM_0].f32, WIDTH_PERCENT_5);
    NAPI_END;
}
} // namespace ArkUICapiTest