/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

namespace ArkUICapiTest {

static napi_value TestSwiperClip001(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float clipRectWidth = 20;
    float clipRectHeight = 20;
    float clipRectRoundedWidth = 3;
    float clipRectRoundedHeight = 3;
    ArkUI_NumberValue clip_value[] = {{.i32 = ARKUI_CLIP_TYPE_RECTANGLE},
                                      {.f32 = clipRectWidth},
                                      {.f32 = clipRectHeight},
                                      {.f32 = clipRectRoundedWidth},
                                      {.f32 = clipRectRoundedHeight}};
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP_SHAPE, &clip_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_RECTANGLE);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_1].f32, clipRectWidth);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_2].f32, clipRectHeight);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_3].f32, clipRectRoundedWidth);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_4].f32, clipRectRoundedHeight);
    NAPI_END;
}

static napi_value TestSwiperClip002(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float clipRectWidth = -20;
    float clipRectHeight = -20;
    float clipRectRoundedWidth = -3;
    float clipRectRoundedHeight = -3;
    ArkUI_NumberValue clip_value[] = {{.i32 = ARKUI_CLIP_TYPE_RECTANGLE},
                                      {.f32 = clipRectWidth},
                                      {.f32 = clipRectHeight},
                                      {.f32 = clipRectRoundedWidth},
                                      {.f32 = clipRectRoundedHeight}};
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP_SHAPE, &clip_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_RECTANGLE);
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_1].f32, clipRectWidth);
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_2].f32, clipRectHeight);
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_3].f32, clipRectRoundedWidth);
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_4].f32, clipRectRoundedHeight);
    }
    NAPI_END;
}

static napi_value TestSwiperClip003(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float clipRectWidth = 30000;
    float clipRectHeight = 30000;
    float clipRectRoundedWidth = 10000;
    float clipRectRoundedHeight = 10000;
    ArkUI_NumberValue clip_value[] = {{.i32 = ARKUI_CLIP_TYPE_RECTANGLE},
                                      {.f32 = clipRectWidth},
                                      {.f32 = clipRectHeight},
                                      {.f32 = clipRectRoundedWidth},
                                      {.f32 = clipRectRoundedHeight}};
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP_SHAPE, &clip_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_RECTANGLE);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_1].f32, clipRectWidth);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_2].f32, clipRectHeight);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_3].f32, clipRectRoundedWidth);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_4].f32, clipRectRoundedHeight);
    NAPI_END;
}

static napi_value TestSwiperClip004(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float clipCircleWidth = 20;
    float clipCircleHeight = 20;
    ArkUI_NumberValue clip_value[] = {
        {.i32 = ARKUI_CLIP_TYPE_CIRCLE}, {.f32 = clipCircleWidth}, {.f32 = clipCircleHeight}};
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP_SHAPE, &clip_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_CIRCLE);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_1].f32, clipCircleWidth);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_2].f32, clipCircleHeight);
    NAPI_END;
}

static napi_value TestSwiperClip005(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float clipCircleWidth = -20;
    float clipCircleHeight = -20;
    ArkUI_NumberValue clip_value[] = {
        {.i32 = ARKUI_CLIP_TYPE_CIRCLE}, {.f32 = clipCircleWidth}, {.f32 = clipCircleHeight}};
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP_SHAPE, &clip_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_CIRCLE);
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_1].f32, clipCircleWidth);
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_2].f32, clipCircleHeight);
    }
    NAPI_END;
}

static napi_value TestSwiperClip006(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float clipCircleWidth = 10000;
    float clipCircleHeight = 10000;
    ArkUI_NumberValue clip_value[] = {
        {.i32 = ARKUI_CLIP_TYPE_CIRCLE}, {.f32 = clipCircleWidth}, {.f32 = clipCircleHeight}};
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP_SHAPE, &clip_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_CIRCLE);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_1].f32, clipCircleWidth);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_2].f32, clipCircleHeight);
    NAPI_END;
}

