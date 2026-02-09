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
#include "../manager/plugin_manager.h"
#include "NodeUtilsReturnTest.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_types.h>
#include <string>

namespace ArkUICapiTest {

static void OnEventReceive(ArkUI_NodeCustomEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testGetPositionInLayout001", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testGetPositionInLayout001",
            "OnEventReceive: event is null");
        return;
    }
    int32_t eventId = OH_ArkUI_NodeCustomEvent_GetEventTargetId(event);
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto nodeHandler = OH_ArkUI_NodeCustomEvent_GetNodeHandle(event);
    if (eventId == ON_DRAW_EVENT_ID) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "on OH_ArkUI_NodeCustomEvent_GetPositionInLayout "
                     "ArkUI_IntOffset.x: %{public}d ArkUI_IntOffset.y: %{public}d",
                     OH_ArkUI_NodeCustomEvent_GetPositionInLayout(event).x,
                     OH_ArkUI_NodeCustomEvent_GetPositionInLayout(event).y);
        auto *drawContext = OH_ArkUI_NodeCustomEvent_GetDrawContextInDraw(event);
        auto *canvas1 = OH_ArkUI_DrawContext_GetCanvas(drawContext);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                     "registerCustomNodeEventReceiver width == %{public}d  "
                     "height == %{public}d",
                     OH_ArkUI_DrawContext_GetSize(drawContext).width,
                     OH_ArkUI_DrawContext_GetSize(drawContext).height);
        
        auto x = OH_ArkUI_NodeCustomEvent_GetPositionInLayout(event).x;
        auto y = OH_ArkUI_NodeCustomEvent_GetPositionInLayout(event).y;
        auto width = OH_ArkUI_DrawContext_GetSize(drawContext).width;
        auto height = OH_ArkUI_DrawContext_GetSize(drawContext).height;
        if (x < 0 && y >=0 && width > 0 && height > 0) {
            ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_GREEN } };
            ArkUI_AttributeItem background_color_item = { background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

napi_value NodeUtilsReturnTest::testGetPositionGetSize001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testGetPositionInLayout001", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testGetPositionInLayout001",
            "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue sizeValue1[] = { { .f32 = SIZE_200 }, { .f32 = SIZE_200 } };
    ArkUI_AttributeItem sizeItem1 = { sizeValue1, sizeof(sizeValue1) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(column, NODE_SIZE, &sizeItem1);
    
    auto custom = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    ArkUI_NumberValue sizeValue2[] = { { .f32 = SIZE_100 }, { .f32 = SIZE_100 } };
    ArkUI_AttributeItem sizeItem2 = { sizeValue2, sizeof(sizeValue2) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(custom, NODE_SIZE, &sizeItem2);

    ArkUI_NumberValue backgroundColorValue[] = { { .u32 = COLOR_RED } };
    ArkUI_AttributeItem backgroundColorItem = { backgroundColorValue,
        sizeof(backgroundColorValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(custom, NODE_BACKGROUND_COLOR, &backgroundColorItem);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnDrawTest";
    nodeAPI->setAttribute(custom, NODE_ID, &id_item);

    nodeAPI->addChild(column, custom);
    nodeAPI->registerNodeCustomEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeCustomEvent(custom, ARKUI_NODE_CUSTOM_EVENT_ON_DRAW, ON_DRAW_EVENT_ID, nullptr);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testAddCustomProperty001",
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