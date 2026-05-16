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

#define PARAM_1003020 1003020

namespace ArkUICapiTest {

  static napi_value ListBackBehaviorTest_001(napi_env env, napi_callback_info info)
  {
    NAPI_START(list, ARKUI_NODE_LIST);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
      "ListBackBehaviorTest_001 result=%{public}d", NODE_LIST_BACK_PRESS_BEHAVIOR);
    ASSERT_EQ(NODE_LIST_BACK_PRESS_BEHAVIOR, PARAM_1003020);
    NAPI_END;
  }

  static napi_value ListBackBehaviorTest_002(napi_env env, napi_callback_info info)
  {
    NAPI_START(list, ARKUI_NODE_LIST);

    ArkUI_NumberValue value[] = {{.i32 = true}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_BACK_PRESS_BEHAVIOR, &value_item);
    auto ret1 = nodeAPI->getAttribute(list, NODE_LIST_BACK_PRESS_BEHAVIOR)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, true);
    NAPI_END;
  }

  static napi_value ListBackBehaviorTest_003(napi_env env, napi_callback_info info)
  {
    NAPI_START(list, ARKUI_NODE_LIST);

    ArkUI_NumberValue value[] = {{.i32 = false}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_BACK_PRESS_BEHAVIOR, &value_item);
    auto ret1 = nodeAPI->getAttribute(list, NODE_LIST_BACK_PRESS_BEHAVIOR)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, false);
    NAPI_END;
  }

  static napi_value ListBackBehaviorTest_004(napi_env env, napi_callback_info info)
  {
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t emptyBranch = napi_undefined;
    ArkUI_NumberValue value[] = {{.i32 = emptyBranch}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_LIST_BACK_PRESS_BEHAVIOR, &valueItem);
    auto ret1 = nodeAPI->getAttribute(list, NODE_LIST_BACK_PRESS_BEHAVIOR)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, false);
    NAPI_END;
  }
}