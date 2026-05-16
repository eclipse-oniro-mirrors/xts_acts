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

static napi_value TestDatePickerStart001(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_START)->string, "1970-1-1");
    NAPI_END;
}

static napi_value TestDatePickerStart002(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);

    ArkUI_AttributeItem value_item = {.string = "2024-1-1"};
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_START, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_START)->string, "2024-1-1");
    NAPI_END;
}

static napi_value TestDatePickerStart003(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);

    ArkUI_AttributeItem value_item = {.string = "1111-1-1"};
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_START, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STRNE(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_START)->string, "1111-1-1");
    NAPI_END;
}

static napi_value TestDatePickerStart004(napi_env env, napi_callback_info info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);

    ArkUI_AttributeItem value_item = {.string = "9999-1-1"};
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_START, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STRNE(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_START)->string, "9999-1-1");
    NAPI_END;
}
} // namespace ArkUICapiTest
