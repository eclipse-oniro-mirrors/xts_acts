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

import ACTION_CANCELED_BEFORE_DRAG_APITest from './CommonTest/OnPreDragTest/OnPreDrag_APITest/ACTION_CANCELED_BEFORE_DRAG_APITest'
import getDisplayId from './DragTest/getDisplayId.test';
import axisEventTest from './GlobalDisplayTest/axisEvent.test';
import clickEventTest from './GlobalDisplayTest/clickEvent.test';
import dragEventTest from './GlobalDisplayTest/dragEvent.test';
import fingerInfoTest from './GlobalDisplayTest/fingerInfo.test';
import hoverEventTest from './GlobalDisplayTest/hoverEvent.test';
import mouseEventTest from './GlobalDisplayTest/mouseEvent.test';
import touchEventTest from './GlobalDisplayTest/touchEvent.test';
import getResultTest from "./DragEvent/getResult.test";
import DragModifier from './DragEvent/DragModifier.test';
import normalDrag from './DragEvent/normalDrag.test';
import dragSpringLoading from './DragEvent/dragSpringLoading.test';
import enableInternalDropAnimation from './DragEvent/enableInternalDropAnimation.test';

export default function testsuite() {
  ACTION_CANCELED_BEFORE_DRAG_APITest();
  DragModifier();
  normalDrag();
  dragSpringLoading();
  enableInternalDropAnimation();
  getDisplayId();
  axisEventTest();
  clickEventTest();
  dragEventTest();
  fingerInfoTest();
  hoverEventTest();
  mouseEventTest();
  touchEventTest();
  getResultTest();
}