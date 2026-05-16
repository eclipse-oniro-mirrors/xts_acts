/*
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
import windowTitleBarTest from './WindowTitleBar.test';
import windowModalTest from './WindowModal.test';
import windowManageTest from './WindowManage.test';
import windowAutoSaveTest from './WindowAutoSave.test';
import windowZindexTest from './WindowZindex.test';
import extensionWindowPropertiesTest from './ExtensionWindowProperties.test';
import windowFocusTest from './WindowFocus.test';
import windowPCTest from './WindowPC.test';
import windowRotationTest from './WindowRotation.test';
import windowControlsTest from './WindowControls.test';

export default function testsuite() {
  windowFocusTest();
  windowAutoSaveTest();
  windowTitleBarTest();
  windowZindexTest();
  windowManageTest();
  windowModalTest();
  windowPCTest();
  windowControlsTest();
  windowRotationTest();
  extensionWindowPropertiesTest();
}