static napi_value TestSwiperClip007(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float clipEllipseWidth = 35;
    float clipEllipseHeight = 20;
    ArkUI_NumberValue clip_value[] = {
        {.i32 = ARKUI_CLIP_TYPE_ELLIPSE}, {.f32 = clipEllipseWidth}, {.f32 = clipEllipseHeight}};
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP_SHAPE, &clip_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_ELLIPSE);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_1].f32, clipEllipseWidth);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_2].f32, clipEllipseHeight);
    NAPI_END;
}

static napi_value TestSwiperClip008(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float clipEllipseWidth = -35;
    float clipEllipseHeight = -20;
    ArkUI_NumberValue clip_value[] = {
        {.i32 = ARKUI_CLIP_TYPE_ELLIPSE}, {.f32 = clipEllipseWidth}, {.f32 = clipEllipseHeight}};
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP_SHAPE, &clip_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_ELLIPSE);
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_1].f32, clipEllipseWidth);
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_2].f32, clipEllipseHeight);
    }
    NAPI_END;
}

static napi_value TestSwiperClip009(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float clipEllipseWidth = 20000;
    float clipEllipseHeight = 10000;
    ArkUI_NumberValue clip_value[] = {
        {.i32 = ARKUI_CLIP_TYPE_ELLIPSE}, {.f32 = clipEllipseWidth}, {.f32 = clipEllipseHeight}};
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP_SHAPE, &clip_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_ELLIPSE);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_1].f32, clipEllipseWidth);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_2].f32, clipEllipseHeight);
    NAPI_END;
}

static napi_value TestSwiperClip010(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float clipPathWidth = 35;
    float clipPathHeight = 20;
    ArkUI_NumberValue clip_value[] = {{.i32 = ARKUI_CLIP_TYPE_PATH}, {.f32 = clipPathWidth}, {.f32 = clipPathHeight}};
    const char *path = "M0 0 H20 V20 H0 Z";
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue), path};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP_SHAPE, &clip_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_PATH);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_1].f32, clipPathWidth);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_2].f32, clipPathHeight);
    ASSERT_STREQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->string, path);
    NAPI_END;
}

static napi_value TestSwiperClip011(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float clipPathWidth = -35;
    float clipPathHeight = -20;
    ArkUI_NumberValue clip_value[] = {{.i32 = ARKUI_CLIP_TYPE_PATH}, {.f32 = clipPathWidth}, {.f32 = clipPathHeight}};
    const char *path = "";
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue), path};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP_SHAPE, &clip_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE) != nullptr &&
        nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value != nullptr &&
        nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->string != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_PATH);
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_1].f32, clipPathWidth);
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_2].f32, clipPathHeight);
        ASSERT_STRNE(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->string, path);
    }
    NAPI_END;
}

static napi_value TestSwiperClip012(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float clipPathWidth = 10000;
    float clipPathHeight = 10000;
    ArkUI_NumberValue clip_value[] = {{.i32 = ARKUI_CLIP_TYPE_PATH}, {.f32 = clipPathWidth}, {.f32 = clipPathHeight}};
    const char *path = "M0 0 H20 V20 H0 Z";
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue), path};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP_SHAPE, &clip_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_0].i32, ARKUI_CLIP_TYPE_PATH);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_1].f32, clipPathWidth);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->value[PARAM_2].f32, clipPathHeight);
    ASSERT_STREQ(nodeAPI->getAttribute(swiper, NODE_CLIP_SHAPE)->string, path);
    NAPI_END;
}

static napi_value TestSwiperClip013(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t clipBool = 1;
    ArkUI_NumberValue clip_value[] = {{.i32 = clipBool}};
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP, &clip_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP)->value[PARAM_0].i32, clipBool);
    NAPI_END;
}

static napi_value TestSwiperClip014(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t clipBool = 0;
    ArkUI_NumberValue clip_value[] = {{.i32 = clipBool}};
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP, &clip_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_CLIP)->value[PARAM_0].i32, clipBool);
    NAPI_END;
}

static napi_value TestSwiperClip015(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t clipBool = -1;
    ArkUI_NumberValue clip_value[] = {{.i32 = clipBool}};
    ArkUI_AttributeItem clip_item = {clip_value, sizeof(clip_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_CLIP, &clip_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(swiper, NODE_CLIP) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_CLIP)->value[PARAM_0].i32, clipBool);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
