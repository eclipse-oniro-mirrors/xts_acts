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

#ifndef NDKXCOMPONENT_ATTRIBUTE_H
#define NDKXCOMPONENT_ATTRIBUTE_H

#include "component/XComponent.h"

#define XC ArkUICapiTest::XComponent

namespace NodeAttribute {

static XC ColumnComponent = XC(ARKUI_NODE_COLUMN);
static XC XComponentRect = XC(ARKUI_NODE_XCOMPONENT);
void InitNode();

napi_value CreateAttributeNativeNode(napi_env env, napi_callback_info info);
napi_value CheckNodeTextHalfLeading(napi_env env, napi_callback_info info);
napi_value CheckNodeTextLineCount(napi_env env, napi_callback_info info);
napi_value CheckNodeTextOptimizeTrailingSpace(napi_env env, napi_callback_info info);
napi_value CheckNodeTextLinearGradient(napi_env env, napi_callback_info info);
napi_value CheckNodeTextRadialGradient(napi_env env, napi_callback_info info);
napi_value CheckNodeTextVerticalAlign(napi_env env, napi_callback_info info);
napi_value CheckNodeTextInputHalfLeading(napi_env env, napi_callback_info info);
napi_value CheckNodeTextInputKeyboardAppearance(napi_env env, napi_callback_info info);
napi_value CheckNodeTextInputEnableFillAnimation(napi_env env, napi_callback_info info);
napi_value CheckNodeTextInputLineHeight(napi_env env, napi_callback_info info);
napi_value CheckNodeTextAreaInputFilter(napi_env env, napi_callback_info info);
napi_value CheckNodeTextAreaContentType(napi_env env, napi_callback_info info);
napi_value CheckNodeTextAreaHalfLeading(napi_env env, napi_callback_info info);
napi_value CheckNodeTextAreaKeyboardAppearance(napi_env env, napi_callback_info info);
napi_value CheckNodeTextAreaMaxLines(napi_env env, napi_callback_info info);
napi_value CheckNodeTextAreaLineSpacing(napi_env env, napi_callback_info info);
napi_value CheckNodeTextAreaMinLines(napi_env env, napi_callback_info info);
napi_value CheckNodeTextAreaMaxLinesWithScroll(napi_env env, napi_callback_info info);
napi_value CheckNodeTextAreaLineHeight(napi_env env, napi_callback_info info);
napi_value CheckNodeTextPickSelectedBackgroundStyle(napi_env env, napi_callback_info info);
napi_value CheckNodeBorderWidthPercent(napi_env env, napi_callback_info info);
napi_value CheckNodeUniqueId(napi_env env, napi_callback_info info);
napi_value CheckNodeFocusBox(napi_env env, napi_callback_info info);
napi_value CheckNodeClickDistance(napi_env env, napi_callback_info info);
napi_value CheckNodeTabStop(napi_env env, napi_callback_info info);
napi_value CheckNodeBackgroundImageResizableWithSlice(napi_env env, napi_callback_info info);
napi_value CheckNodeNextFocus(napi_env env, napi_callback_info info);
napi_value CheckNodeVisibleAreaApproximateChangeRatio(napi_env env, napi_callback_info info);
napi_value CheckNodeTranslateWidthPercent(napi_env env, napi_callback_info info);
napi_value CheckNodeRotateAngle(napi_env env, napi_callback_info info);
napi_value CheckNodeImmutableFontWeight(napi_env env, napi_callback_info info);
napi_value CheckNodeImageSpanBaselineOffset(napi_env env, napi_callback_info info);
napi_value CheckNodeImageSyncLoad(napi_env env, napi_callback_info info);
napi_value CheckNodeButtonMinFontScale(napi_env env, napi_callback_info info);
napi_value CheckNodeButtonMaxFontScale(napi_env env, napi_callback_info info);
napi_value CheckNodeXComponentSurfaceSize(napi_env env, napi_callback_info info);
napi_value CheckNodeXComponentSurfaceRect(napi_env env, napi_callback_info info);
napi_value CheckNodeDatePickerCanLoop(napi_env env, napi_callback_info info);
napi_value CheckNodeTimePickerStart(napi_env env, napi_callback_info info);
napi_value CheckNodeTimePickerEnd(napi_env env, napi_callback_info info);
napi_value CheckNodeSliderPrefix(napi_env env, napi_callback_info info);
napi_value CheckNodeSliderSuffix(napi_env env, napi_callback_info info);
napi_value CheckNodeCheckboxGroupSelectedColor(napi_env env, napi_callback_info info);
napi_value CheckNodeCheckboxGroupUnselectedColor(napi_env env, napi_callback_info info);
napi_value CheckNodeCheckboxGroupMark(napi_env env, napi_callback_info info);
napi_value CheckNodeCheckboxGroupShape(napi_env env, napi_callback_info info);
napi_value CheckNodeScrollFling(napi_env env, napi_callback_info info);
napi_value CheckNodeScrollFadingEdge(napi_env env, napi_callback_info info);
napi_value CheckNodeScrollFlingSpeedLimit(napi_env env, napi_callback_info info);
napi_value CheckNodeScrollClipContent(napi_env env, napi_callback_info info);
napi_value CheckNodeScrollBarMargin(napi_env env, napi_callback_info info);
napi_value CheckNodeListStackFromEnd(napi_env env, napi_callback_info info);
napi_value CheckNodeListFocusWrapMode(napi_env env, napi_callback_info info);
napi_value CheckNodeListSyncLoad(napi_env env, napi_callback_info info);
napi_value CheckNodeSwiperIndicatorInteractive(napi_env env, napi_callback_info info);
napi_value CheckNodeSwiperPageFlipMode(napi_env env, napi_callback_info info);
napi_value CheckNodeSwiperAutoFill(napi_env env, napi_callback_info info);
napi_value CheckNodeSwiperMaintainVisibleContentPosition(napi_env env, napi_callback_info info);
napi_value CheckNodeRefreshMaxPullDownDistance(napi_env env, napi_callback_info info);
napi_value CheckNodeWaterFlowLayoutMode(napi_env env, napi_callback_info info);
napi_value CheckNodeWaterFlowSyncLoad(napi_env env, napi_callback_info info);
napi_value CheckNodeRelativeContainerGuideLine(napi_env env, napi_callback_info info);
napi_value CheckNodeRelativeContainerBarrier(napi_env env, napi_callback_info info);
napi_value CheckNodeGridSyncLoad(napi_env env, napi_callback_info info);
napi_value CheckNodeEmbeddedComponentWant(napi_env env, napi_callback_info info);
napi_value CheckNodeFocusMoveForward(napi_env env, napi_callback_info info);
napi_value CheckNodeFocusMoveBackward(napi_env env, napi_callback_info info);
napi_value CheckNodeFocusMoveUp(napi_env env, napi_callback_info info);
napi_value CheckNodeFocusMoveDown(napi_env env, napi_callback_info info);
napi_value CheckNodeFocusMoveLeft(napi_env env, napi_callback_info info);
napi_value CheckNodeFocusMoveRight(napi_env env, napi_callback_info info);
};

#endif //NDKXCOMPONENT_ATTRIBUTE_H
