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

import AlertDialogAJsunit from './Dialog/AlertDialogAJsunit.test';
import showAlertDialogMode from './Dialog/showAlertDialogMode.test'
import AlertDialogFalse from './alertDialogTest/AlertDialogFalse.test';
import AlertDialogTrue from './alertDialogTest/AlertDialogTrue.test';
import stageAlertDialog from './alertDialogTest/stageAlertDialog.test';
import alertDialogCenterStartJsunit from './alertDialogTest/alertDialog.test';
import AlertDialogJsunit from './alertDialogTest/AlertDialogJsunit.test';
import DialogJsunit from './alertDialogTest/DialogJsunit.test';
import AlertDialog1 from './alertDialogTest/AlertDialog1.test';
import AlertDialog2 from './alertDialogTest/AlertDialog2.test';
import AlertDialog3 from './alertDialogTest/AlertDialog3.test';
import AlertDialog4 from './alertDialogTest/AlertDialog4.test';
import AlertDialogLifeTest from './dialogLifeTest/AlertDialogLife.test'
import alertDialogBackgroundEffectTest from './alertDialogTest/alertDialogBackgroundEffect.test'
import alertDialogBlurStyleOptionsTest from './alertDialogTest/alertDialogBlurStyleOptions.test'

export default function testsuite() {
  AlertDialogAJsunit();
  AlertDialog1();
  AlertDialog2();
  AlertDialog3();
  AlertDialog4();
  AlertDialogFalse();
  AlertDialogTrue();
  stageAlertDialog();
  alertDialogCenterStartJsunit();
  AlertDialogJsunit();
  DialogJsunit();
  showAlertDialogMode();
  AlertDialogLifeTest();
  alertDialogBackgroundEffectTest();
  alertDialogBlurStyleOptionsTest();
  
}