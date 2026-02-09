/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"
#include "../manager/plugin_manager.h"
#include <asm-generic/stat.h>
#include <bits/alltypes.h>
#include <cstdint>
#include <iostream>
#include <linux/if.h>
#include <linux/if_link.h>
#include <linux/mroute6.h>
#include <linux/quota.h>
#include <sound/hdsp.h>
#include <string>
#include <cstdio>
#include "napi/native_api.h"
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_color.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_render.h>
#include <bits/alltypes.h>
#include <hilog/log.h>
#include <linux/nubus.h>
#include <sys/types.h>
#include <thread>
#include <unistd.h>
#include <vector>
#include <hitrace/trace.h>

#define NUMBER_32 32
#define NUMBER_64 64
#define PARAM_COLOR 4294967295
#define NUMBER_F_200 (-200)
#define PARAM_999999 99999
#define PARAM_VALUE "M0 100 A30 20 20 0 0 200 100 Z"
#define NUMBER_106204 106204
#define NUMBER_106106 106106
#define NUMBER_500 500
#define NUMBER_1 1
#define NUMBER_2 2
#define NUMBER_3 3
#define NUMBER_4 4
namespace ArkUICapiTest {

static napi_value RenderNodeUtils_001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result1_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_001 result=%{public}d", result1_1);
    ASSERT_EQ(result1_1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto rectShape = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(rectShape, PARAM_100, 
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(rectShape, PARAM_NEGATIVE_5, 
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_LEFT);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(rectShape, PARAM_0, 
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(rectShape, SIZE_150, 
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(rectShape, PARAM_999999, 
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_BOTTOM);
    
    auto rectMask = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromRectShape(rectShape);
    OH_ArkUI_RenderNodeUtils_SetRenderNodeMaskOptionFillColor(rectMask, 0xFFFF0000);
    OH_ArkUI_RenderNodeUtils_SetRenderNodeMaskOptionStrokeColor(rectMask, 0xFF443366);
    OH_ArkUI_RenderNodeUtils_SetRenderNodeMaskOptionStrokeWidth(rectMask, PARAM_20);
    auto result1_2 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask);
    OH_ArkUI_RenderNodeUtils_DisposeRectShapeOption(rectShape);
    OH_ArkUI_RenderNodeUtils_DisposeRenderNodeMaskOption(rectMask);
    
    ASSERT_EQ(result1_2, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto resNullptr = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromRectShape(nullptr);
    ASSERT_OBJ(resNullptr, nullptr);
    NAPI_END;
}

static napi_value RenderNodeUtils_002(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result2_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_002 result=%{public}d", result2_1);
    ASSERT_EQ(result2_1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto styleOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderStyleOption();
    
    OH_ArkUI_RenderNodeUtils_SetNodeBorderStyleOptionEdgeStyle(styleOption, 
        ArkUI_BorderStyle::ARKUI_BORDER_STYLE_SOLID, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderStyleOptionEdgeStyle(styleOption, 
        ArkUI_BorderStyle::ARKUI_BORDER_STYLE_DOTTED, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_LEFT);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderStyleOptionEdgeStyle(styleOption, 
        ArkUI_BorderStyle::ARKUI_BORDER_STYLE_SOLID, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderStyleOptionEdgeStyle(styleOption, 
        ArkUI_BorderStyle::ARKUI_BORDER_STYLE_DASHED, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderStyleOptionEdgeStyle(styleOption, 
        ArkUI_BorderStyle::ARKUI_BORDER_STYLE_SOLID, ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_BOTTOM);
    
    auto result2_2 = OH_ArkUI_RenderNodeUtils_SetBorderStyle(rsNodeRoot, styleOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_SetBorderStyle RenderNodeUtils_002 result=%{public}d", result2_2);
    ASSERT_EQ(result2_2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result2_3 = OH_ArkUI_RenderNodeUtils_GetBorderStyle(rsNodeRoot, &styleOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_GetBorderStyle RenderNodeUtils_002 result=%{public}d", result2_3);
    OH_ArkUI_RenderNodeUtils_DisposeNodeBorderStyleOption(styleOption);
    
    ASSERT_EQ(result2_3, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RenderNodeUtils_003(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result3_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_003 result=%{public}d", result3_1);
    ASSERT_EQ(result3_1, ARKUI_ERROR_CODE_NO_ERROR);

    auto widthOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderWidthOption();
    OH_ArkUI_RenderNodeUtils_SetNodeBorderWidthOptionEdgeWidth(widthOption, PARAM_10,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderWidthOptionEdgeWidth(widthOption, PARAM_NEGATIVE_10,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_LEFT);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderWidthOptionEdgeWidth(widthOption, PARAM_20,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderWidthOptionEdgeWidth(widthOption, SIZE_30,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderWidthOptionEdgeWidth(widthOption, SIZE_40,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_BOTTOM);

    auto result3_2 = OH_ArkUI_RenderNodeUtils_SetBorderWidth(rsNodeRoot, widthOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_SetBorderWidth RenderNodeUtils_003 result=%{public}d", result3_2);
    ASSERT_EQ(result3_2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result3_3 = OH_ArkUI_RenderNodeUtils_GetBorderWidth(rsNodeRoot, &widthOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_GetBorderWidth RenderNodeUtils_003 result=%{public}d", result3_3);
    OH_ArkUI_RenderNodeUtils_DisposeNodeBorderWidthOption(widthOption);
    
    ASSERT_EQ(result3_3, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RenderNodeUtils_004(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result4_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_004 result=%{public}d", result4_1);
    ASSERT_EQ(result4_1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto colorOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderColorOption();
    OH_ArkUI_RenderNodeUtils_SetNodeBorderColorOptionEdgeColor(colorOption, 0xFF000000,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderColorOptionEdgeColor(colorOption, 0xFF000000,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_LEFT);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderColorOptionEdgeColor(colorOption, 0xFFFFFF00,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderColorOptionEdgeColor(colorOption, 0xFFFF0000,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderColorOptionEdgeColor(colorOption, PARAM_COLOR,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_BOTTOM);

    auto result4_2 = OH_ArkUI_RenderNodeUtils_SetBorderColor(rsNodeRoot, colorOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_SetBorderColor RenderNodeUtils_004 result=%{public}d", result4_2);

    auto colorOption2 = OH_ArkUI_RenderNodeUtils_CreateNodeBorderColorOption();
    auto result4_3 = OH_ArkUI_RenderNodeUtils_GetBorderColor(rsNodeRoot, &colorOption2);
    OH_ArkUI_RenderNodeUtils_DisposeNodeBorderColorOption(colorOption);
    
    ASSERT_EQ(result4_3, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RenderNodeUtils_005(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result5_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_005 result=%{public}d", result5_1);
    ASSERT_EQ(result5_1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto radiusOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderRadiusOption();
    OH_ArkUI_RenderNodeUtils_SetNodeBorderRadiusOptionCornerRadius(radiusOption, NUMBER_32,
        ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_TOP_LEFT);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderRadiusOptionCornerRadius(radiusOption, NUMBER_32,
        ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_TOP_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderRadiusOptionCornerRadius(radiusOption, NUMBER_32,
        ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_BOTTOM_LEFT);
    OH_ArkUI_RenderNodeUtils_SetNodeBorderRadiusOptionCornerRadius(radiusOption, NUMBER_64,
        ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_BOTTOM_RIGHT);

    ASSERT_EQ(ARKUI_CORNER_DIRECTION_TOP_LEFT, NUMBER_1);
    ASSERT_EQ(ARKUI_CORNER_DIRECTION_TOP_RIGHT, NUMBER_2);
    ASSERT_EQ(ARKUI_CORNER_DIRECTION_BOTTOM_LEFT, NUMBER_3);
    ASSERT_EQ(ARKUI_CORNER_DIRECTION_BOTTOM_RIGHT, NUMBER_4);

    auto result5_2 = OH_ArkUI_RenderNodeUtils_SetBorderRadius(rsNodeRoot, radiusOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_SetBorderStyle RenderNodeUtils_005 result=%{public}d", result5_2);
    ASSERT_EQ(result5_2, ARKUI_ERROR_CODE_NO_ERROR);

    auto result5_3 = OH_ArkUI_RenderNodeUtils_GetBorderRadius(rsNodeRoot, &radiusOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_GetBorderStyle RenderNodeUtils_005 result=%{public}d", result5_3);
    OH_ArkUI_RenderNodeUtils_DisposeNodeBorderRadiusOption(radiusOption);
    
    ASSERT_EQ(result5_3, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RenderNodeUtils_006(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result6_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_006 result=%{public}d", result6_1);
    ASSERT_EQ(result6_1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto circleShape = OH_ArkUI_RenderNodeUtils_CreateCircleShapeOption();
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterX(circleShape, SIZE_120);
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterY(circleShape, SIZE_120);
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionRadius(circleShape, PARAM_100);
    
    auto rectMask = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(circleShape);
    auto result6_2 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask);
    OH_ArkUI_RenderNodeUtils_DisposeCircleShapeOption(circleShape);
    ASSERT_EQ(result6_2, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto resNullptr = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCircleShape(nullptr);
    ASSERT_OBJ(resNullptr, nullptr);
    NAPI_END;
}

static napi_value RenderNodeUtils_007(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result7_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_007 result=%{public}d", result7_1);
    ASSERT_EQ(result7_1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto roundShape = OH_ArkUI_RenderNodeUtils_CreateRoundRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(roundShape, NUMBER_F_200,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_LEFT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(roundShape, PARAM_0,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(roundShape, SIZE_250,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(roundShape, SIZE_150,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_BOTTOM);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(roundShape, SIZE_60, SIZE_30,
        ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_ALL);

    auto rectMask = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromRoundRectShape(roundShape);
    auto result7_2 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask);
    OH_ArkUI_RenderNodeUtils_DisposeRoundRectShapeOption(roundShape);
    ASSERT_EQ(result7_2, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto resNullptr = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromRoundRectShape(nullptr);
    ASSERT_OBJ(resNullptr, nullptr);
    NAPI_END;
}

static napi_value RenderNodeUtils_008(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result8_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_008 result=%{public}d", result8_1);
    ASSERT_EQ(result8_1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto commandPath = OH_ArkUI_RenderNodeUtils_CreateCommandPathOption();
    OH_ArkUI_RenderNodeUtils_SetCommandPathOptionCommands(commandPath, PARAM_VALUE);
    auto rectMask = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCommandPath(commandPath);
    auto result8_2 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask);
    OH_ArkUI_RenderNodeUtils_DisposeCommandPathOption(commandPath);
    ASSERT_EQ(result8_2, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto resNullptr = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromCommandPath(nullptr);
    ASSERT_OBJ(resNullptr, nullptr);
    NAPI_END;
}

static napi_value RenderNodeUtils_009(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result9_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_009 result=%{public}d", result9_1);
    ASSERT_EQ(result9_1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto rectShape = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(rectShape, PARAM_100, 
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);
    auto rectMask = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromOvalShape(rectShape);
    auto result9_2 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask);
    ASSERT_EQ(result9_2, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto resNullptr = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromOvalShape(nullptr);
    ASSERT_OBJ(resNullptr, nullptr);
    NAPI_END;
}

static napi_value RenderNodeUtils_010(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result10_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_010 result=%{public}d", result10_1);
    ASSERT_EQ(result10_1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto commandPath = OH_ArkUI_RenderNodeUtils_CreateCommandPathOption();
    OH_ArkUI_RenderNodeUtils_SetCommandPathOptionCommands(commandPath, PARAM_VALUE);
    auto rectClip = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromCommandPath(commandPath);
    auto result10_2 = OH_ArkUI_RenderNodeUtils_SetClip(rsNodeRoot, rectClip);
    ASSERT_EQ(result10_2, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto resNullptr = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromCommandPath(nullptr);
    ASSERT_OBJ(resNullptr, nullptr);
    NAPI_END;
}

static napi_value RenderNodeUtils_011(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result11_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_011 result=%{public}d", result11_1);
    ASSERT_EQ(result11_1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto rectShape = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(rectShape, PARAM_100, 
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);
    auto rectClip = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromRectShape(rectShape);
    auto result11_2 = OH_ArkUI_RenderNodeUtils_SetClip(rsNodeRoot, rectClip);
    OH_ArkUI_RenderNodeUtils_DisposeRenderNodeClipOption(rectClip);
    ASSERT_EQ(result11_2, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto resNullptr = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromRectShape(nullptr);
    ASSERT_OBJ(resNullptr, nullptr);
    NAPI_END;
}

static napi_value RenderNodeUtils_012(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result12_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_012 result=%{public}d", result12_1);
    ASSERT_EQ(result12_1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto roundShape = OH_ArkUI_RenderNodeUtils_CreateRoundRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(roundShape, NUMBER_F_200,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_LEFT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(roundShape, PARAM_0,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_TOP);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(roundShape, SIZE_250,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_RIGHT);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionEdgeValue(roundShape, SIZE_150,
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_BOTTOM);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(roundShape, SIZE_60, SIZE_30,
        ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_ALL);  
    
    auto rectClip = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromRoundRectShape(roundShape);
    auto result12_2 = OH_ArkUI_RenderNodeUtils_SetClip(rsNodeRoot, rectClip);
    ASSERT_EQ(result12_2, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto resNullptr = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromRoundRectShape(nullptr);
    ASSERT_OBJ(resNullptr, nullptr);
    NAPI_END;
}

static napi_value RenderNodeUtils_013(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result13_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_013 result=%{public}d", result13_1);
    ASSERT_EQ(result13_1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto circleShape = OH_ArkUI_RenderNodeUtils_CreateCircleShapeOption();
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterX(circleShape, SIZE_120);
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionCenterY(circleShape, SIZE_120);
    OH_ArkUI_RenderNodeUtils_SetCircleShapeOptionRadius(circleShape, PARAM_100);
    
    auto rectClip = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromCircleShape(circleShape);
    auto result13_2 = OH_ArkUI_RenderNodeUtils_SetClip(rsNodeRoot, rectClip);
    ASSERT_EQ(result13_2, ARKUI_ERROR_CODE_NO_ERROR);
    auto resNullptr = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromCircleShape(nullptr);
    ASSERT_OBJ(resNullptr, nullptr);
    NAPI_END;
}

static napi_value RenderNodeUtils_014(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto result14_1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNodeRoot);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_014 result=%{public}d", result14_1);
    ASSERT_EQ(result14_1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto rectShape = OH_ArkUI_RenderNodeUtils_CreateRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionEdgeValue(rectShape, PARAM_100, 
        ArkUI_EdgeDirection::ARKUI_EDGE_DIRECTION_ALL);
    auto rectClip = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromOvalShape(rectShape);
    auto result14_2 = OH_ArkUI_RenderNodeUtils_SetClip(rsNodeRoot, rectClip);
    ASSERT_EQ(result14_2, ARKUI_ERROR_CODE_NO_ERROR);
    auto resNullptr = OH_ArkUI_RenderNodeUtils_CreateRenderNodeClipOptionFromOvalShape(nullptr);
    ASSERT_OBJ(resNullptr, nullptr);
    NAPI_END;
}

static napi_value RenderNodeUtils_015(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto ret = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_SetMask RenderNodeUtils_015 result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value RenderNodeUtils_016(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto ret = OH_ArkUI_RenderNodeUtils_SetClip(rsNodeRoot, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ArkUI_RenderNodeUtils_SetClip RenderNodeUtils_016 result=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ASSERT_EQ(ARKUI_ERROR_CODE_NODE_ON_INVALID_THREAD, NUMBER_106204);
    ASSERT_EQ(ARKUI_ERROR_CODE_CHILD_NODE_EXIST, NUMBER_106106);
    ASSERT_EQ(ARKUI_ERROR_CODE_CAPI_INIT_ERROR, NUMBER_500);
    
    NAPI_END;
}

}