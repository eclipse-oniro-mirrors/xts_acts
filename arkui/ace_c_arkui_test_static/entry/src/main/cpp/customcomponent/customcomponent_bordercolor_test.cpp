/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double TestCustomComponentBorderColor001(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BORDER_COLOR)->value[PARAM_0].u32, COLOR_GREEN);
    NAPI_END;
}

static ani_double TestCustomComponentBorderColor002(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}, {.u32 = COLOR_RED}, {.u32 = COLOR_RED}, {.u32 = COLOR_RED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BORDER_COLOR)->value[PARAM_0].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BORDER_COLOR)->value[PARAM_1].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BORDER_COLOR)->value[PARAM_2].u32, COLOR_RED);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_BORDER_COLOR)->value[PARAM_3].u32, COLOR_RED);
    NAPI_END;
}

} // namespace ArkUIAniTest
