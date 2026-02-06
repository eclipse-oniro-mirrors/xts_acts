/**
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
import menuSubMenuExpandSymbolTest from './MenuTest/subMenuExpandSymbol.test';
import customDialogGetstateTest from './customdialogTest/customdialog.test';
import ratingStarStyle from './RatingTest/ratingStarStyle.test';
import SheetTypeTest from './SheetTypeTest/sheetTypeSide.test';
import closeToastTest from './promptActionTest/closeToastTest.test';
import dismissSheetActionTest from './SheetTypeTest/dismissSheetAction.test';
import sheetTypeContentCoverTest from './SheetTypeTest/sheetTypeContentCover.test';
import ModalTransitionTest from './SheetTypeTest/ModalTransition.test';
import bindContentCoverTest from './BindContentCoverTest/bindContentCover.test';
import selectModalModeTest from './MenuTest/selectModalMode.test';
import PreviewScaleModeTest from './MenuTest/PreviewScaleModeTest.test';
import AvailableLayoutAreaTest from './MenuTest/AvailableLayoutAreaTest.test';
import enableFloatingDragBarTest from './SheetTypeTest/enableFloatingDragBar.test';
import maskTest from './bindMenuTest/mask.test';
import maskColorTest from './bindMenuTest/maskColor.test';
import maskBackgroundBlurStyleTest from './bindMenuTest/maskBackgroundBlurStyle.test';
import SliderOptionValue from './Slider/slider.test';

export default function testsuite() {
  menuSubMenuExpandSymbolTest();
  customDialogGetstateTest();
  ratingStarStyle();
  SheetTypeTest();
  closeToastTest();
  dismissSheetActionTest();
  sheetTypeContentCoverTest();
  ModalTransitionTest();
  bindContentCoverTest()
  selectModalModeTest();
  PreviewScaleModeTest();
  AvailableLayoutAreaTest();
  enableFloatingDragBarTest();
  maskTest();
  maskColorTest();
  maskBackgroundBlurStyleTest();
  SliderOptionValue();
}