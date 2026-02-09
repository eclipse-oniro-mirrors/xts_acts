/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "dragdrog/XComponentDragAndDrog.h"

namespace XComponentDragAndDrog {

napi_value CreateDragAndDrogNativeNode(napi_env env, napi_callback_info info)
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
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    auto nodeContentEvent = [](ArkUI_NodeContentEvent *event) {
        ArkUI_NodeContentHandle handle = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(event);
        if (OH_ArkUI_NodeContentEvent_GetEventType(event) == NODE_CONTENT_EVENT_ON_ATTACH_TO_WINDOW) {
            InitNode();
            OH_ArkUI_NodeContent_AddNode(handle, ColumnComponent.GetComponent());
        }
    };
    OH_ArkUI_NodeContent_RegisterCallback(nodeContentHandle, nodeContentEvent);
    return nullptr;
}

void SetDragAction(XC* Component)
{
    SetOnDrog(Component);
    auto NodeComponent = Component->GetComponent();
    auto NodeApi = Component->GetNodeApi();
    NodeApi->registerNodeEvent(NodeComponent, NODE_ON_TOUCH_INTERCEPT, PARAM_911, nullptr);
    auto call = [](ArkUI_NodeEvent *event) {
                    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
                    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
                    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "[dragAndDropInfo]",
                                 "targetId=%{public}d,eventType=%{public}d,", targetId, eventType);
                    if (eventType == NODE_ON_TOUCH_INTERCEPT) {
                        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "[dragAndDropInfo]",
                                     "ARKUI_NODE_BUTTON touch intercept");
                        DragActionCreate(&ImageComponentThree);
                    }
                };
    NodeApi->addNodeEventReceiver(NodeComponent, call);
}

void InitNode()
{
    ColumnComponent.SetPercentWidth(PARAM_1_POINT_0);
    ColumnComponent.SetPercentHeight(PARAM_1_POINT_0);
    ImageComponentOne.SetId("ImageOne");
    ImageComponentOne.SetPercentWidth(PARAM_0_POINT_5);
    ImageComponentOne.SetPercentHeight(PARAM_0_POINT_3);
    ImageComponentOne.SetBackgroundColor(0xFF5481FF);
    ImageComponentOne.SetBorderRadius(PARAM_15_POINT_0, PARAM_15_POINT_0, PARAM_15_POINT_0, PARAM_15_POINT_0);
    ArkUI_AttributeItem Item = { .string = "/resources/rawfile/tardis.png" };
    ImageComponentOne.setAttribute(NODE_IMAGE_SRC, &Item);
    OH_ArkUI_SetNodeDraggable(ImageComponentOne.GetComponent(), true);
    SetOnDragEnd(&ImageComponentOne);
    GetOnPreDrag(&ImageComponentOne);
    SetOnDragStart(&ImageComponentOne);
    ImageComponentTwo.SetId("ImageTwo");
    ImageComponentTwo.SetPercentWidth(PARAM_0_POINT_5);
    ImageComponentTwo.SetPercentHeight(PARAM_0_POINT_3);
    ImageComponentTwo.SetBackgroundColor(0xFF182125);
    ImageComponentTwo.SetBorderRadius(PARAM_15_POINT_0, PARAM_15_POINT_0, PARAM_15_POINT_0, PARAM_15_POINT_0);
    SetOnDrog(&ImageComponentTwo);
    ImageComponentThree.SetId("ImageThree");
    ImageComponentThree.SetPercentWidth(PARAM_0_POINT_5);
    ImageComponentThree.SetPercentHeight(PARAM_0_POINT_3);
    ImageComponentThree.SetBackgroundColor(0xFF182125);
    ImageComponentThree.SetBorderRadius(PARAM_15_POINT_0, PARAM_15_POINT_0, PARAM_15_POINT_0, PARAM_15_POINT_0);
    SetDragAction(&ImageComponentThree);
    OH_ArkUI_SetNodeDraggable(ImageComponentThree.GetComponent(), true);
    std::shared_ptr<ArkUICapiTest::Component> child = std::make_shared<ArkUICapiTest::XComponent>(ImageComponentTwo);
    ColumnComponent.AddChild(child);
    child = std::make_shared<ArkUICapiTest::XComponent>(ImageComponentOne);
    ColumnComponent.AddChild(child);
    child = std::make_shared<ArkUICapiTest::XComponent>(ImageComponentThree);
    ColumnComponent.AddChild(child);
}

