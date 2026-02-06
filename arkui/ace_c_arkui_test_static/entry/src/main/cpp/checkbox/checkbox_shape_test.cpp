/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "ani/ani.h"

#include "common/common.h"
namespace ArkUIAniTest {

static ani_double TestCheckboxShape001(ani_env* env, ani_object info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    int32_t shape = ArkUI_CHECKBOX_SHAPE_ROUNDED_SQUARE;
    ArkUI_NumberValue shape_value[] = {{.i32 = shape}};
    ArkUI_AttributeItem shape_item = {shape_value, sizeof(shape_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(checkbox, NODE_CHECKBOX_SHAPE, &shape_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_SHAPE)->value[PARAM_0].i32, shape);
    NAPI_END;
}

static ani_double TestCheckboxShape002(ani_env* env, ani_object info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    int32_t shape = ArkUI_CHECKBOX_SHAPE_CIRCLE;
    ArkUI_NumberValue shape_value[] = {{.i32 = shape}};
    ArkUI_AttributeItem shape_item = {shape_value, sizeof(shape_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(checkbox, NODE_CHECKBOX_SHAPE, &shape_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_SHAPE)->value[PARAM_0].i32, shape);
    NAPI_END;
}

static ani_double TestCheckboxShape003(ani_env* env, ani_object info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_SHAPE)->value[PARAM_0].i32, ArkUI_CHECKBOX_SHAPE_CIRCLE);
    NAPI_END;
}

} // namespace ArkUIAniTest