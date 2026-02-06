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
#include <cstdint>

#include "../manager/plugin_manager.h"
#include "arkui/native_node.h"
#include "common/common.h"

namespace ArkUICapiTest {
static napi_value TestListListNodeAdapter001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    ArkUI_AttributeItem item = {};
    item.object = OH_ArkUI_NodeAdapter_Create();
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_NODE_ADAPTER, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getAttribute(list, NODE_LIST_NODE_ADAPTER)->object, item.object);
    NAPI_END;
}

static napi_value TestListListNodeAdapter002(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    ArkUI_AttributeItem item = {};
    item.object = nullptr;
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_NODE_ADAPTER, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_OBJ(nodeAPI->getAttribute(list, NODE_LIST_NODE_ADAPTER)->object, item.object);
    NAPI_END;
}

static napi_value TestListListNodeAdapter003(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto ret = nodeAPI->resetAttribute(list, NODE_LIST_NODE_ADAPTER);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getAttribute(list, NODE_LIST_NODE_ADAPTER)->object, nullptr);
    NAPI_END;
}
} // namespace ArkUICapiTest