void SetOnDrog(XC* Component)
{
    auto NodeComponent = Component->GetComponent();
    auto NodeApi = Component->GetNodeApi();
    NodeApi->registerNodeEvent(NodeComponent, NODE_ON_DROP, PARAM_911, nullptr);
    auto onDrog = [](ArkUI_NodeEvent* event) {
        if (OH_ArkUI_NodeEvent_GetEventType(event) != NODE_ON_DROP) {
            return;
        }
        ArkUI_DragEvent* DragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
        g_dragResult = ARKUI_DRAG_RESULT_CANCELED;
        g_setDragResult = OH_ArkUI_DragEvent_SetDragResult(DragEvent, g_dragResult) ==
                          ARKUI_ERROR_CODE_NO_ERROR;
        char bundleName[PARAM_128];
        g_getDragSource = OH_ArkUI_DragEvent_GetDragSource(DragEvent, bundleName, PARAM_128) ==
                          ARKUI_ERROR_CODE_NO_ERROR;
        int32_t CountOk = PARAM_NEGATIVE_2;
        int32_t maxStrLenOk = PARAM_128;
        g_setDropOperation = OH_ArkUI_DragEvent_SetSuggestedDropOperation(DragEvent, ARKUI_DROP_OPERATION_MOVE) ==
                             ARKUI_ERROR_CODE_NO_ERROR;
        ArkUI_DropOperation DragResult = ArkUI_DropOperation(PARAM_NEGATIVE_2);
        g_getDropOperation = OH_ArkUI_DragEvent_GetDropOperation(DragEvent, &DragResult) == ARKUI_ERROR_CODE_NO_ERROR;
        if (OH_ArkUI_DragEvent_GetDropOperation(DragEvent, &g_dropOperation) != ARKUI_ERROR_CODE_NO_ERROR) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "[GetOnDragMove]", "GetDragResult Failed");
            return;
        }
        g_getDataTypeCount = OH_ArkUI_DragEvent_GetDataTypeCount(DragEvent, &CountOk) == ARKUI_ERROR_CODE_NO_ERROR;
        g_getDataTypesOk = OH_ArkUI_DragEvent_GetDataTypes(DragEvent, eventTypeArrayOk, CountOk, maxStrLenOk);
        g_getDataTypesOk = g_getDataTypesOk == ARKUI_ERROR_CODE_NO_ERROR || CountOk >= PARAM_0;
        OH_UdmfData* UdmfData = OH_UdmfData_Create();
        g_getSetData = OH_ArkUI_DragEvent_SetData(DragEvent, UdmfData) == ARKUI_ERROR_CODE_NO_ERROR;
        OH_UdmfData_Destroy(UdmfData);
        int32_t Count = PARAM_NEGATIVE_2;
        int32_t maxStrLen = PARAM_NEGATIVE_2;
        char* eventTypeArray[] = {};
        g_getDataTypes = OH_ArkUI_DragEvent_GetDataTypes(DragEvent, eventTypeArray, Count, maxStrLen);
        char key[] = "key_string1";
        OH_UdmfGetDataParams* options = OH_UdmfGetDataParams_Create();
        unsigned int keyLen = 513;
        g_getStartDataLoading = OH_ArkUI_DragEvent_StartDataLoading(DragEvent, options, key, keyLen) ==
                                ARKUI_ERROR_CODE_NO_ERROR || options;
    };
    NodeApi->addNodeEventReceiver(NodeComponent, onDrog);
    return;
}

