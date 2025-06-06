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
#define NORMAL_COLOR 0xFFFF0000

namespace ArkUICapiTest {

static napi_value TestScrollBorderColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.u32 = NORMAL_COLOR}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_COLOR)->value[PARAM_0].u32, NORMAL_COLOR);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_COLOR)->value[PARAM_1].u32, NORMAL_COLOR);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_COLOR)->value[PARAM_2].u32, NORMAL_COLOR);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_COLOR)->value[PARAM_3].u32, NORMAL_COLOR);
    NAPI_END;
}

static napi_value TestScrollBorderColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {
        {.u32 = NORMAL_COLOR}, {.u32 = NORMAL_COLOR}, {.u32 = NORMAL_COLOR}, {.u32 = NORMAL_COLOR}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_COLOR)->value[PARAM_0].u32, NORMAL_COLOR);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_COLOR)->value[PARAM_1].u32, NORMAL_COLOR);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_COLOR)->value[PARAM_2].u32, NORMAL_COLOR);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_COLOR)->value[PARAM_3].u32, NORMAL_COLOR);
    NAPI_END;
}
} // namespace ArkUICapiTest
