/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include "PointerEventGetCurrentLocalTest.h"
#include <string>
#include <sstream>
#include <iomanip>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include <arkui/ui_input_event.h>

static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

namespace ArkUICapiTest {

static ArkUI_NodeHandle g_textResultX = nullptr;
static ArkUI_NodeHandle g_textResultY = nullptr;
static ArkUI_NodeHandle g_textResultXByIndex = nullptr;
static ArkUI_NodeHandle g_textResultYByIndex = nullptr;

static void SetNodeID(ArkUI_NodeHandle &nodeHandle, std::string idValue)
{
    ArkUI_AttributeItem IDValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &IDValueItem);
}

static void UpdateTextContent(ArkUI_NodeHandle node, const std::string& prefix, float value)
{
    if (node == nullptr) {
        return;
    }
    std::ostringstream oss;
    oss << prefix << std::fixed << std::setprecision(PRECISION_DECIMAL_2) << value;
    std::string result = oss.str();
    ArkUI_AttributeItem textItem = {.string = result.c_str()};
    nodeAPI->setAttribute(node, NODE_TEXT_CONTENT, &textItem);
}

static void OnTouchEvent(ArkUI_NodeEvent* event)
{
    ArkUI_UIInputEvent* inputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    if (inputEvent == nullptr) {
        return;
    }
    
    int32_t eventType = OH_ArkUI_UIInputEvent_GetType(inputEvent);
    if (eventType != ARKUI_UIINPUTEVENT_TYPE_TOUCH) {
        return;
    }
    
    int32_t action = OH_ArkUI_UIInputEvent_GetAction(inputEvent);
    if (action == UI_TOUCH_EVENT_ACTION_DOWN || action == UI_TOUCH_EVENT_ACTION_MOVE) {
        float localX = OH_ArkUI_PointerEvent_GetCurrentLocalX(inputEvent);
        float localY = OH_ArkUI_PointerEvent_GetCurrentLocalY(inputEvent);
        float localXByIndex = OH_ArkUI_PointerEvent_GetCurrentLocalXByIndex(inputEvent, PARAM_0);
        float localYByIndex = OH_ArkUI_PointerEvent_GetCurrentLocalYByIndex(inputEvent, PARAM_0);
        
        UpdateTextContent(g_textResultX, "LocalX:", localX);
        UpdateTextContent(g_textResultY, "LocalY:", localY);
        UpdateTextContent(g_textResultXByIndex, "LocalXByIndex:", localXByIndex);
        UpdateTextContent(g_textResultYByIndex, "LocalYByIndex:", localYByIndex);
        
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "PointerEventGetCurrentLocalTest",
            "LocalX: %{public}f, LocalY: %{public}f, XByIndex: %{public}f, YByIndex: %{public}f",
            localX, localY, localXByIndex, localYByIndex);
    }
}

static ArkUI_NodeHandle CreateTextTitleNode(ArkUI_NativeNodeAPI_1* api)
{
    auto textTitle = api->createNode(ARKUI_NODE_TEXT);
    SetNodeID(textTitle, "textTitlePointerEventGetCurrentLocal");
    std::string titleStr = "PointerEvent GetCurrentLocal Test";
    ArkUI_AttributeItem titleItem = {.string = titleStr.c_str()};
    api->setAttribute(textTitle, NODE_TEXT_CONTENT, &titleItem);
    ArkUI_NumberValue titleFontSize[] = {{.f32 = FONT_SIZE_24}};
    ArkUI_AttributeItem fontSizeItem = {titleFontSize, PARAM_1};
    api->setAttribute(textTitle, NODE_FONT_SIZE, &fontSizeItem);
    return textTitle;
}

