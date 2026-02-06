/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "../common/common.h"
#include "../manager/PluginManagerTest.h"

#include <cstdint>
#include <string>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_render.h>

#define PARAM_1013014 1013014
#define PARAM_1013015 1013015

namespace ArkUICapiTest {

static napi_value GridIndexTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "GridIndexTest_001 result=%{public}d", NODE_GRID_SCROLL_TO_INDEX);
    ASSERT_EQ(NODE_GRID_SCROLL_TO_INDEX, PARAM_1013014);
    NAPI_END;
}

static napi_value GridEmptyTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "GridEmptyTest_001 result=%{public}d", NODE_GRID_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING);
    ASSERT_EQ(NODE_GRID_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING, PARAM_1013015);
    NAPI_END;
}

static napi_value GridEmptyTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    int32_t emptyBranch = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = emptyBranch}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING, &valueItem);
    auto ret1 = nodeAPI->getAttribute(grid, NODE_GRID_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, false);
    NAPI_END;
}

static napi_value GridEmptyTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    int32_t emptyBranch = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = emptyBranch}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING, &valueItem);
    auto ret1 = nodeAPI->getAttribute(grid, NODE_GRID_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, true);
    NAPI_END;
}

static napi_value GridEmptyTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    int32_t emptyBranch = napi_undefined;
    ArkUI_NumberValue value[] = {{.i32 = emptyBranch}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING, &valueItem);
    auto ret1 = nodeAPI->getAttribute(grid, NODE_GRID_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, false);
    NAPI_END;
}
}