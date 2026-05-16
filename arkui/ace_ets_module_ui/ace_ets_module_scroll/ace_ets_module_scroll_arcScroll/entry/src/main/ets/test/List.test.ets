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

import arcScrollBar from './ArcScrollBar/arcScrollBar.test';
import ArcList from './ArcList/ArcList.test'
import childrenSizeArcList from './ArcList/childrenSizeArcList.test';
import swipeActionArcList from './ArcList/swipeActionArcList.test';
import digitalCrownSensitivityNullUndefinedTest from './arcListDefault/digitalCrownSensitivityNullUndefined.test';
import scrollBarNullUndefinedTest from './arcListDefault/scrollBarNullUndefined.test';
import scrollBarColorNullUndefinedTest from './arcListDefault/scrollBarColorNullUndefined.test';
import scrollBarWidthNullUndefinedTest from './arcListDefault/scrollBarWidthNullUndefined.test';
import chainAnimationNullUndefinedTest from './arcListDefault/chainAnimationNullUndefined.test';
import childrenMainSizeNullUndefinedTest from './arcListDefault/childrenMainSizeNullUndefined.test';
import enableScrollInteractionNullUndefinedTest from './arcListDefault/enableScrollInteractionNullUndefined.test';
import fadingEdgeNullUndefinedTest from './arcListDefault/fadingEdgeNullUndefined.test';
import frictionNullUndefinedTest from './arcListDefault/frictionNullUndefined.test';
import flingSpeedLimitNullUndefinedTest from './arcListDefault/flingSpeedLimitNullUndefined.test';
import onScrollIndexNullUndefinedTest from './arcListDefault/onScrollIndexNullUndefined.test';
import cachedCountNullUndefinedTest from './arcListDefault/cachedCountNullUndefined.test';
import spaceNullUndefinedTest from './arcListDefault/spaceNullUndefined.test';
import autoScaleNullUndefinedTest from './arcListItemDefault/autoScaleNullUndefined.test';
import swipeActionNullUndefinedTest from './arcListItemDefault/swipeActionNullUndefined.test';

export default function testsuite() {
  arcScrollBar()
  ArcList()
  childrenSizeArcList()
  swipeActionArcList()
  digitalCrownSensitivityNullUndefinedTest();
  scrollBarNullUndefinedTest();
  scrollBarColorNullUndefinedTest();
  scrollBarWidthNullUndefinedTest();
  chainAnimationNullUndefinedTest();
  childrenMainSizeNullUndefinedTest();
  enableScrollInteractionNullUndefinedTest();
  fadingEdgeNullUndefinedTest();
  frictionNullUndefinedTest();
  flingSpeedLimitNullUndefinedTest();
  onScrollIndexNullUndefinedTest();
  cachedCountNullUndefinedTest();
  spaceNullUndefinedTest();
  autoScaleNullUndefinedTest();
  swipeActionNullUndefinedTest();
}