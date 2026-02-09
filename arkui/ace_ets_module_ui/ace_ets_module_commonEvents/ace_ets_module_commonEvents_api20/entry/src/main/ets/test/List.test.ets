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

import getDisplayId from './DragTest/getDisplayId.test';
import tapLocationTest from './TapGestureTest/tapLocation.test';
import PanGestureTest from './PanGestureTest/observer.test';
import colorMetricsTest from './ColorTest/colorMetrics.test';
import onTouchTestDoneTest from './GestureRecognizerTest/onTouchTestDone.test';
import nodeRenderStateTest from './NodeRenderStateTest/nodeRenderState.test';
import BlockDescendantsTest from './HitTestBehaviorTest/BlockDescendants.test';
import BlockHierarchyTest from './HitTestBehaviorTest/BlockHierarchy.test';
import BackgroundOptionsTest from './BackgroundTest/BackgroundOptions.test';
import axisEventTest from './GlobalDisplayTest/axisEvent.test';
import clickEventTest from './GlobalDisplayTest/clickEvent.test';
import dragEventTest from './GlobalDisplayTest/dragEvent.test';
import fingerInfoTest from './GlobalDisplayTest/fingerInfo.test';
import hoverEventTest from './GlobalDisplayTest/hoverEvent.test';
import mouseEventTest from './GlobalDisplayTest/mouseEvent.test';
import touchEventTest from './GlobalDisplayTest/touchEvent.test';

export default function testsuite() {
  getDisplayId();
  tapLocationTest();
  PanGestureTest();
  colorMetricsTest();
  onTouchTestDoneTest();
  nodeRenderStateTest();
  BlockDescendantsTest();
  BlockHierarchyTest();
  BackgroundOptionsTest();
  axisEventTest();
  clickEventTest();
  dragEventTest();
  fingerInfoTest();
  hoverEventTest();
  mouseEventTest();
  touchEventTest();
}