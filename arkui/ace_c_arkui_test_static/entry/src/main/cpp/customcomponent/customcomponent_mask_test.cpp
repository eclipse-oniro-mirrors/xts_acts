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

static ani_double TestCustomComponentMask001(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    uint32_t maskFillColor = 0xFFFF3333;
    uint32_t maskStrokeColor = 0xFF000000;
    float maskStrokeWidth = 1.00;
    int32_t maskType = ARKUI_MASK_TYPE_RECTANGLE;
    float maskRectangularWidth = 100.00;
    float maskRectangularHeight = 100.00;
    float maskRectangleRoundedWidth = 10.00;
    float maskRectangleRoundedHeight = 10.00;

    ArkUI_NumberValue value[] = {{.u32 = maskFillColor},
                                 {.u32 = maskStrokeColor},
                                 {.f32 = maskStrokeWidth},
                                 {.i32 = maskType},
                                 {.f32 = maskRectangularWidth},
                                 {.f32 = maskRectangularHeight},
                                 {.f32 = maskRectangleRoundedWidth},
                                 {.f32 = maskRectangleRoundedHeight}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_0].u32, maskFillColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_1].u32, maskStrokeColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskStrokeWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_3].i32, maskType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_4].f32, maskRectangularWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_5].f32, maskRectangularHeight);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_6].f32, maskRectangleRoundedWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_7].f32, maskRectangleRoundedHeight);
    NAPI_END;
}

static ani_double TestCustomComponentMask002(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    uint32_t maskFillColor = 0xFFFF3333;
    uint32_t maskStrokeColor = 0xFF000000;
    float maskStrokeWidth = 0.00;
    int32_t maskType = ARKUI_MASK_TYPE_RECTANGLE;
    float maskRectangularWidth = 0.00;
    float maskRectangularHeight = 0.00;
    float maskRectangleRoundedWidth = 0.00;
    float maskRectangleRoundedHeight = 0.00;

    ArkUI_NumberValue value[] = {{.u32 = maskFillColor},
                                 {.u32 = maskStrokeColor},
                                 {.f32 = maskStrokeWidth},
                                 {.i32 = maskType},
                                 {.f32 = maskRectangularWidth},
                                 {.f32 = maskRectangularHeight},
                                 {.f32 = maskRectangleRoundedWidth},
                                 {.f32 = maskRectangleRoundedHeight}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_0].u32, maskFillColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_1].u32, maskStrokeColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskStrokeWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_3].i32, maskType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_4].f32, maskRectangularWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_5].f32, maskRectangularHeight);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_6].f32, maskRectangleRoundedWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_7].f32, maskRectangleRoundedHeight);
    NAPI_END;
}

static ani_double TestCustomComponentMask003(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    uint32_t maskFillColor = 0xFFFF3333;
    uint32_t maskStrokeColor = 0xFF000000;
    float maskStrokeWidth = -1.00;
    int32_t maskType = ARKUI_MASK_TYPE_RECTANGLE;
    float maskRectangularWidth = -100.00;
    float maskRectangularHeight = -100.00;
    float maskRectangleRoundedWidth = -10.00;
    float maskRectangleRoundedHeight = -10.00;

    ArkUI_NumberValue value[] = {{.u32 = maskFillColor},
                                 {.u32 = maskStrokeColor},
                                 {.f32 = maskStrokeWidth},
                                 {.i32 = maskType},
                                 {.f32 = maskRectangularWidth},
                                 {.f32 = maskRectangularHeight},
                                 {.f32 = maskRectangleRoundedWidth},
                                 {.f32 = maskRectangleRoundedHeight}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(custom, NODE_MASK) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskStrokeWidth);
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_4].f32, maskRectangularWidth);
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_5].f32, maskRectangularHeight);
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_6].f32, maskRectangleRoundedWidth);
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_7].f32, maskRectangleRoundedHeight);
    }
    NAPI_END;
}

