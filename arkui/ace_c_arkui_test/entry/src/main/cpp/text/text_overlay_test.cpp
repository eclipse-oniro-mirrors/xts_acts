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

static napi_value TestTextOverlay001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = "A";
    auto ret = nodeAPI->setAttribute(text, NODE_OVERLAY, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP_START);
    NAPI_END;
}

static napi_value TestTextOverlay002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = "A";
    auto ret = nodeAPI->setAttribute(text, NODE_OVERLAY, &valueItem);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->string, "A");
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextOverlay003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float offsetValue = 20;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_TOP_START}, {.f32 = offsetValue}, {.f32 = offsetValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "A";
    auto ret = nodeAPI->setAttribute(text, NODE_OVERLAY, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP_START);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_1].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_1].f32, offsetValue);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->string, "A");
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextOverlay004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_TOP}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "A";
    auto ret = nodeAPI->setAttribute(text, NODE_OVERLAY, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->string, "A");
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextOverlay005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_TOP_END}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "A";
    auto ret = nodeAPI->setAttribute(text, NODE_OVERLAY, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP_END);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->string, "A");
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextOverlay006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_START}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "A";
    auto ret = nodeAPI->setAttribute(text, NODE_OVERLAY, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_START);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->string, "A");
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextOverlay007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_CENTER}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "A";
    auto ret = nodeAPI->setAttribute(text, NODE_OVERLAY, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_CENTER);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->string, "A");
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextOverlay008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_END}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "A";
    auto ret = nodeAPI->setAttribute(text, NODE_OVERLAY, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_END);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->string, "A");
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextOverlay009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_BOTTOM_START}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "A";
    auto ret = nodeAPI->setAttribute(text, NODE_OVERLAY, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_BOTTOM_START);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->string, "A");
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextOverlay010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_BOTTOM}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "A";
    auto ret = nodeAPI->setAttribute(text, NODE_OVERLAY, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_BOTTOM);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->string, "A");
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextOverlay011(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_BOTTOM_END}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "A";
    auto ret = nodeAPI->setAttribute(text, NODE_OVERLAY, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_BOTTOM_END);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->string, "A");
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextOverlay012(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float offsetValue = 1000;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ALIGNMENT_TOP_START}, {.f32 = offsetValue}, {.f32 = offsetValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "A";
    auto ret = nodeAPI->setAttribute(text, NODE_OVERLAY, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_0].i32, ARKUI_ALIGNMENT_TOP_START);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_1].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_2].f32, offsetValue);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_OVERLAY)->string, "A");
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextOverlay013(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t exceptionValue = -1;
    ArkUI_NumberValue value[] = {{.i32 = exceptionValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.string = "A";
    auto ret = nodeAPI->setAttribute(text, NODE_OVERLAY, &valueItem);
    if (nodeAPI->getAttribute(text, NODE_OVERLAY) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_OVERLAY)->value[PARAM_0].i32, exceptionValue);
    };

    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}
} // namespace ArkUICapiTest
