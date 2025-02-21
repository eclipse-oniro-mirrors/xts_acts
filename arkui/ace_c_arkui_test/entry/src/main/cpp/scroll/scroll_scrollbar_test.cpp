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

#define SUCCESS 0
#define ABNORMAL_PARAM 1000

namespace ArkUICapiTest {

static napi_value TestScrollScrollBar001(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE)->value[PARAM_0].i32,
              ARKUI_SCROLL_BAR_DISPLAY_MODE_AUTO);
    NAPI_END;
}

static napi_value TestScrollScrollBar002(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE)->value[PARAM_0].i32,
              ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF);
    NAPI_END;
}

static napi_value TestScrollScrollBar003(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SCROLL_BAR_DISPLAY_MODE_ON}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE)->value[PARAM_0].i32,
              ARKUI_SCROLL_BAR_DISPLAY_MODE_ON);
    NAPI_END;
}

static napi_value TestScrollScrollBar004(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    int32_t mode = ABNORMAL_PARAM;
    ArkUI_NumberValue value[] = {{.i32 = mode}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_DISPLAY_MODE)->value[PARAM_0].i32, mode);
    }
    NAPI_END;
}
} // namespace ArkUICapiTest
