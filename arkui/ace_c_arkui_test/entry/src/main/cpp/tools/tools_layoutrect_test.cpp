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
#define X 75
#define Y 90
#define WIDTH 50
#define HEIGHT 100
namespace ArkUICapiTest {

static napi_value TestToolsLayoutRect001(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    ArkUI_NumberValue value[] = { { .i32 = X }, { .i32 = Y }, { .i32 = WIDTH }, { .i32 = HEIGHT } };
    ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(flex, NODE_LAYOUT_RECT, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_LAYOUT_RECT)->value[PARAM_0].i32, X);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_LAYOUT_RECT)->value[PARAM_1].i32, Y);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_LAYOUT_RECT)->value[PARAM_2].i32, WIDTH);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_LAYOUT_RECT)->value[PARAM_3].i32, HEIGHT);
    NAPI_END;
}
} // namespace ArkUICapiTest