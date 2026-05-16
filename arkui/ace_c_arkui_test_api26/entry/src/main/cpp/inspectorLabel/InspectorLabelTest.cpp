/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "InspectorLabelTest.h"
#include <string>
#include <cstring>

namespace ArkUICapiTest {

napi_value InspectorLabelTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    
    ArkUI_AttributeItem item = {.string = "testInspectorLabel"};
    auto ret = nodeAPI->setAttribute(column, NODE_INSPECTOR_LABEL, &item);
    ASSERT_EQ(ret, SUCCESS);
    
    auto result = nodeAPI->getAttribute(column, NODE_INSPECTOR_LABEL);
    ASSERT_EQ(strcmp(result->string, "testInspectorLabel"), 0);
    
    NAPI_END;
}

napi_value InspectorLabelTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    
    ArkUI_AttributeItem item = {.string = ""};
    auto ret = nodeAPI->setAttribute(column, NODE_INSPECTOR_LABEL, &item);
    ASSERT_EQ(ret, SUCCESS);
    
    auto result = nodeAPI->getAttribute(column, NODE_INSPECTOR_LABEL);
    ASSERT_EQ(strcmp(result->string, ""), 0);
    NAPI_END;
}

napi_value InspectorLabelTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    
    auto ret = nodeAPI->setAttribute(column, NODE_INSPECTOR_LABEL, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    
    NAPI_END;
}

} // namespace ArkUICapiTest