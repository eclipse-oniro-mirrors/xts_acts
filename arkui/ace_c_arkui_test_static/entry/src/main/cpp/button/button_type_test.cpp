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

static ani_double TestButtonType001(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t  buttonType = ARKUI_BUTTON_TYPE_NORMAL;
    ArkUI_NumberValue  button_value[] = {{.i32 =  buttonType}};
    ArkUI_AttributeItem button_item = {button_value, sizeof(button_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_TYPE, &button_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_BUTTON_TYPE)->value[PARAM_0].i32, buttonType);
    NAPI_END;
}

static ani_double TestButtonType002(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t  buttonType = ARKUI_BUTTON_TYPE_CAPSULE;
    ArkUI_NumberValue  button_value[] = {{.i32 =  buttonType}};
    ArkUI_AttributeItem button_item = {button_value, sizeof(button_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_TYPE, &button_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_BUTTON_TYPE)->value[PARAM_0].i32, buttonType);
    NAPI_END;
}

static ani_double TestButtonType003(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t  buttonType = ARKUI_BUTTON_TYPE_CIRCLE;
    ArkUI_NumberValue  button_value[] = {{.i32 =  buttonType}};
    ArkUI_AttributeItem button_item = {button_value, sizeof(button_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_TYPE, &button_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_BUTTON_TYPE)->value[PARAM_0].i32, buttonType);
    NAPI_END;
}

static ani_double TestButtonType004(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t  buttonType = PARAM_3;
    ArkUI_NumberValue  button_value[] = {{.i32 =  buttonType}};
    ArkUI_AttributeItem button_item = {button_value, sizeof(button_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_TYPE, &button_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(button, NODE_BUTTON_TYPE)->value[PARAM_0].i32, buttonType);
    NAPI_END;
}

static ani_double TestButtonType005(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t  buttonType = PARAM_NEGATIVE_1;
    ArkUI_NumberValue  button_value[] = {{.i32 =  buttonType}};
    ArkUI_AttributeItem button_item = {button_value, sizeof(button_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_TYPE, &button_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(button, NODE_BUTTON_TYPE)->value[PARAM_0].i32, buttonType);
    NAPI_END;
}
} // namespace ArkUIAniTest
