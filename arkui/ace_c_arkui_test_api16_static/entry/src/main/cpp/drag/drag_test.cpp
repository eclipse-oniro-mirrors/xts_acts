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

#include "drag_test.h"
#include "common/common.h"
#include <arkui/drag_and_drop.h>
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

namespace ArkUIAniTest {

std::vector<int32_t> DragTest::result = {};

static ani_object SetArrayAniDataWithGesture(const std::vector<int32_t> &values, ani_env* env)
{
   OH_LOG_INFO(LOG_APP, "[drag_test] SetArrayAniDataWithGesture start values1:%{public}d", values[0]);
   ani_ref undefinedRef {};
    if (ANI_OK != env->GetUndefined(&undefinedRef)) {
        OH_LOG_INFO(LOG_APP, "[drag_test] GetUndefined error");
        return nullptr;
    }
    ani_size size = values.size();
    ani_array aniArray;
    if (ANI_OK != env->Array_New(size, undefinedRef, &aniArray)) {
        OH_LOG_INFO(LOG_APP, "[drag_test] create colorSpace aniArray error");
        return nullptr;
    }
    ani_class intCls {};
    ani_method intCtor {};
    if (ANI_OK != env->FindClass("std.core.Double", &intCls)) {
        OH_LOG_INFO(LOG_APP, "[drag_test] Find std.core.Int error");
        return nullptr;
    }
    if (ANI_OK != env->Class_FindMethod(intCls, "<ctor>", "d:", &intCtor)) {
        OH_LOG_INFO(LOG_APP, "[drag_test] Find Int Ctor error");
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "[drag_test] copy array start");
    for (ani_size i = 0; i < size; ++i) {
        ani_object intObj {};
        OH_LOG_INFO(LOG_APP, "[drag_test] SetArrayAniDataWithGesture start values%{public}d:%{public}d", i, values[i]);
        ani_status status = env->Object_New(intCls, intCtor, &intObj, ani_int(values[i]));
        OH_LOG_INFO(LOG_APP, "[drag_test] copy array  status: %{public}d", status);
        if (ANI_OK != status) {
            OH_LOG_INFO(LOG_APP, "[drag_test] Object_New error");
            return nullptr;
        }
        OH_LOG_INFO(LOG_APP, "[drag_test] copy array XXXX");
        if (ANI_OK != env->Array_Set(aniArray, i, intObj)) {
            OH_LOG_INFO(LOG_APP, "[drag_test] Array_Set int error");
            return nullptr;
        }
    }
    OH_LOG_INFO(LOG_APP, "[drag_test] SetArrayAniDataWithGesture end");
    return aniArray;
}

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
    OH_LOG_INFO(LOG_APP, " [drag_test]OnEventDragStart  start");
    OH_UdmfRecord* record = OH_UdmfRecord_Create();
    int returnValue;
    OH_UdsFileUri* imageValue = OH_UdsFileUri_Create();
    returnValue = OH_UdsFileUri_SetFileUri(imageValue, "./resources/base/media/icon.png");
    returnValue = OH_UdmfRecord_AddFileUri(record, imageValue);
    OH_UdmfData* data = OH_UdmfData_Create();
    returnValue = OH_UdmfData_AddRecord(data, record);
    returnValue = OH_ArkUI_DragEvent_SetData(dragEvent, data);
    OH_LOG_INFO(LOG_APP, " [drag_test]OnEventDragStart  end");
}

static void OnEventOnDrag(ArkUI_DragEvent* dragEvent)
{
    OH_LOG_INFO(LOG_APP, " [drag_test]OnEventOnDrag  start");
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
    OH_LOG_INFO(LOG_APP, " [drag_test]DragTest::result  values1: %{public}d", ret);
    PushBackIntToData(DragTest::result, ret);
    OH_LOG_INFO(LOG_APP, " [drag_test]OnEventOnDrag  end");
}

static void OnEventReceive(ArkUI_NodeEvent* event)
{
    OH_LOG_INFO(LOG_APP, " [drag_test]OnEventReceive  start");
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragTest", "OnEventReceive: event is null");
        return;
    }

    auto eventId = OH_ArkUI_NodeEvent_GetEventType(event);
    auto dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    OH_LOG_INFO(LOG_APP, " [drag_test]OnEventReceive  eventID: %{public}d", eventId);
    if (eventId == NODE_ON_DRAG_START) {
        OnEventDragStart(dragEvent);
    }
    if (eventId == NODE_ON_DROP) {
        OnEventOnDrag(dragEvent);
    }
}

void DragTest::TestDragStartDataLoading001(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [drag_test]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    OH_LOG_INFO(LOG_APP, " [drag_test]createColumn  action");
    auto column = createColumn(true);
    OH_LOG_INFO(LOG_APP, " [drag_test]registerNodeEventReceiver(&OnEventReceive)  action");
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [drag_test]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [drag_test]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void DragTest::TestDragDisableDropDataPrefetch002(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [drag_test]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    auto column = createColumn(false);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [drag_test]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [drag_test]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void DragTest::TestDragCancelDataLoading003(ani_env* env, ani_object info, ani_object NodeContent, ani_object UIContext)
{
    OH_LOG_INFO(LOG_APP, " [drag_test]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem buttonText = { .string = "Cancel" };
    ArkUI_ContextHandle context = nullptr;
    OH_ArkUI_NativeModule_GetContextFromAniValue(env, UIContext, &context);
    auto key = "test";
    int ret = OH_ArkUI_CancelDataLoading(context, key);
    PushBackIntToData(DragTest::result, ret);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [drag_test]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, button);
    OH_LOG_INFO(LOG_APP, " [drag_test]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

ani_object DragTest::GetResult(ani_env* env, ani_object info)
{
    ani_object String_array = SetArrayAniDataWithGesture(DragTest::result, env);
    DragTest::result.clear();
    return String_array;
    
}
} // namespace ArkUIAniTest