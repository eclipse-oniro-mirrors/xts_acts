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

static ani_double TestCommonAttrsBlur001(ani_env* env, ani_object info)
{
    float value = PARAM_0;
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue saturate_value[] = {{.f32 = value}};
    ArkUI_AttributeItem saturate_item = {saturate_value, sizeof(saturate_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BLUR, &saturate_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BLUR)->value[PARAM_0].f32, value);
    NAPI_END;
}

static ani_double TestCommonAttrsBlur002(ani_env* env, ani_object info)
{
    float value = PARAM_30;
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue saturate_value[] = {{.f32 = value}};
    ArkUI_AttributeItem saturate_item = {saturate_value, sizeof(saturate_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BLUR, &saturate_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BLUR)->value[PARAM_0].f32, value);
    NAPI_END;
}

static ani_double TestCommonAttrsBlur003(ani_env* env, ani_object info)
{
    float value = PARAM_50;
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue saturate_value[] = {{.f32 = value}};
    ArkUI_AttributeItem saturate_item = {saturate_value, sizeof(saturate_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BLUR, &saturate_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BLUR)->value[PARAM_0].f32, value);
    NAPI_END;
}

static ani_double TestCommonAttrsBlur004(ani_env* env, ani_object info)
{
    float value = PARAM_100;
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue saturate_value[] = {{.f32 = value}};
    ArkUI_AttributeItem saturate_item = {saturate_value, sizeof(saturate_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BLUR, &saturate_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BLUR)->value[PARAM_0].f32, value);
    NAPI_END;
}

static ani_double TestCommonAttrsBlur005(ani_env* env, ani_object info)
{
    float value = PARAM_NEGATIVE_100;
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue saturate_value[] = {{.f32 = value}};
    ArkUI_AttributeItem saturate_item = {saturate_value, sizeof(saturate_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BLUR, &saturate_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BLUR)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}

static ani_double TestCommonAttrsBlur006(ani_env* env, ani_object info)
{
    float value = PARAM_100;
    NAPI_START(image, ARKUI_NODE_IMAGE);
    ArkUI_NumberValue saturate_value[] = {{.f32 = value}};
    ArkUI_AttributeItem saturate_item = {saturate_value, sizeof(saturate_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(image, NODE_BLUR, &saturate_item);
    auto ret = nodeAPI->resetAttribute(image, NODE_BLUR);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BLUR)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUIAniTest
