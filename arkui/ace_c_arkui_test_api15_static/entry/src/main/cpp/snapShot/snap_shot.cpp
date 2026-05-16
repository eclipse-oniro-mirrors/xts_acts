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

 #include "snap_shot.h"
 #include <asm-generic/stat.h>
 #include <bits/alltypes.h>
 #include <cstdint>
 #include <string>
 #include <cstdio>
 #include "napi/native_api.h"
 #include <ace/xcomponent/native_interface_xcomponent.h>
 #include <arkui/native_node.h>
 #include <arkui/native_animate.h>
 #include <arkui/native_node_napi.h>
 #include <arkui/native_type.h>
 #include <arkui/native_interface.h>
 #include <arkui/native_key_event.h>
 #include <arkui/ui_input_event.h>
 #include <hilog/log.h>
 #include <arkui/drag_and_drop.h>
 #include "../manager/plugin_manager.h"
 #include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#include <string>
 namespace ArkUIAniTest {
 
 Manager::~Manager() {}
 OH_PixelmapNative *pixelMap = nullptr;
 Manager Manager::manager_;
 const char *keyText;
 double timestamp;
 
 static ArkUI_NodeHandle image;
 static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
 static ArkUI_AttributeItem NODE_IMAGE_SRC_Item;
 
 std::vector<int32_t> Manager::result = {};
 std::int32_t g_snapShot_dataSizeEvent = 2;
 const int EVENT_DATA_SIZE_TWO = 2;
 const int EVENT_DATA_SIZE_FIVE = 5;
 
static ani_object SetArrayAniDataWithGesture(const std::vector<int32_t> &values, ani_env* env)
{
   ani_ref undefinedRef {};
   ani_size size = values.size();
   OH_LOG_INFO(LOG_APP, " [snap_shot]Class_BindNativeMethods Failed -> 63  values.size: %{public}d ",size);
   OH_LOG_INFO(LOG_APP, " [snap_shot]Class_BindNativeMethods Failed -> 63  values[0]: %{public}d ",values[0]);
   OH_LOG_INFO(LOG_APP, " [snap_shot]Class_BindNativeMethods Failed -> 63  values[1]: %{public}d ",values[1]);
   ani_array aniArray;
    OH_LOG_INFO(LOG_APP, "[snap_shot] 44");
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[snap_shot] GetUndefined error");
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "[snap_shot] 49");
    if (ANI_OK != env->Array_New(size, undefinedRef, &aniArray)) {
        OH_LOG_INFO(LOG_APP, "[snap_shot] create colorSpace aniArray error");
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "[snap_shot] 66");
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
        OH_LOG_INFO(LOG_APP, "[snap_shot] Array_Set int error");
        return nullptr;
    }

    OH_LOG_INFO(LOG_APP, "[snap_shot] 79");
    return aniArray;
}
 
 static void PushBackIntToData(std::vector<int32_t> &data, int32_t value) { data.push_back(value); }
 
 static auto createColumn(bool dropDataPrefetchOnNode) {
    OH_LOG_INFO(LOG_APP, " [snap_shot]createColumn start ");
     ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
     OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
     auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
     image = nodeAPI->createNode(ARKUI_NODE_IMAGE);
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
     nodeAPI->registerNodeEvent(image, NODE_ON_CLICK, 6001, nullptr);
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
    OH_LOG_INFO(LOG_APP, " [snap_shot]createColumn end ");
 }
 
 void Manager::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent) {
    OH_LOG_INFO(LOG_APP, " [snap_shot]CreateNativeNode action ");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
 
    OH_LOG_INFO(LOG_APP, " [snap_shot]createColumn action ");
     auto column = createColumn(true);
     nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
         auto eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
         if (eventId == 6001) {
             OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ComponentSnapshot",
                          "C-api test demo create gs button1");
             auto options = OH_ArkUI_CreateSnapshotOptions();
             OH_ArkUI_DestroySnapshotOptions(options);
             auto scale = OH_ArkUI_SnapshotOptions_SetScale(options, 0.5);
             OH_LOG_INFO(LOG_APP, " [snap_shot]Manager::result value1: %{public}d ",scale);
             PushBackIntToData(Manager::result, scale);
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ComponentSnapshot", "scale: %{public}d", scale);
             auto createPixelMapRet = OH_ArkUI_GetNodeSnapshot(image, options, &pixelMap);
             OH_LOG_INFO(LOG_APP, " [snap_shot]Manager::result value2: %{public}d ",createPixelMapRet);
             PushBackIntToData(Manager::result, createPixelMapRet);
             OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ComponentSnapshot",
                          "C-api test demo create pixelmap result is %{public}d", createPixelMapRet);
             uint32_t byteCnt = 0;
             OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ComponentSnapshot",
                          "C-api test demo byteCnt is %{public}u", byteCnt);
 
             if (!pixelMap) {
                 OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ComponentSnapshot",
                              "C-api test demo pixelMap is nullptr");
             } else {
                 OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ComponentSnapshot",
                              "C-api test demo pixelMap is not nullptr");
             }
             auto drawable = OH_ArkUI_DrawableDescriptor_CreateFromPixelMap(pixelMap);
 
             if (!drawable) {
                 OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ComponentSnapshot",
                              "C-api test demo drawable is nullptr");
             } else {
                 OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ComponentSnapshot",
                              "C-api test demo drawable is not nullptr");
             }
         }
     });
 
    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [snap_shot]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [snap_shot]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
 }
 
 ani_object Manager::GetResult(ani_env* env, ani_object info) {
    ani_object String_array = SetArrayAniDataWithGesture(Manager::result, env);
    Manager::result.clear();
    return String_array;
 }
 } // namespace ArkUIAniTest
 