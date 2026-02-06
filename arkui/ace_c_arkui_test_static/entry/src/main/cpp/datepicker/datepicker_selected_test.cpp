/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double TestDatePickerSelected001(ani_env* env, ani_object info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {.string = "2024-5-1"};
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_SELECTED, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_SELECTED)->string, "2024-5-1");
    NAPI_END;
}

static ani_double TestDatePickerSelected002(ani_env* env, ani_object info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {.string = ""};
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_SELECTED, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_STRNE(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_SELECTED)->string, "");
    NAPI_END;
}

static ani_double TestDatePickerSelected003(ani_env* env, ani_object info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {.string = "1111-1-1"};
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_SELECTED, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STRNE(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_SELECTED)->string, "1111-1-1");
    NAPI_END;
}

static ani_double TestDatePickerSelected004(ani_env* env, ani_object info)
{
    NAPI_START(datePicker, ARKUI_NODE_DATE_PICKER);
    ArkUI_AttributeItem value_item = {.string = "9999-1-1"};
    auto ret = nodeAPI->setAttribute(datePicker, NODE_DATE_PICKER_SELECTED, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STRNE(nodeAPI->getAttribute(datePicker, NODE_DATE_PICKER_SELECTED)->string, "9999-1-1");
    NAPI_END;
}
} // namespace ArkUIAniTest
