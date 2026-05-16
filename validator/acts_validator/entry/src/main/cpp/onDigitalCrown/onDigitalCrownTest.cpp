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

#include "onDigitalCrownTest.h"
#include <string>
#include "PluginManagerTest.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include "common/common.h"
#include "common/commonDragEvent.h"
#include <arkui/drag_and_drop.h>
#include <arkui/native_dialog.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/ui_input_event.h>
#include <hilog/log.h>
#include <sstream>

#define HILOG_USE_FLOAT 1
#define TEXT_LOG_DOMAIN 0xD001100
#define TEXT_LOG_TAG "Text_Event"

namespace ArkUICapiTest {
static ArkUI_NodeHandle refresh;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle spanColumn = nullptr;
static ArkUI_NodeHandle text = nullptr;
// 设置ID
static auto IDTest(ArkUI_NodeHandle &nodeHandle, std::string isID)
{
    std::string idValue = isID;
    ArkUI_AttributeItem IDValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &IDValueItem);
}

static void UpdateTextAndLog(ArkUI_NodeHandle textNode, const std::string& eventInfo)
{

    OH_LOG_Print(LOG_APP, LOG_INFO, TEXT_LOG_DOMAIN, TEXT_LOG_TAG, "Event Info: %{public}s", eventInfo.c_str());
    
    if (nodeAPI == nullptr || textNode == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, TEXT_LOG_DOMAIN, TEXT_LOG_TAG,
            "UpdateTextAndLog param is null (nodeAPI:%p, textNode:%p)", nodeAPI, textNode);
        return;
    }
    ArkUI_AttributeItem textItem = {0};
    textItem.string = eventInfo.c_str();
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &textItem);
}

static void OnEventReceive(ArkUI_NodeEvent* event)
{
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
}

