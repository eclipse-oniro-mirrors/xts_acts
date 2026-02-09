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

#include "commonevent_onareachange_test.h"
#include "../manager/plugin_manager.h"
#include <string>
#include <cmath>

namespace ArkUICapiTest {

#define ON_CLICK_EVENT_ID_OFFSET 16001
#define ON_AREA_CHANGE_SIZE_EVENT_ID 7004
#define ON_AREA_CHANGE_OFFSET_EVENT_ID 8004

static bool g_hasOnAreaChangeInit = false;

static bool NearEqual(float l, float r)
{
    return fabs(l - r) < 0.001f;
}

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, uint32_t initialColor, int32_t clickEventID)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_IMAGE_SPAN);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_40}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = initialColor}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_CLICK, clickEventID, nullptr);

    return nodeHandle;
}

static void PrintOnAreaChangeBackData(ArkUI_NodeComponentEvent *result)
{
    for (int i = PARAM_0; i < PARAM_12; i++) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventOnAreaChangeTest",
                     "PrintOnAreaChangeBackData result->data[%{public}d].f32: %{public}f", i, result->data[i].f32);
    }
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventOnAreaChangeTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventOnAreaChangeTest",
                     "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventOnAreaChangeTest",
                 "OnEventReceive eventId: %{public}d", eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_CLICK_EVENT_ID) {
        g_hasOnAreaChangeInit = true;
        ArkUI_NumberValue width_value[] = {{.f32 = SIZE_200}};
        ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_WIDTH, &width_item);
    }

    if (eventId == ON_CLICK_EVENT_ID_OFFSET) {
        g_hasOnAreaChangeInit = true;
        ArkUI_NumberValue offset_value[] = {{.f32 = SIZE_100}, {.f32 = SIZE_20}};
        ArkUI_AttributeItem offset_item = {offset_value, sizeof(offset_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_OFFSET, &offset_item);
    }

    if (g_hasOnAreaChangeInit && eventId == ON_AREA_CHANGE_SIZE_EVENT_ID) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        PrintOnAreaChangeBackData(result);
        bool checkResult = false;
        checkResult = (result->data[PARAM_0].f32 < result->data[PARAM_6].f32) &&
                      (NearEqual(result->data[PARAM_1].f32, result->data[PARAM_7].f32)) &&
                      (NearEqual(result->data[PARAM_2].f32, result->data[PARAM_8].f32)) &&
                      (NearEqual(result->data[PARAM_3].f32, result->data[PARAM_9].f32)) &&
                      (result->data[PARAM_4].f32 > result->data[PARAM_10].f32) &&
                      (NearEqual(result->data[PARAM_5].f32, result->data[PARAM_11].f32));
        if (checkResult) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }

    if (g_hasOnAreaChangeInit && eventId == ON_AREA_CHANGE_EVENT_ID) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        PrintOnAreaChangeBackData(result);
        bool checkResult = false;
        checkResult = (NearEqual(result->data[PARAM_0].f32, result->data[PARAM_6].f32)) &&
                      (NearEqual(result->data[PARAM_1].f32, result->data[PARAM_7].f32)) &&
                      (NearEqual(result->data[PARAM_2].f32, result->data[PARAM_8].f32)) &&
                      (NearEqual(result->data[PARAM_3].f32, result->data[PARAM_9].f32)) &&
                      (result->data[PARAM_4].f32 > result->data[PARAM_10].f32) &&
                      (NearEqual(result->data[PARAM_5].f32, result->data[PARAM_11].f32));
        if (checkResult) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }

    if (g_hasOnAreaChangeInit && eventId == ON_AREA_CHANGE_OFFSET_EVENT_ID) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

napi_value CommonEventOnAreaChangeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CommonEventOnAreaChangeTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventOnAreaChangeTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto rowSize = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto rowMove = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto rowOffset = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto imageSpanSize = createChildNode(nodeAPI, COLOR_RED, ON_CLICK_EVENT_ID);
    auto imageSpanMove = createChildNode(nodeAPI, COLOR_RED, ON_CLICK_EVENT_ID);
    auto imageSpanMoveCompare = createChildNode(nodeAPI, COLOR_PURPLE, ON_CLICK_EVENT_ID);
    auto imageSpanOffset = createChildNode(nodeAPI, COLOR_RED, ON_CLICK_EVENT_ID_OFFSET);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnAreaChangeTestImageSpanSize";
    nodeAPI->setAttribute(imageSpanSize, NODE_ID, &id_item);
    id_item.string = "OnAreaChangeTestImageSpanMove";
    nodeAPI->setAttribute(imageSpanMove, NODE_ID, &id_item);
    id_item.string = "OnAreaChangeTestImageSpanMoveCompare";
    nodeAPI->setAttribute(imageSpanMoveCompare, NODE_ID, &id_item);
    id_item.string = "OnAreaChangeTestImageSpanOffset";
    nodeAPI->setAttribute(imageSpanOffset, NODE_ID, &id_item);

    nodeAPI->addChild(rowSize, imageSpanSize);
    nodeAPI->addChild(rowMove, imageSpanMove);
    nodeAPI->addChild(rowMove, imageSpanMoveCompare);
    nodeAPI->addChild(rowOffset, imageSpanOffset);

    nodeAPI->registerNodeEvent(imageSpanSize, NODE_EVENT_ON_AREA_CHANGE, ON_AREA_CHANGE_SIZE_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(imageSpanMove, NODE_EVENT_ON_AREA_CHANGE, ON_AREA_CHANGE_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(imageSpanOffset, NODE_EVENT_ON_AREA_CHANGE, ON_AREA_CHANGE_OFFSET_EVENT_ID, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    nodeAPI->addChild(column, rowSize);
    nodeAPI->addChild(column, rowMove);
    nodeAPI->addChild(column, rowOffset);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CommonEventOnAreaChangeTest",
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