void SetOnDragEnd(XC* Component)
{
    auto NodeComponent = Component->GetComponent();
    auto NodeApi = Component->GetNodeApi();
    int32_t Result = NodeApi->registerNodeEvent(NodeComponent, NODE_ON_DRAG_END, PARAM_911, nullptr);
    if (Result != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "[SetOnDragEnd]", "Failed Error Code: %{public}d", Result);
        return;
    }
    auto onDrag = [](ArkUI_NodeEvent* event) {
        if (OH_ArkUI_NodeEvent_GetEventType(event) != NODE_ON_DRAG_END) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "[SetOnDragEnd]", "Not OnDragEnd");
            return;
        }
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "[SetOnDragEnd]", "OnDragEnd");
        ArkUI_DragEvent* DragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
        g_getDragResult = OH_ArkUI_DragEvent_GetDragResult(DragEvent, &g_dragResult) == ARKUI_ERROR_CODE_NO_ERROR;
        OH_UdmfDataLoadParams* UdmfData = OH_UdmfDataLoadParams_Create();
        g_getSetDataLoadParams = OH_ArkUI_DragEvent_SetDataLoadParams(DragEvent, UdmfData) == ARKUI_ERROR_CODE_NO_ERROR;
        OH_UdmfDataLoadParams_Destroy(UdmfData);
        OH_UdmfData* UdmfDataB = OH_UdmfData_Create();
        g_getUdmfData = OH_ArkUI_DragEvent_GetUdmfData(DragEvent, UdmfDataB) == ARKUI_ERROR_CODE_NO_ERROR;
        OH_UdmfData_Destroy(UdmfDataB);
        bool flag = true;
        OH_ArkUI_DragEvent_IsRemote(DragEvent, &flag) == ARKUI_ERROR_CODE_NO_ERROR;
        if (!g_getDragResult) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "[SetOnDragEnd]", "GetDragResult Failed");
            return;
        }
    };
    NodeApi->addNodeEventReceiver(NodeComponent, onDrag);
    return;
}

void SetOnDragStart(XC* Component)
{
    auto NodeComponent = Component->GetComponent();
    auto NodeApi = Component->GetNodeApi();
    int32_t Result = NodeApi->registerNodeEvent(NodeComponent, NODE_ON_DRAG_START, PARAM_911, nullptr);
    if (Result != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "[SetOnDragStart]", "Failed Error Code: %{public}d", Result);
        return;
    }
    auto onDrag = [](ArkUI_NodeEvent* event) {
        if (OH_ArkUI_NodeEvent_GetEventType(event) != NODE_ON_DRAG_START) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "[SetOnDragStart]", "Not OnDragEnd");
            return;
        }
        ArkUI_DragEvent* DragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
        uint64_t keys = 0;
        g_keys = OH_ArkUI_DragEvent_GetModifierKeyStates(DragEvent, &keys) == ARKUI_ERROR_CODE_NO_ERROR;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "[SetOnDragStart]", "OnDragEnd");
    };
    NodeApi->addNodeEventReceiver(NodeComponent, onDrag);
    return;
}

void GetOnPreDrag(XC* Component)
{
    auto NodeComponent = Component->GetComponent();
    auto NodeApi = Component->GetNodeApi();
    int32_t Result = NodeApi->registerNodeEvent(NodeComponent, NODE_ON_PRE_DRAG, PARAM_911, nullptr);
    if (Result != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "[GetOnPreDrag]", "Failed Error Code: %{public}d", Result);
        return;
    }
    auto onDrag = [](ArkUI_NodeEvent* event) {
        if (OH_ArkUI_NodeEvent_GetEventType(event) != NODE_ON_PRE_DRAG) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "[GetOnPreDrag]", "Not OnPreDrag");
            return;
        }
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "[GetOnPreDrag]", "OnPreDrag");
        ArkUI_PreDragStatus Result = OH_ArkUI_NodeEvent_GetPreDragStatus(event);
        ArkUI_DragEvent* DragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
        DragTouchPointDisplayX = OH_ArkUI_DragEvent_GetTouchPointXToGlobalDisplay(DragEvent);
        DragTouchPointDisplayY = OH_ArkUI_DragEvent_GetTouchPointYToGlobalDisplay(DragEvent);
        int32_t did = PARAM_0;
        g_getDisplayIdOk = OH_ArkUI_DragEvent_GetDisplayId(DragEvent, &did) == ARKUI_ERROR_CODE_NO_ERROR;
        g_getDisplayId = OH_ArkUI_DragEvent_GetDisplayId(nullptr, &did) == ARKUI_ERROR_CODE_PARAM_INVALID;
        g_getDisable = OH_ArkUI_DragEvent_DisableDefaultDropAnimation(DragEvent, true) == ARKUI_ERROR_CODE_NO_ERROR;
        if (g_preDragStatusMap.count(Result) == 0) {
            g_preDragStatusMap.insert({ Result, Result });
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "[GetOnPreDrag]", "GetOnPreDrag %{public}d", Result);
            return;
        }
    };
    NodeApi->addNodeEventReceiver(NodeComponent, onDrag);
    return;
}

