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
import ActionSheet1 from './ActionSheetTest/ActionSheet1.test.ets';
import ActionSheet2 from './ActionSheetTest/ActionSheet2.test.ets';
import ActionSheet3 from './ActionSheetTest/ActionSheet3.test.ets';
import AlertDialog1 from './AlertDialogTest/AlertDialog1.test.ets';
import AlertDialog2 from './AlertDialogTest/AlertDialog2.test.ets';
import AlertDialog3 from './AlertDialogTest/AlertDialog3.test.ets';
import CustomDialog1 from './CustomDialogTest/CustomDialog1.test.ets';
import CustomDialog2 from './CustomDialogTest/CustomDialog2.test.ets';
import CustomDialog3 from './CustomDialogTest/CustomDialog3.test.ets';
import openCustomDialog1 from './openCustomDialogTest/openCustomDialog1.test.ets';
import openCustomDialog2 from './openCustomDialogTest/openCustomDialog2.test.ets';
import openCustomDialog3 from './openCustomDialogTest/openCustomDialog3.test.ets';
import closeCustomDialog from './promptActionTest/closeCustomDialog.test';
import openCustomDialog from './promptActionTest/openCustomDialog.test';
import updateCustomDialog from './promptActionTest/updateCustomDialog.test';
import onHeightDidChange from './onHeightDidChange.test';

import CloseCustomDialogTest from './CustomDialogTest/UIContextTest/CloseCustomDialog.test.ets';
import openCustomDialogTest from './CustomDialogTest/UIContextTest/OpenCustomDialog.test.ets';
import UpdateCustomDialogTest from './CustomDialogTest/UIContextTest/UpdateCustomDialog.test.ets';
import dialogApi from './Dialog/dialogApi.test';
import CustomDialogRouter from './CustomDialogTest/CustomDialogRouter.test.ets';
import MenuApi1 from './Menu/MenuApi1.test';
import menuItemDivider from './Menu/menuItemDivider.test.ets';
import IconApiTest from './MenuTest/MenuApiTest/IconApiTest.test';
import menuItemGroupDivider from './Menu/menuItemGroupDivider.test.ets';
import subMenuExpandingMode from './Menu/subMenuExpandingMode.test.ets';
import SubMenuExpandingModeTest_SIDE from './MenuTest/MenuApiTest/SubMenuExpandingModeTest_SIDE.test';
import SubMenuExpandingModeTest_EMBEDDED from './MenuTest/MenuApiTest/SubMenuExpandingModeTest_EMBEDDED.test';
import closeBindSheetTest from './UIContextTest/closeBindSheetTest.test'
import openBindSheetTest from './UIContextTest/openBindSheetTest.test'
import updateBindSheetTest from './UIContextTest/updateBindSheetTest.test'
import uiCloseCustomDialogTest from './UIContextTest/uiCloseCustomDialogTest.test'
import uiOpenCustomDialogTest from './UIContextTest/uiOpenCustomDialogTest.test'
import uiUpdateCustomDialogTest from './UIContextTest/uiUpdateCustomDialogTest.test'
import subMenuExpandingModeTest_STACK_EXPAND from './MenuTest/MenuApiTest/subMenuExpandingModeTest_STACK_EXPAND.test';
import interstitialDialogActionTest from './Dialog/InterstitialDialogAction.test';
import showToastTest from './promptActionTest/showToast.test';
import BaseDialogTest from './CustomDialogTest/KeyboardAvoidMode/BaseDialogTest.test';
import CustomDialogTest from './CustomDialogTest/KeyboardAvoidMode/CustomDialogTest.test';
import PromptActionTest from './CustomDialogTest/KeyboardAvoidMode/PromptActionTest.test';

import primary from './AlertDialogTest/primary.test';
import buttonMaxFontSize from './button/buttonMaxFontSize.test';
import sheetBorderWidth from './bindSheet/sheetBorderWidth.test';
import CustomDialogBorderColor from './CustomDialogTest/CustomDialogBorderColor.test';
import dialogButtonStyle from './Dialog/dialogButtonStyle.test';
import arrowOffset from './popup/arrowOffset.test';
import showDialogTest from './promptActionTest/showDialogTest.test';
import dialogTransitionTest from './CustomDialogTest/dialogTransitionTest.test';
import menuTransition from './Menu/menuTransition.test';

export default function testsuite() {
  buttonMaxFontSize()
  primary()
  sheetBorderWidth()
  CustomDialogBorderColor()
  dialogButtonStyle()
  arrowOffset()
  showDialogTest()
  dialogTransitionTest()
  menuTransition()
  
  dialogApi();
  ActionSheet1();
  ActionSheet2();
  ActionSheet3();
  AlertDialog1();
  AlertDialog2();
  AlertDialog3();
  CustomDialog1();
  CustomDialog2();
  CustomDialog3();
  openCustomDialog1();
  openCustomDialog2();
  openCustomDialog3();
  onHeightDidChange();
  closeCustomDialog();
  openCustomDialog();
  updateCustomDialog();
  CloseCustomDialogTest();
  openCustomDialogTest();
  UpdateCustomDialogTest();
  CustomDialogRouter();
  MenuApi1();
  IconApiTest();
  menuItemDivider();
  menuItemGroupDivider();
  subMenuExpandingMode();
  SubMenuExpandingModeTest_SIDE();
  SubMenuExpandingModeTest_EMBEDDED();
  closeBindSheetTest();
  openBindSheetTest();
  updateBindSheetTest();
  uiCloseCustomDialogTest();
  uiOpenCustomDialogTest();
  uiUpdateCustomDialogTest();
  subMenuExpandingModeTest_STACK_EXPAND();
  interstitialDialogActionTest();
  showToastTest();
  BaseDialogTest();
  CustomDialogTest();
  PromptActionTest();
}