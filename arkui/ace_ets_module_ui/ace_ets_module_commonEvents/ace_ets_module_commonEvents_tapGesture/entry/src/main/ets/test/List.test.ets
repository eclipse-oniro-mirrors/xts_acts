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

import GestureTagJsSuit from './TapGestureTest/GestureTagJsSuit.test';
import TapGesture1 from './TapGestureTest/TapGesture1.test';
import TapGesture2 from './TapGestureTest/TapGesture2.test';
import TapGesture3 from './TapGestureTest/TapGesture3.test';
import tapGestureTest from './TapGestureTest/TapGesture.test.ets';
import priorityGestureJsunit from './TapGestureTest/PriorityGestureJsunit.test.ets';
import parallelGestureJsunit from './TapGestureTest/ParallelGestureJsunit.test.ets';
import TapGestureBasicClickTest from './TapGesture/TapGestureBasicClickTest.test';
import TapGestureBasicDoubleClickTest from './TapGesture/TapGestureBasicDoubleClickTest.test';
import TapGestureBasicClickMouseTest from './TapGesture/TapGestureBasicClickMouseTest.test';
import TapGestureBasicDoubleClickMouseTest from './TapGesture/TapGestureBasicDoubleClickMouseTest.test';
import TapGestureTemplateTest from './TapGesture/TapGestureTemplateTest.test';
import tapLocationTest from './TapGestureTest/tapLocation.test';
import tapLocationTest2 from './TapGestureTest/tapLocation2.test';

export default function testsuite() {
  TapGesture1();
  TapGesture2();
  TapGesture3();
  tapGestureTest();
  priorityGestureJsunit();
  parallelGestureJsunit();
  GestureTagJsSuit();
  TapGestureBasicClickTest();
  TapGestureBasicDoubleClickTest();
  TapGestureBasicClickMouseTest();
  TapGestureBasicDoubleClickMouseTest();
  TapGestureTemplateTest();
  tapLocationTest();
  tapLocationTest2();
}