static ArkUI_NodeHandle CreateTouchAreaNode(ArkUI_NativeNodeAPI_1* api)
{
    auto touchArea = api->createNode(ARKUI_NODE_COLUMN);
    SetNodeID(touchArea, "touchAreaGetCurrentLocal");
    ArkUI_NumberValue widthValue[] = {{.f32 = PERCENT_80}};
    ArkUI_AttributeItem widthItem = {widthValue, PARAM_1};
    api->setAttribute(touchArea, NODE_WIDTH_PERCENT, &widthItem);
    ArkUI_NumberValue heightValue[] = {{.f32 = PERCENT_50}};
    ArkUI_AttributeItem heightItem = {heightValue, PARAM_1};
    api->setAttribute(touchArea, NODE_HEIGHT_PERCENT, &heightItem);
    ArkUI_NumberValue bgColor[] = {{.u32 = COLOR_LIGHT_GRAY}};
    ArkUI_AttributeItem bgItem = {bgColor, PARAM_1};
    api->setAttribute(touchArea, NODE_BACKGROUND_COLOR, &bgItem);
    
    auto touchAreaText = api->createNode(ARKUI_NODE_TEXT);
    SetNodeID(touchAreaText, "touchAreaText");
    std::string touchStr = "Touch Here";
    ArkUI_AttributeItem touchTextItem = {.string = touchStr.c_str()};
    api->setAttribute(touchAreaText, NODE_TEXT_CONTENT, &touchTextItem);
    api->addChild(touchArea, touchAreaText);
    
    api->registerNodeEvent(touchArea, NODE_TOUCH_EVENT, PARAM_0, nullptr);
    return touchArea;
}

static void CreateResultTextNodes(ArkUI_NativeNodeAPI_1* api, ArkUI_NodeHandle parent)
{
    g_textResultX = api->createNode(ARKUI_NODE_TEXT);
    SetNodeID(g_textResultX, "textResultGetCurrentLocalX");
    ArkUI_AttributeItem resultXItem = {.string = "LocalX:-1.0"};
    api->setAttribute(g_textResultX, NODE_TEXT_CONTENT, &resultXItem);
    api->addChild(parent, g_textResultX);

    g_textResultY = api->createNode(ARKUI_NODE_TEXT);
    SetNodeID(g_textResultY, "textResultGetCurrentLocalY");
    ArkUI_AttributeItem resultYItem = {.string = "LocalY:-1.0"};
    api->setAttribute(g_textResultY, NODE_TEXT_CONTENT, &resultYItem);
    api->addChild(parent, g_textResultY);

    g_textResultXByIndex = api->createNode(ARKUI_NODE_TEXT);
    SetNodeID(g_textResultXByIndex, "textResultGetCurrentLocalXByIndex");
    ArkUI_AttributeItem resultXByIndexItem = {.string = "LocalXByIndex:-1.0"};
    api->setAttribute(g_textResultXByIndex, NODE_TEXT_CONTENT, &resultXByIndexItem);
    api->addChild(parent, g_textResultXByIndex);

    g_textResultYByIndex = api->createNode(ARKUI_NODE_TEXT);
    SetNodeID(g_textResultYByIndex, "textResultGetCurrentLocalYByIndex");
    ArkUI_AttributeItem resultYByIndexItem = {.string = "LocalYByIndex:-1.0"};
    api->setAttribute(g_textResultYByIndex, NODE_TEXT_CONTENT, &resultYByIndexItem);
    api->addChild(parent, g_textResultYByIndex);
}

static void SetupEventReceiver(ArkUI_NativeNodeAPI_1* api)
{
    api->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        switch (eventType) {
            case NODE_TOUCH_EVENT: {
                OnTouchEvent(event);
                break;
            }
            default:
                break;
        }
    });
}

napi_value PointerEventGetCurrentLocalTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto columnParent = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    SetNodeID(columnParent, "columnPointerEventGetCurrentLocalTest");

    auto textTitle = CreateTextTitleNode(nodeAPI);
    nodeAPI->addChild(columnParent, textTitle);

    auto touchArea = CreateTouchAreaNode(nodeAPI);
    nodeAPI->addChild(columnParent, touchArea);

    CreateResultTextNodes(nodeAPI, columnParent);

    SetupEventReceiver(nodeAPI);

    std::string id(xComponentID);

    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), columnParent) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PointerEventGetCurrentLocalTest",
            "AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

PointerEventGetCurrentLocalTest::~PointerEventGetCurrentLocalTest() {}

} // namespace ArkUICapiTest