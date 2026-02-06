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

#define SUCCESS 0
#define ABNORMAL_PARAM 1000

namespace ArkUIAniTest {

static ani_double TestScrollScrollAble001(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SCROLL_DIRECTION_VERTICAL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION)->value[PARAM_0].i32,
              ARKUI_SCROLL_DIRECTION_VERTICAL);
    NAPI_END;
}

static ani_double TestScrollScrollAble002(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SCROLL_DIRECTION_HORIZONTAL}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION)->value[PARAM_0].i32,
              ARKUI_SCROLL_DIRECTION_HORIZONTAL);
    NAPI_END;
}

static ani_double TestScrollScrollAble003(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SCROLL_DIRECTION_NONE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION)->value[PARAM_0].i32,
              ARKUI_SCROLL_DIRECTION_NONE);
    NAPI_END;
}

static ani_double TestScrollScrollAble004(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    int32_t mode = ABNORMAL_PARAM;
    ArkUI_NumberValue value[] = {{.i32 = mode}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_SCROLL_SCROLL_DIRECTION)->value[PARAM_0].i32, mode);
    }
    NAPI_END;
}
} // namespace ArkUIAniTest