static ani_double TestCustomComponentMask004(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    uint32_t maskFillColor = 0xFFFF3333;
    uint32_t maskStrokeColor = 0xFF000000;
    float maskStrokeWidth = 1.00;
    int32_t maskType = ARKUI_MASK_TYPE_RECTANGLE;
    float maskRectangularWidth = 100.00;
    float maskRectangularHeight = 100.00;
    float maskRectangleRoundedWidth = 200.00;
    float maskRectangleRoundedHeight = 200.00;

    ArkUI_NumberValue value[] = {{.u32 = maskFillColor},
                                 {.u32 = maskStrokeColor},
                                 {.f32 = maskStrokeWidth},
                                 {.i32 = maskType},
                                 {.f32 = maskRectangularWidth},
                                 {.f32 = maskRectangularHeight},
                                 {.f32 = maskRectangleRoundedWidth},
                                 {.f32 = maskRectangleRoundedHeight}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_0].u32, maskFillColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_1].u32, maskStrokeColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskStrokeWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_3].i32, maskType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_4].f32, maskRectangularWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_5].f32, maskRectangularHeight);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_6].f32, maskRectangleRoundedWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_7].f32, maskRectangleRoundedHeight);
    NAPI_END;
}

static ani_double TestCustomComponentMask005(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    uint32_t maskFillColor = 0xFFFF3333;
    uint32_t maskStrokeColor = 0xFF000000;
    float maskStrokeWidth = 10.00;
    int32_t maskType = ARKUI_MASK_TYPE_CIRCLE;
    float maskCircularWidth = 100.00;
    float maskCircularHeight = 100.00;

    ArkUI_NumberValue value[] = {{.u32 = maskFillColor}, {.u32 = maskStrokeColor},   {.f32 = maskStrokeWidth},
                                 {.i32 = maskType},      {.f32 = maskCircularWidth}, {.f32 = maskCircularHeight}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_0].u32, maskFillColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_1].u32, maskStrokeColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskStrokeWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_3].i32, maskType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_4].f32, maskCircularWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_5].f32, maskCircularHeight);
    NAPI_END;
}

static ani_double TestCustomComponentMask006(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    uint32_t maskFillColor = 0xFFFF3333;
    uint32_t maskStrokeColor = 0xFF000000;
    float maskStrokeWidth = -10.00;
    int32_t maskType = ARKUI_MASK_TYPE_CIRCLE;
    float maskCircularWidth = -100.00;
    float maskCircularHeight = -100.00;

    ArkUI_NumberValue value[] = {{.u32 = maskFillColor}, {.u32 = maskStrokeColor},   {.f32 = maskStrokeWidth},
                                 {.i32 = maskType},      {.f32 = maskCircularWidth}, {.f32 = maskCircularHeight}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(custom, NODE_MASK) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskStrokeWidth);
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_4].f32, maskCircularWidth);
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_5].f32, maskCircularHeight);
    }
    NAPI_END;
}

static ani_double TestCustomComponentMask007(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    uint32_t maskFillColor = 0xFFFF3333;
    uint32_t maskStrokeColor = 0xFF000000;
    float maskStrokeWidth = 0.00;
    int32_t maskType = ARKUI_MASK_TYPE_CIRCLE;
    float maskCircularWidth = 0.00;
    float maskCircularHeight = 0.00;

    ArkUI_NumberValue value[] = {{.u32 = maskFillColor}, {.u32 = maskStrokeColor},   {.f32 = maskStrokeWidth},
                                 {.i32 = maskType},      {.f32 = maskCircularWidth}, {.f32 = maskCircularHeight}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_0].u32, maskFillColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_1].u32, maskStrokeColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskStrokeWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_3].i32, maskType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_4].f32, maskCircularWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_5].f32, maskCircularHeight);
    NAPI_END;
}

