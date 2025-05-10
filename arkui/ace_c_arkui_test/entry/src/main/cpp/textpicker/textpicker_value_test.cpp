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
#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestTextPickerValue001(napi_env env, napi_callback_info info)
{
    NAPI_START(textPicker, ARKUI_NODE_TEXT_PICKER);
    ArkUI_NumberValue single_value[] = {{.i32 = ARKUI_TEXTPICKER_RANGETYPE_SINGLE}};
    ArkUI_AttributeItem single_item = {single_value, sizeof(single_value) / sizeof(ArkUI_NumberValue)};
    single_item.string = "A;B;C";
    nodeAPI->setAttribute(textPicker, NODE_TEXT_PICKER_OPTION_RANGE, &single_item);

    ArkUI_AttributeItem value_item = {};
    value_item.string = "B";
    auto ret = nodeAPI->setAttribute(textPicker, NODE_TEXT_PICKER_OPTION_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(textPicker, NODE_TEXT_PICKER_OPTION_VALUE)->string, "B");
    NAPI_END;
}

static napi_value TestTextPickerValue002(napi_env env, napi_callback_info info)
{
    NAPI_START(textPicker, ARKUI_NODE_TEXT_PICKER);
    ArkUI_NumberValue multi_value[] = {{.i32 = ARKUI_TEXTPICKER_RANGETYPE_MULTI}};
    ArkUI_AttributeItem multi_item = {multi_value, sizeof(multi_value) / sizeof(ArkUI_NumberValue)};
    multi_item.string = "A,B,C;A,B,C;A,B,C";
    nodeAPI->setAttribute(textPicker, NODE_TEXT_PICKER_OPTION_RANGE, &multi_item);

    ArkUI_AttributeItem value_item = {};
    value_item.string = "B;B;B";
    auto ret = nodeAPI->setAttribute(textPicker, NODE_TEXT_PICKER_OPTION_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(textPicker, NODE_TEXT_PICKER_OPTION_VALUE)->string, "B;B;B");
    NAPI_END;
}
} // namespace ArkUICapiTest
