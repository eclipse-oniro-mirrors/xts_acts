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

static ani_double TestCommonAttrsFlexBasis001(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    float width = 100.0;
    ArkUI_NumberValue value[] = {{.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_FLEX_BASIS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_FLEX_BASIS)->value[PARAM_0].f32, width);
    NAPI_END;
}

static ani_double TestCommonAttrsFlexBasis002(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    float width = -100.0;
    ArkUI_NumberValue value[] = {{.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_FLEX_BASIS, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(button, NODE_FLEX_BASIS)->value[PARAM_0].f32, width);
    NAPI_END;
}
} // namespace ArkUIAniTest
