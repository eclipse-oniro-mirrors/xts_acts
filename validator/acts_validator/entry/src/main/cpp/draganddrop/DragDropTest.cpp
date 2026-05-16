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

#include "DragDropTest.h"
#include "../draganddrop/PluginManagerTest.h"
#include <arkui/drag_and_drop.h>
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <hilog/log.h>
#include <thread>
#include <unistd.h>

namespace ArkUICapiTest {
    static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    ArkUI_NodeHandle column = nullptr;
    ArkUI_NodeHandle dragImage2 = nullptr;
    ArkUI_NodeHandle dropImage2 = nullptr;
    ArkUI_NodeHandle dragText3 = nullptr;
    ArkUI_NodeHandle dropText3 = nullptr;
    ArkUI_NodeHandle dropArea3 = nullptr;
    static bool change = false;
    static bool change1 = false;
    static bool change2 = true;
    
    void SetWidth1(ArkUI_NodeHandle &node, float width = SIZE_200)
    {
        if (!nodeAPI) {
            return;
        }
        ArkUI_NumberValue widthValue[] = {width};
        ArkUI_AttributeItem widthItem = {widthValue, 1};
        nodeAPI->setAttribute(node, NODE_WIDTH, &widthItem);
    }
    
    void SetHeight1(ArkUI_NodeHandle &node, float height = SIZE_200)
    {
        if (!nodeAPI) {
            return;
        }
        ArkUI_NumberValue heightValue[] = {height};
        ArkUI_AttributeItem heightItem = {heightValue, 1};
        nodeAPI->setAttribute(node, NODE_HEIGHT, &heightItem);
    }
    void SetBackgroundColor1(ArkUI_NodeHandle &node, uint32_t color = COLOR_WHITE)
    {
        if (!nodeAPI) {
            return;
        }
        ArkUI_NumberValue colorValue[] = {{.u32 = color}};
        ArkUI_AttributeItem colorItem = {colorValue, 1};
        nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &colorItem);
    }
    void SetMargin1(ArkUI_NodeHandle &node, float margin = DEFAULT_MARGIN)
    {
        if (!nodeAPI) {
            return;
        }
        ArkUI_NumberValue marginValue[] = {margin};
        ArkUI_AttributeItem marginItem = {marginValue, 1};
        nodeAPI->setAttribute(node, NODE_MARGIN, &marginItem);
    }
    
    void SetButtonLabel(ArkUI_NodeHandle &node, const char *label)
    {
        if (!nodeAPI) {
            return;
        }
        ArkUI_AttributeItem NODE_Button_SRC_Item = {.string = label};
        nodeAPI->setAttribute(node, NODE_BUTTON_LABEL, &NODE_Button_SRC_Item);
    }
    
    // 组合函数
    void SetCommonAttribute(ArkUI_NodeHandle &node, float width = SIZE_200, float height = SIZE_200,
                            unsigned int color = COLOR_WHITE, float margin = DEFAULT_MARGIN)
    {
        SetWidth1(node, width);
        SetHeight1(node, height);
        SetBackgroundColor1(node, color);
        SetMargin1(node, margin);
    }
    
    void SetText(ArkUI_NodeHandle &node, const char *str, float size = SIZE_50)
    {
        if (!nodeAPI) {
            return;
        }
        ArkUI_AttributeItem textValueItem = {.string = str};
        ArkUI_NumberValue fontSize[] = {size};
        ArkUI_AttributeItem fontItem = {fontSize, 1};
        nodeAPI->setAttribute(node, NODE_TEXT_CONTENT, &textValueItem);
        nodeAPI->setAttribute(node, NODE_TEXT_FONT, &fontItem);
    }
    
    void ExecuteDragPending(ArkUI_DragEvent* dragEvent)
    {
        int32_t requestId = -1;
        auto ret = OH_ArkUI_DragEvent_RequestDragEndPending(dragEvent, &requestId);
        if (ret == ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED) {
            return;
        }
        std::thread tt([requestId]() {
            sleep(1);
            if(change == false){
                auto code = OH_ArkUI_NotifySuggestedDropOperation(requestId, ARKUI_DROP_OPERATION_MOVE);
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "cxxdragTest", "move errorCode %{public}d", code);
            }else if(change == true){
                auto code = OH_ArkUI_NotifySuggestedDropOperation(requestId, ARKUI_DROP_OPERATION_COPY);
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "cxxdragTest", "copy errorCode %{public}d", code);
            }
            if(change1 == false){
                auto code1 = OH_ArkUI_NotifyDisableDefaultDropAnimation(requestId, false);
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "cxxdragTest", "false errorCode %{public}d", code1);
            }else if(change1 == true){
                auto code1 = OH_ArkUI_NotifyDisableDefaultDropAnimation(requestId, true);
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "cxxdragTest", "true errorCode %{public}d", code1);
            }
            OH_ArkUI_NotifyDragEndPendingDone(requestId);
        });
        tt.detach();
    }

    void GetTextDragResult(ArkUI_DragEvent* dragEvent)
    {
        ArkUI_DragResult result;
        ArkUI_DropOperation operation;
        OH_ArkUI_DragEvent_GetDragResult(dragEvent, &result);
        OH_ArkUI_DragEvent_GetDropOperation(dragEvent, &operation);
        if (result == ARKUI_DRAG_RESULT_SUCCESSFUL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "cxxdragTest", "Text Drag Successful!");
        nodeAPI->resetAttribute(dragText3, NODE_TEXT_CONTENT);
        SetText(dropText3, "drag me", SIZE_30);
        } else if (result == ARKUI_DRAG_RESULT_FAILED) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "cxxdragTest", "Text Drag Failed!");
        }
        if (operation == ARKUI_DROP_OPERATION_COPY) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "cxxdragTest", "Text Drag operation is ARKUI_DROP_OPERATION_COPY");
        } else if (operation == ARKUI_DROP_OPERATION_MOVE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "cxxdragTest", "Text Drag operation is ARKUI_DROP_OPERATION_MOVE");
            
        }
    }
    void RegisterTextDragEvents(ArkUI_NodeHandle &dragNode)
    {
        if (!nodeAPI) return;
    
        nodeAPI->addNodeEventReceiver(dragNode, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            auto preDragStatus = OH_ArkUI_NodeEvent_GetPreDragStatus(event);
            auto *dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    
            switch (eventType) {
                case NODE_ON_DRAG_START: {
                break;
                }
                case NODE_ON_DRAG_END: {
                    GetTextDragResult(dragEvent);
                    break;
                }
            }
        });
    }
    
    void RegisterTextDropEvents(ArkUI_NodeHandle &dragNode)
    {
        if (!nodeAPI) return;
    
        nodeAPI->addNodeEventReceiver(dragNode, [](ArkUI_NodeEvent *event) {
            auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
            auto preDragStatus = OH_ArkUI_NodeEvent_GetPreDragStatus(event);
            auto *dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    
            switch (eventType) {
                case NODE_ON_DROP: {
                    ExecuteDragPending(dragEvent);
                    break;
                }
                default: {
                    break;
                }
            }
        });
    }
    void ResetButton(ArkUI_NodeHandle &column)
    {
        auto resetButton = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem id_item3 = {.string = "resetbutton"};
        nodeAPI->setAttribute(resetButton, NODE_ID, &id_item3);
        SetButtonLabel(resetButton, "复位");
        nodeAPI->registerNodeEvent(resetButton, NODE_ON_CLICK_EVENT, 1, nullptr);
        nodeAPI->addNodeEventReceiver(resetButton, [](ArkUI_NodeEvent *event) {
            nodeAPI->resetAttribute(dropText3, NODE_TEXT_CONTENT);
            SetText(dragText3, "drag me", SIZE_30);
        });
        nodeAPI->addChild(column, resetButton);
    }
    void Button1(ArkUI_NodeHandle &column)
    {
        auto Button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem id_item4 = {.string = "button1"};
        nodeAPI->setAttribute(Button1, NODE_ID, &id_item4);
        SetButtonLabel(Button1, "ARKUI_DROP_OPERATION_MOVE");
        nodeAPI->registerNodeEvent(Button1, NODE_ON_CLICK_EVENT, PARAM_2, nullptr);
        static ArkUI_NodeHandle staticButton1 = nullptr;
        staticButton1 = Button1;
        nodeAPI->addNodeEventReceiver(Button1, [](ArkUI_NodeEvent *event) {
            change = !change;
            if (staticButton1 != nullptr) {
                SetButtonLabel(staticButton1, change ? "ARKUI_DROP_OPERATION_COPY" : "ARKUI_DROP_OPERATION_MOVE");
            }
        });
        nodeAPI->addChild(column, Button1);
    }
    void Button2(ArkUI_NodeHandle &column)
    {
         auto Button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
        ArkUI_AttributeItem id_item5 = {.string = "button2"};
        nodeAPI->setAttribute(Button, NODE_ID, &id_item5);
        SetButtonLabel(Button, "动画开");
        nodeAPI->registerNodeEvent(Button, NODE_ON_CLICK_EVENT, PARAM_3, nullptr);
        static ArkUI_NodeHandle staticButton2 = nullptr;
        staticButton2 = Button;
        nodeAPI->addNodeEventReceiver(Button, [](ArkUI_NodeEvent *event) {
            change1 = !change1;
            if (staticButton2 != nullptr) {
                SetButtonLabel(staticButton2, change1 ? "动画关" : "动画开");
            }
        });
        nodeAPI->addChild(column, Button);
    }

    napi_value DragDropTest::CreateNativeNode(napi_env env, napi_callback_info info)
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
        auto column3 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        auto title = nodeAPI->createNode(ARKUI_NODE_TEXT);
        nodeAPI->addChild(column3, title);
        auto textRow = nodeAPI->createNode(ARKUI_NODE_ROW);
        nodeAPI->addChild(column3, textRow);
        auto textDragColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        auto textDragText = nodeAPI->createNode(ARKUI_NODE_TEXT);
        auto dragArea3 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        SetCommonAttribute(dragArea3, SIZE_150, SIZE_50, COLOR_WHITE, SIZE_10);
    
        nodeAPI->addChild(textDragColumn, textDragText);
        nodeAPI->addChild(textDragColumn, dragArea3);
        nodeAPI->addChild(textRow, textDragColumn);
    
        dragText3 = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem id_item1 = {.string = "dragArea"};
        nodeAPI->setAttribute(dragText3, NODE_ID, &id_item1);
        SetText(dragText3, "drag me", SIZE_30);
        nodeAPI->registerNodeEvent(dragText3, NODE_ON_PRE_DRAG, 1, nullptr);
        nodeAPI->registerNodeEvent(dragText3, NODE_ON_DRAG_START, 1, nullptr);
        nodeAPI->registerNodeEvent(dragText3, NODE_ON_DRAG_END, 1, nullptr);
        OH_ArkUI_SetNodeDraggable(dragText3, true);
        nodeAPI->addChild(dragArea3, dragText3);
    
        auto textDropColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        auto textDropText = nodeAPI->createNode(ARKUI_NODE_TEXT);
    
        dropArea3 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        ArkUI_AttributeItem id_item2 = {.string = "dropArea"};
        nodeAPI->setAttribute(dropArea3, NODE_ID, &id_item2);
        SetCommonAttribute(dropArea3, SIZE_150, SIZE_50, COLOR_WHITE, SIZE_10);
        OH_ArkUI_AllowNodeAllDropDataTypes(dropArea3);
        OH_ArkUI_SetDragEventStrictReportWithNode(dropArea3, true);
        dropText3 = nodeAPI->createNode(ARKUI_NODE_TEXT);
        SetText(dropText3, "", SIZE_30);
        nodeAPI->addChild(textDropColumn, textDropText);
        nodeAPI->addChild(dropArea3, dropText3);
        nodeAPI->registerNodeEvent(dropArea3, NODE_ON_DROP, 1, nullptr);
        nodeAPI->addChild(textDropColumn, dropArea3);
        nodeAPI->addChild(textRow, textDropColumn);
    
        ResetButton(column3);
        Button2(column3);
        RegisterTextDragEvents(dragText3);
        RegisterTextDropEvents(dropArea3);

        std::string id(xComponentID);
        if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column3)
        == INVALID_PARAM) {
        }

        napi_value exports;
        if (napi_create_object(env, &exports) != napi_ok) {
            napi_throw_type_error(env, nullptr, "napi_create_object failed");
            return nullptr;
        }
        return exports;
    }
} // namespace ArkUICapiTest
