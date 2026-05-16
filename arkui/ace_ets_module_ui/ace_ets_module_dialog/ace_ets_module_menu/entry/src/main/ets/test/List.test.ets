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
import menu from './MenuTest/menu.test'
import menuTest from './MenuTest/menufirst.test'
import menuSecondTest from './MenuTest/menusecond.test'
import responseTypeJsunit from './MenuTest/responseType.test.ets';
import menuEnabledJsunit from './MenuTest/menuEnabledJsunit.test.ets';
import responseRegionJsunit from './MenuTest/ResponseRegionJsunit.test';
import bindMenuJsunitt from './MenuTest/BindMenuJsunitt.test.ets';
import bindPopupJsunit from './MenuTest/BindPopupJsunit.test.ets';
import menuDividerTest from './MenuTest/menuDivider.test.ets'
import muneRadiusTest from './MenuTest/muneRadiusTest.test.ets'

import MenuApi1 from './Menu/MenuApi1.test';
import menuItemDivider from './Menu/menuItemDivider.test.ets';
import IconApiTest from './MenuTest/MenuApiTest/IconApiTest.test';
import menuItemGroupDivider from './Menu/menuItemGroupDivider.test.ets';
import subMenuExpandingMode from './Menu/subMenuExpandingMode.test.ets';
import SubMenuExpandingModeTest_SIDE from './MenuTest/MenuApiTest/SubMenuExpandingModeTest_SIDE.test';
import SubMenuExpandingModeTest_EMBEDDED from './MenuTest/MenuApiTest/SubMenuExpandingModeTest_EMBEDDED.test';
import menuTransition from './Menu/menuTransition.test';
import subMenuExpandingModeTest_STACK_EXPAND from './MenuTest/MenuApiTest/subMenuExpandingModeTest_STACK_EXPAND.test';
import menuitemOnChangeModifierTest from './MenuTest/menuitemOnChangeModifierTest.test'
import menuFontsizeModifierTest from './MenuTest/menuFontsizeModifierTest.test'
import menuBindMenuModifierTest from './MenuTest/menuBindMenuModifierTest.test'
import blurStyleOptions from './MenuTest/blurStyleOptions.test'
import effectOptions from './MenuTest/effectOptions.test'
import bindContextMenuHapticFeedbackMode from './bindContextMenuTest/bindContextMenuHapticFeedback.test'
import previewBorderRadius from './bindContextMenuTest/previewBorderRadius.test'
import bindMenuHapticFeedbackMode from './bindMenuTest/bindMenuHapticFeedbackMode.test';
import closeMenu from './promptActionTest/closeMenu.test.ets'
import openMenu from './promptActionTest/openMenu.test.ets'
import updateMenu from './promptActionTest/updateMenu.test.ets'
import maskTest from './bindMenuTest/mask.test';
import maskColorTest from './bindMenuTest/maskColor.test';
import maskBackgroundBlurStyleTest from './bindMenuTest/maskBackgroundBlurStyle.test';
import menuSubMenuExpandSymbolTest from './MenuTest/subMenuExpandSymbol.test';
import selectModalModeTest from './MenuTest/selectModalMode.test';
import PreviewScaleModeTest from './MenuTest/PreviewScaleModeTest.test';
import AvailableLayoutAreaTest from './MenuTest/AvailableLayoutAreaTest.test';
import BindMenuWithResponse from './Menu/BindMenuWithResponse.test';

export default function testsuite() {
  bindMenuHapticFeedbackMode();
  blurStyleOptions();
  effectOptions();
  menuTransition()
  menuEnabledJsunit();
  menu()
  menuTest()
  menuSecondTest();
  responseRegionJsunit()
  bindMenuJsunitt()
  bindPopupJsunit();
  menuDividerTest();
  muneRadiusTest();
  MenuApi1();
  IconApiTest();
  menuItemDivider();
  menuItemGroupDivider();
  subMenuExpandingMode();
  SubMenuExpandingModeTest_SIDE();
  SubMenuExpandingModeTest_EMBEDDED();
  subMenuExpandingModeTest_STACK_EXPAND();
  menuitemOnChangeModifierTest();
  menuFontsizeModifierTest();
  menuBindMenuModifierTest();
  bindContextMenuHapticFeedbackMode();
  previewBorderRadius();
  closeMenu();
  openMenu();
  updateMenu();
  selectModalModeTest();
  PreviewScaleModeTest();
  AvailableLayoutAreaTest();
  maskTest();
  maskColorTest();
  maskBackgroundBlurStyleTest();
  BindMenuWithResponse();
}