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

import touchAbleJsunit from './TouchAbleJsunit.test';
import sourceTypeJsunit from './SourceTypeJsunit.test';
import OnTouch1 from './onTouchTest/OnTouch1.test'
import OnTouch2 from './onTouchTest/OnTouch2.test'
import OnTouch3 from './onTouchTest/OnTouch3.test'
import touchJsunit from './onTouchTest/TouchJsunit.test';
import GetChangedPointerId from './GetChangedPointerId/GetChangedPointerId.test';
import RollAngle from './RollAngle/RollAngle.test';
import BlockDescendantsTest from './HitTestBehaviorTest/BlockDescendants.test';
import BlockHierarchyTest from './HitTestBehaviorTest/BlockHierarchy.test';
import postInputEvent from './BuilderNode/postInputEvent.test';

export default function testsuite() {
  touchAbleJsunit();
  sourceTypeJsunit();
  OnTouch1();
  OnTouch2();
  OnTouch3();
  GetChangedPointerId();
  RollAngle();
  BlockDescendantsTest();
  BlockHierarchyTest();
  postInputEvent();
  touchJsunit();
}