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

#define STR_TEXT  "content_test_with_no_meaning"

namespace ArkUICapiTest {

static napi_value TestTextContent001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_AttributeItem valueItem = {};
    valueItem.string = STR_TEXT;
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_TEXT_CONTENT)->string, STR_TEXT);
    
    NAPI_END;
}

static napi_value TestTextContent002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);

    ArkUI_NumberValue value[] = { { .i32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);

    NAPI_END;
}

} // namespace ArkUICapiTest