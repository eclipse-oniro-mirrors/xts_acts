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
 
#include "SnapShotTest.h"
#include <arkui/native_node.h>
#include <arkui/drag_and_drop.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

static OH_PixelmapNative *g_pixelMap = nullptr;
static ArkUI_NodeHandle g_image;
static ArkUI_NativeNodeAPI_1 *g_nodeAPi = nullptr;
static ArkUI_AttributeItem g_NODE_IMAGE_SRC_Item;
namespace SnapShotTest {
ArkUI_NodeHandle snapshotcolumn = nullptr;
napi_value CreateNodeSnapshot(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    // 1. 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    snapshotcolumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue value[] = {{ .u32 = 0xFFFF0000 }};
    ArkUI_AttributeItem coloritem = {.value = value, .size = PARAM_1};
    nodeAPI->setAttribute(snapshotcolumn, NODE_BACKGROUND_COLOR, &coloritem);
    ArkUI_NumberValue width[] = {{ .f32 = 1.0 }};
    ArkUI_AttributeItem item1 = {.value = width, .size = PARAM_1};
    nodeAPI->setAttribute(snapshotcolumn, NODE_WIDTH_PERCENT, &item1);
    nodeAPI->setAttribute(snapshotcolumn, NODE_HEIGHT_PERCENT, &item1);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, snapshotcolumn);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value GetNodeSnapshotTest_001(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *g_pixelMap = nullptr;
    auto g_options = OH_ArkUI_CreateSnapshotOptions();
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    int width = PARAM_20;
    OH_PixelmapInitializationOptions_SetWidth(createOpts, width);
    int height = PARAM_20;
    OH_PixelmapInitializationOptions_SetHeight(createOpts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    uint8_t data [PARAM_500];
    int dataSize = PARAM_500;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &g_pixelMap);
    int result = OH_ArkUI_GetNodeSnapshot(snapshotcolumn, g_options, &g_pixelMap);
    OH_PixelmapNative_Release(g_pixelMap);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNodeSnapshotTest_002(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPi);
    // 创建指定类型的节点
    auto column1 = nullptr;
    auto options = OH_ArkUI_CreateSnapshotOptions();
    int result = OH_ArkUI_GetNodeSnapshot(column1, options, &g_pixelMap);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNodeSnapshotTest_003(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPi);
    // 创建指定类型的节点
    auto column2 = g_nodeAPi->createNode(ARKUI_NODE_COLUMN);
    auto options = OH_ArkUI_CreateSnapshotOptions();
    int result = OH_ArkUI_GetNodeSnapshot(column2, options, &g_pixelMap);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_INTERNAL_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNodeSnapshotTest_004(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPi);
    // 创建指定类型的节点
    auto column3 = nullptr;
    auto options = OH_ArkUI_CreateSnapshotOptions();
    int result = OH_ArkUI_GetNodeSnapshot(column3, options, &g_pixelMap);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}
}
 