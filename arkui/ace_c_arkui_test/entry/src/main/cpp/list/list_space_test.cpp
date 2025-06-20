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
#define SIZE_1000 1000
#define SIZE_100000 100000

static auto SetSpace(ArkUI_NodeHandle list, float space)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NumberValue value[] = { { .f32 = space } };
    ArkUI_AttributeItem item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_SPACE, &item);
    return ret;
}

static napi_value TestListSpace001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float space = PARAM_4;
    auto ret = SetSpace(list, space);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_SPACE)->value[PARAM_0].f32, space);
    NAPI_END;
}

static napi_value TestListSpace002(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float space = SIZE_100000;
    auto ret = SetSpace(list, space);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestListSpace002", "space = %{public}f",
        nodeAPI->getAttribute(list, NODE_LIST_SPACE)->value[PARAM_0].f32);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_SPACE)->value[PARAM_0].f32, space);
    NAPI_END;
}

static napi_value TestListSpace003(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float space1 = PARAM_4;
    float space2 = PARAM_NEGATIVE_1;
    auto ret = SetSpace(list, space1);
    ret = SetSpace(list, space2);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(list, NODE_LIST_SPACE) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_SPACE)->value[PARAM_0].f32, space1);
    }
    NAPI_END;
}

static napi_value TestListSpace004(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float space = PARAM_0;
    auto ret = SetSpace(list, space);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_SPACE)->value[PARAM_0].f32, space);
    NAPI_END;
}

static napi_value TestListSpace005(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    auto ret = nodeAPI->resetAttribute(list, NODE_LIST_SPACE);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LIST_SPACE)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUICapiTest