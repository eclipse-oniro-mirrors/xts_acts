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

#include "DataLoadingDragEventTest.h"
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
static char key[UDMF_KEY_BUFFER_LEN];


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
    ArkUI_DragEvent *dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    
    switch (eventType) {
    case NODE_ON_DRAG_START: {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest", "NODE_ON_DRAG_START EventReceiver js1111");
        //test setdata
        OH_UdmfRecord *record = OH_UdmfRecord_Create();
        int returnValue;
        OH_UdsFileUri *imageValue = OH_UdsFileUri_Create();
        returnValue = OH_UdsFileUri_SetFileUri(imageValue, "./resources/base/media/icon.png");
        returnValue = OH_UdmfRecord_AddFileUri(record, imageValue);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                     "dragTest OH_UdmfRecord_AddPlainText returnStatus = %{public}d", returnValue);
        OH_UdmfData *data = OH_UdmfData_Create();
        returnValue = OH_UdmfData_AddRecord(data, record);
        
        returnValue = OH_ArkUI_DragEvent_SetData(dragEvent, data);
        
        //test dataLoadParams
        OH_UdmfDataLoadParams *dataLoadParams = OH_UdmfDataLoadParams_Create();
        OH_UdmfDataLoadInfo *info = OH_UdmfDataLoadInfo_Create();
        char* type = UDMF_META_GENERAL_FILE;
        OH_UdmfDataLoadInfo_SetType(info,type);
        OH_UdmfDataLoadInfo_SetRecordCount(info, 100);
        OH_UdmfDataLoadParams_SetDataLoadInfo(dataLoadParams, info);
        OH_Udmf_DataLoadHandler dataLoadHandler = [](OH_UdmfDataLoadInfo *acceptableInfo) {
            OH_UdmfRecord *record = OH_UdmfRecord_Create();
            int returnValue;
            OH_UdsFileUri *imageValue = OH_UdsFileUri_Create();
            returnValue = OH_UdsFileUri_SetFileUri(imageValue, "./resources/base/media/icon.png");
            
            returnValue = OH_UdmfRecord_AddFileUri(record, imageValue);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                         "dragTest OH_UdmfRecord_AddPlainText returnStatus = %{public}d", returnValue);
            OH_UdmfData *data = OH_UdmfData_Create();
            returnValue = OH_UdmfData_AddRecord(data, record);
            return data;
        };
        OH_UdmfDataLoadParams_SetLoadHandler(dataLoadParams, dataLoadHandler);
        ArkUI_ErrorCode errorCode1 = OH_ArkUI_DragEvent_SetDataLoadParams(dragEvent, dataLoadParams);
         OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                         "OH_ArkUI_DragEvent_StartDataLoading errorCode1 = %{public}d js1111", errorCode1);

        break;
    }
    case NODE_ON_DROP: {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest", "NODE_ON_DROP js1111");
        // 异步流程
        const char *destUri = "file://com.example.myapplication_capi/data/storage/el2/base/haps/entry/files/";
        OH_Udmf_DataProgressListener dataProgressListener = [](OH_Udmf_ProgressInfo *progressInfo, OH_UdmfData *data) {
            int32_t progress = OH_UdmfProgressInfo_GetProgress(progressInfo);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                         "OH_ArkUI_DragEvent_StartDataLoading progressInfo = %{public}d js1111", progress);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest", "dataProgressListener callback js1111");
            bool resultUdmf = OH_UdmfData_HasType(data, UDMF_META_GENERAL_FILE);
            if (resultUdmf) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                             "NODE_ON_DROP has UDMF_META_GENERAL_FILE js1111");
                unsigned int recordsCount = 0;
                OH_UdmfRecord **records = OH_UdmfData_GetRecords(data, &recordsCount);
                // 获取records中的元素
                int returnStatus;
                for (int i = 0; i < recordsCount; i++) {
                    // 从OH_UdmfRecord中获取文件类型数据
                    OH_UdsFileUri *imageValue = OH_UdsFileUri_Create();
                    returnStatus = OH_UdmfRecord_GetFileUri(records[i], imageValue);
                    const char *fileUri = OH_UdsFileUri_GetFileUri(imageValue);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                                 "returnStatus= %{public}d "
                                 "fileUri= %{public}s js1111",
                                 returnStatus, fileUri);
                    // 使用结束后销毁指针
                    OH_UdsFileUri_Destroy(imageValue);
                }
            }
        };
        OH_UdmfGetDataParams *params = OH_UdmfGetDataParams_Create();
        unsigned int keyLen = UDMF_KEY_BUFFER_LEN;
        OH_UdmfGetDataParams_SetDestUri(params, destUri);
        OH_UdmfGetDataParams_SetFileConflictOptions(params, Udmf_FileConflictOptions::UDMF_OVERWRITE);
        OH_UdmfGetDataParams_SetProgressIndicator(params, Udmf_ProgressIndicator::UDMF_DEFAULT);
        OH_UdmfGetDataParams_SetDataProgressListener(params, dataProgressListener);
        int ret = OH_ArkUI_DragEvent_StartDataLoading(dragEvent, params, key, keyLen);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragTest",
                     "OH_ArkUI_DragEvent_StartDataLoading returnValue = %{public}d js1111", ret);
        break;
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
            auto Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            auto image = nodeAPI->createNode(ARKUI_NODE_IMAGE);
            ArkUI_AttributeItem NODE_IMAGE_SRC_Item = {.string = "./resources/base/media/icon.png"};
            auto dragAreaText = nodeAPI->createNode(ARKUI_NODE_TEXT);

            ArkUI_AttributeItem dragAreaText_Item = {.string = "落入区域"};
            ArkUI_NumberValue imageWidthValue[] = {150};
            ArkUI_AttributeItem imageWidthItem = {imageWidthValue, 1};
            ArkUI_NumberValue imageHeightValue[] = {150};
            ArkUI_AttributeItem imageHeightItem = {imageHeightValue, 1};
            ArkUI_NumberValue columnWidthValue[] = {200};
            ArkUI_AttributeItem columnWidthItem = {columnWidthValue, 1};
            ArkUI_NumberValue columnHeightValue[] = {200};
            ArkUI_AttributeItem columnHeightItem = {columnHeightValue, 1};
            nodeAPI->setAttribute(image, NODE_WIDTH, &imageWidthItem);
            nodeAPI->setAttribute(image, NODE_HEIGHT, &imageHeightItem);
            nodeAPI->setAttribute(image, NODE_IMAGE_SRC, &NODE_IMAGE_SRC_Item);
            nodeAPI->setAttribute(dragAreaText, NODE_TEXT_CONTENT, &dragAreaText_Item);
            nodeAPI->registerNodeEvent(image, NODE_ON_DRAG_START, 0, nullptr);
            nodeAPI->registerNodeEvent(Column, NODE_ON_DROP, 0, nullptr);
            nodeAPI->registerNodeEvent(image, NODE_ON_DROP, 0, nullptr);
            OH_ArkUI_SetNodeDraggable(image, true);
            ArkUI_AttributeItem id_item = {};
            id_item.string = "image";
            nodeAPI->setAttribute(image, NODE_ID, &id_item);
            id_item.string = "dragArea";
            nodeAPI->addChild(Column, image);

            // 拖拽区域4允许任何组件拖入
            ArkUI_NumberValue fontSize[] = {10};
            ArkUI_AttributeItem Font_Item = {fontSize, 1};
            ArkUI_NumberValue widthValue[] = {150};
            ArkUI_AttributeItem widthItem = {widthValue, 1};
            ArkUI_NumberValue heightValue1[] = {150};
            ArkUI_AttributeItem heightItem = {heightValue1, 1};
            ArkUI_NumberValue borderValue[] = {1};
            ArkUI_AttributeItem borderItem = {borderValue, 1};
            ArkUI_NumberValue marginValue[] = {20};
            ArkUI_AttributeItem marginItem = {marginValue, 1};

            auto dragArea4Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
            ArkUI_AttributeItem dragArea4Text_Item = {.string = "拖拽区域4允许任何组件拖入"};
            nodeAPI->setAttribute(dragArea4Text, NODE_TEXT_CONTENT, &dragArea4Text_Item);
            nodeAPI->setAttribute(dragArea4Text, NODE_TEXT_FONT, &Font_Item);
            auto dragArea4 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            nodeAPI->setAttribute(dragArea4, NODE_WIDTH, &widthItem);
            nodeAPI->setAttribute(dragArea4, NODE_HEIGHT, &heightItem);
            nodeAPI->setAttribute(dragArea4, NODE_BORDER_WIDTH, &borderItem);
            nodeAPI->setAttribute(dragArea4, NODE_MARGIN, &marginItem);
            nodeAPI->registerNodeEvent(dragArea4, NODE_ON_DROP, 7, nullptr);
            nodeAPI->addChild(dragArea4, dragArea4Text);
            int ret = OH_ArkUI_DisableDropDataPrefetchOnNode(dragArea4, true);
            auto returnValue = OH_ArkUI_AllowNodeAllDropDataTypes(dragArea4);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                         "dragTest AllowNodeAllDropDataTypes returnValue = %{public}d", returnValue);
            nodeAPI->addChild(Column, dragArea4);


            ArkUI_NodeEvent *event;
            nodeAPI->registerNodeEventReceiver(&OnEventReceive);

            OH_NativeXComponent_AttachNativeRootNode(component, Column);
            
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