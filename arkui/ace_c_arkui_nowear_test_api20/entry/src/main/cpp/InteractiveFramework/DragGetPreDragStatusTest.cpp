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

#include "DragGetPreDragStatusTest.h"
#include "../manager/plugin_manager.h"
#include <arkui/drag_and_drop.h>
#include <string>
#include "common.h"

namespace ArkUICapiTest {
ArkUI_DragStatus status;
ArkUI_DragAction *action5 = nullptr;
static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, bool enabled) {
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem LABEL_Item = {.string = "drag_getPreDragStatus Test"};
    ArkUI_NumberValue fontSize[] = {PARAM_20};
    ArkUI_AttributeItem Font_Item = {fontSize, PARAM_1};
    ArkUI_NumberValue marginValue[] = {PARAM_20};
    ArkUI_AttributeItem marginItem = {marginValue, PARAM_1};
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_CONTENT, &LABEL_Item);
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_FONT, &Font_Item);
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &marginItem);
    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_DRAG_START, PARAM_1, nullptr);
    OH_ArkUI_SetNodeDraggable(nodeHandle, true);

    return nodeHandle;
}
int dragStatus0 = PARAM_0;
int dragStatus1 = PARAM_0;

void DragStatusListener(ArkUI_DragAndDropInfo *info, void *userData)
{
    auto status = OH_ArkUI_DragAndDropInfo_GetDragStatus(info);
    if (status == PARAM_0){
        dragStatus0 = status;
    } else {
        dragStatus1 = status;
    }
    auto dragEvent = OH_ArkUI_DragAndDropInfo_GetDragEvent(info);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest", "DragStatusListener called");
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest", "dragStatus = %{public}d, &dragEvent = %{public}p",
                 status, dragEvent);
}

napi_value GetPreDragStatusTest::Enum_ARKUI_DRAG_STATUS_STARTED(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(dragStatus0, ARKUI_DRAG_STATUS_STARTED);
    ASSERT_EQ(dragStatus1, ARKUI_DRAG_STATUS_ENDED);
    NAPI_END;
}

static void OnEventReceive(ArkUI_NodeEvent *event) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest", "OnEventReceive: event is null");
        return;
    }

    auto dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest", "OnEventReceive : %{public}p",
                 dragEvent);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);


    auto result = OH_ArkUI_NodeEvent_GetPreDragStatus(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest",
                 "Drag GetPreDragStatus result : %{public}p", result);
    auto dragAction = OH_ArkUI_CreateDragActionWithNode(nodeHandler);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "drag_RegisterStatusListener", "result:%{public}p", dragAction);
    
    std::vector<ArkUI_PreDragStatus> resultList;
    resultList.push_back(result);
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest",
                 "Drag GetPreDragStatus result added to list");
    
    bool containsSpecificStatus = true;
    std::vector<ArkUI_PreDragStatus> specificStatuses = {ARKUI_PRE_DRAG_STATUS_UNKNOWN,
                                                         ARKUI_PRE_DRAG_STATUS_ACTION_DETECTING,
                                                         ARKUI_PRE_DRAG_STATUS_READY_TO_TRIGGER_DRAG,
                                                         ARKUI_PRE_DRAG_STATUS_PREVIEW_LIFT_STARTED,
                                                         ARKUI_PRE_DRAG_STATUS_PREVIEW_LIFT_FINISHED,
                                                         ARKUI_PRE_DRAG_STATUS_PREVIEW_LANDING_STARTED,
                                                         ARKUI_PRE_DRAG_STATUS_PREVIEW_LANDING_FINISHED,
                                                         ARKUI_PRE_DRAG_STATUS_CANCELED_BEFORE_DRAG};

    for (auto status : resultList) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest", "Checking status: %{public}d",
                     status);

        bool found = false;
        if (status == PARAM_7) {
            continue;
        } else {
            for (auto specificStatus : specificStatuses) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest",
                             "Checking against specific status: %{public}d",
                             specificStatus);

                if (status == specificStatus) {
                    found = true;
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest",
                                 "Match found for status: %{public}d", status);
                    break;
                }
            }

            if (!found) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest",
                             "No match found for status: %{public}d", status);
                containsSpecificStatus = false;
                break;
            }
        }
    }

    if (containsSpecificStatus) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest",
                     "Drag GetPreDragStatus result2 : %{public}d", result);
    }
}

ArkUI_NodeHandle dragButton = nullptr;
ArkUI_NodeHandle dropButton = nullptr;
void SetDragActionData()
{
    // 创建OH_UdmfRecord对象
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    // 向OH_UdmfRecord中添加纯文本类型数据
    OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
    int returnStatus;
    OH_UdsPlainText_SetAbstract(plainText, "this is plainText Abstract example");
    OH_UdsPlainText_SetContent(plainText, "this is plainText Content example");
    returnStatus = OH_UdmfRecord_AddPlainText(record, plainText);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00U, "dragTest",
        "dragTest OH_UdmfRecord_AddPlainText returnStatus = %{public}d", returnStatus);
    // 创建OH_UdmfData对象
    OH_UdmfData *data = OH_UdmfData_Create();
    // 向OH_UdmfData中添加OH_UdmfRecord
    returnStatus = OH_UdmfData_AddRecord(data, record);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00U, "dragTest",
        "dragTest OH_UdmfData_AddRecord returnStatus = %{public}d", returnStatus);
    int returnValue = OH_ArkUI_DragAction_SetData(action, data);
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00U, "dragTest",
        "OH_ArkUI_DragAction_SetData returnValue = %{public}d", returnValue);
    // 注册拖拽状态监听回调
    OH_ArkUI_DragAction_RegisterStatusListener(action, data, &DragStatusListener);
}