static ani_double TestCustomComponentMask008(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    uint32_t maskFillColor = 0xFFFF3333;
    uint32_t maskStrokeColor = 0xFF000000;
    float maskStrokeWidth = 10.00;
    int32_t maskType = ARKUI_MASK_TYPE_ELLIPSE;
    float maskEllipseWidth = 100.00;
    float maskEllipseHeight = 100.00;

    ArkUI_NumberValue value[] = {{.u32 = maskFillColor}, {.u32 = maskStrokeColor},  {.f32 = maskStrokeWidth},
                                 {.i32 = maskType},      {.f32 = maskEllipseWidth}, {.f32 = maskEllipseHeight}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_0].u32, maskFillColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_1].u32, maskStrokeColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskStrokeWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_3].i32, maskType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_4].f32, maskEllipseWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_5].f32, maskEllipseHeight);
    NAPI_END;
}

static ani_double TestCustomComponentMask009(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    uint32_t maskFillColor = 0xFFFF3333;
    uint32_t maskStrokeColor = 0xFF000000;
    float maskStrokeWidth = 0.00;
    int32_t maskType = ARKUI_MASK_TYPE_ELLIPSE;
    float maskEllipseWidth = 0.00;
    float maskEllipseHeight = 0.00;

    ArkUI_NumberValue value[] = {{.u32 = maskFillColor}, {.u32 = maskStrokeColor},  {.f32 = maskStrokeWidth},
                                 {.i32 = maskType},      {.f32 = maskEllipseWidth}, {.f32 = maskEllipseHeight}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_0].u32, maskFillColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_1].u32, maskStrokeColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskStrokeWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_3].i32, maskType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_4].f32, maskEllipseWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_5].f32, maskEllipseHeight);
    NAPI_END;
}

static ani_double TestCustomComponentMask010(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    uint32_t maskFillColor = 0xFFFF3333;
    uint32_t maskStrokeColor = 0xFF000000;
    float maskStrokeWidth = -10.00;
    int32_t maskType = ARKUI_MASK_TYPE_ELLIPSE;
    float maskEllipseWidth = -100.00;
    float maskEllipseHeight = -100.00;

    ArkUI_NumberValue value[] = {{.u32 = maskFillColor}, {.u32 = maskStrokeColor},  {.f32 = maskStrokeWidth},
                                 {.i32 = maskType},      {.f32 = maskEllipseWidth}, {.f32 = maskEllipseHeight}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(custom, NODE_MASK) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskStrokeWidth);
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_4].f32, maskEllipseWidth);
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_5].f32, maskEllipseHeight);
    }
    NAPI_END;
}

static ani_double TestCustomComponentMask011(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    uint32_t maskFillColor = 0xFFFF3333;
    uint32_t maskStrokeColor = 0xFF000000;
    float maskStrokeWidth = 10.00;
    int32_t maskType = ARKUI_MASK_TYPE_PATH;
    float maskPathWidth = 100.00;
    float maskPathHeight = 100.00;

    const char *path = "M0 0 H20 V20 H0 Z";
    ArkUI_NumberValue value[] = {{.u32 = maskFillColor}, {.u32 = maskStrokeColor}, {.f32 = maskStrokeWidth},
                                 {.i32 = maskType},      {.f32 = maskPathWidth},   {.f32 = maskPathHeight}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue), path};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_0].u32, maskFillColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_1].u32, maskStrokeColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskStrokeWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_3].i32, maskType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_4].f32, maskPathWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_5].f32, maskPathHeight);
    ASSERT_STREQ(nodeAPI->getAttribute(custom, NODE_MASK)->string, path);
    NAPI_END;
}

