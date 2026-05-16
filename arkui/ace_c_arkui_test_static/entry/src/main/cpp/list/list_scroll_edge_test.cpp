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
#include <cstdint>
#include <thread>


#include "arkui/native_node.h"
#include "common/common.h"
#include "ani/ani.h"

namespace ArkUIAniTest {

static auto SetScrollEdge(ArkUI_NodeHandle list, int32_t edge)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NumberValue value[] = { { .i32 = edge } };
    ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_EDGE, &item);
    return ret;
}

static ani_double TestListScrollEdge001(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t edge = ArkUI_ScrollEdge::ARKUI_SCROLL_EDGE_TOP;
    auto ret = SetScrollEdge(list, edge);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollEdge001", "ret = %{public}d", ret);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListScrollEdge002(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t edge = ArkUI_ScrollEdge::ARKUI_SCROLL_EDGE_BOTTOM;
    auto ret = SetScrollEdge(list, edge);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollEdge002", "ret = %{public}d", ret);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListScrollEdge003(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t edge = ArkUI_ScrollEdge::ARKUI_SCROLL_EDGE_START;
    auto ret = SetScrollEdge(list, edge);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollEdge003", "ret = %{public}d", ret);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListScrollEdge004(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t edge = ArkUI_ScrollEdge::ARKUI_SCROLL_EDGE_END;
    auto ret = SetScrollEdge(list, edge);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollEdge004", "ret = %{public}d", ret);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListScrollEdge005(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t edge = PARAM_NEGATIVE_1;
    auto ret = SetScrollEdge(list, edge);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollEdge005", "ret = %{public}d", ret);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListScrollEdge006(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t edge = PARAM_4;
    auto ret = SetScrollEdge(list, edge);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollEdge006", "ret = %{public}d", ret);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestListScrollEdge007(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto ret = nodeAPI->resetAttribute(list, NODE_SCROLL_EDGE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListScrollEdge007", "ret = %{public}d", ret);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
} // namespace ArkUIAniTest