void DragActionCreate(XC* Component)
{
    auto NodeComponent = Component->GetComponent();
    DragAction = OH_ArkUI_CreateDragActionWithNode(NodeComponent);
    OH_ArkUI_DragAction_SetPointerId(DragAction, PARAM_0);
    OH_ArkUI_DragAction_SetTouchPointX(DragAction, PARAM_0);
    OH_ArkUI_DragAction_SetTouchPointY(DragAction, PARAM_0);
    auto listener = [](ArkUI_DragAndDropInfo* dragAndDropInfo, void* userData) {
        int32_t result = OH_ArkUI_DragAndDropInfo_GetDragStatus(dragAndDropInfo);
        g_dragStatusMap.insert({ CheckDragStatus(PARAM_0), PARAM_0 });
        g_dragStatusMap.insert({ CheckDragStatus(PARAM_1), PARAM_1 });
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "[dragAndDropInfo]", "GetOnPreDrag%{public}d", result);
    };
    OH_ArkUI_DragAction_RegisterStatusListener(DragAction, nullptr, listener);
    int32_t returnValue = OH_ArkUI_StartDrag(DragAction);
    OH_ArkUI_DragAction_Dispose(DragAction);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "[dragAndDropInfo]",
                 "OH_ArkUI_StartDrag returnValue = %{public}d", returnValue);
}

napi_value GetDragResult(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_dragResult, &retValue);
    g_dragResult = ArkUI_DragResult(PARAM_NEGATIVE_2);
    return retValue;
}

napi_value GetDropOperationResult(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_dropOperation, &retValue);
    g_dropOperation = ArkUI_DropOperation(PARAM_NEGATIVE_2);
    return retValue;
}

ArkUI_PreDragStatus CheckPreDragStatus(int32_t Enum)
{
    ArkUI_PreDragStatus Temp = ArkUI_PreDragStatus(PARAM_NEGATIVE_2);
    switch (Enum) {
        case ARKUI_PRE_DRAG_STATUS_UNKNOWN:
        case ARKUI_PRE_DRAG_STATUS_ACTION_DETECTING:
        case ARKUI_PRE_DRAG_STATUS_READY_TO_TRIGGER_DRAG:
        case ARKUI_PRE_DRAG_STATUS_PREVIEW_LIFT_STARTED:
        case ARKUI_PRE_DRAG_STATUS_PREVIEW_LIFT_FINISHED:
        case ARKUI_PRE_DRAG_STATUS_PREVIEW_LANDING_STARTED:
        case ARKUI_PRE_DRAG_STATUS_PREVIEW_LANDING_FINISHED:
        case ARKUI_PRE_DRAG_STATUS_CANCELED_BEFORE_DRAG:
            Temp = ArkUI_PreDragStatus(Enum);
        default:
            break;
    }
    return Temp;
}

napi_value GetOnPreDragResult(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
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
    int32_t Enum = PARAM_0;
    napi_get_value_int32(env, args[PARAM_0], &Enum);
    if (g_preDragStatusMap.count(CheckPreDragStatus(Enum)) != 0 ||
        Enum == PARAM_NEGATIVE_1 || Enum == PARAM_6) {
        napi_create_int32(env, Enum, &retValue);
    } else {
        napi_create_int32(env, PARAM_0, &retValue);
    }
    g_dropOperation = ArkUI_DropOperation(PARAM_NEGATIVE_2);
    g_preDragStatusMap.clear();
    return retValue;
}

napi_value DragPreviewOptionSetScaleMode(napi_env env, napi_callback_info info)
{
    auto object = OH_ArkUI_CreateDragPreviewOption();
    int32_t result = OH_ArkUI_DragPreviewOption_SetScaleMode(object, ARKUI_DRAG_PREVIEW_SCALE_AUTO);
    OH_ArkUI_DragPreviewOption_Dispose(object);
    napi_value retValue = 0;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

ArkUI_DragStatus CheckDragStatus(int32_t DragStatus)
{
    ArkUI_DragStatus Temp = ArkUI_DragStatus(PARAM_NEGATIVE_2);
    switch (DragStatus) {
        case ARKUI_DRAG_STATUS_UNKNOWN:
        case ARKUI_DRAG_STATUS_STARTED:
        case ARKUI_DRAG_STATUS_ENDED:
            Temp = ArkUI_DragStatus(DragStatus);
        default:
            break;
    }
    return Temp;
}

napi_value DragAndDropInfoGetDragStatusUnknown(napi_env env, napi_callback_info info)
{
    ArkUI_DragAndDropInfo* DragAndDropInfo = nullptr;
    int32_t result = OH_ArkUI_DragAndDropInfo_GetDragStatus(DragAndDropInfo);
    napi_value retValue = 0;
    napi_create_int32(env, CheckDragStatus(result), &retValue);
    return retValue;
}

napi_value DragAndDropInfoGetDragStatusStarted(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_dragStatusMap.count(ARKUI_DRAG_STATUS_STARTED)) {
        napi_create_int32(env, ARKUI_DRAG_STATUS_STARTED, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    g_dragStatusMap.clear();
    return retValue;
}

napi_value DragAndDropInfoGetDragStatusEnded(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_dragStatusMap.count(ARKUI_DRAG_STATUS_ENDED)) {
        napi_create_int32(env, ARKUI_DRAG_STATUS_ENDED, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    g_dragStatusMap.clear();
    return retValue;
}

napi_value DragEventDisableDefaultDropAnimationOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_getDisable) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventDisableDefaultDropAnimationParamInvalid(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_DisableDefaultDropAnimation(nullptr, true) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventSetSuggestedDropOperationOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_setDropOperation) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventSetSuggestedDropOperationParamInvalid(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_SetSuggestedDropOperation(nullptr, ARKUI_DROP_OPERATION_COPY) ==
        ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventSetDragResultOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_setDragResult) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventSetDragResultParamInvalid(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_SetDragResult(nullptr, ARKUI_DRAG_RESULT_SUCCESSFUL) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventSetDataOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_getSetData) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventSetDataParamInvalid(napi_env env, napi_callback_info info)
{
    OH_UdmfData* UdmfData = OH_UdmfData_Create();
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_SetData(nullptr, UdmfData) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    OH_UdmfData_Destroy(UdmfData);
    return retValue;
}

napi_value DragEventSetDataLoadParamsOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_getSetDataLoadParams) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventSetDataLoadParamsParamInvalid(napi_env env, napi_callback_info info)
{
    OH_UdmfDataLoadParams* UdmfData = OH_UdmfDataLoadParams_Create();
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_SetDataLoadParams(nullptr, UdmfData) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    OH_UdmfDataLoadParams_Destroy(UdmfData);
    return retValue;
}

napi_value DragEventGetUdmfDataOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_getUdmfData) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, g_getUdmfData, &retValue);
    }
    g_getUdmfData = PARAM_NEGATIVE_2;
    return retValue;
}

napi_value DragEventGetUdmfDataParamInvalid(napi_env env, napi_callback_info info)
{
    OH_UdmfData* UdmfData = OH_UdmfData_Create();
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_GetUdmfData(nullptr, UdmfData) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    OH_UdmfData_Destroy(UdmfData);
    return retValue;
}

napi_value DragEventGetDataTypeCountOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_getDataTypeCount) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventGetDataTypeCountParamInvalid(napi_env env, napi_callback_info info)
{
    int32_t Count = 0;
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_GetDataTypeCount(nullptr, &Count) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventGetDataTypesOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_getDataTypesOk) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventGetDataTypesParamInvalid(napi_env env, napi_callback_info info)
{
    int32_t Count = 0;
    int32_t maxStrLen = PARAM_128;
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_GetDataTypes(nullptr, nullptr, Count, maxStrLen) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventGetDataTypesBufferSizeError(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_getDataTypes == ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR) {
        napi_create_int32(env, ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR, &retValue);
    } else {
        napi_create_int32(env, g_getDataTypes, &retValue);
    }
    return retValue;
}

