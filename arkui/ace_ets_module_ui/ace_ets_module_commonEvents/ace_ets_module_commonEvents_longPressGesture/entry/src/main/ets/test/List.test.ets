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

import LongPressGesture1 from './LongPressGestureTest/LongPressGesture1.test'
import LongPressGesture2 from './LongPressGestureTest/LongPressGesture2.test'
import LongPressGesture3 from './LongPressGestureTest/LongPressGesture3.test'
import longPressGestureJsUnit from './LongPressGestureTest/LongPressGesture.test.ets';
import LongPressGestureLongClickTest from './LongPressGesture/LongPressGestureLongClickTest.test';
import LongPressGestureLongClickMouseTest from './LongPressGesture/LongPressGestureLongClickMouseTest.test';
import LongPressGestureTemplateTest from './LongPressGesture/LongPressGestureTemplateTest.test';
import AllowableMovementTest from "./LongPressGesture/allowableMovement.test";

export default function testsuite() {
  LongPressGesture1()
  LongPressGesture2()
  LongPressGesture3()
  longPressGestureJsUnit();
  LongPressGestureLongClickTest();
  LongPressGestureLongClickMouseTest();
  LongPressGestureTemplateTest();
  AllowableMovementTest();
}