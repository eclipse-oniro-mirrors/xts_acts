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

static napi_value TestTextFontFamily001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem valueItem = {};
    valueItem.string = "HarmonyOS Sans";
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_FAMILY, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_STREQ(nodeAPI->getAttribute(text, NODE_FONT_FAMILY)->string, "HarmonyOS Sans");
    NAPI_END;
}

} // namespace ArkUICapiTest
