/**
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
import observerScrollTest from './observerTest/observerScroll.test';
import ObserverNavDestinationState from './observerTest/ObserverNavDestinationState.test';
import ObserverNavDestinationId from './observerTest/ObserverNavDestinationId.test';
import ObserverPageId from './observerTest/ObserverPageId.test';
import ObserverApi1 from './observerTest/ObserverApi1.test';
import DensityInfoTest from './observerTest/DensityInfo.test';
import tabContentState from './observerTest/tabContentState.test';
import observeTabJsunit from './observerTest/observeTabJsunit.test';
import idScrollEvent from './observerTest/idScrollEvent.test'
import indexTabs from './observerTest/indexTabs.test'
import onTabUpdate from './observerTest/onTabUpdate.test'
import uiScrollEvent from './observerTest/uiScrollEvent.test';
import uiTabUpdate from './observerTest/uiTabUpdate.test'
import uiIdUpdate from './observerTest/uiIdUpdate.test'

export default function testsuite() {
  observerScrollTest()
  ObserverNavDestinationState();
  ObserverNavDestinationId();
  ObserverPageId();
  ObserverApi1();
  DensityInfoTest();
  tabContentState();
  observeTabJsunit();
  idScrollEvent();
  indexTabs();
  onTabUpdate();
  uiScrollEvent();
  uiTabUpdate();
  uiIdUpdate();
}