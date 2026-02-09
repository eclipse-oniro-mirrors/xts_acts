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

#include "gestureRecognizer.h"

#include <arkui/drag_and_drop.h>
#include <arkui/native_gesture.h>
#include <arkui/native_node_napi.h>
#include <database/udmf/udmf.h>
#include <database/udmf/udmf_meta.h>
#include <database/udmf/uds.h>
#include <string>

#include "../manager/plugin_manager.h"
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#include <string>

namespace ArkUIAniTest {

std::vector<int32_t> GestureRecognizerTest::result = {};
int32_t g_dataSizeGesture = 1;
const int EVENT_DATA_SIZE_ONE = 1;
const int EVENT_DATA_SIZE_TWO = 2;

static ani_object SetArrayAniDataWithGesture(const std::vector<int32_t> &values, ani_env* env)
{
   ani_ref undefinedRef {};
   ani_size size = values.size();
   OH_LOG_INFO(LOG_APP, " [gestureRecognizer]Class_BindNativeMethods Failed -> 63  values.size: %{public}d ",size);
//   OH_LOG_INFO(LOG_APP, " [gestureRecognizer]Class_BindNativeMethods Failed -> 63  values[0]: %{public}d ",values[0]);
//   OH_LOG_INFO(LOG_APP, " [gestureRecognizer]Class_BindNativeMethods Failed -> 63  values[1]: %{public}d ",values[1]);
   ani_array aniArray;
    OH_LOG_INFO(LOG_APP, "[gestureRecognizer] 44");
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[gestureRecognizer] GetUndefined error");
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "[gestureRecognizer] 49");
    if (ANI_OK != env->Array_New(size, undefinedRef, &aniArray)) {
        OH_LOG_INFO(LOG_APP, "[gestureRecognizer] create colorSpace aniArray error");
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "[gestureRecognizer] 66");
    std::string AString = "";
    for (ani_size i = 0; i < size; ++i) {
        AString += std::to_string(values[i]);
        if (i < size - PARAM_1) {
            AString += ",";
        } 
    }
    ani_string result_string{};
    if (env->String_NewUTF8(AString.c_str(), AString.size(), &result_string) != ANI_OK) {
        return {};
    }

    if (ANI_OK != env->Array_Set(aniArray, PARAM_0, result_string)) {
        OH_LOG_INFO(LOG_APP, "[gestureRecognizer] Array_Set int error");
        return nullptr;
    }

    OH_LOG_INFO(LOG_APP, "[gestureRecognizer] 79");
    return aniArray;
}

static void PushBackIntToData(std::vector<int32_t> &data, int32_t value) { data.push_back(value); }

static auto createColumn(bool dropDataPrefetchOnNode)
{
    OH_LOG_INFO(LOG_APP, "[gestureRecognizer] createColumn start");
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
    uint32_t changedPointerId = 100;
    auto changedIdResult = OH_ArkUI_PointerEvent_GetChangedPointerId(inputEvent, &changedPointerId);
    PushBackIntToData(GestureRecognizerTest::result, changedIdResult);
    PushBackIntToData(GestureRecognizerTest::result, changedPointerId);
    g_dataSizeGesture = EVENT_DATA_SIZE_TWO;
}

static void OnEventMouse(ArkUI_UIInputEvent *inputEvent)
{
    OH_LOG_INFO(LOG_APP, " [gestureRecognizer] OnEventMouse start ");
    static ArkUI_NativeGestureAPI_1 *gestureApi;
    // 创建手势
    gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    if (gestureApi->createLongPressGesture) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Container", " LongPressLog: not null");
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Container", " LongPressLog: null");
    }


    OH_LOG_INFO(LOG_APP, " [gestureRecognizer] createLongPressGesture start ");
    // 设置手势参数
    auto LongPressGesture = gestureApi->createLongPressGesture(1, true, 500);
    auto longlog = OH_ArkUI_SetGestureRecognizerLimitFingerCount(LongPressGesture, true);
    OH_LOG_INFO(LOG_APP, " [gestureRecognizer]OnEventMouse longlog: %{public}d ",longlog);
    PushBackIntToData(GestureRecognizerTest::result, longlog);
    g_dataSizeGesture = EVENT_DATA_SIZE_ONE;
    OH_LOG_INFO(LOG_APP, " [gestureRecognizer] OnEventMouse end ");
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_INFO(LOG_APP, " [gestureRecognizer]OnEventReceive start ");
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "EventInfoTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EventInfoTest", "OnEventReceive: event is null");
        return;
    }

    auto eventId = OH_ArkUI_NodeEvent_GetEventType(event);
    OH_LOG_INFO(LOG_APP, " [gestureRecognizer]OnEventMouse eventId: %{public}d ",eventId);
    auto inputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    if (eventId == NODE_TOUCH_EVENT) {
        OnEventTouch(inputEvent);
    }
    if (eventId == NODE_ON_MOUSE) {
        OnEventMouse(inputEvent);
    }
}

void GestureRecognizerTest::TestGestureRecognizerFinger001(ani_env* env, ani_object info, ani_object NodeContent)
{
   OH_LOG_INFO(LOG_APP, " [gestureRecognizer]TestGestureRecognizerFinger001 start ");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    OH_LOG_INFO(LOG_APP, " [gestureRecognizer]createColumn action ");
    auto column = createColumn(true);
    OH_LOG_INFO(LOG_APP, " [gestureRecognizer]registerNodeEventReceiver(&OnEventReceive) action ");
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [gestureRecognizer]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [gestureRecognizer]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

ani_object GestureRecognizerTest::GetResult(ani_env* env, ani_object info)
{
    ani_object String_array = SetArrayAniDataWithGesture(GestureRecognizerTest::result, env);
    GestureRecognizerTest::result.clear();
    return String_array;
}

} // namespace ArkUIAniTest