void RegisterNodeEventForthReceiver1()
{
    if (!nodeAPI) {
        return;
    }

    // [Start on_touchIntercept]
    nodeAPI->addNodeEventReceiver(dragButton, [](ArkUI_NodeEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00U, "dragTest", "RegisterNodeEventForthReceiver called");
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto preDragStatus = OH_ArkUI_NodeEvent_GetPreDragStatus(event);
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00U, "dragTest",
            "eventType = %{public}d, preDragStatus = %{public}d", eventType, preDragStatus);

        auto *dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
        switch (eventType) {
            // [Start set_dragAction]
            case NODE_ON_TOUCH_INTERCEPT: {
                OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00U, "dragTest", "NODE_ON_TOUCH_INTERCEPT EventReceiver");
                // [StartExclude on_touchIntercept]
                // 创建DragAction
                action = OH_ArkUI_CreateDragActionWithNode(dragButton);
                OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00U, "dragTest",
                    "OH_ArkUI_CreateDragActionWithNode returnValue = %{public}p", action);
                // 设置pixelMap
                std::vector<OH_PixelmapNative *> pixelVector;
                // 设置DragPreviewOption
                SetDragPreviewOption();
                // 设置pointerId、touchPoint
                PrintDragActionInfos();
                // 设置unifiedData
                SetDragActionData();
                // startDrag
                int returnValue = OH_ArkUI_StartDrag(action);
                OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00U, "dragTest",
                    "OH_ArkUI_StartDrag returnValue = %{public}d",
                    returnValue);
                OH_ArkUI_DragAction_Dispose(action);
                break;
            }
            default: {
                OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00U, "dragTest", "UNKNOWN EventReceiver");
                break;
            }
        }
    });
}
void ForthModule(ArkUI_NodeHandle &root)
{
    auto column4 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    SetWidthPercent(column4, PARAM_1);
    SetColumnJustifyContent(column4, ARKUI_FLEX_ALIGNMENT_START);
    SetColumnAlignItem(column4, ARKUI_HORIZONTAL_ALIGNMENT_START);
    SetPadding(column4, BLANK_10);
    SetBorderWidth(column4, BORDER_WIDTH_1);
    SetBorderStyle(column4, ARKUI_BORDER_STYLE_DASHED, DEFAULT_RADIUS);

    auto title4 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    SetTextAttribute(title4, "主动发起拖拽示例：", TEXT_FONT_SIZE_15, SIZE_170, SIZE_20);
    nodeAPI->addChild(column4, title4);

    auto dragRow = nodeAPI->createNode(ARKUI_NODE_ROW);
    SetRowAlignItem(dragRow, ARKUI_VERTICAL_ALIGNMENT_TOP);
    nodeAPI->addChild(column4, dragRow);
    
    enum {
        BUTTON_TOUCH = 1
    };
    dragButton = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    SetId(dragButton, "dragBt3");
    SetCommonAttribute(dragButton, SIZE_80, SIZE_50, COLOR_RED, BLANK_20);
    SetButtonLabel(dragButton, "拖起");
    nodeAPI->registerNodeEvent(dragButton, NODE_ON_TOUCH_INTERCEPT, BUTTON_TOUCH, nullptr);
    // [End touch_intercept]
    nodeAPI->addChild(dragRow, dragButton);

    dropButton = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    SetId(dropButton, "dropBt3");
    SetCommonAttribute(dropButton, SIZE_140, SIZE_50, COLOR_RED, BLANK_20);
    SetButtonLabel(dropButton, "拖拽至此处");
    nodeAPI->registerNodeEvent(dropButton, NODE_ON_DROP, 1, nullptr);
    nodeAPI->addChild(dragRow, dropButton);

    nodeAPI->addChild(root, column4);

    RegisterNodeEventForthReceiver1();
}

napi_value GetPreDragStatusTest::CreateNativeNode(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest",
                     "GetContext env or info is null");
        return nullptr;
    }
    
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text1 = createChildNode(nodeAPI, true);
    auto text2 = createChildNode(nodeAPI, true);
    nodeAPI->registerNodeEvent(text2, NODE_ON_PRE_DRAG, PARAM_1, nullptr);
    nodeAPI->registerNodeEvent(text2, NODE_ON_DROP, PARAM_1, nullptr);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "textDragTest1";
    nodeAPI->setAttribute(text1, NODE_ID, &id_item);
    id_item.string = "textDragTest2";
    nodeAPI->setAttribute(text2, NODE_ID, &id_item);

    nodeAPI->addChild(column, text1);
    nodeAPI->addChild(column, text2);
    ForthModule(column);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragGetPreDragStatusTest",
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
