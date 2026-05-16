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

#include "eventInfo.h"

#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>
#include <database/udmf/udmf.h>
#include <database/udmf/udmf_meta.h>
#include <database/udmf/uds.h>
#include <string>

#include "../manager/plugin_manager.h"

namespace ArkUICapiTest {

std::vector<int32_t> EventInfoTest::resultTouch = {};
std::vector<int32_t> EventInfoTest::resultMove = {};

static napi_value SetArrayNapiDataWithGesture(const std::vector<int32_t> &data, napi_env env)
{
    napi_value array;
    napi_create_array(env, &array);
    for (size_t i = PARAM_0; i < data.size(); i++) {
        napi_value num;
        napi_create_int32(env, data[i], &num);
        napi_set_element(env, array, i, num);
    }
    return array;
};

static void PushBackIntToData(std::vector<int32_t> &data, int32_t value) { data.push_back(value); }

static auto createColumn(bool dropDataPrefetchOnNode)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto image = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    ArkUI_AttributeItem NODE_IMAGE_SRC_Item = {.string = "./resources/base/media/icon.png"};
    ArkUI_NumberValue imageWidthValue[] = {100};
    ArkUI_AttributeItem imageWidthItem = {imageWidthValue, 1};
    ArkUI_NumberValue imageHeightValue[] = {100};
    ArkUI_AttributeItem imageHeightItem = {imageHeightValue, 1};
    ArkUI_NumberValue marginValue[] = {20};
    ArkUI_AttributeItem marginItem = {marginValue, 1};
    nodeAPI->setAttribute(image, NODE_WIDTH, &imageWidthItem);
    nodeAPI->setAttribute(image, NODE_HEIGHT, &imageHeightItem);
    nodeAPI->setAttribute(image, NODE_IMAGE_SRC, &NODE_IMAGE_SRC_Item);
    nodeAPI->setAttribute(image, NODE_MARGIN, &marginItem);
    auto dragArea = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue heightValue1[] = {150};
    ArkUI_AttributeItem heightItem = {heightValue1, 1};
    ArkUI_NumberValue widthValue[] = {200};
    ArkUI_AttributeItem widthItem = {widthValue, 1};
    ArkUI_NumberValue borderValue[] = {1};
    ArkUI_AttributeItem borderItem = {borderValue, 1};
    nodeAPI->setAttribute(dragArea, NODE_WIDTH, &widthItem);
    nodeAPI->setAttribute(dragArea, NODE_HEIGHT, &heightItem);
    nodeAPI->setAttribute(dragArea, NODE_BORDER_WIDTH, &borderItem);
    nodeAPI->registerNodeEvent(image, NODE_TOUCH_EVENT, 0, nullptr);
    nodeAPI->registerNodeEvent(image, NODE_ON_MOUSE, 1, nullptr);
    OH_ArkUI_AllowNodeAllDropDataTypes(dragArea);
    OH_ArkUI_DisableDropDataPrefetchOnNode(dragArea, dropDataPrefetchOnNode);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "image";
    nodeAPI->setAttribute(image, NODE_ID, &id_item);
    id_item.string = "dragArea";
    nodeAPI->setAttribute(dragArea, NODE_ID, &id_item);
    nodeAPI->addChild(column, image);
    nodeAPI->addChild(column, dragArea);
    return column;
}

static void OnEventTouch(ArkUI_UIInputEvent *inputEvent)
{
    auto action = OH_ArkUI_UIInputEvent_GetAction(inputEvent);
    if (action != 1) {
        return;
    }
    auto displayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(inputEvent);
    PushBackIntToData(EventInfoTest::resultTouch, displayId);
    auto pressedTime = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(inputEvent, 0);
    PushBackIntToData(EventInfoTest::resultTouch, pressedTime);
}

static void OnEventMouse(ArkUI_UIInputEvent *inputEvent)
{
    auto action = OH_ArkUI_UIInputEvent_GetAction(inputEvent);
    if (action != 1) {
        return;
    }
    auto displayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(inputEvent);
    PushBackIntToData(EventInfoTest::resultMove, displayId);
    auto pressedTime = OH_ArkUI_PointerEvent_GetPressedTimeByIndex(inputEvent, 0);
    PushBackIntToData(EventInfoTest::resultMove, pressedTime);
    auto rawDeltaX = OH_ArkUI_MouseEvent_GetRawDeltaX(inputEvent);
    auto rawDeltaY = OH_ArkUI_MouseEvent_GetRawDeltaY(inputEvent);
    PushBackIntToData(EventInfoTest::resultMove, rawDeltaX);
    PushBackIntToData(EventInfoTest::resultMove, rawDeltaY);
    auto pressedButtons = OH_ArkUI_MouseEvent_GetPressedButtons(inputEvent, nullptr, nullptr);
    PushBackIntToData(EventInfoTest::resultMove, pressedButtons);
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "EventInfoTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EventInfoTest", "OnEventReceive: event is null");
        return;
    }

    auto eventId = OH_ArkUI_NodeEvent_GetEventType(event);
    auto inputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    if (eventId == NODE_TOUCH_EVENT) {
        OnEventTouch(inputEvent);
    }
    if (eventId == NODE_ON_MOUSE) {
        OnEventMouse(inputEvent);
    }
}

napi_value EventInfoTest::TestEventInfoGetPressedTime001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "startDataLoading", "CreateNativeNode");

    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "startDataLoading", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = createColumn(true);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "startDataLoading",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value EventInfoTest::GetResultTouch(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EventInfoTest", "GetEventInfoData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiDataWithGesture(EventInfoTest::resultTouch, env));
    EventInfoTest::resultTouch.clear();
    return result;
}

napi_value EventInfoTest::GetResultMove(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EventInfoTest", "GetEventInfoData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiDataWithGesture(EventInfoTest::resultMove, env));
    EventInfoTest::resultMove.clear();
    return result;
}
} // namespace ArkUICapiTest