static ani_double TestCustomComponentMask012(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    uint32_t maskFillColor = 0xFFFF3333;
    uint32_t maskStrokeColor = 0xFF000000;
    float maskStrokeWidth = 0.00;
    int32_t maskType = ARKUI_MASK_TYPE_PATH;
    float maskPathWidth = 0.00;
    float maskPathHeight = 0.00;

    const char *path = "";
    ArkUI_NumberValue value[] = {{.u32 = maskFillColor}, {.u32 = maskStrokeColor}, {.f32 = maskStrokeWidth},
                                 {.i32 = maskType},      {.f32 = maskPathWidth},   {.f32 = maskPathHeight}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue), path};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_0].u32, maskFillColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_1].u32, maskStrokeColor);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskStrokeWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_3].i32, maskType);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_4].f32, maskPathWidth);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_5].f32, maskPathHeight);
    ASSERT_STREQ(nodeAPI->getAttribute(custom, NODE_MASK)->string, path);
    NAPI_END;
}

static ani_double TestCustomComponentMask013(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    uint32_t maskFillColor = 0xFFFF3333;
    uint32_t maskStrokeColor = 0xFF000000;
    float maskStrokeWidth = -10.00;
    int32_t maskType = ARKUI_MASK_TYPE_PATH;
    float maskPathWidth = -100.00;
    float maskPathHeight = -100.00;

    const char *path = "M0 0 H20 V20 H0 Z";
    ArkUI_NumberValue value[] = {{.u32 = maskFillColor}, {.u32 = maskStrokeColor}, {.f32 = maskStrokeWidth},
                                 {.i32 = maskType},      {.f32 = maskPathWidth},   {.f32 = maskPathHeight}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue), path};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(custom, NODE_MASK) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskStrokeWidth);
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_4].f32, maskPathWidth);
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_5].f32, maskPathHeight);
    }
    NAPI_END;
}

static ani_double TestCustomComponentMask014(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t maskType = ARKUI_MASK_TYPE_PROGRESS;
    float maskProgressCurrentValue = 50.00;
    float maskProgressMaxValue = 100.00;
    uint32_t maskProgressColor = 0xFF00FF00;

    ArkUI_NumberValue value[] = {{.i32 = maskType},
                                 {.f32 = maskProgressCurrentValue},
                                 {.f32 = maskProgressMaxValue},
                                 {.u32 = maskProgressColor}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(custom, NODE_MASK) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_0].i32, maskType);
        ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_1].f32, maskProgressCurrentValue);
        ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskProgressMaxValue);
        ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_3].u32, maskProgressColor);
    }
    NAPI_END;
}

static ani_double TestCustomComponentMask015(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t maskType = ARKUI_MASK_TYPE_PROGRESS;
    float maskProgressCurrentValue = 0.00;
    float maskProgressMaxValue = 0.00;
    uint32_t maskProgressColor = 0xFF00FF00;

    ArkUI_NumberValue value[] = {{.i32 = maskType},
                                 {.f32 = maskProgressCurrentValue},
                                 {.f32 = maskProgressMaxValue},
                                 {.u32 = maskProgressColor}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(custom, NODE_MASK) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_0].i32, maskType);
        ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_1].f32, maskProgressCurrentValue);
        ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskProgressMaxValue);
        ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_3].u32, maskProgressColor);
    }
    NAPI_END;
}

static ani_double TestCustomComponentMask016(ani_env* env, ani_object info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    int32_t maskType = ARKUI_MASK_TYPE_PROGRESS;
    float maskProgressCurrentValue = -50.00;
    float maskProgressMaxValue = -100.00;
    uint32_t maskProgressColor = 0xFF00FF00;

    ArkUI_NumberValue value[] = {{.i32 = maskType},
                                 {.f32 = maskProgressCurrentValue},
                                 {.f32 = maskProgressMaxValue},
                                 {.u32 = maskProgressColor}};

    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(custom, NODE_MASK, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(custom, NODE_MASK) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_0].i32, maskType);
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_1].f32, maskProgressCurrentValue);
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_2].f32, maskProgressMaxValue);
        ASSERT_NE(nodeAPI->getAttribute(custom, NODE_MASK)->value[PARAM_3].u32, maskProgressColor);
    }
    NAPI_END;
}
} // namespace ArkUIAniTest
