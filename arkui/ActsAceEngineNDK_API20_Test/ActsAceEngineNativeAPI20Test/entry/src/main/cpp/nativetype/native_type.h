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

#ifndef NATIVE_TYPE_TEST_ARKUI_TEST_H
#define NATIVE_TYPE_TEST_ARKUI_TEST_H
#include <arkui/native_animate.h>
#include <cstdint>
#include <napi/native_api.h>
napi_value CheckRotationOptionX(napi_env env, napi_callback_info info);
napi_value CheckRotationOptionY(napi_env env, napi_callback_info info);
napi_value CheckRotationOptionZ(napi_env env, napi_callback_info info);
napi_value CheckRotationOptionAngle(napi_env env, napi_callback_info info);
napi_value CheckRotationOptionCenterX(napi_env env, napi_callback_info info);
napi_value CheckRotationOptionCenterY(napi_env env, napi_callback_info info);
napi_value CheckRotationOptionCenterZ(napi_env env, napi_callback_info info);
napi_value CheckRotationOptionPerspective(napi_env env, napi_callback_info info);
napi_value CheckScaleOptionsX(napi_env env, napi_callback_info info);
napi_value CheckScaleOptionsY(napi_env env, napi_callback_info info);
napi_value CheckScaleOptionsZ(napi_env env, napi_callback_info info);
napi_value CheckScaleOptionsCenterX(napi_env env, napi_callback_info info);
napi_value CheckScaleOptionsCenterY(napi_env env, napi_callback_info info);
napi_value CheckTranslationOptionsX(napi_env env, napi_callback_info info);
napi_value CheckTranslationOptionsY(napi_env env, napi_callback_info info);
napi_value CheckTranslationOptionsZ(napi_env env, napi_callback_info info);
napi_value CreateNavDestinationNode(napi_env env, napi_callback_info info);
napi_value GetNavDestinationState(napi_env env, napi_callback_info info);
napi_value GetNavDestinationStateResult(napi_env env, napi_callback_info info);
napi_value CreateRouterPageNode(napi_env env, napi_callback_info info);
napi_value GetRouterPageNodeState(napi_env env, napi_callback_info info);
napi_value GetRouterPageNodeStateResult(napi_env env, napi_callback_info info);
napi_value SetSwiperIndicatorMaxDisplayCount(napi_env env, napi_callback_info info);
napi_value SetCustomSpanMetricsWidthError(napi_env env, napi_callback_info info);
napi_value SetCustomSpanMetricsWidthSuccess(napi_env env, napi_callback_info info);
napi_value SetCustomSpanMetricsHeightSuccess(napi_env env, napi_callback_info info);
napi_value SetCustomSpanMetricsHeightError(napi_env env, napi_callback_info info);
napi_value ArkUISnapshotOptionsSetScaleSuccess(napi_env env, napi_callback_info info);
napi_value ArkUISnapshotOptionsSetScaleError(napi_env env, napi_callback_info info);
napi_value UnmarshallStyledStringDescriptor(napi_env env, napi_callback_info info);
napi_value MarshallStyledStringDescriptorError(napi_env env, napi_callback_info info);
napi_value GetCheckedState(napi_env env, napi_callback_info info);
napi_value GetUnCheckedState(napi_env env, napi_callback_info info);
napi_value ErrorCodeEventNotSupported(napi_env env, napi_callback_info info);
napi_value ErrorCodeNodeNotSupported(napi_env env, napi_callback_info info);
napi_value ErrorCodeNodeOutOfRange(napi_env env, napi_callback_info info);
napi_value ErrorCodeNodeIndexInvalid(napi_env env, napi_callback_info info);
napi_value ErrorCodeFocusNonExistent(napi_env env, napi_callback_info info);
napi_value ErrorCodeFocusNonFocusable(napi_env env, napi_callback_info info);
napi_value ErrorCodeFocusNonAncestor(napi_env env, napi_callback_info info);
napi_value ErrorCodeNonScrollableContainer(napi_env env, napi_callback_info info);
napi_value CreateGestureNode1(napi_env env, napi_callback_info info);
napi_value ErrorCodePostClonedComponentStatusAbnormal(napi_env env, napi_callback_info info);
napi_value CreateNavigation(napi_env env, napi_callback_info info);
napi_value ErrorCodeInternalError(napi_env env, napi_callback_info info);
napi_value ErrorCodeNodeEventParamInvalid(napi_env env, napi_callback_info info);
napi_value ErrorCodeGetInfoFailed(napi_env env, napi_callback_info info);
napi_value CreateGestureNode2(napi_env env, napi_callback_info info);
napi_value CreateNode(napi_env env, napi_callback_info info);
napi_value ErrorCodeRecognizerTypeNotSupported(napi_env env, napi_callback_info info);
napi_value ErrorCodeParamInvalid(napi_env env, napi_callback_info info);
napi_value ErrorCodeInvalidStyledString(napi_env env, napi_callback_info info);
napi_value ErrorCodeNotClonedPointerEvent(napi_env env, napi_callback_info info);
napi_value ErrorCodeBufferSizeNotEnough(napi_env env, napi_callback_info info);
napi_value CreateUIInputEventNode(napi_env env, napi_callback_info info);
napi_value ErrorCodePostCloned(napi_env env, napi_callback_info info);

#endif // NATIVE_TYPE_TEST_ARKUI_TEST_H
