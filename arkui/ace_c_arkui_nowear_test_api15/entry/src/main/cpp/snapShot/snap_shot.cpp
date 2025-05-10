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
 #include <arkui/native_type.h>
 #include <arkui/native_key_event.h>
 #include <arkui/ui_input_event.h>
 #include <hilog/log.h>
 #include <arkui/drag_and_drop.h>
 #include "../manager/plugin_manager.h"
 
 namespace ArkUICapiTest {
 
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
 
 static napi_value SetArrayNapiDataWithGesture(const std::vector<int32_t> &data, napi_env env) {
     napi_value array;
     napi_create_array(env, &array);
     for (size_t i = PARAM_0; i < g_snapShot_dataSizeEvent; i++) {
         napi_value num;
         napi_create_int32(env, data[i], &num);
         napi_set_element(env, array, i, num);
     }
     return array;
 };
 
 static void PushBackIntToData(std::vector<int32_t> &data, int32_t value) { data.push_back(value); }
 
 static auto createColumn(bool dropDataPrefetchOnNode) {
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
 }
 
 napi_value Manager::CreateNativeNode(napi_env env, napi_callback_info info) {
     OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "startDataLoading", "CreateNativeNode");
 
     size_t argc = 2;
     napi_value args[2] = {nullptr};
     napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
     size_t length = PARAM_64;
     size_t strLength = PARAM_0;
     char xComponentID[PARAM_64] = {PARAM_0};
     napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
 
     if ((env == nullptr) || (info == nullptr)) {
         return nullptr;
     }
 
     ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
     OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
 
     auto column = createColumn(true);
     nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
         auto eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
         if (eventId == 6001) {
             OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ComponentSnapshot",
                          "C-api test demo create gs button1");
             auto options = OH_ArkUI_CreateSnapshotOptions();
             OH_ArkUI_DestroySnapshotOptions(options);
             auto scale = OH_ArkUI_SnapshotOptions_SetScale(options, 0.5);
             PushBackIntToData(Manager::result, scale);
             OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ComponentSnapshot", "scale: %{public}d", scale);
             auto createPixelMapRet = OH_ArkUI_GetNodeSnapshot(image, options, &pixelMap);
             PushBackIntToData(Manager::result, createPixelMapRet);
             OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ComponentSnapshot",
                          "C-api test demo create pixelmap result is %{public}d", createPixelMapRet);
             uint32_t byteCnt = 0;
             //                      OH_PixelmapNative_GetByteCount(pixelMap, &byteCnt);
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
 
     std::string id(xComponentID);
     if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
         INVALID_PARAM) {
         OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "startDataLoading",
                      "OH_NativeXComponent_AttachNativeRootNode failed");
     }
 
     napi_value exports;
     if (napi_create_object(env, &exports) != napi_ok) {
         napi_throw_type_error(env, nullptr, "napi_create_object failed");
         return nullptr;
     }
 
     return exports;
 }
 
 napi_value Manager::GetResult(napi_env env, napi_callback_info info) {
     OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "snapShotTest001", "GetEventInfoData");
     napi_value result;
     napi_create_array(env, &result);
     napi_set_element(env, result, PARAM_0, SetArrayNapiDataWithGesture(Manager::result, env));
     Manager::result.clear();
     return result;
 }
 } // namespace ArkUICapiTest
 