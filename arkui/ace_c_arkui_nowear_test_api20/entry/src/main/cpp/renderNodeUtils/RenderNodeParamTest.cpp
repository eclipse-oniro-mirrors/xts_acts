/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/common.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <hilog/log.h>

#define NUMBER_N_100000000 (-100000000)
#define NUMBER_N_100000001 (-100000001)
#define NUMBER_N_1 (-1)
#define NUMBER_100000000 100000000
#define NUMBER_100000001 100000001
#define NUMBER_2147483647 2147483647
#define NUMBER_2147483648 2147483648
#define NUMBER_100000 100000
#define NUMBER_100001 100001
#define NUMBER_2147483649 2147483649
#define NUMBER_2 2
#define NUMBER_1 1
#define NUMBER_1000000 1000000
#define NUMBER_1000001 1000001
#define NUMBER_N_1000000 (-1000000)
#define NUMBER_N_1000001 (-1000001)
#define NUMBER_1000000000 1000000000
#define NUMBER_1000000001 1000000001
#define NUMBER_N_1000000000 (-1000000000)
#define NUMBER_N_1000000001 (-1000000001)
#define NUMBER_4294967295 4294967295
#define NUMBER_4294967296 4294967296

namespace ArkUICapiTest {

static napi_value RenderNodeParam001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_FloatAnimatablePropertyHandle property1 =
        OH_ArkUI_RenderNodeUtils_CreateFloatAnimatableProperty(NUMBER_N_100000000);
    float value = 0.0f;
    auto result1 = OH_ArkUI_RenderNodeUtils_GetFloatAnimatablePropertyValue(property1, &value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam001 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);

    ArkUI_FloatAnimatablePropertyHandle property2 =
        OH_ArkUI_RenderNodeUtils_CreateFloatAnimatableProperty(NUMBER_100000000);
    auto result2 = OH_ArkUI_RenderNodeUtils_GetFloatAnimatablePropertyValue(property2, &value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam001 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    ArkUI_FloatAnimatablePropertyHandle property3 =
        OH_ArkUI_RenderNodeUtils_CreateFloatAnimatableProperty(NUMBER_N_100000001);
    auto result3 = OH_ArkUI_RenderNodeUtils_GetFloatAnimatablePropertyValue(property3, &value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam001 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);

    ArkUI_FloatAnimatablePropertyHandle property4 =
        OH_ArkUI_RenderNodeUtils_CreateFloatAnimatableProperty(NUMBER_100000001);
    auto result4 = OH_ArkUI_RenderNodeUtils_GetFloatAnimatablePropertyValue(property4, &value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam001 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RenderNodeParam002(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    float x = 0.0f;
    float y = 0.0f;
    ArkUI_Vector2AnimatablePropertyHandle property1 =
        OH_ArkUI_RenderNodeUtils_CreateVector2AnimatableProperty(NUMBER_N_100000000, NUMBER_N_100000000);
    auto result1 = OH_ArkUI_RenderNodeUtils_GetVector2AnimatablePropertyValue(property1, &x, &y);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam002 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);

    ArkUI_Vector2AnimatablePropertyHandle property2 =
        OH_ArkUI_RenderNodeUtils_CreateVector2AnimatableProperty(NUMBER_100000000, NUMBER_100000000);
    auto result2 = OH_ArkUI_RenderNodeUtils_GetVector2AnimatablePropertyValue(property2, &x, &y);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam002 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    ArkUI_Vector2AnimatablePropertyHandle property3 =
        OH_ArkUI_RenderNodeUtils_CreateVector2AnimatableProperty(NUMBER_N_100000001, NUMBER_N_100000001);
    auto result3 = OH_ArkUI_RenderNodeUtils_GetVector2AnimatablePropertyValue(property3, &x, &y);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam002 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);

    ArkUI_Vector2AnimatablePropertyHandle property4 =
        OH_ArkUI_RenderNodeUtils_CreateVector2AnimatableProperty(NUMBER_100000001, NUMBER_100000001);
    auto result4 = OH_ArkUI_RenderNodeUtils_GetVector2AnimatablePropertyValue(property4, &x, &y);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam002 result1=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);

