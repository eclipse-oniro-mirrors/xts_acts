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

#include "AccessibilityFocusIdTest.h"
#include <cstring>

namespace ArkUICapiTest {

napi_value AccessibilityNextFocusIdTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    
    ArkUI_AttributeItem item = {.string = "testNextFocusId"};
    auto ret = nodeAPI->setAttribute(column, NODE_ACCESSIBILITY_NEXT_FOCUS_ID, &item);
    ASSERT_EQ(ret, SUCCESS);
    
    NAPI_END;
}

napi_value AccessibilityNextFocusIdTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    
    ArkUI_AttributeItem item = {.string = ""};
    auto ret = nodeAPI->setAttribute(column, NODE_ACCESSIBILITY_NEXT_FOCUS_ID, &item);
    ASSERT_EQ(ret, SUCCESS);
    
    NAPI_END;
}

napi_value AccessibilityDefaultFocusTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    
    ArkUI_NumberValue value[] = {{.i32 = PARAM_1}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    auto ret = nodeAPI->setAttribute(column, NODE_ACCESSIBILITY_DEFAULT_FOCUS, &item);
    ASSERT_EQ(ret, SUCCESS);
    
    NAPI_END;
}

napi_value AccessibilityDefaultFocusTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    
    ArkUI_NumberValue value[] = {{.i32 = PARAM_0}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    auto ret = nodeAPI->setAttribute(column, NODE_ACCESSIBILITY_DEFAULT_FOCUS, &item);
    ASSERT_EQ(ret, SUCCESS);
    
    NAPI_END;
}

} // namespace ArkUICapiTest