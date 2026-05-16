/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "../manager/PluginManagerTest.h"
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
    OH_ArkUI_RenderNodeUtils_SetRectShapeOptionValue(rectShape, 50.0f, 50.0f, 100.0f, 100.0f);

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
        "OH_ArkUI_NodeUtils_AddRenderNode RenderNodeUtils_007 result=%{public}d", result2_1);
    ASSERT_EQ(result2_1, ARKUI_ERROR_CODE_NO_ERROR);

    auto roundShape = OH_ArkUI_RenderNodeUtils_CreateRoundRectShapeOption();
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionValue(roundShape, 50.0f, 50.0f, 100.0f, 100.0f);
    OH_ArkUI_RenderNodeUtils_SetRoundRectShapeOptionCornerXY(roundShape, 20.0f, 20.0f,
      ArkUI_CornerDirection::ARKUI_CORNER_DIRECTION_ALL);

    auto rectMask = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromRoundRectShape(roundShape);
    auto result2_2 = OH_ArkUI_RenderNodeUtils_SetMask(rsNodeRoot, rectMask);
    OH_ArkUI_RenderNodeUtils_DisposeRoundRectShapeOption(roundShape);
    ASSERT_EQ(result2_2, ARKUI_ERROR_CODE_NO_ERROR);

    auto resNullptr = OH_ArkUI_RenderNodeUtils_CreateRenderNodeMaskOptionFromRoundRectShape(nullptr);
    ASSERT_OBJ(resNullptr, nullptr);
    NAPI_END;
}
}