    NAPI_END;
}

static napi_value RenderNodeParam003(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_Vector2AnimatablePropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateVector2AnimatableProperty(0.5f, 0.5f);

    auto result1 =
        OH_ArkUI_RenderNodeUtils_SetVector2AnimatablePropertyValue(property, NUMBER_N_100000000, NUMBER_N_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam003 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);

    auto result2 =
        OH_ArkUI_RenderNodeUtils_SetVector2AnimatablePropertyValue(property, NUMBER_100000000, NUMBER_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam003 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 =
        OH_ArkUI_RenderNodeUtils_SetVector2AnimatablePropertyValue(property, NUMBER_N_100000001, NUMBER_N_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam003 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);

    auto result4 =
        OH_ArkUI_RenderNodeUtils_SetVector2AnimatablePropertyValue(property, NUMBER_100000001, NUMBER_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam003 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RenderNodeParam004(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);

    auto widthOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderWidthOption();
    OH_ArkUI_RenderNodeUtils_SetNodeBorderWidthOptionEdgeWidth(widthOption, NUMBER_N_100000000,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);

    auto result1 = OH_ArkUI_RenderNodeUtils_SetBorderWidth(rsNodeRoot, widthOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam004 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetNodeBorderWidthOptionEdgeWidth(widthOption, NUMBER_100000000,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetBorderWidth(rsNodeRoot, widthOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam004 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetNodeBorderWidthOptionEdgeWidth(widthOption, NUMBER_N_100000001,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);
    auto result3 = OH_ArkUI_RenderNodeUtils_SetBorderWidth(rsNodeRoot, widthOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam004 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetNodeBorderWidthOptionEdgeWidth(widthOption, NUMBER_100000001,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);
    auto result4 = OH_ArkUI_RenderNodeUtils_SetBorderWidth(rsNodeRoot, widthOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam004 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RenderNodeParam005(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result4_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);

    auto colorOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderColorOption();
    OH_ArkUI_RenderNodeUtils_SetNodeBorderColorOptionEdgeColor(colorOption, 0,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);

    auto result1 = OH_ArkUI_RenderNodeUtils_SetBorderColor(rsNodeRoot, colorOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam005 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetNodeBorderColorOptionEdgeColor(colorOption, NUMBER_2147483647,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetBorderColor(rsNodeRoot, colorOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam005 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetNodeBorderColorOptionEdgeColor(colorOption, NUMBER_2147483648,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);
    auto result3 = OH_ArkUI_RenderNodeUtils_SetBorderColor(rsNodeRoot, colorOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam005 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RenderNodeParam006(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result5_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);

    auto radiusOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderRadiusOption();
    OH_ArkUI_RenderNodeUtils_SetNodeBorderRadiusOptionCornerRadius(radiusOption, 0,
        ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_TOP_LEFT);
    auto result1 = OH_ArkUI_RenderNodeUtils_SetBorderRadius(rsNodeRoot, radiusOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam006 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetNodeBorderRadiusOptionCornerRadius(radiusOption, NUMBER_2147483647,
        ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_TOP_LEFT);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetBorderRadius(rsNodeRoot, radiusOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam006 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetNodeBorderRadiusOptionCornerRadius(radiusOption, NUMBER_2147483648,
        ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_TOP_LEFT);
    auto result3 = OH_ArkUI_RenderNodeUtils_SetBorderRadius(rsNodeRoot, radiusOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam006 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RenderNodeParam007(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result6_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);

    auto circleShape = OH_ArkUI_RenderNodeUtils_CreateCircleShapeOption();
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterX(circleShape, NUMBER_N_100000000);
    auto rectMask1 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(circleShape);
    auto result1 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam007 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterX(circleShape, NUMBER_100000000);
    auto rectMask2 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(circleShape);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam007 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterX(circleShape, NUMBER_N_100000001);
    auto rectMask3 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(circleShape);
    auto result3 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam007 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterX(circleShape, NUMBER_100000001);
    auto rectMask4 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(circleShape);
    auto result4 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask4);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam007 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RenderNodeParam008(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result6_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);

    auto circleShape = OH_ArkUI_RenderNodeUtils_CreateCircleShapeOption();
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterY(circleShape, NUMBER_N_100000000);
    auto rectMask1 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(circleShape);
    auto result1 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam008 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterY(circleShape, NUMBER_100000000);
    auto rectMask2 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(circleShape);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam008 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterY(circleShape, NUMBER_N_100000001);
    auto rectMask3 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(circleShape);
    auto result3 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam008 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterY(circleShape, NUMBER_100000001);
    auto rectMask4 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(circleShape);
    auto result4 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask4);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam008 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RenderNodeParam009(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result6_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);

    auto circleShape = OH_ArkUI_RenderNodeUtils_CreateCircleShapeOption();
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionRadius(circleShape, 0);
    auto rectMask1 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(circleShape);
    auto result1 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam009 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionRadius(circleShape, NUMBER_N_1);
    auto rectMask2 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(circleShape);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam009 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionRadius(circleShape, NUMBER_100000000);
    auto rectMask3 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(circleShape);
    auto result3 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam009 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionRadius(circleShape, NUMBER_100000001);
    auto rectMask4 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(circleShape);
    auto result4 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask4);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam009 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RenderNodeParam010(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto roundShape = OH_ArkUI_RenderNodeUtils_CreateRoundRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(roundShape, NUMBER_N_100000000, NUMBER_N_100000000,
        ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_ALL);
    auto rectMask1 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromRoundRectShape(roundShape);
    auto result1 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam010 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(roundShape, NUMBER_100000000, NUMBER_100000000,
        ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_ALL);
    auto rectMask2 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromRoundRectShape(roundShape);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam010 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(roundShape, NUMBER_N_100000001, NUMBER_N_100000001,
        ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_ALL);
    auto rectMask3 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromRoundRectShape(roundShape);
    auto result3 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam010 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(roundShape, NUMBER_100000001, NUMBER_100000001,
        ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_ALL);
    auto rectMask4 = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromRoundRectShape(roundShape);
    auto result4 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask4);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam010 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RenderNodeUtils_DisposeRoundRectShapeOption(roundShape);
    NAPI_END;
}

static napi_value RenderNodeParam011(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto commandPath = OH_ArkUI_RenderNodeUtils_CreateCommandPathOption();
    OH_ArkUI_RenderNodeUtils_SetCommandPathOptionCommands(commandPath, nullptr);
    auto rectClip = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromCommandPath(commandPath);
    auto result1 = OH_ArkUI_RenderNodeUtils_SetClip(rsNodeRoot, rectClip);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RenderNodeUtils_DisposeCommandPathOption(commandPath);
    NAPI_END;
}

static napi_value RenderNodeParam012(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rootRenderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rootRenderNode);

    ArkUI_RenderNodeHandle nodeTemp;
    auto result1 = OH_ArkUI_RenderNodeUtils_GetChild(rootRenderNode, NUMBER_100000, &nodeTemp);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam012 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_RENDER_CHILD_NOT_EXIST);

    auto result2 = OH_ArkUI_RenderNodeUtils_GetChild(rootRenderNode, NUMBER_N_1, &nodeTemp);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam012 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_PARAM_INVALID);

    auto result3 = OH_ArkUI_RenderNodeUtils_GetChild(rootRenderNode, NUMBER_100001, &nodeTemp);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam012 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_RENDER_CHILD_NOT_EXIST);
    NAPI_END;
}

static napi_value RenderNodeParam013(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetBackgroundColor(rsNode, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam013 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetBackgroundColor(rsNode, NUMBER_2147483648);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam013 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetBackgroundColor(rsNode, NUMBER_2147483649);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam013 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam014(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetClipToFrame(rsNode, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam014 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetClipToFrame(rsNode, NUMBER_N_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam014 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetClipToFrame(rsNode, NUMBER_2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam014 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    
    NAPI_END;
}

static napi_value RenderNodeParam015(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetClipToBounds(rsNode, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam015 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetClipToBounds(rsNode, NUMBER_N_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam015 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetClipToBounds(rsNode, NUMBER_2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam015 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    
    NAPI_END;
}

static napi_value RenderNodeParam016(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetOpacity(rsNode, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam016 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetOpacity(rsNode, NUMBER_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam016 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetOpacity(rsNode, NUMBER_N_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam016 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetOpacity(rsNode, NUMBER_2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam016 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    
    NAPI_END;
}

static napi_value RenderNodeParam017(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetSize(rsNode, NUMBER_2147483647, NUMBER_2147483647);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam017 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetSize(rsNode, NUMBER_N_1, NUMBER_N_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam017 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetSize(rsNode, NUMBER_2147483648, NUMBER_2147483648);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam017 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetSize(rsNode, 0, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam017 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam018(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetPosition(rsNode, 0, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam018 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetPosition(rsNode, NUMBER_1000000, NUMBER_1000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam018 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetPosition(rsNode, NUMBER_N_1, NUMBER_N_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam018 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetPosition(rsNode, NUMBER_1000001, NUMBER_1000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam018 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RenderNodeParam019(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetPivot(rsNode, 0, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam019 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetPivot(rsNode, NUMBER_N_1, NUMBER_N_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam019 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetPivot(rsNode, NUMBER_2, NUMBER_2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam019 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam020(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetScale(rsNode, 0, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam020 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetScale(rsNode, NUMBER_1000000, NUMBER_1000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam020 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetScale(rsNode, NUMBER_N_1, NUMBER_N_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam020 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetScale(rsNode, NUMBER_1000001, NUMBER_1000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam020 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam021(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetTranslation(rsNode, NUMBER_N_1000000000, NUMBER_N_1000000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam021 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetTranslation(rsNode, NUMBER_1000000000, NUMBER_1000000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam021 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetTranslation(rsNode, NUMBER_N_1000000000, NUMBER_N_1000000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam021 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetTranslation(rsNode, NUMBER_N_1000000001, NUMBER_N_1000000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam021 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam022(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetRotation(rsNode, NUMBER_N_1000000, NUMBER_N_1000000, NUMBER_N_1000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam022 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetRotation(rsNode, NUMBER_1000000, NUMBER_1000000, NUMBER_1000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam022 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetRotation(rsNode, NUMBER_N_1000001, NUMBER_N_1000001, NUMBER_N_1000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam022 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetRotation(rsNode, NUMBER_1000001, NUMBER_1000001, NUMBER_1000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam022 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam023(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetShadowColor(rsNode, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam023 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetShadowColor(rsNode, NUMBER_2147483647);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam023 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetShadowColor(rsNode, NUMBER_2147483648);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam023 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam024(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetShadowOffset(rsNode, NUMBER_N_100000000, NUMBER_N_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam024 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetShadowOffset(rsNode, NUMBER_100000000, NUMBER_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam024 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetShadowOffset(rsNode, NUMBER_N_100000001, NUMBER_N_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam024 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetShadowOffset(rsNode, NUMBER_100000001, NUMBER_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam024 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam025(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetShadowAlpha(rsNode, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam025 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetShadowAlpha(rsNode, NUMBER_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam025 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetShadowAlpha(rsNode, NUMBER_N_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam025 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetShadowAlpha(rsNode, NUMBER_2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam025 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    
    NAPI_END;
}

static napi_value RenderNodeParam026(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetShadowElevation(rsNode, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam026 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetShadowElevation(rsNode, NUMBER_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam026 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetShadowElevation(rsNode, NUMBER_N_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam026 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetShadowElevation(rsNode, NUMBER_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam026 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam027(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetShadowRadius(rsNode, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam027 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetShadowRadius(rsNode, NUMBER_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam027 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetShadowRadius(rsNode, NUMBER_N_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam027 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetShadowRadius(rsNode, NUMBER_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam027 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam028(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetBounds(rsNode, NUMBER_N_100000000,
        NUMBER_N_100000000, NUMBER_N_100000000, NUMBER_N_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam028 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetBounds(rsNode, NUMBER_100000000,
        NUMBER_100000000, NUMBER_100000000, NUMBER_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam028 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetBounds(rsNode, NUMBER_N_100000001,
        NUMBER_N_100000001, NUMBER_N_100000001, NUMBER_N_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam028 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetBounds(rsNode, NUMBER_100000001,
        NUMBER_100000001, NUMBER_100000001, NUMBER_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam028 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam029(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto result1 = OH_ArkUI_RenderNodeUtils_SetDrawRegion(rsNode, NUMBER_N_100000000,
        NUMBER_N_100000000, NUMBER_N_100000000, NUMBER_N_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam029 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetDrawRegion(rsNode, NUMBER_100000000,
        NUMBER_100000000, NUMBER_100000000, NUMBER_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam029 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetDrawRegion(rsNode, NUMBER_N_100000001,
        NUMBER_N_100000001, NUMBER_N_100000001, NUMBER_N_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam029 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetDrawRegion(rsNode, NUMBER_100000001,
        NUMBER_100000001, NUMBER_100000001, NUMBER_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam029 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam030(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    float value = 0.0f;
    
    ArkUI_FloatPropertyHandle property1 = OH_ArkUI_RenderNodeUtils_CreateFloatProperty(NUMBER_N_1000000000);
    auto result1 = OH_ArkUI_RenderNodeUtils_GetFloatPropertyValue(property1, &value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam030 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    ArkUI_FloatPropertyHandle property2 = OH_ArkUI_RenderNodeUtils_CreateFloatProperty(NUMBER_1000000000);
    auto result2 = OH_ArkUI_RenderNodeUtils_GetFloatPropertyValue(property2, &value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam030 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    ArkUI_FloatPropertyHandle property3 = OH_ArkUI_RenderNodeUtils_CreateFloatProperty(NUMBER_N_1000000001);
    auto result3 = OH_ArkUI_RenderNodeUtils_GetFloatPropertyValue(property3, &value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam030 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    ArkUI_FloatPropertyHandle property4 = OH_ArkUI_RenderNodeUtils_CreateFloatProperty(NUMBER_1000000001);
    auto result4 = OH_ArkUI_RenderNodeUtils_GetFloatPropertyValue(property4, &value);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam030 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam031(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    ArkUI_FloatPropertyHandle property = OH_ArkUI_RenderNodeUtils_CreateFloatProperty(0.5f);
    auto result1 = OH_ArkUI_RenderNodeUtils_SetFloatPropertyValue(property, NUMBER_N_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam031 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetFloatPropertyValue(property, NUMBER_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam031 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3 = OH_ArkUI_RenderNodeUtils_SetFloatPropertyValue(property, NUMBER_N_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam031 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetFloatPropertyValue(property, NUMBER_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam031 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam032(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    ArkUI_Vector2PropertyHandle property1 =
        OH_ArkUI_RenderNodeUtils_CreateVector2Property(NUMBER_N_100000000, NUMBER_N_100000000);
    auto result1 = OH_ArkUI_RenderNodeUtils_SetVector2PropertyValue(property1, NUMBER_N_100000000, NUMBER_N_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam032 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    ArkUI_Vector2PropertyHandle property2 =
        OH_ArkUI_RenderNodeUtils_CreateVector2Property(NUMBER_N_100000000, NUMBER_N_100000000);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetVector2PropertyValue(property2, NUMBER_100000000, NUMBER_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam032 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    
    ArkUI_Vector2PropertyHandle property3 =
        OH_ArkUI_RenderNodeUtils_CreateVector2Property(NUMBER_N_100000001, NUMBER_N_100000001);
    auto result3 = OH_ArkUI_RenderNodeUtils_SetVector2PropertyValue(property3, NUMBER_N_100000001, NUMBER_N_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam032 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    ArkUI_Vector2PropertyHandle property4 =
        OH_ArkUI_RenderNodeUtils_CreateVector2Property(NUMBER_100000001, NUMBER_100000001);
    auto result4 = OH_ArkUI_RenderNodeUtils_SetVector2PropertyValue(property4, NUMBER_100000001, NUMBER_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam032 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam033(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    ArkUI_ColorPropertyHandle property1 = OH_ArkUI_RenderNodeUtils_CreateColorProperty(0);
    auto result1 = OH_ArkUI_RenderNodeUtils_SetColorPropertyValue(property1, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam033 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    ArkUI_ColorPropertyHandle property2 = OH_ArkUI_RenderNodeUtils_CreateColorProperty(NUMBER_2147483647);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetColorPropertyValue(property2, NUMBER_2147483647);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam033 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    
    ArkUI_ColorPropertyHandle property3 = OH_ArkUI_RenderNodeUtils_CreateColorProperty(NUMBER_2147483648);
    auto result3 = OH_ArkUI_RenderNodeUtils_SetColorPropertyValue(property3, NUMBER_2147483648);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam033 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam034(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    ArkUI_FloatAnimatablePropertyHandle property =
        OH_ArkUI_RenderNodeUtils_CreateFloatAnimatableProperty(0.5f);
    auto result1 = OH_ArkUI_RenderNodeUtils_SetFloatAnimatablePropertyValue(property, NUMBER_N_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam034 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result2 = OH_ArkUI_RenderNodeUtils_SetFloatAnimatablePropertyValue(property, NUMBER_100000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam034 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result3 = OH_ArkUI_RenderNodeUtils_SetFloatAnimatablePropertyValue(property, NUMBER_N_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam034 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto result4 = OH_ArkUI_RenderNodeUtils_SetFloatAnimatablePropertyValue(property, NUMBER_100000001);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam034 result4=%{public}d", result4);
    ASSERT_EQ(result4, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam035(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    ArkUI_ColorAnimatablePropertyHandle property1 =
        OH_ArkUI_RenderNodeUtils_CreateColorAnimatableProperty(0);
    auto result1 = OH_ArkUI_RenderNodeUtils_SetColorAnimatablePropertyValue(property1, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam035 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    ArkUI_ColorAnimatablePropertyHandle property2 =
        OH_ArkUI_RenderNodeUtils_CreateColorAnimatableProperty(NUMBER_100000000);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetColorAnimatablePropertyValue(property2, NUMBER_2147483647);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam035 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    
    ArkUI_ColorAnimatablePropertyHandle property3 =
        OH_ArkUI_RenderNodeUtils_CreateColorAnimatableProperty(NUMBER_100000001);
    auto result3 = OH_ArkUI_RenderNodeUtils_SetColorAnimatablePropertyValue(property3, NUMBER_2147483648);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam035 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    NAPI_END;
}

static napi_value RenderNodeParam036(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto rectShape = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();
    auto rectMask = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromRectShape(rectShape);
    OH_ArkUI_RenderNodeUtils_SetRenderNodeMaskOptionFillColor(rectMask, 0);
    OH_ArkUI_RenderNodeUtils_SetRenderNodeMaskOptionStrokeColor(rectMask, 0);
    auto result1 = OH_ArkUI_RenderNodeUtils_SetMask(rsNode, rectMask);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam036 result1=%{public}d", result1);
    ASSERT_EQ(result1, ARKUI_ERROR_CODE_NO_ERROR);
    
    OH_ArkUI_RenderNodeUtils_SetRenderNodeMaskOptionFillColor(rectMask, NUMBER_4294967295);
    OH_ArkUI_RenderNodeUtils_SetRenderNodeMaskOptionStrokeColor(rectMask, NUMBER_4294967295);
    auto result2 = OH_ArkUI_RenderNodeUtils_SetMask(rsNode, rectMask);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam036 result2=%{public}d", result2);
    ASSERT_EQ(result2, ARKUI_ERROR_CODE_NO_ERROR);
    
    OH_ArkUI_RenderNodeUtils_SetRenderNodeMaskOptionFillColor(rectMask, NUMBER_4294967296);
    OH_ArkUI_RenderNodeUtils_SetRenderNodeMaskOptionStrokeColor(rectMask, NUMBER_4294967296);
    auto result3 = OH_ArkUI_RenderNodeUtils_SetMask(rsNode, rectMask);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk RenderNodeParam036 result3=%{public}d", result3);
    ASSERT_EQ(result3, ARKUI_ERROR_CODE_NO_ERROR);
    
    OH_ArkUI_RenderNodeUtils_DisposeRectShapeOption(rectShape);
    OH_ArkUI_RenderNodeUtils_DisposeRenderNodeMaskOption(rectMask);
    NAPI_END;
}
} // namespace ArkUICapiTest