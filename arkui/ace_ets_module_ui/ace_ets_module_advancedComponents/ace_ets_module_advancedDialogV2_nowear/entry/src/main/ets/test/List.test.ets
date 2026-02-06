/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import tipsDialogTest from './dialogV2/tipsDialogTest.test';
import selectDialogTest from './dialogV2/selectDialogTest.test';
import confirmDialogTest from './dialogV2/confirmDialogTest.test';
import alertDialogTest from  './dialogV2/alertDialogTest.test';
import loadingDialogTest from './dialogV2/loadingDialogTest.test';
import popoverDialogTest from './dialogV2/popoverDialogTest.test';
import customContentDialogTest from './dialogV2/customContentDialogTest.test';

export default function testsuite() {
  tipsDialogTest();
  selectDialogTest();
  confirmDialogTest();
  alertDialogTest();
  loadingDialogTest();
  popoverDialogTest();
  customContentDialogTest();
}