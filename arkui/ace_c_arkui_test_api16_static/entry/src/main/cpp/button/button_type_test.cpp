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

static ani_double TestButtonType006(ani_env* env, ani_object info)
{
    OH_LOG_INFO(LOG_APP, " TestButtonType006 -> 1");
    NAPI_START(button, ARKUI_NODE_BUTTON);
    OH_LOG_INFO(LOG_APP, " TestButtonType006 -> 2");
    ArkUI_AttributeItem button_item = {};
    auto ret = nodeAPI->setAttribute(button, NODE_BUTTON_TYPE, &button_item);
    OH_LOG_INFO(LOG_APP, " TestButtonType006 -> 3");
    ASSERT_EQ(ret, INVALID_PARAM);
    OH_LOG_INFO(LOG_APP, " TestButtonType006 -> 4");
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_BUTTON_TYPE)->value[PARAM_0].i32, PARAM_8);
    OH_LOG_INFO(LOG_APP, " TestButtonType006 -> 5");
    NAPI_END;
    OH_LOG_INFO(LOG_APP, " TestButtonType006 -> 6");
}

static ani_double TestButtonType007(ani_env* env, ani_object info)
{
    NAPI_START(button, ARKUI_NODE_BUTTON);
    int32_t  buttonType = ARKUI_BUTTON_TYPE_NORMAL;
    ArkUI_NumberValue  button_value[] = {{.i32 =  buttonType}};
    ArkUI_AttributeItem button_item = {button_value, sizeof(button_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_BUTTON_TYPE, &button_item);
    auto ret = nodeAPI->resetAttribute(button, NODE_BUTTON_TYPE);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(button, NODE_BUTTON_TYPE)->value[PARAM_0].i32, PARAM_8);
    NAPI_END;
}
} // namespace ArkUIAniTest
