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


import alertDialogTest from './dialog/alertDialogTest.test';
import confirmDialogTest from './dialog/confirmDialogTest.test';
import customContentDialogTest from './dialog/customContentDialogTest.test';
import selectDialogTest from './dialog/selectDialogTest.test';
import tipsDialogTest from './dialog/tipsDialogTest.test';
import loadingDialogTest from './dialog/loadingDialogTest.test';

export default function testsuite() {
  alertDialogTest();
  confirmDialogTest();
  customContentDialogTest();
  selectDialogTest();
  tipsDialogTest();
  loadingDialogTest();
}