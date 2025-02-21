/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import stageFontTest from './stageFont.test';
import stageRouterTest from './stageRouter.test';
import animateToTest from './animateto.test';
import stageActionSheet from './stageActionSheet.test';
import stageAlertDialog from './stageAlertDialog.test';
import stageDatePickerDialog from './stageDatePickerDialog.test';
import stageMediaquery from './stageMediaquery.test';
import stagePrompt from './stagePrompt.test';
import stageTextPickerDialog from './stageTextPickerDialog.test';
import stageTimePickerDialog from './stageTimePickerDialog.test';
import bindPopupOffsetTest from './bindPopupOffset.test';
import animationCurveTest from './animationCurve.test';
import hoverTest from './hover.test';
import textObscuredTest from './textObscuredTest.test';
import imageObscuredTest from './imageObscuredTest.test';
import stageAnimatorTest from './stageAnimator.test';
import textSpanFontTest from './textSpanFont.test';
import gridScrollbarUpdateTest from './gridScrollbarUpdate.test';
import sidebarTypeTest from './sidebarType.test';
import noBarrierComponentsTest from './noBarrierComponents.test';
import noBarriersGroupTest from './noBarriersGroup.test';
import assemblyCallbackTest from './assemblyCallback.test';
import ActsGridTest from './Grid.test';
import ActsListTest from './Listitem.test';
import ActsSwiperTest from './Swiper.test';
import ActsRichEditorTest from './richeditor.test';
import navigationTypeTest from './navigationType.test';
import ActsgetcomponentaddTest from './getcomponentadd.test';
import ActsgetcomponentTest from './getcomponent.test';

export default function testsuite() {
  stageFontTest()
  stageRouterTest()
  animateToTest()
  stageActionSheet()
  stageAlertDialog()
  stageDatePickerDialog()
  stageMediaquery()
  stagePrompt()
  stageTextPickerDialog()
  stageTimePickerDialog()
  bindPopupOffsetTest()
  animationCurveTest()
  hoverTest()
  textObscuredTest()
  imageObscuredTest()
  stageAnimatorTest()
  textSpanFontTest()
  gridScrollbarUpdateTest()
  sidebarTypeTest()
  noBarrierComponentsTest()
  noBarriersGroupTest()
  assemblyCallbackTest()
  ActsGridTest()
  ActsListTest()
  ActsSwiperTest()
  ActsRichEditorTest()
  navigationTypeTest()
  ActsgetcomponentaddTest()
  ActsgetcomponentTest()
}