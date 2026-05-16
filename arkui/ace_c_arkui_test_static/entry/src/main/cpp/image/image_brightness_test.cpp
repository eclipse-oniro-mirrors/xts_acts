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

#define DEFAULT_VALUE (1.0)
#define MIN_VALUE (0.0)
#define MAX_VALUE (2.0)
#define FIRST_MIDDLE_VALUE (0.5)
#define SECOND_MIDDLE_VALUE (1.5)
#define MIN_ABNORMAL_VALUE (-1.0)
#define MAX_ABNORMAL_VALUE (3.0)

namespace ArkUIAniTest {

static ani_double TestImageBrightness001(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float brightnessValue = MIN_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BRIGHTNESS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static ani_double TestImageBrightness002(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float brightnessValue = FIRST_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BRIGHTNESS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static ani_double TestImageBrightness003(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float brightnessValue = DEFAULT_VALUE;
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static ani_double TestImageBrightness004(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float brightnessValue = SECOND_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BRIGHTNESS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static ani_double TestImageBrightness005(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float brightnessValue = MAX_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BRIGHTNESS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

} // namespace ArkUIAniTest
