/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "customcomponent_ondraw_behind_test.h"
#include "../manager/plugin_manager.h"
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_types.h>
#include <string>

namespace ArkUICapiTest {

static void OnEventReceive(ArkUI_NodeCustomEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentOnDrawTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentOnDrawTest",
                     "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeCustomEvent_GetEventTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentOnDrawTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeCustomEvent_GetNodeHandle(event);

    if (eventId == ON_DRAW_EVENT_ID) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);

        ArkUI_DrawContext *drawContext = OH_ArkUI_NodeCustomEvent_GetDrawContextInDraw(event);
        OH_Drawing_Canvas *canvas = reinterpret_cast<OH_Drawing_Canvas *>(OH_ArkUI_DrawContext_GetCanvas(drawContext));
        OH_Drawing_Pen *pen = OH_Drawing_PenCreate();

        OH_Drawing_PenSetAntiAlias(pen, true);
        OH_Drawing_PenSetColor(pen, COLOR_BLUE);
        OH_Drawing_PenSetWidth(pen, SIZE_30);
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawLine(canvas, SIZE_10, SIZE_10, SIZE_180, SIZE_180);
        OH_Drawing_PenDestroy(pen);
        pen = nullptr;
    }
}

napi_value CustomComponentOnDrawBehindTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomComponentOnDrawTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentOnDrawTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto custom = nodeAPI->createNode(ARKUI_NODE_CUSTOM);

    ArkUI_NumberValue sizeValue[] = {{.f32 = SIZE_200}, {.f32 = SIZE_200}};
    ArkUI_AttributeItem sizeItem = {sizeValue, sizeof(sizeValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(custom, NODE_SIZE, &sizeItem);

    ArkUI_NumberValue backgroundColorValue[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem backgroundColorItem = {backgroundColorValue,
                                               sizeof(backgroundColorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(custom, NODE_BACKGROUND_COLOR, &backgroundColorItem);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnDrawTest";
    nodeAPI->setAttribute(custom, NODE_ID, &id_item);

    nodeAPI->addChild(column, custom);

    nodeAPI->registerNodeCustomEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeCustomEvent(custom, ARKUI_NODE_CUSTOM_EVENT_ON_DRAW_BEHIND, ON_DRAW_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomComponentOnDrawTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest