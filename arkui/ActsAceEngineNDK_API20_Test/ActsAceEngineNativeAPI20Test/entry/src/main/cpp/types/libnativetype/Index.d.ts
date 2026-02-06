/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { Content } from '@kit.ArkUI';

export const CheckRotationOptionX: () => number;

export const CheckRotationOptionY: () => number;

export const CheckRotationOptionZ: () => number;

export const CheckRotationOptionAngle: () => number;

export const CheckRotationOptionCenterX: () => number;

export const CheckRotationOptionCenterY: () => number;

export const CheckRotationOptionCenterZ: () => number;

export const CheckRotationOptionPerspective: () => number;

export const CheckScaleOptionsX: () => number;

export const CheckScaleOptionsY: () => number;

export const CheckScaleOptionsZ: () => number;

export const CheckScaleOptionsCenterX: () => number;

export const CheckScaleOptionsCenterY: () => number;

export const CheckTranslationOptionsX: () => number;

export const CheckTranslationOptionsY: () => number;

export const CheckTranslationOptionsZ: () => number;

export const CreateNavDestinationNode: (Node: Content) => void;

export const GetNavDestinationState: () => void;

export const GetNavDestinationStateResult: (index: number) => number;

export const CreateRouterPageNode: (Node: Content) => void;

export const GetRouterPageNodeState: () => void;

export const GetRouterPageNodeStateResult: (index: number) => number;

export const SetSwiperIndicatorMaxDisplayCount: (count: number) => number;

export const SetCustomSpanMetricsWidthSuccess: (width?) => number;

export const SetCustomSpanMetricsWidthError: (width?) => number;

export const SetCustomSpanMetricsHeightSuccess: (width?) => number;

export const SetCustomSpanMetricsHeightError: (width?) => number;

export const ArkUISnapshotOptionsSetScaleSuccess: (scale?) => number;

export const ArkUISnapshotOptionsSetScaleError: (scale?) => number;

export const UnmarshallStyledStringDescriptor: (buffer?, bufferSize?) => number;

export const MarshallStyledStringDescriptorError: (buffer?, bufferSize?, resultSize?) => number;

export const GetCheckedState: () => number;

export const GetUnCheckedState: () => number;

export const ErrorCodeEventNotSupported: () => number;

export const ErrorCodeNodeNotSupported: () => number;

export const ErrorCodeNodeOutOfRange: () => number;

export const ErrorCodeNodeParamInvalid: () => number;

export const ErrorCodeNodeIndexInvalid: () => number;

export const ErrorCodeFocusNonExistent: () => number;

export const ErrorCodeFocusNonFocusable: () => number;

export const ErrorCodeFocusNonAncestor: () => number;

export const ErrorCodeNonScrollableContainer: () => number;

export const CreateGestureNode1: (Node: Content) => number;

export const ErrorCodePostClonedComponentStatusAbnormal: () => number;

export const ErrorCodeInternalError: () => number;

export const ErrorCodeNodeEventParamInvalid: () => number;

export const ErrorCodeGetInfoFailed: () => number;

export const CreateNavigation: (Node: Content) => void;

export const CreateGestureNode2: (Node: Content) => void;

export const CreateUIInputEventNode: (Node: Content) => void;

export const CreateNode: (Node: Content) => void;

export const ErrorCodeRecognizerTypeNotSupported: () => number;

export const ErrorCodeParamInvalid: () => number;

export const ErrorCodeInvalidStyledString: () => number;

export const ErrorCodeNotClonedPointerEvent: () => number;

export const ErrorCodeBufferSizeNotEnough: () => number;

export const ErrorCodePostCloned: () => number;
