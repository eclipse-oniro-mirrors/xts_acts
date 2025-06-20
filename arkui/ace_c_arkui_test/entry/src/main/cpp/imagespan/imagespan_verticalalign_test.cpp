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

static napi_value TestImageSpanVerticalAlign001(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_IMAGE_SPAN_ALIGNMENT_BASELINE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT)->value[PARAM_0].i32,
              ARKUI_IMAGE_SPAN_ALIGNMENT_BASELINE);
    NAPI_END;
}

static napi_value TestImageSpanVerticalAlign002(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_IMAGE_SPAN_ALIGNMENT_BOTTOM}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT)->value[PARAM_0].i32,
              ARKUI_IMAGE_SPAN_ALIGNMENT_BOTTOM);
    NAPI_END;
}

static napi_value TestImageSpanVerticalAlign003(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_IMAGE_SPAN_ALIGNMENT_CENTER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT)->value[PARAM_0].i32,
              ARKUI_IMAGE_SPAN_ALIGNMENT_CENTER);
    NAPI_END;
}

static napi_value TestImageSpanVerticalAlign004(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_IMAGE_SPAN_ALIGNMENT_TOP}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT)->value[PARAM_0].i32,
              ARKUI_IMAGE_SPAN_ALIGNMENT_TOP);
    NAPI_END;
}

static napi_value TestImageSpanVerticalAlign005(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    int32_t verticalAlign = -1;

    ArkUI_NumberValue value[] = {{.i32 = verticalAlign}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(imageSpan, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(imageSpan, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT)->value[PARAM_0].i32,
                  verticalAlign);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