napi_value DragEventGetDragResultOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_getDragResult) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventGetDragResultParamInvalid(napi_env env, napi_callback_info info)
{
    ArkUI_DragResult DragResult = ArkUI_DragResult(PARAM_NEGATIVE_2);
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_GetDragResult(nullptr, &DragResult) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventGetDropOperationOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_getDropOperation) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventGetDropOperationParamInvalid(napi_env env, napi_callback_info info)
{
    ArkUI_DropOperation DragResult = ArkUI_DropOperation(PARAM_NEGATIVE_2);
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_GetDropOperation(nullptr, &DragResult) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value GetDragTouchPointDisplayX(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_double(env, DragTouchPointDisplayX, &retValue);
    DragTouchPointDisplayX = PARAM_NEGATIVE_0_POINT_1;
    return retValue;
}

napi_value GetDragTouchPointDisplayY(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_double(env, DragTouchPointDisplayY, &retValue);
    DragTouchPointDisplayX = PARAM_NEGATIVE_0_POINT_1;
    return retValue;
}

napi_value DragEventGetModifierKeyStatesOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_keys) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventGetModifierKeyStatesParamInvalid(napi_env env, napi_callback_info info)
{
    uint64_t keys = 0;
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_GetModifierKeyStates(nullptr, &keys) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventGetDisplayIdOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_getDisplayIdOk) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventGetDisplayIdParamInvalid(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_getDisplayId) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventStartDataLoadingOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_getStartDataLoading) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventStartDataLoadingParamInvalid(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_StartDataLoading(nullptr, nullptr, nullptr, 0) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventCancelDataLoadingOk(napi_env env, napi_callback_info info)
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
    ArkUI_ContextHandle UIContextHandle = nullptr;
    OH_ArkUI_GetContextFromNapiValue(env, args[0], &UIContextHandle);
    char key[] = "key_string1";
    napi_value retValue = 0;
    if (OH_ArkUI_CancelDataLoading(UIContextHandle, key) == ARKUI_ERROR_CODE_NO_ERROR || UIContextHandle) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventCancelDataLoadingParamInvalid(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (OH_ArkUI_CancelDataLoading(nullptr, nullptr) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DisableDropDataPrefetchOnNodeOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (OH_ArkUI_DisableDropDataPrefetchOnNode(ImageComponentOne.GetComponent(), true) == ARKUI_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DisableDropDataPrefetchOnNodeParamInvalid(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (OH_ArkUI_DisableDropDataPrefetchOnNode(nullptr, true) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragActionSetDataLoadParamsOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    ArkUI_DragAction* DragAction = OH_ArkUI_CreateDragActionWithNode(ImageComponentOne.GetComponent());
    if (OH_ArkUI_DragAction_SetDataLoadParams(DragAction, OH_UdmfDataLoadParams_Create()) ==
        ARKUI_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragActionSetDataLoadParamsParamInvalid(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (OH_ArkUI_DragAction_SetDataLoadParams(nullptr, nullptr) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventGetDragSourceOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_getDragSource) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventGetDragSourceParamInvalid(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_GetDragSource(nullptr, nullptr, PARAM_128) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventIsRemoteOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (g_isRemote) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value DragEventIsRemoteParamInvalid(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (OH_ArkUI_DragEvent_IsRemote(nullptr, nullptr) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

napi_value EnableDropDisallowedBadgeOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    bool flag = true;
    ArkUI_ContextHandle ContextHandle = static_cast<ArkUI_ContextHandle>(malloc(sizeof(ArkUI_Context*)));
    if (OH_ArkUI_EnableDropDisallowedBadge(ContextHandle, &flag) == ARKUI_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, ARKUI_ERROR_CODE_NO_ERROR, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    free(ContextHandle);
    return retValue;
}

napi_value EnableDropDisallowedBadgeParamInvalid(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    if (OH_ArkUI_EnableDropDisallowedBadge(nullptr, true) == ARKUI_ERROR_CODE_PARAM_INVALID) {
        napi_create_int32(env, ARKUI_ERROR_CODE_PARAM_INVALID, &retValue);
    } else {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
    }
    return retValue;
}

}