napi_value onDigitalCrownTest::CreateNativeNode(napi_env env, napi_callback_info info)
    {

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    if (nodeAPI != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, TEXT_LOG_DOMAIN, TEXT_LOG_TAG, "CreateNativeNode  34444");
        if (nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_INFO, TEXT_LOG_DOMAIN, TEXT_LOG_TAG, "OnSurfaceCreatedCB  222--1");

            spanColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            text = nodeAPI->createNode(ARKUI_NODE_TEXT);

            if (spanColumn == nullptr || text == nullptr) {
                OH_LOG_Print(LOG_APP, LOG_ERROR, TEXT_LOG_DOMAIN, TEXT_LOG_TAG,
                    "Create node failed (spanColumn:%p, text:%p)", spanColumn, text);
                return nullptr;
            }

            ArkUI_NumberValue widthValue[] = {0.9};
            ArkUI_AttributeItem TextSizeItem = {widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(text, NODE_WIDTH_PERCENT, &TextSizeItem);
            nodeAPI->setAttribute(text, NODE_HEIGHT_PERCENT, &TextSizeItem);

            ArkUI_NumberValue borderRadiusVal = {.f32 = 116.5f};
            ArkUI_AttributeItem borderRadiusItem = {&borderRadiusVal, 1};
            nodeAPI->setAttribute(text, NODE_BORDER_RADIUS, &borderRadiusItem);

            ArkUI_NumberValue focusableVal = {.i32 = 1};
            ArkUI_AttributeItem focusableItem = {&focusableVal, 1};
            nodeAPI->setAttribute(text, NODE_FOCUSABLE, &focusableItem);
            ArkUI_NumberValue defaultFocusVal = {.i32 = 1};
            ArkUI_AttributeItem defaultFocusItem = {&defaultFocusVal, 1};
            nodeAPI->setAttribute(text, NODE_DEFAULT_FOCUS, &defaultFocusItem);
            ArkUI_NumberValue focusOnTouchVal = {.i32 = 1};
            ArkUI_AttributeItem focusOnTouchItem = {&focusOnTouchVal, 1};
            nodeAPI->setAttribute(text, NODE_FOCUS_ON_TOUCH, &focusOnTouchItem);

            ArkUI_NumberValue alignVal = {.i32 = 1};
            ArkUI_AttributeItem alignItem = {&alignVal, 1};
            nodeAPI->setAttribute(text, NODE_TEXT_ALIGN, &alignItem);
            IDTest(text, "text");

            std::string initText = "onDigitalCrown";
            UpdateTextAndLog(text, initText);

            ArkUI_NumberValue backgroundColorVal = {.f32 = static_cast<float>(0xFF00FFFF)};
            ArkUI_AttributeItem backgroundColorItem = {&backgroundColorVal, 1};
            nodeAPI->setAttribute(spanColumn, NODE_BACKGROUND_COLOR, &backgroundColorItem);
            
            nodeAPI->registerNodeEvent(text, NODE_ON_DIGITAL_CROWN, 1, &text);
            nodeAPI->addNodeEventReceiver(spanColumn, [](ArkUI_NodeEvent *event) {
                if (!event) return;
                auto *inputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                if (!inputEvent) return;

                auto eventType = OH_ArkUI_UIInputEvent_GetType(inputEvent);
                std::string logMsg;
                if (OH_ArkUI_NodeEvent_GetEventType(event) == NODE_ON_CLICK) {
                    logMsg = "spanColumn: click isPropagation";
                } else if (OH_ArkUI_NodeEvent_GetEventType(event) == NODE_ON_DIGITAL_CROWN) {
                    logMsg = "spanColumn: crown isPropagation";
                } else if (eventType == ARKUI_UIINPUTEVENT_TYPE_UNKNOWN) {
                    logMsg = "spanColumn: UNKNOWN UIINPUTEVENT!";
                }
                OH_LOG_Print(LOG_APP, LOG_INFO, TEXT_LOG_DOMAIN, TEXT_LOG_TAG, "%{public}s", logMsg.c_str());
            });

            nodeAPI->addNodeEventReceiver(text, [](ArkUI_NodeEvent *event) {
                if (!event || text == nullptr) {
                    OH_LOG_Print(LOG_APP, LOG_WARN, TEXT_LOG_DOMAIN, TEXT_LOG_TAG,
                        "Event is null or text node destroyed");
                    return;
                }

                auto *inputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
                if (!inputEvent) return;

                auto eventType = OH_ArkUI_UIInputEvent_GetType(inputEvent);
                auto nodeEventType = OH_ArkUI_NodeEvent_GetEventType(event);
                std::string eventInfo;

                if (nodeEventType == NODE_ON_CLICK) {
                    auto displayId = OH_ArkUI_UIInputEvent_GetTargetDisplayId(inputEvent);
                    std::ostringstream oss;
                    oss << "displayId = " << displayId;
                    eventInfo = oss.str();
                    UpdateTextAndLog(text, eventInfo);
                } else if (nodeEventType == NODE_ON_DIGITAL_CROWN) {
                    if (eventType == ARKUI_UIINPUTEVENT_TYPE_DIGITAL_CROWN) {
                        std::ostringstream oss;
                        auto ARKUI_ERROR_CODE_PARAM_INVALID = OH_ArkUI_DigitalCrownEvent_SetStopPropagation(nullptr, false);
                        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "errorCode",
                                 "SetStopPropagation 0 ARKUI_ERROR_CODE_PARAM_INVALID: %{public}d", ARKUI_ERROR_CODE_PARAM_INVALID);

                        auto ARKUI_ERROR_CODE_NO_ERROR = OH_ArkUI_DigitalCrownEvent_SetStopPropagation(inputEvent, true);
                        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "errorCode",
                                 "SetStopPropagation 0 ARKUI_ERROR_CODE_NO_ERROR: %{public}d", ARKUI_ERROR_CODE_NO_ERROR);

                            oss <<"errorcode:"<< ARKUI_ERROR_CODE_NO_ERROR
                                <<", errorcode:"<< ARKUI_ERROR_CODE_PARAM_INVALID
                                << "\naction:" << OH_ArkUI_DigitalCrownEvent_GetAction(inputEvent)
                                << ", angularVelocity:" << OH_ArkUI_DigitalCrownEvent_GetAngularVelocity(inputEvent)
                                << ", degree:" << OH_ArkUI_DigitalCrownEvent_GetDegree(inputEvent)
                                << ", eventTime:" << OH_ArkUI_DigitalCrownEvent_GetEventTime(inputEvent);

                            if (OH_ArkUI_DigitalCrownEvent_GetAction(inputEvent) == ARKUI_CROWNEVENT_ACTION_UNKNOWN) {
                                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                                    "DigitalCrown", "ARKUI_CROWNEVENT_ACTION_UNKNOWN 0");
                            }
                            if (OH_ArkUI_DigitalCrownEvent_GetAction(inputEvent) == ARKUI_CROWNEVENT_ACTION_UPDATE) {
                                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                                    "DigitalCrown", "ARKUI_CROWNEVENT_ACTION_UPDATE 1");
                            }
                            if (OH_ArkUI_DigitalCrownEvent_GetAction(inputEvent) == ARKUI_CROWNEVENT_ACTION_END) {
                                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                                    "DigitalCrown", "ARKUI_CROWNEVENT_ACTION_END 2");
                            }

                        eventInfo = oss.str();
                        UpdateTextAndLog(text, eventInfo);
                    }
                } else if (eventType == ARKUI_UIINPUTEVENT_TYPE_UNKNOWN) {
                    std::ostringstream oss;
                    oss << "UIINPUTEVENT_TYPE_UNKNOWN";
                    eventInfo = oss.str();
                    UpdateTextAndLog(text, eventInfo);
                }
            });

            nodeAPI->setAttribute(spanColumn, NODE_WIDTH_PERCENT, &TextSizeItem);
            nodeAPI->setAttribute(spanColumn, NODE_HEIGHT_PERCENT, &TextSizeItem);
            nodeAPI->setAttribute(spanColumn, NODE_BORDER_RADIUS, &borderRadiusItem);
            nodeAPI->addChild(spanColumn, text);
        }
    }

    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), spanColumn);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest