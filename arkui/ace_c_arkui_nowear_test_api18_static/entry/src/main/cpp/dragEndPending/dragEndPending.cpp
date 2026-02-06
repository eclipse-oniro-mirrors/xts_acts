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

#include "dragEndPending.h"
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
#include <arkui/native_node.h>

namespace ArkUICapiTest {

ani_int DragEndPendingTest::DragEndPendingTest_a(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_a", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_DragAndDropInfo *dragAndDropInfo = nullptr;
    ArkUI_DragStatus status = OH_ArkUI_DragAndDropInfo_GetDragStatus(dragAndDropInfo);
    ArkUI_DragEvent *event = OH_ArkUI_DragAndDropInfo_GetDragEvent(dragAndDropInfo);
    int id = 1;
    auto ret = OH_ArkUI_DragEvent_RequestDragEndPending(event, &id);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_a"," ret ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED ");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

typedef int ArkUI_Bool;
typedef int ArkUI_Int32;
typedef unsigned int ArkUI_Uint32;
typedef long long ArkUI_Int64;
typedef float ArkUI_Float32;
typedef double ArkUI_Float64;
typedef const char* ArkUI_CharPtr;
typedef unsigned long long ArkUI_Uint64;

typedef struct ArkUIDragEvent_ {
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
}ArkUIDragEvent_;
ani_int DragEndPendingTest::DragEndPendingTest_a1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_a1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUIDragEvent_ *event = new ArkUIDragEvent_;
    int id = 1;
    auto ret = OH_ArkUI_DragEvent_RequestDragEndPending((ArkUI_DragEvent*)event, &id);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_a1"," ret %{public}d ", ret);
    ASSERT_EQ(ret, 190004); //ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED
    NAPI_END;
}

ani_int DragEndPendingTest::DragEndPendingTest_b(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_DragAndDropInfo *dragAndDropInfo = nullptr;
    ArkUI_DragStatus status = OH_ArkUI_DragAndDropInfo_GetDragStatus(dragAndDropInfo);
    ArkUI_DragEvent *event = OH_ArkUI_DragAndDropInfo_GetDragEvent(dragAndDropInfo);
    int id = 1;
    auto ret = OH_ArkUI_NotifyDragResult(id, ARKUI_DRAG_RESULT_SUCCESSFUL);
    if(ret == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_b","ret ARKUI_ERROR_CODE_NO_ERROR");
    else if(ret == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_b","ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    else if(ret == ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_b"," ret ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED ");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED);
    NAPI_END;
}


ani_int DragEndPendingTest::DragEndPendingTest_c(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_DragAndDropInfo *dragAndDropInfo = nullptr;
    ArkUI_DragStatus status = OH_ArkUI_DragAndDropInfo_GetDragStatus(dragAndDropInfo);
    ArkUI_DragEvent *event = OH_ArkUI_DragAndDropInfo_GetDragEvent(dragAndDropInfo);
    int id = 1;
    auto ret = OH_ArkUI_NotifyDragEndPendingDone(id);
    if(ret == ARKUI_ERROR_CODE_NO_ERROR )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_c","ret ARKUI_ERROR_CODE_NO_ERROR");
    else if(ret == ARKUI_ERROR_CODE_PARAM_INVALID )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_c","ret ARKUI_ERROR_CODE_PARAM_INVALID ");
    else if(ret == ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED )
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DragEndPendingTest_c"," ret ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED ");
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_DRAG_DROP_OPERATION_NOT_ALLOWED);
    NAPI_END;
}
} // namespace ArkUICapiTest
