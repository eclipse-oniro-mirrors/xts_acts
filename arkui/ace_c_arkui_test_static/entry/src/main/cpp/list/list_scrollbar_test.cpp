/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double TestListScrollBar001(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t scrollBar = ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF;
    ArkUI_NumberValue value[] = {{.i32 = scrollBar}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_BAR_DISPLAY_MODE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_BAR_DISPLAY_MODE)->value[PARAM_0].i32, scrollBar);
    NAPI_END;
}

static ani_double TestListScrollBar002(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t scrollBar = ARKUI_SCROLL_BAR_DISPLAY_MODE_AUTO;
    auto listDefault = nodeAPI->createNode(ARKUI_NODE_LIST);
    ASSERT_EQ(nodeAPI->getAttribute(listDefault, NODE_SCROLL_BAR_DISPLAY_MODE)->value[PARAM_0].i32, scrollBar);
    NAPI_END;
}

static ani_double TestListScrollBar003(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t scrollBar = ARKUI_SCROLL_BAR_DISPLAY_MODE_ON;
    ArkUI_NumberValue value[] = {{.i32 = scrollBar}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_BAR_DISPLAY_MODE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_BAR_DISPLAY_MODE)->value[PARAM_0].i32, scrollBar);
    NAPI_END;
}

static ani_double TestListScrollBar004(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t scrollBar = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = scrollBar}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_BAR_DISPLAY_MODE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(list, NODE_SCROLL_BAR_DISPLAY_MODE)->value[PARAM_0].i32, scrollBar);
    NAPI_END;
}

} // namespace ArkUIAniTest
