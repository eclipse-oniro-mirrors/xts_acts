'use static';
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

import BindPopupAvoidTargetTest from './popupTest/bindPopupAvoidTargetTest.test'
import CustomDialogGetStateTest from './customDialogTest/customDialogGetState.test'
import OpenCustomDialogWithControllerGetStateTest from './promptActionTest/openCustomDialogWithControllerGetState.test'
import OpenPopupAvoidTargetTest from './promptActionTest/openPopupAvoidTargetTest.test'
import PresentCustomDialogGetStateTest from './promptActionTest/presentCustomDialogGetState.test'
import RatingStarStyleOptionsTest from './ratingTest/ratingStarStyleOptionsTest.test'
import SelectModifierTest from './selectTest/selectModifierTest.test'
import SelectOptionSymbolIconTest from './selectTest/selectOptionSymbolIconTest.test'
import SelectShowDefaultSelectedIconTest from './selectTest/selectShowDefaultSelectedIconTest.test'
import SelectShowInSubWindowTest from './selectTest/selectShowInSubWindowTest.test'
import ShowActionMenuLifeTest from './promptActionTest/showActionMenuLifeTest.test'
import sliderBlockColorTest from './sliderTest/sliderBlockColorTest.test'
import sliderTest from './sliderTest/sliderTest.test'

export default function testsuite() {
  BindPopupAvoidTargetTest()
  CustomDialogGetStateTest()
  OpenCustomDialogWithControllerGetStateTest()
  OpenPopupAvoidTargetTest()
  PresentCustomDialogGetStateTest()
  ShowActionMenuLifeTest()
  RatingStarStyleOptionsTest()
  SelectModifierTest()
  SelectOptionSymbolIconTest()
  SelectShowDefaultSelectedIconTest()
  SelectShowInSubWindowTest()
  sliderBlockColorTest()
  sliderTest()
}