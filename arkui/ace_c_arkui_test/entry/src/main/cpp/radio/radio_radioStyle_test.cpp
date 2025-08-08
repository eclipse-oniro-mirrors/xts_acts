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

#define COLOR_007DFF 0x007DFF
#define COLOR_182431 0x182431
#define COLOR_FFFFFF 0xFFFFFF
namespace ArkUICapiTest {

static napi_value TestRadioRadioStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(radio, ARKUI_NODE_RADIO);

    ArkUI_NumberValue value[] = { { .u32 = COLOR_YELLOW }, { .u32 = COLOR_BLUE }, { .u32 = COLOR_GREEN } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(radio, NODE_RADIO_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(radio, NODE_RADIO_STYLE)->value[PARAM_0].u32, COLOR_YELLOW);
    ASSERT_EQ(nodeAPI->getAttribute(radio, NODE_RADIO_STYLE)->value[PARAM_1].u32, COLOR_BLUE);
    ASSERT_EQ(nodeAPI->getAttribute(radio, NODE_RADIO_STYLE)->value[PARAM_2].u32, COLOR_GREEN);

    NAPI_END;
}
static napi_value TestRadioRadioStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(radio, ARKUI_NODE_RADIO);

    ArkUI_AttributeItem value_item = {};
    auto ret = nodeAPI->setAttribute(radio, NODE_RADIO_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestRadioRadioStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(radio, ARKUI_NODE_RADIO);

    ArkUI_NumberValue value[] = { { .u32 = COLOR_YELLOW }, { .u32 = COLOR_BLUE }, { .u32 = COLOR_GREEN } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(radio, NODE_RADIO_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(radio, NODE_RADIO_STYLE);
    ASSERT_EQ(ret1, SUCCESS);

    NAPI_END;
}
static napi_value TestRadioRadioStyle004(napi_env env, napi_callback_info info)
{
    NAPI_START(radio, ARKUI_NODE_RADIO);

    ArkUI_NumberValue value[] = { { .u32 = COLOR_YELLOW }, { .u32 = COLOR_BLUE } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(radio, NODE_RADIO_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(radio, NODE_RADIO_STYLE)->value[PARAM_0].u32, COLOR_YELLOW);
    ASSERT_EQ(nodeAPI->getAttribute(radio, NODE_RADIO_STYLE)->value[PARAM_1].u32, COLOR_BLUE);

    NAPI_END;
}
static napi_value TestRadioRadioStyle005(napi_env env, napi_callback_info info)
{
    NAPI_START(radio, ARKUI_NODE_RADIO);

    ArkUI_NumberValue value[] = { { .u32 = COLOR_YELLOW } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(radio, NODE_RADIO_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(radio, NODE_RADIO_STYLE)->value[PARAM_0].u32, COLOR_YELLOW);

    NAPI_END;
}

}