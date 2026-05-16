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

#define PARAM_1010014 1010014

namespace ArkUICapiTest {

  static napi_value WaterFlowEmptyTest_001(napi_env env, napi_callback_info info)
  {
    NAPI_START(waterFlow, ARKUI_NODE_WATER_FLOW);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
      "WaterFlowEmptyTest_001 result=%{public}d", NODE_WATER_FLOW_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING);
    ASSERT_EQ(NODE_WATER_FLOW_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING, PARAM_1010014);
    NAPI_END;
  }

  static napi_value WaterFlowEmptyTest_002(napi_env env, napi_callback_info info)
  {
    NAPI_START(waterFlow, ARKUI_NODE_WATER_FLOW);
    int32_t emptyBranch = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = emptyBranch}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING, &valueItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, false);
    NAPI_END;
  }

  static napi_value WaterFlowEmptyTest_003(napi_env env, napi_callback_info info)
  {
    NAPI_START(waterFlow, ARKUI_NODE_WATER_FLOW);
    int32_t emptyBranch = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = emptyBranch}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING, &valueItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, true);
    NAPI_END;
  }

  static napi_value WaterFlowEmptyTest_004(napi_env env, napi_callback_info info)
  {
    NAPI_START(waterFlow, ARKUI_NODE_WATER_FLOW);
    int32_t emptyBranch = napi_undefined;
    ArkUI_NumberValue value[] = {{.i32 = emptyBranch}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(waterFlow, NODE_WATER_FLOW_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING, &valueItem);
    auto ret1 = nodeAPI->getAttribute(waterFlow, NODE_WATER_FLOW_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, false);
    NAPI_END;
  }
}