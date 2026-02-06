/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import WaterflowDemo from './WaterflowDemo.test';
import WaterflowAddJsunit from './WaterflowAddJsunit.test';
import WaterFlowFriction from './WaterFlowFriction.test';
import waterFlowDraggingFling from './WaterFlow/waterFlowDraggingFling.test';
import repeatNoMakeObserved from './WaterFlow/repeatNoMakeObserved.test';
import waterOffsetRes from './WaterFlow/waterOffsetRes.test';
import waterContentOffset from './WaterFlow/waterContentOffset.test';
import cachedFlowMin from './WaterFlow/cachedFlowMin.test';
import cachedShowFlowMin from './WaterFlow/cachedShowFlowMin.test';
import waterFlowStopDrag from './WaterFlow/waterFlowStopDrag.test';
import syncLoadFlow from './WaterFlow/syncLoadFlow.test';
import scrollbarColor from './WaterFlow/scrollbarColor.test';
import WaterFlowFillPolicy from './WaterFlow/WaterFlowFillPolicy.test';
import WaterFlowContentSize from './WaterFlow/WaterFlowContentSize.test';
import WaterFlowFillPolicyModifier from './WaterFlow/WaterFlowFillPolicyModifier.test';

export default function testsuite() {
  WaterflowDemo()
  WaterflowAddJsunit()
  WaterFlowFriction()
  waterFlowDraggingFling()
  repeatNoMakeObserved()
  waterOffsetRes()
  waterContentOffset()
  cachedFlowMin()
  cachedShowFlowMin()
  waterFlowStopDrag()
  syncLoadFlow()
  scrollbarColor();
  WaterFlowFillPolicy();
  WaterFlowContentSize();
  WaterFlowFillPolicyModifier();
}