/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import animatorOnframeJsunit from './animator.test.ets';
import curvesEaseOutJsunit from './curves.test.ets';
import routerStandardJsunit from './router.test.ets';
import uiAppearanceALWAYS_DARKJsunit from './uiAppearance.test.ets';
import appVersionCodeJsunit from './app.test.ets';
import alertDialogCenterStartJsunit from './alertDialog.test.ets';
import canvasActualBoundingBoxAscentJsunit from './canvas.test.ets';
import checkBoxGroupJsunit from './checkBox.test.ets';
import checkBoxGroupPartJsunit from './checkBoxGroup.test.ets';
import commonColorModeJsunit from './common.test.ets';
import datePickerLunarJsunit from './datePicker.test.ets';
import enumsCancelJsunit from './enums.test.ets';
import gestureParallelJsunit from './gesture.test.ets';
import listtestIdleJsunit from './listtest.test.ets';
import list_item_groupJsunit from './list_item_group.test.ets'
import loadingProgressCircularJsunit from './loadingProgress.test.ets';
import progressScaleCountJsunit from './progress.test.ets';
import radioGroupJsunit from './radio.test.ets';
import refreshDragJsunit from './refresh.test.ets';
import remoteWindowJsunit from './remoteWindow.test.ets'
import sidebarIconsJsunit from './sidebar.test.ets';
import sliderMovingJsunit from './slider.test.ets';
import stateManagementDARKJsunit from './stateManagement.test.ets';
import stepperItemDisabledJsunit from './stepperItem.test.ets';
import swiperMaskJsunit from './swiper.test.ets';
import text_inputPhoneNumberJsunit from './text_input.test.ets';
import unitsModuleNameJsunit from './units.test.ets';
import webEditTextJsunit from './web.test.ets';
import hoverEffectJsunit from './hoverEffect.test.ets';
import responseTypeJsunit from './responseType.test.ets';
import copyOptionJsunit from './copyOption.test.ets';
import hitTestModeJsunit from './hitTestMode.test.ets';
import colorEnumJsunit from './color.test.ets';

export default function testsuite() {
  animatorOnframeJsunit()
  routerStandardJsunit()
  appVersionCodeJsunit()
  alertDialogCenterStartJsunit()
  canvasActualBoundingBoxAscentJsunit()
  checkBoxGroupJsunit()
  checkBoxGroupPartJsunit()
  commonColorModeJsunit()
  datePickerLunarJsunit()
  gestureParallelJsunit()
  listtestIdleJsunit()
  loadingProgressCircularJsunit()
  progressScaleCountJsunit()
  radioGroupJsunit()
  remoteWindowJsunit()
  sidebarIconsJsunit()
  sliderMovingJsunit()
  stateManagementDARKJsunit()
  stepperItemDisabledJsunit()
  swiperMaskJsunit()
  unitsModuleNameJsunit()
  webEditTextJsunit()
  hoverEffectJsunit()
  responseTypeJsunit()
  copyOptionJsunit()
  hitTestModeJsunit()
  colorEnumJsunit()
}