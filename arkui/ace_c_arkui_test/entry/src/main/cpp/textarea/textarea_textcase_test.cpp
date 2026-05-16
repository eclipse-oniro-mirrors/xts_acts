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

#define COLOR_RED 0xFFFF0000

namespace ArkUICapiTest {

/*
 * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_TESTCASE_0100
 * @tc.name: testTextAreaTestCase001
 * @tc.desc: testing caretColor for textArea with normal value
 * @tc.size: MediumTest
 * @tc.type: Function
 * @tc.level: Level 1
 */
static napi_value TestTextAreaTestCase001(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXT_CASE_NORMAL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_CARET_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_CARET_COLOR)->value[PARAM_0].i32, ARKUI_TEXT_CASE_NORMAL);
    NAPI_END;
}

/*
 * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_TESTCASE_0200
 * @tc.name: testTextAreaTestCase002
 * @tc.desc: testing caretColor for textArea with normal value
 * @tc.size: MediumTest
 * @tc.type: Function
 * @tc.level: Level 1
 */
static napi_value TestTextAreaTestCase002(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXT_CASE_LOWER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_CARET_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_CARET_COLOR)->value[PARAM_0].i32, ARKUI_TEXT_CASE_LOWER);
    NAPI_END;
}

/*
 * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_TESTCASE_0300
 * @tc.name: testTextAreaTestCase003
 * @tc.desc: testing caretColor for textArea with normal value
 * @tc.size: MediumTest
 * @tc.type: Function
 * @tc.level: Level 1
 */
static napi_value TestTextAreaTestCase003(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXT_CASE_UPPER}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_CARET_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_CARET_COLOR)->value[PARAM_0].i32, ARKUI_TEXT_CASE_UPPER);
    NAPI_END;
}
} // namespace ArkUICapiTest
