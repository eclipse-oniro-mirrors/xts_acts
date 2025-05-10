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

import overlayManager from './UIContextTest/overlayManager.test'
import uiOpenCustomDialogMode from './UIContextTest/uiOpenCustomDialogMode.test'
import openCustomDialogWithCtrMode from './UIContextTest/openCustomDialogWithCtrMode.test'
import actionSheetMode from './actionSheet/actionSheetMode.test'
import showActionSheetMode from './actionSheet/showActionSheetMode.test'
import showAlertDialogMode from './dialog/showAlertDialogMode.test'
import showDialogMode from './dialog/showDialogMode.test'
import openCustomDialogMode from './prompt/openCustomDialogMode.test'
import showActionMenuMode from './prompt/showActionMenuMode.test'
import presentCustomDialogMode from './UIContextTest/presentCustomDialogMode.test'
import bindSheetRadius from './bindSheet/bindSheetRadius.test'
import buttonTypeTest from './buttonType/buttonTypeTest.test';
import customDialogKeyboardAvoidDistance from './customDialog/customDialogKeyboardAvoidDistance.test';
import promptActionKeyboardAvoidDistance from './prompt/promptActionKeyboardAvoidDistance.test';


export default function testsuite() {
  overlayManager()
  actionSheetMode()
  showActionSheetMode()
  showAlertDialogMode()
  showDialogMode()
  uiOpenCustomDialogMode()
  openCustomDialogMode()
  showActionMenuMode()
  openCustomDialogWithCtrMode()
  presentCustomDialogMode()
  bindSheetRadius()
  buttonTypeTest()
  customDialogKeyboardAvoidDistance()
  promptActionKeyboardAvoidDistance()
}
