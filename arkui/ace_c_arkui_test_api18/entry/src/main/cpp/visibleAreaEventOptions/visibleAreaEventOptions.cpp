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

#include "visibleAreaEventOptions.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>

#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>

namespace ArkUICapiTest {

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, bool enabled)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem LABEL_Item = {.string = "button"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &LABEL_Item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &background_color_item);
    return button;
}
static void OnEventDragEndPending(ArkUI_NodeEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragTest", "OnEventReceive: event is null");
        return;
    }

    auto eventId = OH_ArkUI_NodeEvent_GetEventType(event);
    auto dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);

    if (eventId == NODE_ON_DRAG_END) {
        int32_t requestId = -1;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "OnEventDragEndPending", "eventId is  NODE_ON_DRAG_END");
        OH_ArkUI_DragEvent_RequestDragEndPending(dragEvent, &requestId);
    } else {
         OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "OnEventDragEndPending", "eventId is not NODE_ON_DRAG_END");
    }
}
static auto createColumn(bool dropDataPrefetchOnNode)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = createChildNode(nodeAPI, true);
    ArkUI_AttributeItem textId = {.string = "dragEndPending_right"};
    nodeAPI->setAttribute(button, NODE_ID, &textId);
    nodeAPI->addChild(column, button);
    nodeAPI->registerNodeEvent(button, NODE_ON_DRAG_END, 20, nullptr);

    /*auto button2 = createChildNode(nodeAPI, true);
    ArkUI_AttributeItem textId2 = {.string = "dragEndPending_error"};
    nodeAPI->setAttribute(button2, NODE_ID, &textId2);
    nodeAPI->addChild(column, button2);
    nodeAPI->registerNodeEvent(button2, NODE_ON_DRAG_END, 20, nullptr);*/

    return column;
}
/*
struct ArkUIDragEvent {
    void* unifiedData;
    void* unifiedDataSummary;
    bool isSuitGetData;
    ArkUI_Int32 dragResult;
    ArkUI_Float64 touchPointX;
    ArkUI_Float64 touchPointY;
    ArkUI_Float64 previewRectWidth;
    ArkUI_Float64 previewRectHeight;
    ArkUI_Float64 velocityX;
    ArkUI_Float64 velocityY;
    ArkUI_Float64 velocity;
    ArkUI_Float64 windowX;
    ArkUI_Float64 windowY;
    ArkUI_Float64 displayX;
    ArkUI_Float64 displayY;
    ArkUI_Float64 screenX;
    ArkUI_Float64 screenY;
    ArkUI_Uint64 modifierKeyState;
    ArkUI_Int32 dragBehavior;
    bool useCustomDropAnimation;
    ArkUI_Int32 subKind;
    ArkUI_Int32 preDragStatus;
    ArkUI_Int32 dataTypesCount;
    ArkUI_CharPtr* dataTypes;
    ArkUI_Int32 dataTypesMaxStrLength;
    ArkUI_CharPtr key;
    ArkUI_Int32 requestId;
    bool isDragEndPending;
};*/

napi_value VisibleAreaEventOptionsTest::DragEndPendingTest_001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_001", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_DragAndDropInfo *dragAndDropInfo = nullptr;
    ArkUI_DragStatus status = OH_ArkUI_DragAndDropInfo_GetDragStatus(dragAndDropInfo);
    ArkUI_DragEvent *event = OH_ArkUI_DragAndDropInfo_GetDragEvent(dragAndDropInfo);
    int id = 1;
    //event->requestId = 1;
    //event->isDragEndPending = true;
    auto ret = OH_ArkUI_DragEvent_RequestDragEndPending(event, &id);
    if(ret == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_001","ret ARKUI_ERROR_CODE_NO_ERROR");
    else if(ret == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_001","ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    else if(ret == ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_001"," ret ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED ");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
/*
napi_value VisibleAreaEventOptionsTest::DragEndPendingTest_002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_002", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    OH_ArkUI_SetDragEventStrictReportWithNode();
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DragEndPendingTest_002", "GetContext env or info is null");
        return nullptr;
    }
 
    
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
*/
napi_value VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_a(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "GetContext env or info is null");
        return nullptr;
    }

    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *options = OH_ArkUI_VisibleAreaEventOptions_Create();
    int creatFlag = 0;
    if(options == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "options creat failed");
        creatFlag = 1;
    }
    ASSERT_EQ(creatFlag, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "options creat success");
    OH_ArkUI_VisibleAreaEventOptions_Dispose(options);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "options Dispose success");
    NAPI_END;
}


