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

#include "DragEventFuncTest.h"
#include "../manager/plugin_manager.h"
#include <mutex>
#include <string>
#include <arkui/drag_and_drop.h>
#include <database/udmf/udmf.h>
#include <database/udmf/udmf_meta.h>
#include <database/udmf/uds.h>
#include <arkui/native_gesture.h>
#include <arkui/native_type.h>
#include <arkui/native_node_napi.h>
#include <cstdlib>
#include <arkui/native_type.h>
#include <arkui/ui_input_event.h>
#define PARAM_150 150
#define PARAM_128 128
#define PARAM_50 50
#define PARAM_500 500
#define PARAM_800 800
#define PARAM_123 123
#define PARAM_960000 960000
#define PARAM_400 400
#define PARAM_0xff112233 0xff112233
#define PARAM_0_POINT_0 0.0
#define PARAM_1_POINT_0 1.0
#define COLOR_YELLOW 0xFFFFF000
#define COLOR_PURPLE 0xFFCC00CC
#define COLOR_GREEN 0xFFA0F0A0

namespace ArkUICapiTest {

static void OnEventReceive(ArkUI_NodeEvent *event) {
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "dragEventFuncTest *************  %{public}d;",
                 eventType);
    ArkUI_DragEvent *dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    int errorCode = 0;
    switch (eventType) {
    case NODE_ON_DROP: {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest", "dragEventFuncTest coming");
        static char key[UDMF_KEY_BUFFER_LEN];
        OH_UdmfGetDataParams *params = OH_UdmfGetDataParams_Create();
        unsigned int keyLen = UDMF_KEY_BUFFER_LEN;
        memset(key, 'a', UDMF_KEY_BUFFER_LEN);
        const char *destUri = "file:///data/storage/el1";
        OH_Udmf_DataProgressListener dataProgressListener = [](OH_Udmf_ProgressInfo *progressInfo, OH_UdmfData *data) {
            int32_t progress = OH_UdmfProgressInfo_GetProgress(progressInfo);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "StartDataLoading progressInfo = %{public}d js1111", progress);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "dataProgressListener callback js1111");
            bool resultUdmf = OH_UdmfData_HasType(data, UDMF_META_GENERAL_FILE);
            if (resultUdmf) {
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
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
        OH_UdmfGetDataParams_SetDestUri(params, destUri);
        OH_UdmfGetDataParams_SetFileConflictOptions(params, Udmf_FileConflictOptions::UDMF_OVERWRITE);
        OH_UdmfGetDataParams_SetProgressIndicator(params, Udmf_ProgressIndicator::UDMF_DEFAULT);
        OH_UdmfDataLoadInfo *info2 = OH_UdmfDataLoadInfo_Create();
        OH_UdmfDataLoadInfo_SetType(info2, "general.file");
        int num = PARAM_100;
        OH_UdmfDataLoadInfo_SetRecordCount(info2, num);
        OH_UdmfGetDataParams_SetAcceptableInfo(params, info2);
        OH_UdmfGetDataParams_SetDataProgressListener(params, dataProgressListener);
        int errorCode1 = OH_ArkUI_DragEvent_StartDataLoading(dragEvent, params, key, keyLen);
        if (errorCode1 == ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_StartDataLoading return ok");
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_StartDataLoading return failed");
            return;
        }

        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        ArkUI_NumberValue color_value[] = {{.u32 = COLOR_WHITE}};
        ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &color_item);
        break;
    }
    case NODE_ON_DRAG_START: {
        errorCode = OH_ArkUI_DragEvent_DisableDefaultDropAnimation(dragEvent, true);
        if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_DisableDefaultDropAnimation return ok");
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_DisableDefaultDropAnimation return failed");
            return;
        }

        errorCode = OH_ArkUI_DragEvent_SetSuggestedDropOperation(dragEvent, ARKUI_DROP_OPERATION_COPY);
        if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_SetSuggestedDropOperation return ok");
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_SetSuggestedDropOperation return failed");
            return;
        }

        errorCode += OH_ArkUI_DragEvent_SetDragResult(dragEvent, ARKUI_DRAG_RESULT_SUCCESSFUL);
        if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_SetDragResult return ok");
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_SetDragResult return failed");
            return;
        }

        char *types1[PARAM_128];
        char stringArray[PARAM_10][PARAM_128];
        for (int i = 0; i < PARAM_10; i++) {
            types1[i] = stringArray[i];
        }
        int32_t CountOk = -1;
        errorCode = OH_ArkUI_DragEvent_GetDataTypes(dragEvent, types1, 0, PARAM_128);
        if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_GetDataTypes return ok");
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_GetDataTypes return faile, %{public}d", errorCode);
            return;
        }
        errorCode = OH_ArkUI_DragEvent_GetDataTypes(dragEvent, types1, CountOk, CountOk);
        if (errorCode == ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_GetDataTypes return ok");
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_GetDataTypes return faile, %{public}d", errorCode);
            return;
        }

        errorCode = OH_ArkUI_DragEvent_GetDataTypeCount(dragEvent, &CountOk);
        if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_GetDataTypeCount return ok");
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_GetDataTypeCount return failed");
            return;
        }

        char bundleNameChar[PARAM_200];
        errorCode = OH_ArkUI_DragEvent_GetDragSource(dragEvent, bundleNameChar, PARAM_200);
        if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_GetDragSource return ok");
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                         "OH_ArkUI_DragEvent_GetDragSource return failed");
            return;
        }
        // 最终在页面进行结果验证
        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        ArkUI_NumberValue color_value[] = {{.u32 = COLOR_WHITE}};
        ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &color_item);
    }
    default:
        break;
    }
}

napi_value DragEventFuncTest::CreateNativeNode(napi_env env, napi_callback_info info) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest", "CreateNativeNode-----------------");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest", "GetContext is null-----------");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto image = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto dragArea = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue imageWidthValue[] = {PARAM_100};
    ArkUI_AttributeItem imageWidthItem = {imageWidthValue, 1};
    ArkUI_NumberValue imageHeightValue[] = {PARAM_100};
    ArkUI_AttributeItem imageHeightItem = {imageHeightValue, 1};
    ArkUI_NumberValue marginValue[] = {PARAM_20};
    ArkUI_AttributeItem marginItem = {marginValue, 1};
    nodeAPI->setAttribute(image, NODE_WIDTH, &imageWidthItem);
    nodeAPI->setAttribute(image, NODE_HEIGHT, &imageHeightItem);
    nodeAPI->setAttribute(image, NODE_MARGIN, &marginItem);
    ArkUI_NumberValue color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(image, NODE_BACKGROUND_COLOR, &color_item);
    ArkUI_NumberValue imageWidthValue1[] = {PARAM_150};
    ArkUI_AttributeItem imageWidthItem1 = {imageWidthValue1, 1};
    ArkUI_NumberValue imageHeightValue1[] = {PARAM_200};
    ArkUI_AttributeItem imageHeightItem1 = {imageHeightValue1, 1};
    ArkUI_NumberValue borderValue[] = {1};
    ArkUI_AttributeItem borderItem = {borderValue, 1};
    nodeAPI->setAttribute(dragArea, NODE_WIDTH, &imageWidthItem1);
    nodeAPI->setAttribute(dragArea, NODE_HEIGHT, &imageHeightItem1);
    nodeAPI->setAttribute(dragArea, NODE_BACKGROUND_COLOR, &color_item);
    nodeAPI->setAttribute(dragArea, NODE_BORDER_WIDTH, &borderItem);
    nodeAPI->registerNodeEvent(image, NODE_ON_DRAG_START, 0, nullptr);
    nodeAPI->registerNodeEvent(image, NODE_ON_DROP, 1, nullptr);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DROP, 1, nullptr);
    OH_ArkUI_AllowNodeAllDropDataTypes(dragArea);
    OH_ArkUI_DisableDropDataPrefetchOnNode(dragArea, true);
    int ret_val = OH_ArkUI_SetNodeDraggable(image, true);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "image_";
    nodeAPI->setAttribute(image, NODE_ID, &id_item);
    id_item.string = "dragArea_";
    nodeAPI->setAttribute(dragArea, NODE_ID, &id_item);
    nodeAPI->addChild(Column, image);
    nodeAPI->addChild(Column, dragArea);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    int ret_val1 =
        OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), Column);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                 "OH_NativeXComponent_AttachNativeRootNode-----------------%{public}d, %{public}d", ret_val, ret_val1);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
napi_value DragEventFuncTest::DragEventFuncTest001(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DragEvent_DisableDefaultDropAnimation(nullptr, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEventFuncTest001", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest002(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DragEvent_SetSuggestedDropOperation(nullptr, ARKUI_DROP_OPERATION_COPY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEventFuncTest002", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest003(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DragEvent_SetDragResult(nullptr, ARKUI_DRAG_RESULT_SUCCESSFUL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEventFuncTest003", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest004(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DragEvent_SetDragResult(nullptr, ARKUI_DRAG_RESULT_SUCCESSFUL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEventFuncTest004", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest005(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DragEvent_SetDragResult(nullptr, ARKUI_DRAG_RESULT_SUCCESSFUL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEventFuncTest005", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest006(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DragEvent_SetDragResult(nullptr, ARKUI_DRAG_RESULT_SUCCESSFUL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEventFuncTest006", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest007(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DragEvent_SetDragResult(nullptr, ARKUI_DRAG_RESULT_SUCCESSFUL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEventFuncTest007", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest008(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DragEvent_GetDragResult(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEventFuncTest008", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest009(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DragEvent_GetDropOperation(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEventFuncTest009", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest010(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DragEvent_GetModifierKeyStates(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEventFuncTest010", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest011(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DragEvent_GetDisplayId(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEventFuncTest011", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest012(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DragEvent_StartDataLoading(nullptr, nullptr, nullptr, PARAM_0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEventFuncTest012", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest013(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_CancelDataLoading(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEventFuncTest013", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest015(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DisableDropDataPrefetchOnNode(nullptr, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest015", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest016(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto dragArea = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    int ret = OH_ArkUI_DisableDropDataPrefetchOnNode(dragArea, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest016", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value DragEventFuncTest::DragEventFuncTest017(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int ret = OH_ArkUI_DisableDropDataPrefetchOnNode(nullptr, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest017", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest018(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    std::vector<const char *> strlist;
    strlist.push_back("general.plain-text");
    int ret = OH_ArkUI_SetNodeAllowedDropDataTypes(text, strlist.data(), strlist.size());
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest018", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest019(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    int ret = OH_ArkUI_DragPreviewOption_SetScaleMode(previewOptions, ARKUI_DRAG_PREVIEW_SCALE_AUTO);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest019", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest020(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    int ret = OH_ArkUI_DragPreviewOption_SetDefaultShadowEnabled(previewOptions, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest020", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest021(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    int ret = OH_ArkUI_DragPreviewOption_SetDefaultRadiusEnabled(previewOptions, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest021", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest022(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    int ret = OH_ArkUI_DragPreviewOption_SetNumberBadgeEnabled(previewOptions, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest022", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest023(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    int ret = OH_ArkUI_DragPreviewOption_SetBadgeNumber(previewOptions, PARAM_123);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest023", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest024(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    int ret = OH_ArkUI_DragPreviewOption_SetDefaultAnimationBeforeLiftingEnabled(previewOptions, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest024", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest026(napi_env env, napi_callback_info info) {
    OH_UdmfDataLoadParams *dataLoadParams = OH_UdmfDataLoadParams_Create();
    auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto(text) = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);
    OH_UdmfDataLoadInfo *infoff = OH_UdmfDataLoadInfo_Create();
    OH_UdmfDataLoadInfo_SetRecordCount(infoff, PARAM_100);
    OH_UdmfDataLoadParams_SetDataLoadInfo(dataLoadParams, infoff);
    ArkUI_ErrorCode ret = OH_ArkUI_DragAction_SetDataLoadParams(dragAction, dataLoadParams);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest026", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest027(napi_env env, napi_callback_info info) {
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_ErrorCode ret = OH_ArkUI_DragAction_SetDataLoadParams(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest027", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest028(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = PARAM_50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    auto *dragAction = OH_ArkUI_CreateDragActionWithNode(text);
    auto *previewOptions = OH_ArkUI_CreateDragPreviewOption();
    auto ret = OH_ArkUI_DragAction_SetDragPreviewOption(dragAction, previewOptions);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest028", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest029(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_DragAction_SetDragPreviewOption(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest029", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest030(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "drag_DragAction Test";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    float size = PARAM_50;
    ArkUI_NumberValue value[] = {{.f32 = size}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_FONT_SIZE, &valueItem);
    ArkUI_ContextHandle context = OH_ArkUI_GetContextByNode(text);
    auto *dragAction = OH_ArkUI_CreateDragActionWithContext(context);
    auto ret = OH_ArkUI_DragAction_RegisterStatusListener(
        dragAction, nullptr, [](ArkUI_DragAndDropInfo *dragAndDropInfo, void *userData) -> void {});
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest030", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest031(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_DragEvent_GetDragSource(nullptr, nullptr, PARAM_0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest031", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest032(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_DragEvent_IsRemote(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest032", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest033(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_ContextHandle ContextHandle = static_cast<ArkUI_ContextHandle>(malloc(sizeof(ArkUI_Context *)));
    auto ret = OH_ArkUI_EnableDropDisallowedBadge(ContextHandle, false);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest033", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest034(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_EnableDropDisallowedBadge(nullptr, false);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest034", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

napi_value DragEventFuncTest::dragEventFuncTest035(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_GestureRecognizerHandleArray array;
    int32_t size = PARAM_0;
    auto node = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_ParallelInnerGestureEvent_GetConflictRecognizers((ArkUI_ParallelInnerGestureEvent *)node,
                                                                         &array, &size);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest035", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
int g_aaa_036ret = PARAM_NEGATIVE_1;
napi_value DragEventFuncTest::dragEventFuncTest036(napi_env env, napi_callback_info info) {
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest001", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // CallBackPanGestureData testCallBackPanGestureData;

    static auto column = nodeAPI->createNode(ARKUI_NODE_ROW);
    // 创建手势并设置回调
    ArkUI_NumberValue value[] = {{.u32 = PARAM_0xff112233}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item);
    ArkUI_NumberValue widthValue[] = {{PARAM_500}};
    ArkUI_AttributeItem width = {widthValue, PARAM_1};
    nodeAPI->setAttribute(column, NODE_WIDTH, &width);
    ArkUI_NumberValue heightValue[] = {{PARAM_800}};
    ArkUI_AttributeItem height = {heightValue, PARAM_1};
    nodeAPI->setAttribute(column, NODE_HEIGHT, &height);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "ColumnID";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    // 创建手势
    auto gestureApi = reinterpret_cast<ArkUI_NativeGestureAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto LongPressGesture = gestureApi->createPanGesture(PARAM_1, GESTURE_DIRECTION_ALL, PARAM_6);
    auto PanGestureSetDistanceMapCode = OH_ArkUI_SetGestureRecognizerLimitFingerCount(LongPressGesture, true);
    int ttList[PARAM_6] = {
        UI_INPUT_EVENT_TOOL_TYPE_FINGER,
        UI_INPUT_EVENT_TOOL_TYPE_PEN,
        UI_INPUT_EVENT_TOOL_TYPE_MOUSE,
        UI_INPUT_EVENT_TOOL_TYPE_TOUCHPAD,
    };
    double ttDistance[PARAM_6] = {
        PARAM_8,
        PARAM_10,
        PARAM_4,
        PARAM_12,
    };
    auto errode = OH_ArkUI_PanGesture_SetDistanceMap(LongPressGesture, PARAM_4, ttList, ttDistance);


    auto onInterruptCallback = [](ArkUI_GestureInterruptInfo *info) -> ArkUI_GestureInterruptResult {
        auto recognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
        double diss0 = PARAM_0_POINT_0;
        auto errode2 = OH_ArkUI_GetGestureParam_distance(recognizer, &diss0);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest",
                     "pan after OH_ArkUI_GetGestureParam_distance code:%{public}d, diss:%{public}f", errode2, diss0);
        auto ret = OH_ArkUI_PanGesture_GetDistanceByToolType(recognizer, UI_INPUT_EVENT_TOOL_TYPE_UNKNOWN, &diss0);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest036", "ret is %{public}d------", ret);
        if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest036", "ret is %{public}d------", ret);
            g_aaa_036ret = ARKUI_ERROR_CODE_NO_ERROR;
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest036", "ret is %{public}d------", ret);
        }

        return GESTURE_INTERRUPT_RESULT_CONTINUE;
    };
    auto onActionCallBack = [](ArkUI_GestureEvent *event, void *extraParam) {
        ArkUI_GestureEventActionType actionType = OH_ArkUI_GestureEvent_GetActionType(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                     "onLongPressCallBack,fingers=2, actionType %{public}d", actionType);
        auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
        auto sourceType = OH_ArkUI_UIInputEvent_GetSourceType(inputEvent);
        auto offsetX = OH_ArkUI_PanGesture_GetOffsetX(event);
        auto offsety = OH_ArkUI_PanGesture_GetOffsetY(event);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PanGestureTest",
                     "onLongPressCallBack, LongPressGesture sourceType %{public}d, offsetX %{public}f, "
                     "offsety %{public}f",
                     sourceType, offsetX, offsety);
    };
    // 把回调挂到手势上
    gestureApi->setGestureEventTarget(LongPressGesture, GESTURE_EVENT_ACTION_ACCEPT, column, onActionCallBack);
    // 将手势设置到组件上
    gestureApi->addGestureToNode(column, LongPressGesture, PARALLEL, NORMAL_GESTURE_MASK);
    gestureApi->setGestureInterrupterToNode(column, onInterruptCallback);
    bool tmp = false;
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testAddCustomProperty001",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    NAPI_END;
}


napi_value DragEventFuncTest::GetPanGesture036Ret(napi_env env, napi_callback_info info) {

    napi_value result = nullptr;
    if (g_aaa_036ret == ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest036",
                     "g_036case_ret is ok, ------. %{public}d", g_aaa_036ret);
        napi_create_int32(env, SUCCESS, &result);
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest036", "g_036case_ret is ok, oth------");
        napi_create_int32(env, INVALID_PARAM, &result);
    }
    return result;
}


void onReceiver037(ArkUI_NodeEvent *event) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest037", "onReceiver037--------");
    static bool g_numlockresult = false;
    static bool g_capslockresult = false;
    static bool g_scrolllockresult = false;
    const ArkUI_UIInputEvent *g_ArkUI_UIInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    auto errorCode = OH_ArkUI_KeyEvent_IsNumLockOn(g_ArkUI_UIInputEvent, &g_numlockresult);
    if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                     "OH_ArkUI_KeyEvent_IsNumLockOn return ok");
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                     "OH_ArkUI_KeyEvent_IsNumLockOn return failed");
        return;
    }
    errorCode = OH_ArkUI_KeyEvent_IsCapsLockOn(g_ArkUI_UIInputEvent, &g_capslockresult);
    if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                     "OH_ArkUI_KeyEvent_IsCapsLockOn return ok");
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                     "OH_ArkUI_KeyEvent_IsCapsLockOn return failed");
        return;
    }

    errorCode = OH_ArkUI_KeyEvent_IsScrollLockOn(g_ArkUI_UIInputEvent, &g_scrolllockresult);
    if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                     "OH_ArkUI_KeyEvent_IsScrollLockOn return ok");
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                     "OH_ArkUI_KeyEvent_IsScrollLockOn return failed");
        return;
    }

    int32_t count = PARAM_NEGATIVE_1;
    int32_t *pressedKeys_nom = (int32_t *)malloc(1);
    auto setResult = OH_ArkUI_UIInputEvent_GetPressedKeys(g_ArkUI_UIInputEvent, pressedKeys_nom, &count);
    if (setResult == ARKUI_ERROR_CODE_BUFFER_SIZE_NOT_ENOUGH /*ARKUI_ERROR_CODE_BUFFER_SIZE_NOT_ENOUGH = 180002*/) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                     "OH_ArkUI_UIInputEvent_GetPressedKeys ret is %{public}d------", setResult);
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                     "OH_ArkUI_UIInputEvent_GetPressedKeys failed:%{public}d------", setResult);
        return;
    }

    uint64_t modifierKey = PARAM_100;
    setResult = OH_ArkUI_UIInputEvent_GetModifierKeyStates(g_ArkUI_UIInputEvent, &modifierKey);
    if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                     "OH_ArkUI_UIInputEvent_GetModifierKeyStates ret is %{public}d------", setResult);
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest",
                     "OH_ArkUI_UIInputEvent_GetModifierKeyStates failed:%{public}d------", setResult);
        return;
    }


    // 回显
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NumberValue color_value[] = {{.u32 = COLOR_WHITE}};
    ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &color_item);

    return;
}
static bool isNumLockOnState = false;
static bool isCapsLockOnState = false;
static bool isScrollLockOnState = false;
napi_value DragEventFuncTest::dragEventFuncTest037(napi_env env, napi_callback_info info) {
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

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    static auto column = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto keyevent = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    nodeAPI->registerNodeEvent(keyevent, NODE_ON_KEY_EVENT, PARAM_1, nullptr);
    ArkUI_NumberValue requestFocusValue[] = {{.i32 = PARAM_1}}; // 1表示请求焦点<br>
    ArkUI_AttributeItem requestFocusItem = {.value = requestFocusValue, .size = PARAM_1};
    nodeAPI->setAttribute(keyevent, NODE_FOCUSABLE, &requestFocusItem);
    nodeAPI->setAttribute(keyevent, NODE_DEFAULT_FOCUS, &requestFocusItem);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "keyevent";
    nodeAPI->setAttribute(keyevent, NODE_ID, &id_item);
    nodeAPI->addNodeEventReceiver(keyevent, onReceiver037);

    nodeAPI->addChild(column, keyevent);
    std::string id(idStr);
    int ret_val1 =
        OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "dragEventFuncTest036 napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value DragEventFuncTest::dragEventFuncTest038(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_SnapshotOptions_SetScale(nullptr, PARAM_0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest038", "ret is %{public}d------", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static void OnEventReceive039(ArkUI_NodeEvent *event) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventFuncTest039", "OnEventReceive039");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest039", "OnEventReceive039: event is null");
        return;
    }

    auto eventId = OH_ArkUI_NodeEvent_GetEventType(event);
    auto inputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    if (eventId == NODE_TOUCH_EVENT) {
        uint32_t changedPointerId = PARAM_100;
        auto changedIdResult = OH_ArkUI_PointerEvent_GetChangedPointerId(inputEvent, &changedPointerId);
        if (changedIdResult == ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest039",
                         "OH_ArkUI_PointerEvent_GetChangedPointerId ret is %{public}d------", changedIdResult);
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest039",
                         "OH_ArkUI_PointerEvent_GetChangedPointerId failed:%{public}d------", changedIdResult);
            return;
        }
    }


    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NumberValue color_value[] = {{.u32 = COLOR_YELLOW}};
    ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &color_item);
}
napi_value DragEventFuncTest::dragEventFuncTest039(napi_env env, napi_callback_info info) {
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "startDataLoading", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto image = nodeAPI->createNode(ARKUI_NODE_IMAGE);
    ArkUI_AttributeItem NODE_IMAGE_SRC_Item = {.string = "./resources/base/media/icon.png"};
    ArkUI_NumberValue imageWidthValue[] = {PARAM_100};
    ArkUI_AttributeItem imageWidthItem = {imageWidthValue, PARAM_1};
    ArkUI_NumberValue imageHeightValue[] = {PARAM_100};
    ArkUI_AttributeItem imageHeightItem = {imageHeightValue, PARAM_1};
    ArkUI_NumberValue marginValue[] = {PARAM_20};
    ArkUI_AttributeItem marginItem = {marginValue, PARAM_1};
    nodeAPI->setAttribute(image, NODE_WIDTH, &imageWidthItem);
    nodeAPI->setAttribute(image, NODE_HEIGHT, &imageHeightItem);
    nodeAPI->setAttribute(image, NODE_IMAGE_SRC, &NODE_IMAGE_SRC_Item);
    nodeAPI->setAttribute(image, NODE_MARGIN, &marginItem);
    auto dragArea = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue heightValue1[] = {PARAM_150};
    ArkUI_AttributeItem heightItem = {heightValue1, PARAM_1};
    ArkUI_NumberValue widthValue[] = {PARAM_200};
    ArkUI_AttributeItem widthItem = {widthValue, PARAM_1};
    ArkUI_NumberValue borderValue[] = {PARAM_1};
    ArkUI_AttributeItem borderItem = {borderValue, PARAM_1};
    nodeAPI->setAttribute(dragArea, NODE_WIDTH, &widthItem);
    nodeAPI->setAttribute(dragArea, NODE_HEIGHT, &heightItem);
    nodeAPI->setAttribute(dragArea, NODE_BORDER_WIDTH, &borderItem);
    nodeAPI->registerNodeEvent(image, NODE_TOUCH_EVENT, PARAM_0, nullptr);
    nodeAPI->registerNodeEvent(image, NODE_ON_MOUSE, PARAM_1, nullptr);
    OH_ArkUI_AllowNodeAllDropDataTypes(dragArea);
    OH_ArkUI_DisableDropDataPrefetchOnNode(dragArea, true);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "image";
    nodeAPI->setAttribute(image, NODE_ID, &id_item);
    id_item.string = "dragArea";
    nodeAPI->setAttribute(dragArea, NODE_ID, &id_item);
    nodeAPI->addChild(column, image);
    nodeAPI->addChild(column, dragArea);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive039);

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

napi_value DragEventFuncTest::dragEventFuncTest040(napi_env env, napi_callback_info info) {
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_PointerEvent_SetStopPropagation(nullptr, false);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest040", "ret is %{public}d------", ret);
    ret = OH_ArkUI_NodeContent_AddNode(nullptr, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

void eventReceiver041(ArkUI_NodeEvent *event) {
    ArkUI_UIInputEvent *UIInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    auto eventId = OH_ArkUI_NodeEvent_GetEventType(event);
    if (eventId == NODE_ON_MOUSE) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest041",
                     "eventId is NODE_ON_MOUSE------%{public}d", eventId);
        int32_t length = PARAM_1;
        int32_t *pressButton = (int32_t *)malloc(length * sizeof(int32_t));
        auto ret = OH_ArkUI_MouseEvent_GetPressedButtons(UIInputEvent, pressButton, &length);
        if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest041",
                         "OH_ArkUI_MouseEvent_GetPressedButtons ret is %{public}d------", ret);
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest041",
                         "OH_ArkUI_MouseEvent_GetPressedButtons failed:%{public}d------", ret);
            return;
        }

        length = -1;
        ret = OH_ArkUI_MouseEvent_GetPressedButtons(UIInputEvent, pressButton, &length);
        if (ret == ARKUI_ERROR_CODE_BUFFER_SIZE_NOT_ENOUGH) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest041",
                         "OH_ArkUI_MouseEvent_GetPressedButtons ret is %{public}d------", ret);
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest041",
                         "OH_ArkUI_MouseEvent_GetPressedButtons failed:%{public}d------", ret);
            return;
        }
    } else {
        ArkUI_UIInputEvent *clonedEvent = nullptr;
        auto ret = OH_ArkUI_PointerEvent_CreateClonedEvent(UIInputEvent, &clonedEvent);
        if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest041",
                         "OH_ArkUI_PointerEvent_CreateClonedEvent ret is %{public}d------", ret);
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest041",
                         "OH_ArkUI_PointerEvent_CreateClonedEvent failed:%{public}d------", ret);
            return;
        }
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NumberValue color_value[] = {{.u32 = COLOR_PURPLE}};
    ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &color_item);
}

napi_value DragEventFuncTest::dragEventFuncTest041(napi_env env, napi_callback_info info) {
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest041",
                     "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventFuncTest041",
                     "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    char xComponentID[PARAM_64] = {PARAM_0};
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    ArkUI_NativeNodeAPI_1 *nodeAPI;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    ArkUI_NodeHandle g_columnNode = nodeAPI->createNode(ARKUI_NODE_COLUMN);


#define COMMONEVENT_EVENT_ID 6070
    int32_t targetId = PARAM_1;
    char *userData = "A";
    auto g_Node = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_1_POINT_0}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    nodeAPI->setAttribute(g_Node, NODE_WIDTH_PERCENT, &item);
    nodeAPI->setAttribute(g_Node, NODE_HEIGHT_PERCENT, &item);
    nodeAPI->registerNodeEvent(g_Node, NODE_ON_MOUSE, targetId, userData);
    nodeAPI->registerNodeEvent(g_Node, NODE_TOUCH_EVENT, PARAM_0, userData);
    ArkUI_AttributeItem id_item = {};
    ArkUI_NumberValue color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(g_Node, NODE_BACKGROUND_COLOR, &color_item);
    id_item.string = "keyevent";
    nodeAPI->setAttribute(g_Node, NODE_ID, &id_item);
    nodeAPI->addNodeEventReceiver(g_Node, eventReceiver041);
    nodeAPI->addChild(g_columnNode, g_Node);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), g_columnNode) ==
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

} // namespace ArkUICapiTest

