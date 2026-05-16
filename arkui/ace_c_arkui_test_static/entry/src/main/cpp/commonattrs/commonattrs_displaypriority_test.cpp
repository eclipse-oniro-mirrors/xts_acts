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

static ani_double TestCommonAttrsDisplayPriority001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    uint32_t priority = PARAM_0;
    ArkUI_NumberValue value[] = {{.u32 = priority}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_DISPLAY_PRIORITY, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_DISPLAY_PRIORITY)->value[PARAM_0].u32, priority);
    NAPI_END;
}

static ani_double TestCommonAttrsDisplayPriority002(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    uint32_t priority = PARAM_1;
    ArkUI_NumberValue value[] = {{.u32 = priority}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_DISPLAY_PRIORITY, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_DISPLAY_PRIORITY)->value[PARAM_0].u32, priority);
    NAPI_END;
}

static ani_double TestCommonAttrsDisplayPriority003(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    uint32_t priority = PARAM_2;
    ArkUI_NumberValue value[] = {{.u32 = priority}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_DISPLAY_PRIORITY, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_DISPLAY_PRIORITY)->value[PARAM_0].u32, priority);
    NAPI_END;
}

static ani_double TestCommonAttrsDisplayPriority004(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    uint32_t priority = PARAM_3;
    ArkUI_NumberValue value[] = {{.u32 = priority}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_DISPLAY_PRIORITY, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_DISPLAY_PRIORITY)->value[PARAM_0].u32, priority);
    NAPI_END;
}

static ani_double TestCommonAttrsDisplayPriority005(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    uint32_t priority = PARAM_5;
    ArkUI_NumberValue value[] = {{.u32 = priority}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_DISPLAY_PRIORITY, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_DISPLAY_PRIORITY)->value[PARAM_0].u32, priority);
    NAPI_END;
}

static ani_double TestCommonAttrsDisplayPriority006(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    uint32_t priority = PARAM_5;
    ArkUI_NumberValue value[] = {{.u32 = priority}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_DISPLAY_PRIORITY, &valueItem);
    auto ret = nodeAPI->resetAttribute(column, NODE_DISPLAY_PRIORITY);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_DISPLAY_PRIORITY)->value[PARAM_0].u32, PARAM_0);
    NAPI_END;
}

} // namespace ArkUIAniTest
