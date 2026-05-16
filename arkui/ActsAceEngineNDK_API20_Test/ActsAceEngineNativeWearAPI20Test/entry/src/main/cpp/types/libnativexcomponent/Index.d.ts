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

export const CreateDragAndDrogNativeNode: (Node: Content) => void;
export const GetDragResult: () => number;
export const GetDropOperationResult: () => number;
export const GetOnPreDragResult: (Enum: number) => number;
export const DragPreviewOptionSetScaleMode: () => number;
export const DragAndDropInfoGetDragStatusUnknown: () => number;
export const DragEventDisableDefaultDropAnimationOk: () => number;
export const DragEventDisableDefaultDropAnimationParamInvalid: () => number;
export const DragEventSetSuggestedDropOperationOk: () => number;
export const DragEventSetSuggestedDropOperationParamInvalid: () => number;
export const DragEventSetDragResultOk: () => number;
export const DragEventSetDragResultParamInvalid: () => number;
export const DragEventSetDataOk: () => number;
export const DragEventSetDataParamInvalid: () => number;
export const DragEventSetDataLoadParamsOk: () => number;
export const DragEventSetDataLoadParamsParamInvalid: () => number;
export const DragEventGetUdmfDataOk: () => number;
export const DragEventGetUdmfDataParamInvalid: () => number;
export const DragEventGetDataTypeCountOk: () => number;
export const DragEventGetDataTypeCountParamInvalid: () => number;
export const DragEventGetDataTypesOk: () => number;
export const DragEventGetDataTypesParamInvalid: () => number;
export const DragEventGetDataTypesBufferSizeError: () => number;
export const DragEventGetDragResultOk: () => number;
export const DragEventGetDragResultParamInvalid: () => number;
export const DragEventGetDropOperationOk: () => number;
export const DragEventGetDropOperationParamInvalid: () => number;
export const GetDragTouchPointDisplayX: () => number;
export const GetDragTouchPointDisplayY: () => number;
export const DragEventGetModifierKeyStatesOk: () => number;
export const DragEventGetModifierKeyStatesParamInvalid: () => number;
export const DragEventGetDisplayIdOk: () => number;
export const DragEventGetDisplayIdParamInvalid: () => number;
export const DragEventStartDataLoadingOk: () => number;
export const DragEventStartDataLoadingParamInvalid: () => number;
export const DragEventCancelDataLoadingOk: (context: UIContext) => number;
export const DragEventCancelDataLoadingParamInvalid: () => number;
export const DisableDropDataPrefetchOnNodeOk: () => number;
export const DisableDropDataPrefetchOnNodeParamInvalid: () => number;
export const DragActionSetDataLoadParamsOk: () => number;
export const DragActionSetDataLoadParamsParamInvalid: () => number;
export const DragEventGetDragSourceOk: () => number;
export const DragEventGetDragSourceParamInvalid: () => number;
export const DragEventIsRemoteOk: () => number;
export const DragEventIsRemoteParamInvalid: () => number;
export const EnableDropDisallowedBadgeOk: () => number;
export const EnableDropDisallowedBadgeParamInvalid: () => number;
export const DragAndDropInfoGetDragStatusStarted: () => number;
export const DragAndDropInfoGetDragStatusEnded: () => number;

export const ShowDialog: () => void;
export const CloseDialog: () => void;
export const CustomDialogGetStateParamInvalid: () => number;
export const CustomDialogGetStateOk: () => number;
export const CustomDialogGetState: (index: number) => number;