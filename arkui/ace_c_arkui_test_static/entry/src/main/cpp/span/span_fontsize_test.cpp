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

static ani_double TestSpanFontSize001(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    float fontSize = 10;
    ArkUI_NumberValue value[] = {{.f32 = fontSize}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_SIZE)->value[PARAM_0].f32, fontSize);
    NAPI_END;
}

static ani_double TestSpanFontSize002(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    float fontSize = -1;
    ArkUI_NumberValue value[] = {{.f32 = fontSize}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_SIZE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(span, NODE_FONT_SIZE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(span, NODE_FONT_SIZE)->value[PARAM_0].f32, fontSize);
    }
    NAPI_END;
}

static ani_double TestSpanFontSize003(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_FONT_SIZE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_FONT_SIZE)->value[PARAM_0].f32, SIZE_100);
    NAPI_END;
}

} // namespace ArkUIAniTest
