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
#define SS01_OFF "\"ss01\" off"
#define SS01_ON "\"ss01\" on"
namespace ArkUICapiTest {

static napi_value TestTextAreaFontFeature001(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem value_item = {};
    value_item.string = SS01_OFF;
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_FEATURE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextAreaFontFeature002(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem value_item = {};
    value_item.string = SS01_ON;
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_FEATURE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextAreaFontFeature003(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem value_item = {};
    value_item.string = nullptr;
    auto ret = nodeAPI->setAttribute(textArea, NODE_FONT_FEATURE, &value_item);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
} // namespace ArkUICapiTest
