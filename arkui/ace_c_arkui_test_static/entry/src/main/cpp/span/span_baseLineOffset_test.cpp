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

static ani_double TestSpanBaseLineOffset001(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.f32 = PARAM_20}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SPAN_BASELINE_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SPAN_BASELINE_OFFSET)->value[PARAM_0].f32, PARAM_20);
    NAPI_END;
}

static ani_double TestSpanBaseLineOffset002(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SPAN_BASELINE_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SPAN_BASELINE_OFFSET)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}

static ani_double TestSpanBaseLineOffset003(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.f32 = PARAM_NEGATIVE_10}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SPAN_BASELINE_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SPAN_BASELINE_OFFSET)->value[PARAM_0].f32, PARAM_NEGATIVE_10);
    NAPI_END;
}

static ani_double TestSpanBaseLineOffset004(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_SPAN);

    ArkUI_NumberValue value[] = {{.f32 = PARAM_20}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_SPAN_BASELINE_OFFSET, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(text, NODE_SPAN_BASELINE_OFFSET);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SPAN_BASELINE_OFFSET)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUIAniTest
