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

#define ENUM_ABNORMAL_VALUE 500

static ani_double TestCustomComponentDirection001(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t direction = ARKUI_DIRECTION_LTR;
    ArkUI_NumberValue value[] = {{.i32 = direction}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_DIRECTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_DIRECTION)->value[PARAM_0].u32, direction);
    NAPI_END;
}

static ani_double TestCustomComponentDirection002(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t direction = ARKUI_DIRECTION_RTL;
    ArkUI_NumberValue value[] = {{.i32 = direction}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_DIRECTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_DIRECTION)->value[PARAM_0].u32, direction);
    NAPI_END;
}

static ani_double TestCustomComponentDirection003(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t direction = ARKUI_DIRECTION_AUTO;
    ArkUI_NumberValue value[] = {{.i32 = direction}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_DIRECTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_DIRECTION)->value[PARAM_0].u32, direction);
    NAPI_END;
}

static ani_double TestCustomComponentDirection004(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t direction = ARKUI_DIRECTION_AUTO;
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_DIRECTION)->value[PARAM_0].u32, direction);
    NAPI_END;
}

static ani_double TestCustomComponentDirection005(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t direction = ENUM_ABNORMAL_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = direction}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_DIRECTION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(custom, NODE_DIRECTION)->value[PARAM_0].u32, direction);
    NAPI_END;
}

} // namespace ArkUIAniTest