napi_value VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_b(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_b", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_b", "GetContext env or info is null");
        return nullptr;
    }

    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *options = OH_ArkUI_VisibleAreaEventOptions_Create();
    float *ratiosArray = new float[12];
    ratiosArray[0] = 0.1;
    ratiosArray[1] = 0.2;
    ratiosArray[2] = 0.3;
    ratiosArray[3] = 0.4;
    ratiosArray[4] = 0.5;
    ratiosArray[5] = 0.6;
    int disFlag = 0;
    int r1 = OH_ArkUI_VisibleAreaEventOptions_SetRatios(options, ratiosArray, 12);
    if(r1 == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_b","ret ARKUI_ERROR_CODE_NO_ERROR");
    else if(r1 == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_b","ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    ASSERT_EQ(r1, ARKUI_ERROR_CODE_NO_ERROR);
    int r2 = OH_ArkUI_VisibleAreaEventOptions_SetExpectedUpdateInterval(options, 1);
    if(r2 == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_b","ret ARKUI_ERROR_CODE_NO_ERROR");
    else if(r2 == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_b","ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    ASSERT_EQ(r2, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}


napi_value VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_c(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c", "GetContext env or info is null");
        return nullptr;
    }

    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *options = OH_ArkUI_VisibleAreaEventOptions_Create();
    float *ratiosArray = new float[12];
    ratiosArray[0] = 0.1;
    ratiosArray[1] = 0.2;
    ratiosArray[2] = 0.3;
    ratiosArray[3] = 0.4;
    ratiosArray[4] = 0.5;
    ratiosArray[5] = 0.6;
    int disFlag = 0;
    int r1 = OH_ArkUI_VisibleAreaEventOptions_SetRatios(options, ratiosArray, 12);
    if(r1 == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c","ret ARKUI_ERROR_CODE_NO_ERROR");
    else if(r1 == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c","ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    float *getRatiosArray = new float[12];
    int size = 12;
    int r2 = OH_ArkUI_VisibleAreaEventOptions_GetRatios(options, getRatiosArray, &size);
    if(r2 == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c","get ret ARKUI_ERROR_CODE_NO_ERROR");
    else if(r2 == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c","get ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    else if(r2 == ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR)
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c","get ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    ASSERT_EQ(r2, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
napi_value VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_d(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d", "GetContext env or info is null");
        return nullptr;
    }

    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *options = OH_ArkUI_VisibleAreaEventOptions_Create();
    float *ratiosArray = new float[12];
    ratiosArray[0] = 0.1;
    ratiosArray[1] = 0.2;
    ratiosArray[2] = 0.3;
    ratiosArray[3] = 0.4;
    ratiosArray[4] = 0.5;
    ratiosArray[5] = 0.6;
    int disFlag = 0;
    int r1 = OH_ArkUI_VisibleAreaEventOptions_SetRatios(options, ratiosArray, 12);
    if(r1 == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d","r1 ARKUI_ERROR_CODE_NO_ERROR");
    else if(r1 == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d","r1 ARKUI_ERROR_CODE_PARAM_INVALID ");
    int r2 = OH_ArkUI_VisibleAreaEventOptions_SetExpectedUpdateInterval(options, 520);
    if(r2 == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d","r2 ARKUI_ERROR_CODE_NO_ERROR");
    else if(r2 == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d","r2 ARKUI_ERROR_CODE_PARAM_INVALID ");
    int r3 = OH_ArkUI_VisibleAreaEventOptions_GetExpectedUpdateInterval(options);
    ASSERT_EQ(r3, 520);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d","get Interval success");
    NAPI_END;
}
} // namespace ArkUICapiTest