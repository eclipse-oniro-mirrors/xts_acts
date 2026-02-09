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
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include "HasAxisTest.h"

static ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
static bool g_hasAxis = false;
static ArkUI_NodeHandle Text1 = nullptr;
static ArkUI_NodeHandle Text2 = nullptr;
static ArkUI_NodeHandle Text3 = nullptr;

namespace ArkUICapiTest {

napi_value HasAxisTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                     "TextContentAlignTest", "GetContext env or info is null");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    Text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    Text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    Text3 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem LABEL_Item1 = {.string = "false"};
    ArkUI_AttributeItem LABEL_Item2 = {.string = "onAxisEvent test"};
    ArkUI_AttributeItem LABEL_ItemHas1 = {.string = "has1"};
    ArkUI_AttributeItem LABEL_ItemHas2 = {.string = "has2"};
    ArkUI_AttributeItem LABEL_ItemHas3 = {.string = "has3"};
    ArkUI_AttributeItem buttonIdItem  = {.string = "button"};
    nodeAPI->setAttribute(Text1, NODE_TEXT_CONTENT, &LABEL_Item1);
    nodeAPI->setAttribute(Text2, NODE_TEXT_CONTENT, &LABEL_Item1);
    nodeAPI->setAttribute(Text3, NODE_TEXT_CONTENT, &LABEL_Item1);
    nodeAPI->setAttribute(Text1, NODE_ID, &LABEL_ItemHas1);
    nodeAPI->setAttribute(Text2, NODE_ID, &LABEL_ItemHas2);
    nodeAPI->setAttribute(Text3, NODE_ID, &LABEL_ItemHas3);
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &LABEL_Item2);
    nodeAPI->setAttribute(button, NODE_ID, &buttonIdItem);
    nodeAPI->addChild(Column, Text1);
    nodeAPI->addChild(Column, Text2);
    nodeAPI->addChild(Column, Text3);
    nodeAPI->addChild(Column, button);
    nodeAPI->registerNodeEvent(button, NODE_ON_AXIS, 0, nullptr);
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        switch (eventType) {
            case NODE_ON_AXIS: {
                auto *uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                auto VERTICAL_AXIS = OH_ArkUI_AxisEvent_HasAxis(uiInputEvent, UI_AXIS_TYPE_VERTICAL_AXIS);
                auto HORIZONTAL_AXIS = OH_ArkUI_AxisEvent_HasAxis(uiInputEvent, UI_AXIS_TYPE_HORIZONTAL_AXIS);
                auto PINCH_AXIS = OH_ArkUI_AxisEvent_HasAxis(uiInputEvent, UI_AXIS_TYPE_PINCH_AXIS);
                if (VERTICAL_AXIS == 1) {
                    ArkUI_AttributeItem LABEL_Item1 = {.string = "true"};
                    nodeAPI->setAttribute(Text1, NODE_TEXT_CONTENT, &LABEL_Item1);
                }
                if (HORIZONTAL_AXIS == 0) {
                    ArkUI_AttributeItem LABEL_Item2 = {.string = "true"};
                    nodeAPI->setAttribute(Text2, NODE_TEXT_CONTENT, &LABEL_Item2);
                }
                if (PINCH_AXIS == 0) {
                    ArkUI_AttributeItem LABEL_Item3 = {.string = "true"};
                    nodeAPI->setAttribute(Text3, NODE_TEXT_CONTENT, &LABEL_Item3);
                }
                break;
            }
            default:{
                break;
            }
        }
    }
    );
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
        Column) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextContentAlignTest",
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