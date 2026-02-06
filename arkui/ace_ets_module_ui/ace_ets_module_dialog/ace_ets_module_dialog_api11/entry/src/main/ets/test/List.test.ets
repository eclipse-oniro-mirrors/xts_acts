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
import CustomDialogMaskTest from './promptActionTest/CustomDialogMask.test'
import menu from './MenuTest/menu.test'
import menuTest from './MenuTest/menufirst.test'
import menuSecondTest from './MenuTest/menusecond.test'
import ToastShowMode from './promptActionTest/ToastShowMode.test';
import promptTest from './promptActionTest/promptTest.test';
import DialogTest from './promptActionTest/Dialog.test';
import panelJsunit from './Panel/PanelJsunit.test';
import panelClose from './Panel/panelClose'
import ActionSheet from './actionSheetTest/ActionSheet.test'
import ActionSheetFalse from './actionSheetTest/ActionSheetFalse.test'
import ActionSheetTrue from './actionSheetTest/ActionSheetTrue.test'
import CustomDialog from './customDialogTest/CustomDialog.test'
import CustomDialogFalse from './customDialogTest/CustomDialogFalse.test'
import CustomDialogTrue from './customDialogTest/CustomDialogTrue.test'
import openCustomDialog from './promptActionTest/openCustomDialog.test'
import openCustomDialogFalse from './promptActionTest/openCustomDialogFalse.test'
import openCustomDialogNew from './promptActionTest/openCustomDialogNew.test'
import openCustomDialogTrue from './promptActionTest/openCustomDialogTrue.test'
import showActionMenu from './promptActionTest/showActionMenu.test'
import showActionMenuFalse from './promptActionTest/showActionMenuFalse.test'
import showActionMenuTrue from './promptActionTest/showActionMenuTrue.test'
import showDialog from './promptActionTest/showDialog.test'
import showDialogFalse from './promptActionTest/showDialogFalse.test'
import showDialogTrue from './promptActionTest/showDialogTrue.test'
import showToast from './promptActionTest/showToast.test'
import AlertDialog1 from './alertDialogTest/AlertDialog1.test'
import AlertDialogFalse from './alertDialogTest/AlertDialogFalse.test'
import AlertDialogTrue from './alertDialogTest/AlertDialogTrue.test'
import bindPopupOffsetTest from './promptActionTest/bindPopupOffset.test'
import stagePromptTest from './promptActionTest/stagePrompt.test'
import stageActionSheet from './actionSheetTest/stageActionSheet.test'
import stageAlertDialog from './alertDialogTest/stageAlertDialog.test'
import customDialogControllerJsunit from './customDialogTest/CustomDialogControllerJsunit.test';
import ohosPromptJsunit from './promptActionTest/OhosPromptJsunit.test';
import alertDialogCenterStartJsunit from './alertDialogTest/alertDialog.test';
import responseTypeJsunit from './MenuTest/responseType.test.ets';
import promptShowDialogJsunit from './promptActionTest/prompt.test.ets';
import ActionsheetDialogAJsunit from './Dialog/ActionsheetDialogJsunit.test.ets';
import AlertDialogAJsunit from './Dialog/AlertDialogAJsunit.test';
import CustomDialogAJsunit from './Dialog/CustomDialogJsunit.test.ets';
import PopupAJsunit from './Dialog/PopupJsunit.test.ets';
import PromptDialogAJsunit from './Dialog/PromptDialogJsunit.test.ets';
import AlertDialogJsunit from './alertDialogTest/AlertDialogJsunit.test.ets';
import CustomDialogJsunit from './customDialogTest/CustomDialogJsunit.test.ets';
import ShowDialogJsunit from './promptActionTest/ShowDialogJsunit.test.ets';
import DialogJsunit from './alertDialogTest/DialogJsunit.test.ets';
import PanelUIJsunit from './Panel/PanelUIJsunit.test.ets';
import ActionSheetJsunit from './actionSheetTest/ActionSheetJsunit.test.ets';
import menuEnabledJsunit from './MenuTest/menuEnabledJsunit.test.ets';
import responseRegionJsunit from './MenuTest/ResponseRegionJsunit.test';
import bindMenuJsunitt from './MenuTest/BindMenuJsunitt.test.ets';
import bindPopupJsunit from './MenuTest/BindPopupJsunit.test.ets';
import CustomDialogRouter from './customDialogTest/CustomDialogRouter.test'
import menuDividerTest from './MenuTest/menuDivider.test.ets'
import muneRadiusTest from './MenuTest/muneRadiusTest.test.ets'

import SelectStatusTest from './checkbox/SelectStatus.test'

export default function testsuite() {
  responseRegionJsunit();
  menuEnabledJsunit();
  ActionSheetTrue()
  CustomDialogTrue();
  openCustomDialogTrue();
  showActionMenuTrue();
  showDialogTrue();
  AlertDialogTrue()
  bindPopupOffsetTest();
  stagePromptTest();
  stageActionSheet();
  stageAlertDialog();
  CustomDialogMaskTest()
  menu()
  menuTest()
  menuSecondTest();
  ToastShowMode()
  promptTest()
  DialogTest();
  panelJsunit();
  panelClose()
  ActionSheet();
  ActionSheetFalse();
  CustomDialog();
  CustomDialogFalse();
  openCustomDialog();
  openCustomDialogFalse();
  openCustomDialogNew();
  showActionMenu();
  showActionMenuFalse();
  showDialog();
  showDialogFalse();
  showToast();
  AlertDialog1();
  AlertDialogFalse();
  customDialogControllerJsunit()
  ohosPromptJsunit()
  alertDialogCenterStartJsunit();
  responseTypeJsunit()
  promptShowDialogJsunit()
  ActionsheetDialogAJsunit();
  AlertDialogAJsunit();
  CustomDialogAJsunit();
  PopupAJsunit();
  PromptDialogAJsunit();
  AlertDialogJsunit();
  CustomDialogJsunit();
  ShowDialogJsunit();
  DialogJsunit();
  PanelUIJsunit();
  ActionSheetJsunit();
  bindMenuJsunitt()
  bindPopupJsunit();
  CustomDialogRouter();
  menuDividerTest();
  muneRadiusTest()
  SelectStatusTest()
}