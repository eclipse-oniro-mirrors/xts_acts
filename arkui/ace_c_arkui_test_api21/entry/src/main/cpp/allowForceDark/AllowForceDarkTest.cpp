/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"
#include "../manager/plugin_manager.h"
static int NUMBER_108 = 108;

namespace ArkUICapiTest {

static napi_value TestAllowForceDark(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeHandle column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{.i32 = 0}};
    ArkUI_AttributeItem item = {value, 1};
    auto ret = nodeAPI->setAttribute(column1, NODE_WIDTH_PERCENT, &item);
    auto ret1 = nodeAPI->setAttribute(column1, NODE_WIDTH_PERCENT, nullptr);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    auto ret2 = nodeAPI->setAttribute(column1, NODE_ALLOW_FORCE_DARK, &item);
    auto ret3 = nodeAPI->setAttribute(column1, NODE_ALLOW_FORCE_DARK, nullptr);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(NODE_ALLOW_FORCE_DARK, NUMBER_108);
    
    NAPI_END;
}

} // namespace ArkUICapiTest