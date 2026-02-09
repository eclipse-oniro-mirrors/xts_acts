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
#include <cfloat>

#define DEFAULT_VALUE 1.0
#define MIN_VALUE 0.0
#define FIRST_MIDDLE_VALUE 5.0
#define SECOND_MIDDLE_VALUE 20.0
#define MIN_ABNORMAL_VALUE (-1.0)

namespace ArkUIAniTest {

static ani_double TestImageSaturate001(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float saturateValue = MIN_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = saturateValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_SATURATION)->value[PARAM_0].f32, saturateValue);
    NAPI_END;
}

static ani_double TestImageSaturate002(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float saturateValue = DEFAULT_VALUE;
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_SATURATION)->value[PARAM_0].f32, saturateValue);
    NAPI_END;
}

static ani_double TestImageSaturate003(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float saturateValue = FIRST_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = saturateValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_SATURATION)->value[PARAM_0].f32, saturateValue);
    NAPI_END;
}

static ani_double TestImageSaturate004(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float saturateValue = SECOND_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = saturateValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_SATURATION)->value[PARAM_0].f32, saturateValue);
    NAPI_END;
}

static ani_double TestImageSaturate005(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float saturateValue = SIZE_50;
    ArkUI_NumberValue value[] = {{.f32 = saturateValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_SATURATION)->value[PARAM_0].f32, saturateValue);
    NAPI_END;
}

static ani_double TestImageSaturate006(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float saturateValue = MIN_ABNORMAL_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = saturateValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(image, NODE_SATURATION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_SATURATION)->value[PARAM_0].f32, saturateValue);
    }
    NAPI_END;
}

static ani_double TestImageSaturate007(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float saturateValue = SIZE_50 + PARAM_1;
    ArkUI_NumberValue value[] = {{.f32 = saturateValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_SATURATION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(image, NODE_SATURATION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_SATURATION)->value[PARAM_0].f32, saturateValue);
    }
    NAPI_END;
}

} // namespace ArkUIAniTest
