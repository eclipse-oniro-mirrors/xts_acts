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
#include "ani/ani.h"
#include "common/common.h"
#define INT_20 20
#define INT_40 40

namespace ArkUIAniTest {

static ani_double columnBackDropBlurTest001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NumberValue valueTextBlur002[] = { {.f32 = 20}, {.f32 = 40}, {.f32 = 0} }; // 模糊半径、灰阶参数
    ArkUI_AttributeItem itemTextBlur001 = {valueTextBlur002, sizeof(valueTextBlur002)/sizeof(ArkUI_NumberValue)};
    auto res1_backdropBlur001 = nodeAPI->setAttribute(column, NODE_BACKDROP_BLUR, &itemTextBlur001); // 设置背景模糊
    ASSERT_EQ(res1_backdropBlur001, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKDROP_BLUR)->value[PARAM_0].f32, INT_20);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKDROP_BLUR)->value[PARAM_1].f32, INT_40);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_BACKDROP_BLUR)->value[PARAM_2].f32, 0);
    NAPI_END;
}

}