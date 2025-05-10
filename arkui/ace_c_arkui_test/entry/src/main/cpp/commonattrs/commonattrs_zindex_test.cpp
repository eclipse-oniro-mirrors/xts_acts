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

static napi_value TestCommonAttrsZIndex001(napi_env env, napi_callback_info info)
{
    uint32_t zIndex = PARAM_0;
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.u32 = zIndex}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_Z_INDEX, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_Z_INDEX)->value[PARAM_0].u32, zIndex);
    NAPI_END;
}

static napi_value TestCommonAttrsZIndex002(napi_env env, napi_callback_info info)
{
    uint32_t zIndex = PARAM_1;
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.u32 = zIndex}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_Z_INDEX, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_Z_INDEX)->value[PARAM_0].u32, zIndex);
    NAPI_END;
}

static napi_value TestCommonAttrsZIndex003(napi_env env, napi_callback_info info)
{
    uint32_t zIndex = PARAM_2;
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.u32 = zIndex}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_Z_INDEX, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_Z_INDEX)->value[PARAM_0].u32, zIndex);
    NAPI_END;
}

static napi_value TestCommonAttrsZIndex004(napi_env env, napi_callback_info info)
{
    uint32_t zIndex = PARAM_300;
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.u32 = zIndex}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_Z_INDEX, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_Z_INDEX)->value[PARAM_0].u32, zIndex);
    NAPI_END;
}

static napi_value TestCommonAttrsZIndex005(napi_env env, napi_callback_info info)
{
    uint32_t zIndex = PARAM_NEGATIVE_1;
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.u32 = zIndex}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_Z_INDEX, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_Z_INDEX)->value[PARAM_0].u32, zIndex);
    NAPI_END;
}

static napi_value TestCommonAttrsZIndex006(napi_env env, napi_callback_info info)
{
    uint32_t zIndex = PARAM_1;
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.u32 = zIndex}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_Z_INDEX, &value_item);
    auto ret = nodeAPI->resetAttribute(text, NODE_Z_INDEX);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_Z_INDEX)->value[PARAM_0].u32, PARAM_0);
    NAPI_END;
}

} // namespace ArkUICapiTest