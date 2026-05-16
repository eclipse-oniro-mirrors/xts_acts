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

static ani_double TestImageShadow001(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t shadowValue = ArkUI_ShadowStyle::ARKUI_SHADOW_STYLE_OUTER_DEFAULT_XS;
    ArkUI_NumberValue value[] = {{.i32 = shadowValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_SHADOW)->value[PARAM_0].i32, shadowValue);
    NAPI_END;
}

static ani_double TestImageShadow002(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t shadowValue = ArkUI_ShadowStyle::ARKUI_SHADOW_STYLE_OUTER_DEFAULT_SM;
    ArkUI_NumberValue value[] = {{.i32 = shadowValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_SHADOW)->value[PARAM_0].i32, shadowValue);
    NAPI_END;
}

static ani_double TestImageShadow003(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t shadowValue = ArkUI_ShadowStyle::ARKUI_SHADOW_STYLE_OUTER_DEFAULT_MD;
    ArkUI_NumberValue value[] = {{.i32 = shadowValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_SHADOW)->value[PARAM_0].i32, shadowValue);
    NAPI_END;
}

static ani_double TestImageShadow004(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t shadowValue = ArkUI_ShadowStyle::ARKUI_SHADOW_STYLE_OUTER_DEFAULT_LG;
    ArkUI_NumberValue value[] = {{.i32 = shadowValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_SHADOW)->value[PARAM_0].i32, shadowValue);
    NAPI_END;
}

static ani_double TestImageShadow005(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t shadowValue = ArkUI_ShadowStyle::ARKUI_SHADOW_STYLE_OUTER_FLOATING_SM;
    ArkUI_NumberValue value[] = {{.i32 = shadowValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_SHADOW)->value[PARAM_0].i32, shadowValue);
    NAPI_END;
}

static ani_double TestImageShadow006(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t shadowValue = ArkUI_ShadowStyle::ARKUI_SHADOW_STYLE_OUTER_FLOATING_MD;
    ArkUI_NumberValue value[] = {{.i32 = shadowValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_SHADOW)->value[PARAM_0].i32, shadowValue);
    NAPI_END;
}

} // namespace ArkUIAniTest
