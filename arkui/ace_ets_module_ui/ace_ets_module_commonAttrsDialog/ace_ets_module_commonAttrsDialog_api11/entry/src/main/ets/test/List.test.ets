/**
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
import BindMenuTest from './menuControlTest/BindMenu.test'
import customPopup from './popupControlTest/customPopup.test';
import popup from './popupControlTest/popup.test';
import menuBlurStyleJsunit from './menuTest/menuBlurStyleJsunit.test';
import ModalBlurStyle from './menuTest/ModalBlurStyle.test';
import popupArrowJsunit from './popupControlTest/popupArrowJsunit.test';
import ModelSheetTest from './bindSheetTest/ModelSheet.test';
import abilityTest from './popupControlTest/popupfirst.test';
import CustomPopupOptions from './popupControlTest/CustomPopupOptions.test';
import CustomPopupOptionsFalse from './popupControlTest/CustomPopupOptionsFalse.test';
import CustomPopupOptionsTrue from './popupControlTest/CustomPopupOptionsTrue.test';
import PopupOptions from './popupControlTest/PopupOptions.test';
import PopupOptionsFalse from './popupControlTest/PopupOptionsFalse.test';
import PopupOptionsTrue from './popupControlTest/PopupOptionsTrue.test';
import bindContextMenu from './menuControlTest/bindContextMenu.test';
import BindMenu from './menuControlTest/BindMenu1.test';
import aboutToDisappearJsunit from './menuControlTest/AboutToDisappearJsunit.test';

export default function testsuite() {
  BindMenuTest();
  customPopup()
  popup()
  menuBlurStyleJsunit()
  ModalBlurStyle()
  popupArrowJsunit()
  ModelSheetTest()
  abilityTest()

  CustomPopupOptions()
  CustomPopupOptionsFalse()
  CustomPopupOptionsTrue()
  PopupOptions()
  PopupOptionsFalse()
  PopupOptionsTrue()
  bindContextMenu()
  BindMenu()
  aboutToDisappearJsunit();
}