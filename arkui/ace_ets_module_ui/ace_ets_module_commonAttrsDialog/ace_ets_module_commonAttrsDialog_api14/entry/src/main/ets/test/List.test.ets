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
import followTransformOfTargetPopup from './PopupTest/followTransformOfTargetPopup.test.ets';
import followTransformOfTargetCustomPopup from './PopupTest/followTransformOfTargetCustomPopup.test.ets';
import activeTest from './UIContext/FocusController/activeTest.test.ets'
import bindSheetHoverMode from './bindSheetTest/bindSheetHoverMode.test'
import showToastHoverMode from './promptActionTest/showToastHoverMode.test'
import showDialogHoverMode from './promptActionTest/showDialogHoverMode.test'
import popoverDialogTest from './dialog/popoverDialogTest.test'
import customDialogHoverMode from './CustomDialog/customDialogHoverMode.test'
import alertDialogHoverMode from './AlertDialog/alertDialogHoverMode.test'
import actionSheetHoverMode from './ActionSheet/actionSheetHoverMode.test'
import bindSheetShowClose from './bindSheetTest/bindSheetShowClose.test'
import bindSheetType from './bindSheetTest/bindSheetType.test'

export default function testsuite() {
  followTransformOfTargetPopup();
  followTransformOfTargetCustomPopup()
  activeTest()
  bindSheetHoverMode()
  showToastHoverMode()
  showDialogHoverMode()
  popoverDialogTest()
  customDialogHoverMode()
  alertDialogHoverMode()
  actionSheetHoverMode()
  bindSheetShowClose()
  bindSheetType()
}