/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include <arkui/native_interface.h>


#include "arkui/native_node.h"
#include "common/common.h"
#include "ani/ani.h"
namespace ArkUIAniTest {
static auto SetAlign(ArkUI_NodeHandle list, int32_t parameter)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NumberValue value[] = { { .i32 = parameter } };
    ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_ALIGN_LIST_ITEM, &item);
    return ret;
}

static ani_double TestListAlignListItem001(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t align = ARKUI_LIST_ITEM_ALIGNMENT_START;
    auto ret = SetAlign(list, align);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_ALIGN_LIST_ITEM)->value[PARAM_0].i32, align);
    NAPI_END;
}

static ani_double TestListAlignListItem002(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t align = ARKUI_LIST_ITEM_ALIGNMENT_CENTER;
    auto ret = SetAlign(list, align);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_ALIGN_LIST_ITEM)->value[PARAM_0].i32, align);
    NAPI_END;
}

static ani_double TestListAlignListItem003(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t align = ARKUI_LIST_ITEM_ALIGNMENT_END;
    auto ret = SetAlign(list, align);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_ALIGN_LIST_ITEM)->value[PARAM_0].i32, align);
    NAPI_END;
}

static ani_double TestListAlignListItem004(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t align = PARAM_NEGATIVE_1;
    auto ret = SetAlign(list, align);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(
        nodeAPI->getAttribute(list, NODE_LIST_ALIGN_LIST_ITEM)->value[PARAM_0].i32, ARKUI_LIST_ITEM_ALIGNMENT_START);
    NAPI_END;
}

static ani_double TestListAlignListItem005(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t align = PARAM_3;
    auto ret = SetAlign(list, align);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(
        nodeAPI->getAttribute(list, NODE_LIST_ALIGN_LIST_ITEM)->value[PARAM_0].i32, ARKUI_LIST_ITEM_ALIGNMENT_START);
    NAPI_END;
}

static ani_double TestListAlignListItem006(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto ret = nodeAPI->resetAttribute(list, NODE_LIST_ALIGN_LIST_ITEM);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(
        nodeAPI->getAttribute(list, NODE_LIST_ALIGN_LIST_ITEM)->value[PARAM_0].i32, ARKUI_LIST_ITEM_ALIGNMENT_START);
    NAPI_END;
}
} // namespace ArkUIAniTest