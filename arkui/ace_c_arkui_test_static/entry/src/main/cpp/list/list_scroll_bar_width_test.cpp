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
#define SIZE_1000 1000

static auto SetWidth(ArkUI_NodeHandle list, float width)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NumberValue value[] = { { .f32 = width } };
    ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_BAR_WIDTH, &item);
    return ret;
}

static ani_double TestListScrollBarWidth001(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float width = PARAM_10;
    auto ret = SetWidth(list, width);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32, width);
    NAPI_END;
}

static ani_double TestListScrollBarWidth002(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float width = PARAM_0;
    auto ret = SetWidth(list, width);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32, width);
    NAPI_END;
}

static ani_double TestListScrollBarWidth003(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float width = PARAM_NEGATIVE_1;
    auto ret = SetWidth(list, width);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(list, NODE_SCROLL_BAR_WIDTH) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32, PARAM_4);
    }
    NAPI_END;
}

static ani_double TestListScrollBarWidth004(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float width = SIZE_1000;
    auto ret = SetWidth(list, width);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32, width);
    NAPI_END;
}

static ani_double TestListScrollBarWidth005(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto ret = nodeAPI->resetAttribute(list, NODE_SCROLL_BAR_WIDTH);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUIAniTest