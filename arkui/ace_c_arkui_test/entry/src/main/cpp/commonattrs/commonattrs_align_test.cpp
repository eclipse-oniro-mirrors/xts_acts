/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"

namespace ArkUICapiTest {

#define ENUM_ABNORMAL_VALUE 500

static napi_value TestCommonAttrsAlign001(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_TOP_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].u32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign002(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_TOP;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].u32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign003(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_TOP_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].u32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign004(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].u32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign005(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_CENTER;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].u32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign006(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].u32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign007(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].u32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign008(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].u32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign009(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].u32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign010(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_CENTER;
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].u32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign011(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ENUM_ABNORMAL_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].u32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign012(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_TOP_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign013(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_TOP;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign014(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_TOP_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign015(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign016(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_CENTER;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign017(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign018(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign019(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign020(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign021(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign022(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = PARAM_9;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign023(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_TOP_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign024(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_TOP;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign025(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_TOP_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign026(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign027(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_CENTER;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign028(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign029(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign030(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign031(napi_env env, napi_callback_info info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign032(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_TOP_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign033(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_TOP;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign034(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_TOP_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign035(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign036(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_CENTER;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign037(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign038(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM_START;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign039(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign040(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, align);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign041(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign042(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = PARAM_9;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsAlign043(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t align = ARKUI_ALIGNMENT_BOTTOM_END;
    ArkUI_NumberValue value[] = {{.i32 = align}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_ALIGNMENT, &value_item);
    auto ret = nodeAPI->resetAttribute(text, NODE_ALIGNMENT);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ALIGNMENT)->value[PARAM_0].i32, ARKUI_ALIGNMENT_CENTER);
    NAPI_END;
}
} // namespace ArkUICapiTest
