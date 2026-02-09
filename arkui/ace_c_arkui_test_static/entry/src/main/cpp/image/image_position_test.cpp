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

static ani_double TestImagePosition001(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float positionX = 10;
    float positionY = 10;

    ArkUI_NumberValue value[] = {{.f32 = positionX}, {.f32 = positionY}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_POSITION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_POSITION)->value[PARAM_0].f32, positionX);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_POSITION)->value[PARAM_1].f32, positionY);
    NAPI_END;
}

static ani_double TestImagePosition002(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float positionX = -10;
    float positionY = -10;

    ArkUI_NumberValue value[] = {{.f32 = positionX}, {.f32 = positionY}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_POSITION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_POSITION)->value[PARAM_0].f32, positionX);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_POSITION)->value[PARAM_1].f32, positionY);
    NAPI_END;
}

} // namespace ArkUIAniTest
