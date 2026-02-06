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
static int NUMBER_100 = 100;
static int NUMBER_5 = 5;
static int NUMBER_19 = 19;
static int NUMBERNO_100 = -100;
static float NUMBER_0_5 = 0.5;


namespace ArkUICapiTest {

static napi_value TestBackgroundColor(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);

    uint32_t backgroundColor = 0;
    OH_ArkUI_RenderNodeUtils_GetBackgroundColor(rsNode, &backgroundColor);
    ASSERT_EQ(backgroundColor, 0);
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetBackgroundColor(rsNode, 0xFF0000FF);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBackgroundColor result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetBackgroundColor(rsNode, &backgroundColor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetBackgroundColor result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret3 = OH_ArkUI_RenderNodeUtils_SetBackgroundColor(nullptr, 0xFF0000FF);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBackgroundColor result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetBackgroundColor(nullptr, &backgroundColor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetBackgroundColor result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestBorderColor(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);

    auto colorOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderColorOption();
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetBorderColor(rsNode, colorOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderColor result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_SetBorderColor(nullptr, colorOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderColor result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret3 = OH_ArkUI_RenderNodeUtils_GetBorderColor(rsNode, &colorOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderColor result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetBorderColor(nullptr, &colorOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderColor result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestBorderRadius(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);

    auto radiusOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderRadiusOption();
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetBorderRadius(rsNode, radiusOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderRadius result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_SetBorderRadius(nullptr, radiusOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderRadius result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret3 = OH_ArkUI_RenderNodeUtils_GetBorderRadius(rsNode, &radiusOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderRadius result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetBorderRadius(nullptr, &radiusOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderRadius result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestBorderStyle(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);

    auto styleOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderStyleOption();
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetBorderStyle(rsNode, styleOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderStyle result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_SetBorderStyle(nullptr, styleOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderStyle result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret3 = OH_ArkUI_RenderNodeUtils_GetBorderStyle(rsNode, &styleOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderStyle result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetBorderStyle(nullptr, &styleOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderStyle result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestBorderWidth(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);

    auto widthOption = OH_ArkUI_RenderNodeUtils_CreateNodeBorderWidthOption();
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetBorderWidth(rsNode, widthOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderWidth result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_SetBorderWidth(nullptr, widthOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderWidth result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret3 = OH_ArkUI_RenderNodeUtils_GetBorderWidth(rsNode, &widthOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderWidth result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetBorderWidth(nullptr, &widthOption);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetBorderWidth result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestBounds(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);

    int32_t setBoundsX = 0;
    int32_t setBoundsY = 0;
    int32_t setBoundsWidth = 0;
    int32_t setBoundsHeight = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetBounds(rsNode, &setBoundsX, &setBoundsY,
        &setBoundsWidth, &setBoundsHeight);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetBounds result=%{public}d", result);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetBounds result=%{public}d", setBoundsX);
    ASSERT_EQ(setBoundsX, 0);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetBounds(rsNode, NUMBER_100, NUMBER_100, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetBounds result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RenderNodeUtils_GetBounds(rsNode, &setBoundsX, &setBoundsY,
        &setBoundsWidth, &setBoundsHeight);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetBounds result=%{public}d", setBoundsY);
    ASSERT_EQ(setBoundsY, NUMBER_100);
    auto ret2 = OH_ArkUI_RenderNodeUtils_SetBounds(rsNode, NUMBER_100, NUMBER_100, NUMBER_100, NUMBERNO_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetBounds result=%{public}d", ret2);
//    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    auto ret3 = OH_ArkUI_RenderNodeUtils_SetBounds(nullptr, NUMBER_100, NUMBER_100, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetBounds result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetBounds(nullptr, &setBoundsX, &setBoundsY,
        &setBoundsWidth, &setBoundsHeight);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetBounds result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestClipToBounds(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);

    int32_t clipToBounds = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetClipToBounds(rsNode, &clipToBounds);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToBounds result=%{public}d", result);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToBounds result=%{public}d", clipToBounds);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(clipToBounds, 0);
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetClipToBounds(rsNode, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToBounds result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RenderNodeUtils_GetClipToBounds(rsNode, &clipToBounds);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToBounds result=%{public}d", clipToBounds);
    ASSERT_EQ(clipToBounds, 1);
    auto ret2 = OH_ArkUI_RenderNodeUtils_SetClipToBounds(rsNode, NUMBER_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToBounds result=%{public}d", ret2);
//    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    auto ret3 = OH_ArkUI_RenderNodeUtils_SetClipToBounds(nullptr, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToBounds result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetClipToBounds(nullptr, &clipToBounds);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToBounds result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestClipToFrame(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
 
    int32_t clipToFrame = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetClipToFrame(rsNode, &clipToFrame);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToFrame result=%{public}d", result);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToFrame result=%{public}d", clipToFrame);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(clipToFrame, 0);
 
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetClipToFrame(rsNode, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToFrame result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RenderNodeUtils_GetClipToFrame(rsNode, &clipToFrame);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToFrame result=%{public}d", clipToFrame);
    ASSERT_EQ(clipToFrame, 1);
 
    auto ret2 = OH_ArkUI_RenderNodeUtils_SetClipToFrame(rsNode, NUMBER_19);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToFrame result=%{public}d", ret2);
//    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    auto ret3 = OH_ArkUI_RenderNodeUtils_SetClipToFrame(nullptr, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToFrame result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetClipToFrame(nullptr, &clipToFrame);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetClipToFrame result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestOpacity(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
 
    float opacity = 0;
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetOpacity(rsNode, NUMBER_0_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetOpacity result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetOpacity(rsNode, &opacity);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetOpacity result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(opacity, NUMBER_0_5);
 
    auto ret3 = OH_ArkUI_RenderNodeUtils_SetOpacity(rsNode, 29);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetOpacity result=%{public}d", ret3);
//    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    auto ret4 = OH_ArkUI_RenderNodeUtils_SetOpacity(nullptr, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetOpacity result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret5 = OH_ArkUI_RenderNodeUtils_GetOpacity(nullptr, &opacity);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetOpacity result=%{public}d", ret5);
    ASSERT_EQ(ret5, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestPivot(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
 
    float setPivotX = 0;
    float setPivotY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetPivot(rsNode, &setPivotX, &setPivotY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetPivot result=%{public}d", result);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(setPivotX, NUMBER_0_5);
 
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetPivot(rsNode, 1, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetPivot result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RenderNodeUtils_GetPivot(rsNode, &setPivotX, &setPivotY);
    ASSERT_EQ(setPivotX, 1);
 
    auto ret2 = OH_ArkUI_RenderNodeUtils_SetPivot(nullptr, 0, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetPivot result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret3 = OH_ArkUI_RenderNodeUtils_GetPivot(nullptr, &setPivotX, &setPivotY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetPivot result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestPosition(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
 
    int32_t setPositionX = 0;
    int32_t setPositionY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetPosition(rsNode, &setPositionX, &setPositionY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetPosition result=%{public}d", result);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetPosition result=%{public}d", setPositionX);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(setPositionX, 0);
 
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetPosition(rsNode, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetPosition result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RenderNodeUtils_GetPosition(rsNode, &setPositionX, &setPositionY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetPosition result=%{public}d", setPositionX);
    ASSERT_EQ(setPositionX, NUMBER_100);
 
    auto ret2 = OH_ArkUI_RenderNodeUtils_SetPosition(nullptr, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetPosition result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret3 = OH_ArkUI_RenderNodeUtils_GetPosition(nullptr, &setPositionX, &setPositionY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetPosition result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestRotation(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
 
    float setRotationX = 0;
    float setRotationY = 0;
    float setRotationZ = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetRotation(rsNode, &setRotationX, &setRotationY, &setRotationZ);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetRotation result=%{public}d", result);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(setRotationX, 0);
 
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetRotation(rsNode, NUMBER_100, 0, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetRotation result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RenderNodeUtils_GetRotation(rsNode, &setRotationX, &setRotationY, &setRotationZ);
    ASSERT_EQ(setRotationX, NUMBER_100);
 
    auto ret2 = OH_ArkUI_RenderNodeUtils_SetRotation(nullptr, NUMBER_100, 0, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetRotation result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret3 = OH_ArkUI_RenderNodeUtils_GetRotation(nullptr, &setRotationX, &setRotationY, &setRotationZ);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetRotation result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestScale(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    float setScaleX = 0;
    float setScaleY = 0;
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetScale(rsNode, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetScale result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetScale(rsNode, &setScaleX, &setScaleY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetScale result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(setScaleX, NUMBER_100);

    auto ret3 = OH_ArkUI_RenderNodeUtils_SetScale(nullptr, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetScale result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetScale(nullptr, &setScaleX, &setScaleY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetScale result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestSetDrawRegion(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetDrawRegion(rsNode, NUMBER_100, NUMBER_100, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetDrawRegion result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_SetDrawRegion(nullptr, NUMBER_100, NUMBER_100, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetDrawRegion result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestSetMarkNodeGroup(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode55 = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode55);
    auto rsNode99 = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddChild(rsNode55, rsNode99);
    
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetMarkNodeGroup(rsNode55, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetMarkNodeGroup result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_SetMarkNodeGroup(nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetMarkNodeGroup result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestShadowAlpha(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    float alpha = 0;
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetShadowAlpha(rsNode, NUMBER_0_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetShadowAlpha result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetShadowAlpha(rsNode, &alpha);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetShadowAlpha result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(alpha, NUMBER_0_5);

    auto ret3 = OH_ArkUI_RenderNodeUtils_SetShadowAlpha(nullptr, NUMBER_0_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetShadowAlpha result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetShadowAlpha(nullptr, &alpha);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetShadowAlpha result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestShadowColor(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    uint32_t shadowColor = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetShadowColor(rsNode, &shadowColor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowColor result=%{public}d", result);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowColor result=%{public}d", shadowColor);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(shadowColor, 0);
    
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetShadowColor(rsNode, 0xFFFF00FF);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowColor result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetShadowColor(rsNode, &shadowColor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowColor result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret3 = OH_ArkUI_RenderNodeUtils_SetShadowColor(nullptr, 0xFFFF00FF);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowColor result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetShadowColor(nullptr, &shadowColor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowColor result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestShadowElevation(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    float elevation = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetShadowElevation(rsNode, &elevation);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowElevation result=%{public}d", result);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(elevation, 0);
    
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetShadowElevation(rsNode, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowElevation result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetShadowElevation(rsNode, &elevation);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowElevation result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(elevation, NUMBER_100);
    auto ret3 = OH_ArkUI_RenderNodeUtils_SetShadowElevation(rsNode, NUMBERNO_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowElevation result=%{public}d", ret3);
//    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
 
    auto ret4 = OH_ArkUI_RenderNodeUtils_SetShadowElevation(nullptr, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowElevation result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret5 = OH_ArkUI_RenderNodeUtils_GetShadowElevation(nullptr, &elevation);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowElevation result=%{public}d", ret5);
    ASSERT_EQ(ret5, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestShadowOffset(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    int32_t shadowOffsetX = 0;
    int32_t shadowOffsetY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetShadowOffset(rsNode, &shadowOffsetX, &shadowOffsetY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowOffset result=%{public}d", result);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowOffset result=%{public}d", shadowOffsetX);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(shadowOffsetX, 0);
    
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetShadowOffset(rsNode, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowOffset result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetShadowOffset(rsNode, &shadowOffsetX, &shadowOffsetY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowOffset result=%{public}d", ret2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowOffset result=%{public}d", shadowOffsetX);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(shadowOffsetX, NUMBER_100);
    auto ret3 = OH_ArkUI_RenderNodeUtils_SetShadowOffset(nullptr, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowOffset result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetShadowOffset(nullptr, &shadowOffsetX, &shadowOffsetY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowOffset result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestShadowRadius(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    float radius = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetShadowRadius(rsNode, &radius);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowRadius result=%{public}d", result);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(radius, 0);

    auto ret1 = OH_ArkUI_RenderNodeUtils_SetShadowRadius(rsNode, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowRadius result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetShadowRadius(rsNode, &radius);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowRadius result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(radius, NUMBER_100);
    auto ret3 = OH_ArkUI_RenderNodeUtils_SetShadowRadius(nullptr, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowRadius result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetShadowRadius(nullptr, &radius);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetShadowRadius result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestSize(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    int32_t getSizeWidth = 0;
    int32_t getSizeHeight = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetSize(rsNode, &getSizeWidth, &getSizeHeight);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetSize result=%{public}d", result);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetSize result=%{public}d", getSizeWidth);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(getSizeWidth, 0);
    
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetSize(rsNode, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetSize result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetSize(rsNode, &getSizeWidth, &getSizeHeight);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetSize result=%{public}d", ret2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetSize result=%{public}d", getSizeWidth);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(getSizeWidth, NUMBER_100);
    auto ret3 = OH_ArkUI_RenderNodeUtils_SetSize(nullptr, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetSize result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetSize(nullptr, &getSizeWidth, &getSizeHeight);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetSize result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestTransform(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    float matrix[] = {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1};
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetTransform(rsNode, matrix);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetTransform result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_SetTransform(nullptr, matrix);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_SetTransform result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestTranslation(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    float setTranslationX = 0;
    float setTranslationY = 0;
    auto result = OH_ArkUI_RenderNodeUtils_GetTranslation(rsNode, &setTranslationX, &setTranslationY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetTranslation result=%{public}d", result);
    ASSERT_EQ(result, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(setTranslationX, 0);
    
    auto ret1 = OH_ArkUI_RenderNodeUtils_SetTranslation(rsNode, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetTranslation result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetTranslation(rsNode, &setTranslationX, &setTranslationY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetTranslation result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(setTranslationX, NUMBER_100);
    auto ret3 = OH_ArkUI_RenderNodeUtils_SetTranslation(nullptr, NUMBER_100, NUMBER_100);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetTranslation result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetTranslation(nullptr, &setTranslationX, &setTranslationY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_GetTranslation result=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value TestAddRenderNode001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom1, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    
    auto ret1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom1, rsNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_AddRenderNode result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto ret2 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom1, rsNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_AddRenderNode result=%{public}d", ret2);
//    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_CHILD_EXISTED);
    
    auto ret3 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom1, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_AddRenderNode result=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    NAPI_END;
}

static napi_value TestAddRenderNode002(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom2, ARKUI_NODE_CUSTOM);
    auto Custom1 = nodeAPI->createNode(ARKUI_NODE_CUSTOM);

    auto rsSubNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto rsSubSunNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom2, rsSubNode);
    OH_ArkUI_RenderNodeUtils_AddChild(rsSubNode, rsSubSunNode);
    
    auto ret5 = OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom1, rsSubSunNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_AddRenderNode result=%{public}d", ret5);
//    ASSERT_EQ(ret5, ARKUI_ERROR_CODE_RENDER_PARENT_EXISTED);

    NAPI_END;
}

static napi_value TestAddRenderNode003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    
    auto ret4 = OH_ArkUI_RenderNodeUtils_AddRenderNode(column, rsNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_AddRenderNode result=%{public}d", ret4);
//    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_NOT_CUSTOM_NODE);
    NAPI_END;
}

static napi_value TestRemoveRenderNode001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto ret1 = OH_ArkUI_RenderNodeUtils_RemoveRenderNode(Custom, rsNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_RemoveRenderNode result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto ret2 = OH_ArkUI_RenderNodeUtils_RemoveRenderNode(Custom, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_RemoveRenderNode result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);

    NAPI_END;
}

static napi_value TestRemoveRenderNode002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    
    auto ret3 = OH_ArkUI_RenderNodeUtils_RemoveRenderNode(column, rsNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_RemoveRenderNode result=%{public}d", ret3);
//    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NOT_CUSTOM_NODE);

    NAPI_END;
}

static napi_value TestClearRenderNodeChildren001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto ret1 = OH_ArkUI_RenderNodeUtils_ClearRenderNodeChildren(Custom);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_ClearRenderNodeChildren result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto ret2 = OH_ArkUI_RenderNodeUtils_ClearRenderNodeChildren(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_ClearRenderNodeChildren result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    NAPI_END;
}

static napi_value TestClearRenderNodeChildren002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    
    auto ret3 = OH_ArkUI_RenderNodeUtils_ClearRenderNodeChildren(column);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_ClearRenderNodeChildren result=%{public}d", ret3);
//    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NOT_CUSTOM_NODE);
    NAPI_END;
}

static napi_value TestInvalidate(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto rsNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddRenderNode(Custom, rsNode);
    
    auto ret1 = OH_ArkUI_RenderNodeUtils_Invalidate(Custom);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_Invalidate result=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto ret2 = OH_ArkUI_RenderNodeUtils_Invalidate(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_RenderNodeUtils_Invalidate result=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    NAPI_END;
}

} // namespace ArkUICapiTest