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

#include "commonattrs_touchable_test.h"

namespace ArkUIAniTest {

static ani_double TestCommonAttrsTouchable002(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t touchable = false;
    ArkUI_NumberValue value[] = {{.i32 = touchable}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ENABLED, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ENABLED)->value[PARAM_0].i32, touchable);
    NAPI_END;
}

static ani_double TestCommonAttrsTouchable003(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t touchable = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = touchable}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_ENABLED, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsTouchable004(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t touchable = false;
    ArkUI_NumberValue value[] = {{.i32 = touchable}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_ENABLED, &value_item);
    auto ret = nodeAPI->resetAttribute(button, NODE_ENABLED);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_ENABLED)->value[PARAM_0].i32, true);
    NAPI_END;
}
} // namespace ArkUIAniTest
