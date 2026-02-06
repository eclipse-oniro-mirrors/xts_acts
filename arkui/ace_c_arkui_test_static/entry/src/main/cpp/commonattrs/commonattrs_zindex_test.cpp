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

static ani_double TestCommonAttrsZIndex001(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsZIndex002(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsZIndex003(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsZIndex004(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsZIndex005(ani_env* env, ani_object info)
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

static ani_double TestCommonAttrsZIndex006(ani_env* env, ani_object info)
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

} // namespace ArkUIAniTest