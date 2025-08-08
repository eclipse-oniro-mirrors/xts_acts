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
#include <cstdint>
#include <iostream>
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
#include <hilog/log.h>

#include "DataLoadingDragActionTest.h"
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include <arkui/drag_and_drop.h>
#include <database/udmf/udmf.h>
#include <database/udmf/udmf_meta.h>

enum {
  buttonTouch
};

namespace NativeXComponentSample {
Manager Manager::manager_;
ArkUI_NodeHandle refresh;



Manager::~Manager() {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "~Manager");
    for (auto iter = nativeXComponentMap_.begin(); iter != nativeXComponentMap_.end(); ++iter) {
        if (iter->second != nullptr) {
            iter->second = nullptr;
        }
    }
    nativeXComponentMap_.clear();

    for (auto iter = containerMap_.begin(); iter != containerMap_.end(); ++iter) {
        if (iter->second != nullptr) {
            delete iter->second;
            iter->second = nullptr;
        }
    }
    containerMap_.clear();
}

static void OnEventReceive(ArkUI_NodeEvent* event)
{
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    ArkUI_DragEvent* dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    
    switch (eventType) {
    case NODE_ON_DRAG_START: {
        OH_UdmfDataLoadParams* dataLoadParams =  OH_UdmfDataLoadParams_Create();
        OH_UdmfDataLoadInfo* info =  OH_UdmfDataLoadInfo_Create();
        OH_UdmfDataLoadInfo_SetRecordCount(info,100);
        OH_UdmfDataLoadParams_SetDataLoadInfo(dataLoadParams,info);
        ArkUI_ErrorCode errorCode1 = OH_ArkUI_DragEvent_SetDataLoadParams(dragEvent,dataLoadParams);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "SetDataLoadParams:%{public}d;", errorCode1);
        break;
    }
    case NODE_ON_DROP:{
        
    }
    default:
        break;
    }
}

