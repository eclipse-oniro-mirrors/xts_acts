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

import UIContextTestCase from './UIContext/UIContextTestCase.test'
import UIContextComponentSnapshot from './UIContext/UIContextComponentSnapshot.test'
import ComponentSnapshotSync from './componentSnapshot/componentSnapshotSync.test'
import UIContextApi1 from './UIContext/UIContextApi1.test'

export default function testsuite() {
  UIContextTestCase(); //SDK11.25 pass 2
  UIContextComponentSnapshot(); //SDK 12.25 pass 4
  ComponentSnapshotSync();//SDK 12.25 pass 5
  UIContextApi1();//SDK 12.25 pass 1
}