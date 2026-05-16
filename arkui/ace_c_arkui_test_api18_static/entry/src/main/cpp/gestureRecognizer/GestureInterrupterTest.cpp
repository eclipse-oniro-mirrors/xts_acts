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

#include "GestureInterrupterTest.h"

#include <arkui/drag_and_drop.h>
#include <arkui/native_gesture.h>
#include <arkui/native_node_napi.h>
#include <database/udmf/udmf.h>
#include <database/udmf/udmf_meta.h>
#include <database/udmf/uds.h>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

#include "../manager/plugin_manager.h"

namespace ArkUIAniTest {
    std::vector<int32_t> GestureInterrupterTest::result = {};
    int32_t g_dataSizeGesture = 1;
    int32_t value = 2;
    const int EVENT_DATA_SIZE_ONE = 1;
    const int EVENT_DATA_SIZE_TWO = 2;

    ArkUI_GestureInterruptResult ChildGestureInterruptFunc(ArkUI_GestureInterruptInfo *info) 
    {
        void * userDataa = OH_ArkUI_GestureInterrupter_GetUserData(info);
        int* valuePtr = reinterpret_cast<int*>(userDataa);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "OH_ArkUI_GestureInterrupter_GetUserData: %{public}d", *valuePtr);
        return ArkUI_GestureInterruptResult::GESTURE_INTERRUPT_RESULT_CONTINUE;
    }

    static void PushBackIntToData(std::vector<int32_t> &data, int32_t value) { data.push_back(value); }

    static auto createColumn(bool dropDataPrefetchOnNode)
    {
        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        auto image = nodeAPI->createNode(ARKUI_NODE_IMAGE);
        auto list = nodeAPI->createNode(ARKUI_NODE_LIST);
        ArkUI_AttributeItem NODE_IMAGE_SRC_Item = {.string = "./resources/base/media/icon.png"};
        ArkUI_NumberValue imageWidthValue[] = {100};
        ArkUI_AttributeItem imageWidthItem = {imageWidthValue, 1};
        ArkUI_NumberValue imageHeightValue[] = {100};
        ArkUI_AttributeItem imageHeightItem = {imageHeightValue, 1};
        ArkUI_NumberValue marginValue[] = {20};
        ArkUI_AttributeItem marginItem = {marginValue, 1};
        ArkUI_NumberValue listWidthValue[] = {500};
        ArkUI_AttributeItem listWidthItem = {listWidthValue, 1};
        ArkUI_NumberValue listHeightValue[] = {400};
        ArkUI_AttributeItem listHeightItem = {listHeightValue, 1};
        ArkUI_NumberValue borderColorValue[] = {{.u32 = 0xCCCCCCCC}};
        ArkUI_AttributeItem borderColorItem = {borderColorValue, 1};
        ArkUI_NumberValue borderWidthValue[] = {5};
        ArkUI_AttributeItem borderWidthItem = {borderWidthValue, 1};
        ArkUI_NumberValue initialIndexValue[] = {{.i32 = 5}};
        ArkUI_AttributeItem initialIndexItem = {initialIndexValue, 1};
        ArkUI_NumberValue edgeEffectValue[] = {{.i32 = ARKUI_EDGE_EFFECT_NONE}};
        ArkUI_AttributeItem edgeEffectItem = {edgeEffectValue, 1};
        ArkUI_AttributeItem nodeIdItem = {.string = "inner"};
        nodeAPI->setAttribute(list, NODE_WIDTH, &listWidthItem);
        nodeAPI->setAttribute(list, NODE_HEIGHT, &listHeightItem);
        nodeAPI->setAttribute(image, NODE_WIDTH, &imageWidthItem);
        nodeAPI->setAttribute(image, NODE_HEIGHT, &imageHeightItem);
        nodeAPI->setAttribute(image, NODE_IMAGE_SRC, &NODE_IMAGE_SRC_Item);
        nodeAPI->setAttribute(image, NODE_MARGIN, &marginItem);
        nodeAPI->setAttribute(list, NODE_BORDER_COLOR, &borderColorItem);
        nodeAPI->setAttribute(list, NODE_BORDER_WIDTH, &borderWidthItem);
        nodeAPI->setAttribute(list, NODE_ID, &nodeIdItem);
        nodeAPI->setAttribute(list, NODE_LIST_INITIAL_INDEX, &initialIndexItem);
        nodeAPI->setAttribute(list, NODE_SCROLL_EDGE_EFFECT, &edgeEffectItem);
        auto ss = nodeAPI->getAttribute(list, NODE_SCROLL_EDGE_EFFECT);
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
        nodeAPI->addChild(column, list);
        ArkUI_NativeGestureAPI_2 *gestureAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_2, gestureAPI);
        if (gestureAPI != nullptr) {
            gestureAPI->setGestureInterrupterToNode(list, &value, ChildGestureInterruptFunc);
        }
        return column;
    }

    static void OnEventTouch(ArkUI_UIInputEvent *inputEvent)
    {
        uint32_t changedPointerId = 100;
        auto changedIdResult = OH_ArkUI_PointerEvent_GetChangedPointerId(inputEvent, &changedPointerId);
        PushBackIntToData(GestureInterrupterTest::result, changedIdResult);
        PushBackIntToData(GestureInterrupterTest::result, changedPointerId);
        g_dataSizeGesture = EVENT_DATA_SIZE_TWO;
    }

    static void OnEventMouse(ArkUI_UIInputEvent *inputEvent)
    {
        static ArkUI_NativeGestureAPI_1 *gestureApi;
        // 创建手势
        gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
        if (gestureApi->createLongPressGesture) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Container", " LongPressLog: not null");
        } else {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Container", " LongPressLog: null");
        }

        // 设置手势参数
        auto LongPressGesture = gestureApi->createLongPressGesture(1, true, 500);
        auto longlog = OH_ArkUI_SetGestureRecognizerLimitFingerCount(LongPressGesture, true);
        PushBackIntToData(GestureInterrupterTest::result, longlog);
        g_dataSizeGesture = EVENT_DATA_SIZE_ONE;
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

    ani_object GestureInterrupterTest::TestGestureInterrupter(ani_env* env, ani_object info, ani_object NodeContent)
    {
        OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
        //获取节点的前置框架代码，直接写就行
        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
        //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
        ArkUI_NodeContentHandle contentHandle;
        OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

        auto column = createColumn(true);
        nodeAPI->registerNodeEventReceiver(&OnEventReceive);

        // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
        OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
        auto status = OH_ArkUI_NodeContent_AddNode(contentHandle, column);
        OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");

        ani_ref undefinedRef {};
        std::string AString = "";
        if (status == PARAM_0) {
            AString += std::to_string(PARAM_1);
        } else {
            AString += std::to_string(status);
        }
        ani_size size = PARAM_1;
        OH_LOG_INFO(LOG_APP, " [cf]Class_BindNativeMethods Failed -> 63  status: %{public}d ",status);
        ani_array aniArray;
        OH_LOG_INFO(LOG_APP, "[cf] 44");
        if (ANI_OK != env->GetUndefined(&undefinedRef)) {
            OH_LOG_INFO(LOG_APP, "[cf] GetUndefined error");
            return nullptr;
        }
        OH_LOG_INFO(LOG_APP, "[cf] 49");
        //aniArray数组实例化
        if (ANI_OK != env->Array_New(size, undefinedRef, &aniArray)) {
            OH_LOG_INFO(LOG_APP, "[cf] create colorSpace aniArray error");
            return nullptr;
        }
        ani_string result_string{};
        if (env->String_NewUTF8(AString.c_str(), AString.size(), &result_string) != ANI_OK) {
            return {};
        }

        if (ANI_OK != env->Array_Set(aniArray, PARAM_0, result_string)) {
            OH_LOG_INFO(LOG_APP, "[cf] Array_Set int error");
            return nullptr;
        }

        return aniArray;
    }
} // namespace ArkUIAniTest