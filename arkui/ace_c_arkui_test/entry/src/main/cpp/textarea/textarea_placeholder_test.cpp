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

#define DEFAULT_TEXT  "please input here ..."

namespace ArkUICapiTest {

    static napi_value TestTextAreaPlaceholder001(napi_env env, napi_callback_info info)
    {
        NAPI_START(textarea, ARKUI_NODE_TEXT_AREA);

        ArkUI_AttributeItem valueItem = {};
        valueItem.string = DEFAULT_TEXT;
        auto ret = nodeAPI->setAttribute(textarea, NODE_TEXT_AREA_PLACEHOLDER, &valueItem);
        ASSERT_EQ(ret, SUCCESS);
        ASSERT_STREQ(nodeAPI->getAttribute(textarea, NODE_TEXT_AREA_PLACEHOLDER)->string, DEFAULT_TEXT);
        
        NAPI_END;
    }
}