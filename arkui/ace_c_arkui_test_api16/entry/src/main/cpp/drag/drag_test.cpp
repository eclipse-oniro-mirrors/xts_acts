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

#include "drag_test.h"

#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>
#include <database/udmf/udmf.h>
#include <database/udmf/udmf_meta.h>
#include <database/udmf/uds.h>
#include <string>

#include "../manager/plugin_manager.h"

namespace ArkUICapiTest {

std::vector<int32_t> DragTest::result = {};

static napi_value SetArrayNapiDataWithGesture(const std::vector<int32_t>& data, napi_env env)
{
    napi_value array;
    napi_create_array(env, &array);
    for (size_t i = PARAM_0; i < data.size(); i++) {
        napi_value num;
        napi_create_int32(env, data[i], &num);
        napi_set_element(env, array, i, num);
    }
    return array;
};

static void PushBackIntToData(std::vector<int32_t>& data, int32_t value)
{
    data.push_back(value);
}

static auto createColumn(bool dropDataPrefetchOnNode)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto image = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    ArkUI_AttributeItem NODE_IMAGE_SRC_Item = { .string = "./resources/base/media/icon.png" };
    ArkUI_NumberValue imageWidthValue[] = { 100 };
    ArkUI_AttributeItem imageWidthItem = { imageWidthValue, 1 };
    ArkUI_NumberValue imageHeightValue[] = { 100 };
    ArkUI_AttributeItem imageHeightItem = { imageHeightValue, 1 };
    ArkUI_NumberValue marginValue[] = { 20 };
    ArkUI_AttributeItem marginItem = { marginValue, 1 };
    nodeAPI->setAttribute(image, NODE_WIDTH, &imageWidthItem);
    nodeAPI->setAttribute(image, NODE_HEIGHT, &imageHeightItem);
    nodeAPI->setAttribute(image, NODE_IMAGE_SRC, &NODE_IMAGE_SRC_Item);
    nodeAPI->setAttribute(image, NODE_MARGIN, &marginItem);
    nodeAPI->registerNodeEvent(image, NODE_ON_DRAG_START, 1, nullptr);
    OH_ArkUI_SetNodeDraggable(image, true);
    auto dragArea = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue heightValue1[] = { 150 };
    ArkUI_AttributeItem heightItem = { heightValue1, 1 };
    ArkUI_NumberValue widthValue[] = { 200 };
    ArkUI_AttributeItem widthItem = { widthValue, 1 };
    ArkUI_NumberValue borderValue[] = { 1 };
    ArkUI_AttributeItem borderItem = { borderValue, 1 };
    nodeAPI->setAttribute(dragArea, NODE_WIDTH, &widthItem);
    nodeAPI->setAttribute(dragArea, NODE_HEIGHT, &heightItem);
    nodeAPI->setAttribute(dragArea, NODE_BORDER_WIDTH, &borderItem);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DROP, 1, nullptr);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DRAG_ENTER, 1, nullptr);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DRAG_MOVE, 1, nullptr);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DRAG_LEAVE, 1, nullptr);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DRAG_END, 1, nullptr);
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

static void OnEventDragStart(ArkUI_DragEvent* dragEvent)
{
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    int returnValue;
    OH_UdsFileUri* imageValue = OH_UdsFileUri_Create();
    returnValue = OH_UdsFileUri_SetFileUri(imageValue, "./resources/base/media/icon.png");
    returnValue = OH_UdmfRecord_AddFileUri(record, imageValue);
    OH_UdmfData* data = OH_UdmfData_Create();
    returnValue = OH_UdmfData_AddRecord(data, record);
    returnValue = OH_ArkUI_DragEvent_SetData(dragEvent, data);
}

static void OnEventOnDrag(ArkUI_DragEvent* dragEvent)
{
    const char* destUri = "file://com.example.sr20240506003108/data/storage/el2/distributedfiles/";
    OH_Udmf_DataProgressListener dataProgressListener = [](OH_Udmf_ProgressInfo* progressInfo, OH_UdmfData* data) {
        bool resultUdmf = OH_UdmfData_HasType(data, UDMF_META_GENERAL_FILE_URI);
        if (resultUdmf) {
            unsigned int recordsCount = 0;
            OH_UdmfRecord** records = OH_UdmfData_GetRecords(data, &recordsCount);
            int returnStatus;
            for (int i = 0; i < recordsCount; i++) {
                OH_UdsFileUri* imageValue = OH_UdsFileUri_Create();
                returnStatus = OH_UdmfRecord_GetFileUri(records[i], imageValue);
                const char* fileUri = OH_UdsFileUri_GetFileUri(imageValue);
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragTest",
                    "returnStatus = %{public}d"
                    "fileUri = %{public}s",
                    returnStatus, fileUri);
                OH_UdsFileUri_Destroy(imageValue);
            }
        }
    };
    OH_UdmfGetDataParams* params = OH_UdmfGetDataParams_Create();
    unsigned int keyLen = UDMF_KEY_BUFFER_LEN;
    OH_UdmfGetDataParams_SetDestUri(params, destUri);
    OH_UdmfGetDataParams_SetFileConflictOptions(params, Udmf_FileConflictOptions::UDMF_OVERWRITE);
    OH_UdmfGetDataParams_SetProgressIndicator(params, Udmf_ProgressIndicator::UDMF_DEFAULT);
    OH_UdmfGetDataParams_SetDataProgressListener(params, dataProgressListener);
    char* key = new char[keyLen];
    int ret = OH_ArkUI_DragEvent_StartDataLoading(dragEvent, params, key, keyLen);
    PushBackIntToData(DragTest::result, ret);
}

static void OnEventReceive(ArkUI_NodeEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragTest", "OnEventReceive: event is null");
        return;
    }

    auto eventId = OH_ArkUI_NodeEvent_GetEventType(event);
    auto dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);

    if (eventId == NODE_ON_DRAG_START) {
        OnEventDragStart(dragEvent);
    }
    if (eventId == NODE_ON_DROP) {
        OnEventOnDrag(dragEvent);
    }
}

napi_value DragTest::TestDragStartDataLoading001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "startDataLoading", "CreateNativeNode");

    size_t argc = 2;
    napi_value args[2] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "startDataLoading", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = createColumn(true);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

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

napi_value DragTest::TestDragDisableDropDataPrefetch002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DisableDropDataPrefetch", "CreateNativeNode");

    size_t argc = 2;
    napi_value args[2] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DisableDropDataPrefetch", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = createColumn(false);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DisableDropDataPrefetch",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value DragTest::TestDragCancelDataLoading003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CancelDataLoading", "CreateNativeNode");

    size_t argc = 2;
    napi_value args[2] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CancelDataLoading", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonText = { .string = "Cancel" };
    ArkUI_ContextHandle context = nullptr;
    OH_ArkUI_GetContextFromNapiValue(env, args[1], &context);
    auto key = "test";
    int ret = OH_ArkUI_CancelDataLoading(context, key);
    PushBackIntToData(DragTest::result, ret);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), button) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DisableDropDataPrefetch",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value DragTest::GetResult(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureGestureInfoTest", "GetGestureData");
    napi_value result;
    napi_create_array(env, &result);
    napi_set_element(env, result, PARAM_0, SetArrayNapiDataWithGesture(DragTest::result, env));
    DragTest::result.clear();
    return result;
}
} // namespace ArkUICapiTest