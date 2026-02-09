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

import ContentOffset from './ListTest/ContentOffset.test';
import scrollSnapAnimationSpeedModifier from './ListTest/scrollSnapAnimationSpeedModifier.test'; 
import scrollSnapAnimationSpeed from './ListTest/scrollSnapAnimationSpeed.test'; 
import listScrollbarColor from './ListTest/listScrollbarColor.test'; 
import scrollScrollbarColor from './ScrollTest/scrollScrollbarColor.test'; 
import gridScrollbarColor from './GridTest/gridScrollbarColor.test'; 
import scrollbarColor from './WaterFlowTest/scrollbarColor.test';
import ListContentSize from './ListTest/ListContentSize.test';
import GridContentSize from './GridTest/GridContentSize.test';
import ScrollContentSize from './ScrollTest/ScrollContentSize.test';
import WaterFlowContentSize from './WaterFlowTest/WaterFlowContentSize.test';
import ListFillPolicy from './ListTest/ListFillPolicy.test';
import GridFillPolicy from './GridTest/GridFillPolicy.test';
import WaterFlowFillPolicy from './WaterFlowTest/WaterFlowFillPolicy.test';
import WaterFlowFillPolicyModifier from './WaterFlowTest/WaterFlowFillPolicyModifier.test';

export default function testsuite() {
  WaterFlowFillPolicyModifier();
  ContentOffset();
  scrollSnapAnimationSpeedModifier();
  scrollSnapAnimationSpeed();
  listScrollbarColor();
  scrollScrollbarColor();
  gridScrollbarColor();
  scrollbarColor();
  ListContentSize();
  GridContentSize();
  ScrollContentSize();
  WaterFlowContentSize();
  ListFillPolicy();
  GridFillPolicy();
  WaterFlowFillPolicy();
}