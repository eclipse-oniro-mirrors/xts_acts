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

import ActionsheetDialogAJsunit from './Dialog/ActionsheetDialogJsunit.test.ets';
import ActionSheet from './actionSheetTest/ActionSheet.test'
import ActionSheetFalse from './actionSheetTest/ActionSheetFalse.test'
import ActionSheetTrue from './actionSheetTest/ActionSheetTrue.test'
import stageActionSheet from './actionSheetTest/stageActionSheet.test'
import ActionSheetJsunit from './actionSheetTest/ActionSheetJsunit.test.ets';
import ActionSheet1 from './actionSheetTest/ActionSheet1.test.ets';
import ActionSheet2 from './actionSheetTest/ActionSheet2.test.ets';
import ActionSheet3 from './actionSheetTest/ActionSheet3.test.ets';
import actionSheetMode from './actionSheet/actionSheetMode.test'
import showActionSheetMode from './actionSheet/showActionSheetMode.test'
import ActionSheetLifeTest from './dialogLifeTest/ActionSheetLife.test'

export default function testsuite() {
  ActionsheetDialogAJsunit();
  ActionSheet();
  ActionSheetFalse();
  ActionSheetTrue();
  stageActionSheet();
  ActionSheetJsunit();
  ActionSheet1();
  ActionSheet2();
  ActionSheet3();
  actionSheetMode();
  showActionSheetMode();
  ActionSheetLifeTest();
























	
}