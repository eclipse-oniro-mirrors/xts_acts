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

#ifndef ACTSACEENGINENATIVEAPI20TEST_XCOMPONENTDRAGANDDROG_H
#define ACTSACEENGINENATIVEAPI20TEST_XCOMPONENTDRAGANDDROG_H

#include "component/XComponent.h"

#define XC ArkUICapiTest::XComponent

namespace XComponentDragAndDrog {

static XC ColumnComponent = XC(ARKUI_NODE_COLUMN);
static XC ImageComponentOne = XC(ARKUI_NODE_IMAGE);
static XC ImageComponentTwo = XC(ARKUI_NODE_IMAGE);
static XC ImageComponentThree = XC(ARKUI_NODE_IMAGE);
static ArkUI_DragResult g_dragResult = ArkUI_DragResult(PARAM_NEGATIVE_2);
static ArkUI_DropOperation g_dropOperation = ArkUI_DropOperation(PARAM_NEGATIVE_2);
static std::unordered_map<ArkUI_PreDragStatus, int32_t> g_preDragStatusMap = {};
static std::unordered_map<ArkUI_DragStatus, int32_t> g_dragStatusMap = {};
static int32_t g_getUdmfData = PARAM_NEGATIVE_2;
static int32_t g_getDataTypesOk = PARAM_NEGATIVE_2;
static int32_t g_getDataTypes = PARAM_NEGATIVE_2;
static int32_t g_getDisplayIdOk = PARAM_NEGATIVE_2;
static int32_t g_getDisplayId = PARAM_NEGATIVE_2;
static int32_t g_getDragSource = PARAM_NEGATIVE_2;
static int32_t g_getStartDataLoading = PARAM_NEGATIVE_2;
static int32_t g_getDisable = PARAM_NEGATIVE_2;
static int32_t g_getDragResult = PARAM_NEGATIVE_2;
static int32_t g_getSetDataLoadParams = PARAM_NEGATIVE_2;
static int32_t g_getSetData = PARAM_NEGATIVE_2;
static int32_t g_getDropOperation = PARAM_NEGATIVE_2;
static int32_t g_setDropOperation = PARAM_NEGATIVE_2;
static int32_t g_setDragResult = PARAM_NEGATIVE_2;
static int32_t g_getDataTypeCount = PARAM_NEGATIVE_2;
static int32_t g_keys = PARAM_NEGATIVE_2;
static int32_t g_isRemote = PARAM_NEGATIVE_2;
static float DragTouchPointDisplayX = PARAM_NEGATIVE_0_POINT_1;
static float DragTouchPointDisplayY = PARAM_NEGATIVE_0_POINT_1;
static ArkUI_DragAction* DragAction = nullptr;
static char eventTypeArrayBuffer[PARAM_128][PARAM_128];
static char** eventTypeArrayOk = (char**)eventTypeArrayBuffer;
void InitNode();
void SetOnDrog(XC* Component);
void SetOnDragEnd(XC* Component);
void SetOnDragStart(XC* Component);
void GetOnPreDrag(XC* Component);
void DragActionCreate(XC* Component);
ArkUI_DragStatus CheckDragStatus(int32_t DragStatus);

napi_value CreateDragAndDrogNativeNode(napi_env env, napi_callback_info info);
napi_value GetDragResult(napi_env env, napi_callback_info info);
napi_value GetDropOperationResult(napi_env env, napi_callback_info info);
napi_value GetOnPreDragResult(napi_env env, napi_callback_info info);
napi_value DragPreviewOptionSetScaleMode(napi_env env, napi_callback_info info);
napi_value DragAndDropInfoGetDragStatusUnknown(napi_env env, napi_callback_info info);
napi_value DragEventDisableDefaultDropAnimationOk(napi_env env, napi_callback_info info);
napi_value DragEventDisableDefaultDropAnimationParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventSetSuggestedDropOperationOk(napi_env env, napi_callback_info info);
napi_value DragEventSetSuggestedDropOperationParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventSetDragResultOk(napi_env env, napi_callback_info info);
napi_value DragEventSetDragResultParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventSetDataOk(napi_env env, napi_callback_info info);
napi_value DragEventSetDataParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventSetDataLoadParamsOk(napi_env env, napi_callback_info info);
napi_value DragEventSetDataLoadParamsParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventGetUdmfDataOk(napi_env env, napi_callback_info info);
napi_value DragEventGetUdmfDataParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventGetDataTypeCountOk(napi_env env, napi_callback_info info);
napi_value DragEventGetDataTypeCountParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventGetDataTypesOk(napi_env env, napi_callback_info info);
napi_value DragEventGetDataTypesParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventGetDataTypesBufferSizeError(napi_env env, napi_callback_info info);
napi_value DragEventGetDragResultOk(napi_env env, napi_callback_info info);
napi_value DragEventGetDragResultParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventGetDropOperationOk(napi_env env, napi_callback_info info);
napi_value DragEventGetDropOperationParamInvalid(napi_env env, napi_callback_info info);
napi_value GetDragTouchPointDisplayX(napi_env env, napi_callback_info info);
napi_value GetDragTouchPointDisplayY(napi_env env, napi_callback_info info);
napi_value DragEventGetModifierKeyStatesOk(napi_env env, napi_callback_info info);
napi_value DragEventGetModifierKeyStatesParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventGetDisplayIdOk(napi_env env, napi_callback_info info);
napi_value DragEventGetDisplayIdParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventStartDataLoadingOk(napi_env env, napi_callback_info info);
napi_value DragEventStartDataLoadingParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventCancelDataLoadingOk(napi_env env, napi_callback_info info);
napi_value DragEventCancelDataLoadingParamInvalid(napi_env env, napi_callback_info info);
napi_value DisableDropDataPrefetchOnNodeOk(napi_env env, napi_callback_info info);
napi_value DisableDropDataPrefetchOnNodeParamInvalid(napi_env env, napi_callback_info info);
napi_value DragActionSetDataLoadParamsOk(napi_env env, napi_callback_info info);
napi_value DragActionSetDataLoadParamsParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventGetDragSourceOk(napi_env env, napi_callback_info info);
napi_value DragEventGetDragSourceParamInvalid(napi_env env, napi_callback_info info);
napi_value DragEventIsRemoteOk(napi_env env, napi_callback_info info);
napi_value DragEventIsRemoteParamInvalid(napi_env env, napi_callback_info info);
napi_value EnableDropDisallowedBadgeOk(napi_env env, napi_callback_info info);
napi_value EnableDropDisallowedBadgeParamInvalid(napi_env env, napi_callback_info info);
napi_value DragAndDropInfoGetDragStatusStarted(napi_env env, napi_callback_info info);
napi_value DragAndDropInfoGetDragStatusEnded(napi_env env, napi_callback_info info);

};

#endif //ACTSACEENGINENATIVEAPI20TEST_XCOMPONENTDRAGANDDROG_H
