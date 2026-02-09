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

#define FIRST_RADIUS_VALUE 5.0
#define SECOND_RADIUS_VALUE 15.0
#define THIRD_RADIUS_VALUE 35.0
#define FIRST_LEFTTOP_RADIUS_VALUE 5.0
#define FIRST_RIGHTTOP_RADIUS_VALUE 8.0
#define FIRST_RIGHTBOTTOM_RADIUS_VALUE 10.0
#define FIRST_LEFTBOTTOM_RADIUS_VALUE 12.0
#define SECOND_LEFTTOP_RADIUS_VALUE 15.0
#define SECOND_RIGHTTOP_RADIUS_VALUE 16.0
#define SECOND_RIGHTBOTTOM_RADIUS_VALUE 17.0
#define SECOND_LEFTBOTTOM_RADIUS_VALUE 18.0
#define ABNORMAL_VALUE (-10.0)

namespace ArkUIAniTest {

static ani_double TestImageBorderRadius001(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderRadius = FIRST_RADIUS_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = borderRadius}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_RADIUS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadius);
    NAPI_END;
}

static ani_double TestImageBorderRadius002(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderRadius = SECOND_RADIUS_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = borderRadius}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_RADIUS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadius);
    NAPI_END;
}

static ani_double TestImageBorderRadius003(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderRadius = THIRD_RADIUS_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = borderRadius}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_RADIUS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadius);
    NAPI_END;
}

static ani_double TestImageBorderRadius004(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderRadiusLeftTop = FIRST_LEFTTOP_RADIUS_VALUE;
    float borderRadiusRightTop = FIRST_RIGHTTOP_RADIUS_VALUE;
    float borderRadiusLeftBottom = FIRST_RIGHTBOTTOM_RADIUS_VALUE;
    float borderRadiusRightBottom = FIRST_LEFTBOTTOM_RADIUS_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = borderRadiusLeftTop},
                                 {.f32 = borderRadiusRightTop},
                                 {.f32 = borderRadiusLeftBottom},
                                 {.f32 = borderRadiusRightBottom}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_RADIUS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadiusLeftTop);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadiusRightTop);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadiusLeftBottom);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadiusRightBottom);
    NAPI_END;
}

static ani_double TestImageBorderRadius005(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderRadiusLeftTop = SECOND_LEFTTOP_RADIUS_VALUE;
    float borderRadiusRightTop = SECOND_RIGHTTOP_RADIUS_VALUE;
    float borderRadiusLeftBottom = SECOND_RIGHTBOTTOM_RADIUS_VALUE;
    float borderRadiusRightBottom = SECOND_LEFTBOTTOM_RADIUS_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = borderRadiusLeftTop},
                                 {.f32 = borderRadiusRightTop},
                                 {.f32 = borderRadiusLeftBottom},
                                 {.f32 = borderRadiusRightBottom}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_RADIUS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadiusLeftTop);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadiusRightTop);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadiusLeftBottom);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadiusRightBottom);
    NAPI_END;
}

static ani_double TestImageBorderRadius006(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderRadiusLeftTop = THIRD_RADIUS_VALUE;
    float borderRadiusRightTop = THIRD_RADIUS_VALUE;
    float borderRadiusLeftBottom = THIRD_RADIUS_VALUE;
    float borderRadiusRightBottom = THIRD_RADIUS_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = borderRadiusLeftTop},
                                 {.f32 = borderRadiusRightTop},
                                 {.f32 = borderRadiusLeftBottom},
                                 {.f32 = borderRadiusRightBottom}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_RADIUS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadiusLeftTop);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadiusRightTop);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadiusLeftBottom);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadiusRightBottom);
    NAPI_END;
}

static ani_double TestImageBorderRadius007(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderRadius = ABNORMAL_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = borderRadius}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_RADIUS, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(image, NODE_BORDER_RADIUS) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadius);
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadius);
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadius);
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadius);
    }

    NAPI_END;
}

static ani_double TestImageBorderRadius008(ani_env* env, ani_object info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderRadiusLeftTop = ABNORMAL_VALUE;
    float borderRadiusRightTop = ABNORMAL_VALUE;
    float borderRadiusLeftBottom = ABNORMAL_VALUE;
    float borderRadiusRightBottom = ABNORMAL_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = borderRadiusLeftTop},
                                 {.f32 = borderRadiusRightTop},
                                 {.f32 = borderRadiusLeftBottom},
                                 {.f32 = borderRadiusRightBottom}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_RADIUS, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(image, NODE_BORDER_RADIUS) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadiusLeftTop);
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadiusRightTop);
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadiusLeftBottom);
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadiusRightBottom);
    }

    NAPI_END;
}

} // namespace ArkUIAniTest
