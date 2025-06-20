/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "common/common.h"

namespace ArkUICapiTest {

    static napi_value TestTextInputSelectAll001(napi_env env, napi_callback_info info)
    {
        NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
        ArkUI_NumberValue value[] = {{.i32 = true}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_SELECT_ALL, &value_item);
        ASSERT_EQ(ret, SUCCESS);
        ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_SELECT_ALL)->value[PARAM_0].i32, true);
        NAPI_END;
    }
    static napi_value TestTextInputSelectAll002(napi_env env, napi_callback_info info)
    {
        NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
        ArkUI_NumberValue value[] = {{.i32 = false}};
        ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
        auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_SELECT_ALL, &value_item);
        ASSERT_EQ(ret, SUCCESS);
        ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_SELECT_ALL)->value[PARAM_0].i32, false);
    
        NAPI_END;
    }
    static napi_value TestTextInputSelectAll003(napi_env env, napi_callback_info info)
    {
        NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
        ArkUI_NumberValue value[] = { { .i32 = -1 } };
        ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
        auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_SELECT_ALL, &value_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputSelectAll",
            "TestTextInputSelectAll003 ret: %{public}d", ret);
        ASSERT_EQ(ret, SUCCESS);
        auto tmp = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_SELECT_ALL)->value[PARAM_0].i32;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTextInputSelectAll",
            "TestTextInputSelectAll003 tmp: %{public}d", tmp);
        ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_SELECT_ALL)->value[PARAM_0].i32, true);
        NAPI_END;
    }
}