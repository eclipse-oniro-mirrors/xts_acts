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

static ani_double TestCommonAttrsAlignSelf001(ani_env* env, ani_object info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ITEM_ALIGNMENT_AUTO}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ALIGN_SELF, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ALIGN_SELF)->value[PARAM_0].i32, ARKUI_ITEM_ALIGNMENT_AUTO);
    NAPI_END;
}

static ani_double TestCommonAttrsAlignSelf002(ani_env* env, ani_object info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ITEM_ALIGNMENT_START}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ALIGN_SELF, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ALIGN_SELF)->value[PARAM_0].i32, ARKUI_ITEM_ALIGNMENT_START);
    NAPI_END;
}

static ani_double TestCommonAttrsAlignSelf003(ani_env* env, ani_object info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ITEM_ALIGNMENT_CENTER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ALIGN_SELF, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ALIGN_SELF)->value[PARAM_0].i32, ARKUI_ITEM_ALIGNMENT_CENTER);
    NAPI_END;
}

static ani_double TestCommonAttrsAlignSelf004(ani_env* env, ani_object info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ITEM_ALIGNMENT_END}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ALIGN_SELF, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ALIGN_SELF)->value[PARAM_0].i32, ARKUI_ITEM_ALIGNMENT_END);
    NAPI_END;
}

static ani_double TestCommonAttrsAlignSelf005(ani_env* env, ani_object info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ITEM_ALIGNMENT_STRETCH}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ALIGN_SELF, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ALIGN_SELF)->value[PARAM_0].i32, ARKUI_ITEM_ALIGNMENT_STRETCH);
    NAPI_END;
}

static ani_double TestCommonAttrsAlignSelf006(ani_env* env, ani_object info)
{
    NAPI_START(row, ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_ITEM_ALIGNMENT_BASELINE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(row, NODE_ALIGN_SELF, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(row, NODE_ALIGN_SELF)->value[PARAM_0].i32, ARKUI_ITEM_ALIGNMENT_BASELINE);
    NAPI_END;
}
} // namespace ArkUIAniTest
