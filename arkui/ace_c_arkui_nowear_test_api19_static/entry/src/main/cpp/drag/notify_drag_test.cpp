/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

//#include "node_handle_by_id_test.h"
#include "common/common.h"
#include "../manager/plugin_manager.h"
#include "notify_drag_test.h"
#include <string>
#include <arkui/native_animate.h>
#include <arkui/native_gesture.h>
#include <arkui/native_node_napi.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <arkui/drag_and_drop.h>
#include <thread>
#include <unistd.h>

#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_types.h>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

static ArkUI_NodeHandle text1 = nullptr;
static ArkUI_NodeHandle text2 = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
namespace ArkUICapiTest {

static auto createTextChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem LABEL_Item = {.string = "drag_getDataTypeCount Test"};
    ArkUI_NumberValue fontSize[] = {20};
    ArkUI_AttributeItem Font_Item = {fontSize, 1};
    ArkUI_NumberValue marginValue[] = {20};
    ArkUI_AttributeItem marginItem = {marginValue, 1};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &LABEL_Item);
    nodeAPI->setAttribute(text, NODE_TEXT_FONT, &Font_Item);
    nodeAPI->setAttribute(text, NODE_MARGIN, &marginItem);
    nodeAPI->registerNodeEvent(text, NODE_ON_DRAG_START, 1, nullptr);
    nodeAPI->registerNodeEvent(text, NODE_ON_PRE_DRAG, 1, nullptr);
    OH_ArkUI_SetNodeDraggable(text, true);

    return text;
}

static auto createDragAreaChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
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
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DROP, 1, nullptr);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DRAG_ENTER, 1, nullptr);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DRAG_MOVE, 1, nullptr);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DRAG_LEAVE, 1, nullptr);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DRAG_END, 1, nullptr);

    return dragArea;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "getDataTypesCount", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
            "getDataTypesCount", "OnEventReceive: event is null");
        return;
    }
    if (OH_ArkUI_NodeEvent_GetEventType(event)  == NODE_ON_DROP) {
        ArkUI_DragEvent* dragEvent =  OH_ArkUI_NodeEvent_GetDragEvent(event);
        OH_ArkUI_DragEvent_SetDragResult(dragEvent, ARKUI_DRAG_RESULT_FAILED);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zxy dragTest", "zxy NODE_ON_DROP");
        int32_t requestId = -1;
        auto ret = OH_ArkUI_DragEvent_RequestDragEndPending(dragEvent, &requestId);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zxy dragTest",
                     "zxy get id = %{public}d, ret = %{public}d", requestId, ret);
        if (ret == 0) {
            std::thread tt([requestId](){
                sleep(1.1);
                auto res1 = OH_ArkUI_NotifyDragResult(requestId, ARKUI_DRAG_RESULT_SUCCESSFUL);
                auto res2 =OH_ArkUI_NotifyDragEndPendingDone(requestId);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zxy dragTest",
                    "zxy get res1 = %{public}d, res2 = %{public}d",res1, res2);
                if (res1 == ARKUI_ERROR_CODE_NO_ERROR && res2 == ARKUI_ERROR_CODE_NO_ERROR) {
                    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
                    ArkUI_AttributeItem background_color_item = {background_color_value,
                        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
                    nodeAPI->setAttribute(text1, NODE_BACKGROUND_COLOR, &background_color_item);  
                }

            });
            tt.detach();
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zxy dragTest", "zxy NODE_ON_DROP_DONE");
        }
    }
    
    if (OH_ArkUI_NodeEvent_GetEventType(event)  == NODE_ON_DROP) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zxy dragTest", "zxy NODE_ON_DRAG_ENTER");
        ArkUI_DragEvent* dragEvent =  OH_ArkUI_NodeEvent_GetDragEvent(event);
        OH_ArkUI_DragEvent_SetDragResult(dragEvent, ARKUI_DRAG_RESULT_FAILED);
        auto ret = OH_ArkUI_DragEvent_RequestDragEndPending(nullptr, nullptr);
        auto res1= OH_ArkUI_NotifyDragResult(NULL, ARKUI_DRAG_RESULT_FAILED);
        auto res2 = OH_ArkUI_NotifyDragEndPendingDone(NULL);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "zxy dragTest",
            "zxy get res1 = %{public}d, res2 = %{public}d",res1, res2);
        
        if (res1 == ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED &&
            res2 == ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(text2, NODE_BACKGROUND_COLOR, &background_color_item);  
        }
    }
}

void NotifyDragTest::testNotifyDragTest001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]NotifyDragTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    auto text = createTextChildNode(nodeAPI);
    auto dragArea = createDragAreaChildNode(nodeAPI);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "getDataTypesCountTest";
    nodeAPI->setAttribute(text, NODE_ID, &id_item);
    id_item.string = "dragArea";
    nodeAPI->setAttribute(dragArea, NODE_ID, &id_item);
    text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem id_item1 = {};
    id_item1.string = "7";
    text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item1.string = "7";
    nodeAPI->setAttribute(text1, NODE_TEXT_CONTENT, &id_item1);
    nodeAPI->setAttribute(text2, NODE_TEXT_CONTENT, &id_item1);
    ArkUI_AttributeItem id_item2 = {};
    id_item2.string = "text1_id";
    ArkUI_AttributeItem id_item3 = {};
    id_item3.string = "text2_id";
    nodeAPI->setAttribute(text1, NODE_ID, &id_item2);
    nodeAPI->setAttribute(text2, NODE_ID, &id_item3);
    nodeAPI->addChild(column, text);
    nodeAPI->addChild(column, dragArea);
    nodeAPI->addChild(column, text1);
    nodeAPI->addChild(column, text2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NotifyDragTest", "nodeAPI->registerNodeEventReceiver start");
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NotifyDragTest", "nodeAPI->registerNodeEventReceiver end");

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NotifyDragTest", "testNotifyDragTest001 end");
    return ;

}

} // namespace ArkUICapiTest