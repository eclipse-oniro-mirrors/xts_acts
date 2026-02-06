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
#include "ani/ani.h"

#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>

namespace ArkUIAniTest {

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

    return column;
}


ani_int VisibleAreaEventOptionsTest::DragEndPendingTest_001(ani_env* env, ani_object info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_001", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_DragAndDropInfo *dragAndDropInfo = nullptr;
    ArkUI_DragStatus status = OH_ArkUI_DragAndDropInfo_GetDragStatus(dragAndDropInfo);
    ArkUI_DragEvent *event = OH_ArkUI_DragAndDropInfo_GetDragEvent(dragAndDropInfo);
    int id = 1;
 
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

ani_int VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_a(ani_env* env, ani_object info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "[visibleAreaEventOptions]CreateNativeNode");

    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto *options = OH_ArkUI_VisibleAreaEventOptions_Create();
    int creatFlag = 0;
    if(options == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "[visibleAreaEventOptions]options creat failed");
        creatFlag = 1;
    }
    ASSERT_EQ(creatFlag, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "[visibleAreaEventOptions]options creat success");
    OH_ArkUI_VisibleAreaEventOptions_Dispose(options);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_a", "[visibleAreaEventOptions]options Dispose success");
    NAPI_END;
}


ani_int VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_b(ani_env* env, ani_object info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_b", "CreateNativeNode");

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


ani_int VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_c(ani_env* env, ani_object info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_c", "CreateNativeNode");

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
ani_int VisibleAreaEventOptionsTest::VisibleAreaEventOptionsTest_d(ani_env* env, ani_object info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "VisibleAreaEventOptionsTest_d", "CreateNativeNode");

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
} // namespace ArkUIAniTest