napi_value Manager::DragEventGetDisplayId(napi_env env, napi_callback_info info) {

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode env or info is null");
        return nullptr;
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  1111");

    size_t argCnt = 2;
    napi_value args[2] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode napi_get_cb_info failed");
    }

    if (argCnt < 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    napi_valuetype valuetype;
    if (napi_typeof(env, args[0], &valuetype) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_typeof failed");
        return nullptr;
    }

    if (valuetype != napi_string) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    constexpr uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    size_t length;
    if (napi_get_value_string_utf8(env, args[0], idStr, idSize, &length) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_get_value_int64 failed");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode  2222 %{public}s", idStr);

    auto manager = Manager::GetInstance();
    if (manager == nullptr) {
        return nullptr;
    }

    OH_NativeXComponent *component = manager->GetNativeXComponent(idStr);
    if (component == nullptr) {
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    if (nodeAPI != nullptr) {
        if (nodeAPI->createNode != nullptr && nodeAPI->addChild != nullptr) {
            auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
            ArkUI_AttributeItem NODE_Button_SRC_Item = {.string = "button"};
            ArkUI_NumberValue buttonWidthValue[] = {200};
            ArkUI_AttributeItem buttonWidthItem = {buttonWidthValue, 1};
            ArkUI_NumberValue buttonHeightValue[] = {100};
            ArkUI_AttributeItem buttonHeightItem = {buttonHeightValue, 1};
            ArkUI_NumberValue marginValue[] = {20};
            ArkUI_AttributeItem marginItem = {marginValue, 1};
            nodeAPI->setAttribute(button, NODE_WIDTH, &buttonWidthItem);
            nodeAPI->setAttribute(button, NODE_HEIGHT, &buttonHeightItem);
            nodeAPI->setAttribute(button, NODE_MARGIN, &marginItem);
            nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &NODE_Button_SRC_Item);
            nodeAPI->registerNodeEvent(button, NODE_ON_TOUCH_INTERCEPT, buttonTouch, nullptr);
            OH_NativeXComponent_AttachNativeRootNode(component, button);

            nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
                auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
                auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
                ArkUI_NodeHandle node = OH_ArkUI_NodeEvent_GetNodeHandle(event);
                auto *dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                             "targetId=%{public}d,eventType=%{public}d,", targetId, eventType);
                switch (eventType) {
                case NODE_ON_TOUCH_INTERCEPT: {
                    // 设置pixelMap
                    uint8_t data[960000];
                    size_t dataSize = 960000;
                    for (int i = 0; i < dataSize; i++) {
                        data[i] = i + 1;
                    }
                    // 创建参数结构体实例，并设置参数
                    OH_Pixelmap_InitializationOptions *createOpts;
                    OH_PixelmapInitializationOptions_Create(&createOpts);
                    OH_PixelmapInitializationOptions_SetWidth(createOpts, 200);
                    OH_PixelmapInitializationOptions_SetHeight(createOpts, 300);
                    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_BGRA_8888);
                    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
                    // 创建Pixelmap实例
                    OH_PixelmapNative *pixelmap = nullptr;
                    OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelmap);
                    OH_PixelmapNative_Rotate(pixelmap, 90.0);
                    OH_PixelmapNative_Opacity(pixelmap, 0.2);
                    OH_PixelmapNative_Scale(pixelmap, 0.8, 1.0);
                    OH_PixelmapNative_Flip(pixelmap, true, true);
                    std::vector<OH_PixelmapNative *> pixelVector;
                    pixelVector.push_back(pixelmap);
                    int returnValue;
                    switch (targetId) {
                    case buttonTouch: {
                        // 创建DragAction
                        auto action1 = OH_ArkUI_CreateDragActionWithNode(node);
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                     "OH_ArkUI_CreateDragActionWithNode returnValue = %{public}p", action1);
                        returnValue = OH_ArkUI_DragAction_SetPixelMaps(action1, pixelVector.data(), pixelVector.size());
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                     "OH_ArkUI_DragAction_SetPixelMaps returnValue = %{public}d", returnValue);
                        // 设置DragPreviewOption
                        auto *previewOptions1 = OH_ArkUI_CreateDragPreviewOption();
                        OH_ArkUI_DragPreviewOption_SetScaleMode(
                            previewOptions1, ArkUI_DragPreviewScaleMode::ARKUI_DRAG_PREVIEW_SCALE_DISABLED);
                        OH_ArkUI_DragPreviewOption_SetDefaultShadowEnabled(previewOptions1, true);
                        OH_ArkUI_DragPreviewOption_SetDefaultRadiusEnabled(previewOptions1, true);
                        returnValue = OH_ArkUI_DragAction_SetDragPreviewOption(action1, previewOptions1);
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                     "OH_ArkUI_DragAction_SetDragPreviewOption returnValue = %{public}d", returnValue);
                        // 设置pointerId
                        returnValue = OH_ArkUI_DragAction_SetPointerId(action1, 0); // -1 0 10
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                     "OH_ArkUI_DragAction_SetPointerId returnValue = %{public}d", returnValue);
                        // 设置touchPoint
                        returnValue = OH_ArkUI_DragAction_SetTouchPointX(action1, 200); // -1 0 200
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                     "OH_ArkUI_DragAction_SetTouchPointX returnValue = %{public}d", returnValue);
                        returnValue = OH_ArkUI_DragAction_SetTouchPointY(action1, 200); // -1 0 200
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                     "OH_ArkUI_DragAction_SetTouchPointY returnValue = %{public}d", returnValue);
                        // 设置unifiedData
                        // 创建OH_UdmfRecord对象
                        OH_UdmfRecord *record = OH_UdmfRecord_Create();
                        // 向OH_UdmfRecord中添加纯文本类型数据
                        OH_UdsPlainText *plainText = OH_UdsPlainText_Create();
                        int returnStatus;
                        OH_UdsPlainText_SetAbstract(plainText, "this is plainText Abstract example");
                        OH_UdsPlainText_SetContent(plainText, "this is plainText Content example");
                        returnStatus = OH_UdmfRecord_AddPlainText(record, plainText);
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                     "dragTest OH_UdmfRecord_AddPlainText returnStatus = %{public}d", returnStatus);
                        // 创建OH_UdmfData对象
                        OH_UdmfData *data = OH_UdmfData_Create();
                        // 向OH_UdmfData中添加OH_UdmfRecord
                        returnStatus = OH_UdmfData_AddRecord(data, record);
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                     "dragTest OH_UdmfData_AddRecord returnStatus = %{public}d", returnStatus);
                        returnValue = OH_ArkUI_DragAction_SetData(action1, data);

                        OH_UdmfDataLoadParams *dataLoadParams = OH_UdmfDataLoadParams_Create();
                        OH_UdmfDataLoadInfo *info = OH_UdmfDataLoadInfo_Create();
                        OH_UdmfDataLoadInfo_SetRecordCount(info, 100);
                        OH_UdmfDataLoadParams_SetDataLoadInfo(dataLoadParams, info);
                        ArkUI_ErrorCode errorCode1 = OH_ArkUI_DragAction_SetDataLoadParams(action1, dataLoadParams);

                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "js1111","OH_ArkUI_DragActi   on_SetDataLoadParams errorCode %{public}d ",errorCode1);

                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                     "OH_ArkUI_DragAction_SetData returnValue = %{public}d", returnValue);
                        // startDrag
                        returnValue = OH_ArkUI_StartDrag(action1);
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                     "OH_ArkUI_StartDrag returnValue = %{public}d", returnValue);
                        OH_ArkUI_DragAction_Dispose(action1);
                                OH_UdmfDataLoadParams_Destroy(dataLoadParams);
                                OH_UdmfDataLoadInfo_Destroy(info);
                    }
                    }
                }
                case NODE_ON_DROP: {
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest", "NODE_ON_DROP EventReceiver");
                    // 获取UDMF data
                    int returnValue;
                    // 创建OH_UdmfData对象
                    OH_UdmfData *data = OH_UdmfData_Create();
                    returnValue = OH_ArkUI_DragEvent_GetUdmfData(dragEvent, data);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                 "OH_ArkUI_DragEvent_GetUdmfData returnValue = %{public}d", returnValue);
                    // 判断OH_UdmfData是否有对应的类型
                    bool resultUdmf = OH_UdmfData_HasType(data, UDMF_META_PLAIN_TEXT);
                    if (resultUdmf) {
                        // 获取OH_UdmfData的记录
                        unsigned int recordsCount = 0;
                        OH_UdmfRecord **records = OH_UdmfData_GetRecords(data, &recordsCount);
                        // 获取records中的元素
                        int returnStatus;
                        for (int i = 0; i < recordsCount; i++) {
                            // 从OH_UdmfRecord中获取纯文本类型数据
                            OH_UdsPlainText *plainTextValue = OH_UdsPlainText_Create();
                            returnStatus = OH_UdmfRecord_GetPlainText(records[i], plainTextValue);
                            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                         "dragTest OH_UdmfRecord_GetPlainText "
                                         "returnStatus= %{public}d",
                                         returnStatus);
                            auto getAbstract = OH_UdsPlainText_GetAbstract(plainTextValue);
                            auto getContent = OH_UdsPlainText_GetContent(plainTextValue);
                            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                         "OH_UdsPlainText_GetAbstract = "
                                         "%{public}s, OH_UdsPlainText_GetContent = "
                                         "%{public}s",
                                         getAbstract, getContent);
                            // 使用结束后销毁指针
                            OH_UdsPlainText_Destroy(plainTextValue);
                        }
                    } else {
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                     "OH_UdmfData_HasType not contain UDMF_META_PLAIN_TEXT");
                    }
                    break;
                }
                }
            });
        }
    }
    return nullptr;
}


