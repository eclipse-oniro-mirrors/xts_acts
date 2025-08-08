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

static napi_value TestCommonAttrsVisibility001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t visibility = ARKUI_VISIBILITY_VISIBLE;
    ArkUI_NumberValue value[] = {{.i32 = visibility}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_VISIBILITY, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_VISIBILITY)->value[PARAM_0].i32, visibility);
    NAPI_END;
}

static napi_value TestCommonAttrsVisibility002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t visibility = ARKUI_VISIBILITY_HIDDEN;
    ArkUI_NumberValue value[] = {{.i32 = visibility}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_VISIBILITY, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_VISIBILITY)->value[PARAM_0].i32, visibility);
    NAPI_END;
}

static napi_value TestCommonAttrsVisibility003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t visibility = ARKUI_VISIBILITY_NONE;
    ArkUI_NumberValue value[] = {{.i32 = visibility}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_VISIBILITY, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_VISIBILITY)->value[PARAM_0].i32, visibility);
    NAPI_END;
}

static napi_value TestCommonAttrsVisibility004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t visibility = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = visibility}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_VISIBILITY, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsVisibility005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t visibility = PARAM_3;
    ArkUI_NumberValue value[] = {{.i32 = visibility}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_VISIBILITY, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsVisibility006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    int32_t visibility = ARKUI_VISIBILITY_NONE;
    ArkUI_NumberValue value[] = {{.i32 = visibility}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_VISIBILITY, &valueItem);
    auto ret = nodeAPI->resetAttribute(column, NODE_VISIBILITY);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_VISIBILITY)->value[PARAM_0].i32, ARKUI_VISIBILITY_VISIBLE);
    NAPI_END;
}
} // namespace ArkUICapiTest