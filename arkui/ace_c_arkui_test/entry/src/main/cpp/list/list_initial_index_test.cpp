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

#include <arkui/native_interface.h>

#include "../manager/plugin_manager.h"
#include "arkui/native_node.h"
#include "common/common.h"

namespace ArkUICapiTest {
using namespace std;

#define SIZE_1000 1000

static auto CreateListComponent(ArkUI_NodeHandle list)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto item1 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto item2 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto item3 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto item4 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    auto item5 = nodeAPI->createNode(ARKUI_NODE_LIST_ITEM);
    nodeAPI->addChild(list, item1);
    nodeAPI->addChild(list, item2);
    nodeAPI->addChild(list, item3);
    nodeAPI->addChild(list, item4);
    nodeAPI->addChild(list, item5);
}

static auto SetInitialIndex(ArkUI_NodeHandle list, int32_t index)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NumberValue value[] = { { .i32 = index } };
    ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_INITIAL_INDEX, &item);
    return ret;
}

static napi_value TestListInitialIndex001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t index = PARAM_0;
    auto ret = SetInitialIndex(list, index);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_INITIAL_INDEX)->value[PARAM_0].i32, index);
    NAPI_END;
}

static napi_value TestListInitialIndex002(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t index = PARAM_NEGATIVE_1;
    auto ret = SetInitialIndex(list, index);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_INITIAL_INDEX)->value[PARAM_0].i32, PARAM_0);
    NAPI_END;
}

static napi_value TestListInitialIndex003(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t index = PARAM_5;
    CreateListComponent(list);
    auto ret = SetInitialIndex(list, index);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_INITIAL_INDEX)->value[PARAM_0].i32, index);
    NAPI_END;
}

static napi_value TestListInitialIndex004(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t index = SIZE_1000;
    CreateListComponent(list);
    auto ret = SetInitialIndex(list, index);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_INITIAL_INDEX)->value[PARAM_0].i32, index);
    NAPI_END;
}

static napi_value TestListInitialIndex005(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto ret = nodeAPI->resetAttribute(list, NODE_LIST_INITIAL_INDEX);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_INITIAL_INDEX)->value[PARAM_0].i32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUICapiTest