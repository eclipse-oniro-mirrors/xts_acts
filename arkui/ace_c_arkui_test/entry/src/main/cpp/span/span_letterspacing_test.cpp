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

static napi_value TestSpanLetterSpacing001(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    float letterSpacing = PARAM_3;

    ArkUI_NumberValue letterspacing_value[] = {{.f32 = letterSpacing}};
    ArkUI_AttributeItem letterspacing_item = {letterspacing_value,
                                              sizeof(letterspacing_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_LETTER_SPACING, &letterspacing_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_LETTER_SPACING)->value[PARAM_0].f32, letterSpacing);
    NAPI_END;
}

static napi_value TestSpanLetterSpacing002(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    float letterSpacing = PARAM_0;

    ArkUI_NumberValue letterspacing_value[] = {{.f32 = letterSpacing}};
    ArkUI_AttributeItem letterspacing_item = {letterspacing_value,
                                              sizeof(letterspacing_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_LETTER_SPACING, &letterspacing_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_LETTER_SPACING)->value[PARAM_0].f32, letterSpacing);
    NAPI_END;
}

static napi_value TestSpanLetterSpacing003(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    float letterSpacing = PARAM_NEGATIVE_1;

    ArkUI_NumberValue letterspacing_value[] = {{.f32 = letterSpacing}};
    ArkUI_AttributeItem letterspacing_item = {letterspacing_value,
                                              sizeof(letterspacing_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_LETTER_SPACING, &letterspacing_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_LETTER_SPACING)->value[PARAM_0].f32, letterSpacing);
    NAPI_END;
}

} // namespace ArkUICapiTest
