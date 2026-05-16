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


import ActionSheet from './actionSheetTest/ActionSheet.test';
import ActionSheetFalse from './actionSheetTest/ActionSheetFalse.test';
import ActionSheetJsunit from './actionSheetTest/ActionSheetJsunit.test';
import ActionSheetTrue from './actionSheetTest/ActionSheetTrue.test';
import stageActionSheet from './actionSheetTest/stageActionSheet.test';

import alertDialogCenterStartJsunit from './alertDialogTest/alertDialog.test';
import AlertDialog from './alertDialogTest/AlertDialog1.test';
import AlertDialogFalse from './alertDialogTest/AlertDialogFalse.test';
import AlertDialogJsunit from './alertDialogTest/AlertDialogJsunit.test';
import AlertDialogTrue from './alertDialogTest/AlertDialogTrue.test';
import DialogJsunit from './alertDialogTest/DialogJsunit.test';
import stageAlertDialog from './alertDialogTest/stageAlertDialog.test';

import SelectStatusTest from './checkbox/SelectStatus.test';

import CustomDialog from './customDialogTest/CustomDialog.test';
import customDialogControllerJsunit from './customDialogTest/CustomDialogControllerJsunit.test';
import CustomDialogFalse from './customDialogTest/CustomDialogFalse.test';
import CustomDialogJsunit from './customDialogTest/CustomDialogJsunit.test';
import CustomDialogRouter from './customDialogTest/CustomDialogRouter.test';
import CustomDialogTrue from './customDialogTest/CustomDialogTrue.test';

import bindMenuTesttt from './MenuTest/BindMenuJsunitt.test';
import bindPopupTest from './MenuTest/BindPopupJsunit.test';
import menu from './MenuTest/menu.test';
import menuDividerTest from './MenuTest/menuDivider.test';
import menuEnabledJsunit from './MenuTest/menuEnabledJsunit.test';
import menuTest from './MenuTest/menufirst.test';
import menuSecondTest from './MenuTest/menusecond.test';
import ResponseRegionJsunit from './MenuTest/ResponseRegionJsunit.test';
import responseTypeJsunit from './MenuTest/responseType.test';

import bindPopupOffsetTest from './promptActionTest/bindPopupOffset.test';
import CustomDialogMaskTest from './promptActionTest/CustomDialogMask.test';
import DialogTest from './promptActionTest/Dialog.test';
import ohosPromptJsunit from './promptActionTest/OhosPromptJsunit.test';
import openCustomDialog from './promptActionTest/openCustomDialog.test';

import openCustomDialogFalse from './promptActionTest/openCustomDialogFalse.test';
import openCustomDialogNew from './promptActionTest/openCustomDialogNew.test';
import openCustomDialogTrue from './promptActionTest/openCustomDialogTrue.test';
import promptShowDialogJsunit from './promptActionTest/prompt.test';
import promptTest from './promptActionTest/promptTest.test';

import showActionMenu from './promptActionTest/showActionMenu.test';
import showActionMenuFalse from './promptActionTest/showActionMenuFalse.test';
import showActionMenuTrue from './promptActionTest/showActionMenuTrue.test';
import showDialog from './promptActionTest/showDialog.test';
import showDialogFalse from './promptActionTest/showDialogFalse.test';

import ShowDialogJsunit from './promptActionTest/ShowDialogJsunit.test';
import showDialogTrue from './promptActionTest/showDialogTrue.test';
import showToast from './promptActionTest/showToast.test';
import stagePromptTest from './promptActionTest/stagePrompt.test';
import ToastShowMode from './promptActionTest/ToastShowMode.test';

export default function testsuite() {
  openCustomDialog()
  CustomDialogMaskTest()
  DialogTest()
  ohosPromptJsunit()
  bindPopupOffsetTest()
  openCustomDialogFalse()
  openCustomDialogNew()
  openCustomDialogTrue()
  promptShowDialogJsunit()
  promptTest()
  showActionMenu()
  showActionMenuFalse()
  showActionMenuTrue()
  showDialog()
  showDialogFalse()
  ShowDialogJsunit()
  showDialogTrue()
  showToast();
  stagePromptTest()
  ToastShowMode()

  ActionSheet()
  ActionSheetFalse()
  ActionSheetJsunit()
  ActionSheetTrue()
  stageActionSheet()
  AlertDialog()
  AlertDialogFalse()
  AlertDialogJsunit()
  AlertDialogTrue()
  DialogJsunit()
  stageAlertDialog()

  SelectStatusTest()

  CustomDialog()
  customDialogControllerJsunit()
  CustomDialogFalse()
  CustomDialogJsunit()
  CustomDialogRouter()
  CustomDialogTrue()

  bindMenuTesttt()
  bindPopupTest()
  menu()
  menuDividerTest()
  menuEnabledJsunit()
  menuTest()
  menuSecondTest()
  ResponseRegionJsunit()
  responseTypeJsunit()
  alertDialogCenterStartJsunit()
}