void Manager::Export(napi_env env, napi_value exports) {
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "Export: env or exports is null");
        return;
    }

    napi_value exportInstance = nullptr;
    if (napi_get_named_property(env, exports, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "Export: napi_get_named_property fail");
        return;
    }

    OH_NativeXComponent *nativeXComponent = nullptr;
    if (napi_unwrap(env, exportInstance, reinterpret_cast<void **>(&nativeXComponent)) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "Export: napi_unwrap fail");
        return;
    }

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    if (OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize) != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "Export: OH_NativeXComponent_GetXComponentId fail");
        return;
    }

    std::string id(idStr);
    auto manager = Manager::GetInstance();
    if ((manager != nullptr) && (nativeXComponent != nullptr)) {
        manager->SetNativeXComponent(id, nativeXComponent);
        auto container = manager->GetContainer(id);
        if (container != nullptr) {
            container->RegisterCallback(nativeXComponent);
        }
    }
}

void Manager::SetNativeXComponent(std::string &id, OH_NativeXComponent *nativeXComponent) {
    if (nativeXComponent == nullptr) {
        return;
    }

    if (nativeXComponentMap_.find(id) == nativeXComponentMap_.end()) {
        nativeXComponentMap_[id] = nativeXComponent;
        return;
    }

    if (nativeXComponentMap_[id] != nativeXComponent) {
        OH_NativeXComponent *tmp = nativeXComponentMap_[id];
        tmp = nullptr;
        nativeXComponentMap_[id] = nativeXComponent;
    }
}

OH_NativeXComponent *Manager::GetNativeXComponent(const std::string &id) { return nativeXComponentMap_[id]; }

Container *Manager::GetContainer(std::string &id) {
    if (containerMap_.find(id) == containerMap_.end()) {
        Container *instance = Container::GetInstance(id);
        containerMap_[id] = instance;
        return instance;
    }

    return containerMap_[id];
}
} // namespace NativeXComponentSample