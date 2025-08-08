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

static napi_value TestImageSpanObjectFit001(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_OBJECT_FIT_CONTAIN}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, ARKUI_OBJECT_FIT_CONTAIN);
    NAPI_END;
}

static napi_value TestImageSpanObjectFit002(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_OBJECT_FIT_COVER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, ARKUI_OBJECT_FIT_COVER);
    NAPI_END;
}

static napi_value TestImageSpanObjectFit003(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_OBJECT_FIT_AUTO}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, ARKUI_OBJECT_FIT_AUTO);
    NAPI_END;
}

static napi_value TestImageSpanObjectFit004(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_OBJECT_FIT_FILL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, ARKUI_OBJECT_FIT_FILL);
    NAPI_END;
}

static napi_value TestImageSpanObjectFit005(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_OBJECT_FIT_SCALE_DOWN}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, ARKUI_OBJECT_FIT_SCALE_DOWN);
    NAPI_END;
}

static napi_value TestImageSpanObjectFit006(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_OBJECT_FIT_NONE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, ARKUI_OBJECT_FIT_NONE);
    NAPI_END;
}

static napi_value TestImageSpanObjectFit007(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    int32_t objectFit = -1;

    ArkUI_NumberValue value[] = {{.i32 = objectFit}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(imageSpan, NODE_IMAGE_OBJECT_FIT)->value[PARAM_0].i32, objectFit);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
