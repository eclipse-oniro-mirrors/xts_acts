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

#include "../manager/plugin_manager.h"
#include "textarea_onfocus_test.h"

#define PARAM_LENGTH 200

namespace ArkUICapiTest {
static ArkUI_NodeHandle textArea;
static ArkUI_NodeHandle textAreaCompare;
static ArkUI_NodeHandle row;
static ArkUI_NativeNodeAPI_1 *nodeAPI;

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    uint32_t background_color = COLOR_YELLOW;
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextAreaOnFocusTest", "OnEventReceive eventId: %{public}d",
                 eventId);
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_FOCUS_EVENT_ID) {
        background_color = COLOR_RED;
        ArkUI_NumberValue background_color_value[] = {{.u32 = background_color}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

static void BasicSet()
{
    row = nodeAPI->createNode(ARKUI_NODE_ROW);
    textArea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue width_value[] = {{.f32 = PARAM_LENGTH}};
    ArkUI_NumberValue height_value[] = {{.f32 = PARAM_LENGTH}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textArea, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(textArea, NODE_HEIGHT, &height_item);
    ArkUI_AttributeItem place_holder_item;
    place_holder_item.string = "NODE_TEXT_AREA_TEXT";
    nodeAPI->setAttribute(textArea, NODE_TEXT_AREA_TEXT, &place_holder_item);

    textAreaCompare = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue compare_width_value[] = {{.f32 = PARAM_LENGTH}};
    ArkUI_NumberValue compare_height_value[] = {{.f32 = PARAM_LENGTH}};
    ArkUI_AttributeItem compare_width_item = {compare_width_value,
                                              sizeof(compare_width_value) / sizeof(ArkUI_NumberValue)};
    ArkUI_AttributeItem compare_height_item = {compare_height_value,
                                               sizeof(compare_height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaCompare, NODE_WIDTH, &compare_width_item);
    nodeAPI->setAttribute(textAreaCompare, NODE_HEIGHT, &compare_height_item);

    ArkUI_NumberValue color_value[] = {{.u32 = COLOR_YELLOW}};
    ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaCompare, NODE_BACKGROUND_COLOR, &color_item);

    ArkUI_NumberValue value[] = {{.i32 = true}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaCompare, NODE_DEFAULT_FOCUS, &item);

    ArkUI_AttributeItem idItem = {};
    idItem.string = "TextAreaOnFocus";
    nodeAPI->setAttribute(textArea, NODE_ID, &idItem);

    ArkUI_AttributeItem idCompareItem = {};
    idCompareItem.string = "TextAreaOnFocusCompare";
    nodeAPI->setAttribute(textAreaCompare, NODE_ID, &idCompareItem);
}

napi_value TextAreaOnFocusTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    BasicSet();

    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textArea, NODE_BACKGROUND_COLOR, &item);

    nodeAPI->addChild(row, textAreaCompare);
    nodeAPI->addChild(row, textArea);

    nodeAPI->registerNodeEvent(textArea, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string idRow(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(idRow), row);

    napi_value exports;
    napi_create_object(env, &exports);

    return exports;
}
} // namespace ArkUICapiTest