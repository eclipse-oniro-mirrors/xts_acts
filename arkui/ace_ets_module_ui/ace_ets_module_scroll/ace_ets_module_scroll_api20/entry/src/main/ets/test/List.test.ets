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

import barHeightNoMinHeightLimit from './TabsTest/barHeightNoMinHeightLimit.test';
import maintainPosition from './SwiperTest/maintainPosition.test';
import barMarginGrid from './GridTest/barMarginGrid.test';
import barMarginList from './ListTest/barMarginList.test';
import barMarginScroll from './ScrollTest/barMarginScroll.test';
import curvesTabs from './TabsTest/curvesTabs.test';
import maxDownRefresh from './RefreshTest/maxDownRefresh.test';
import scrollBarColor from './ScrollBarTest/scrollBarColor.test';
import canOverGrid from './GridTest/canOverGrid.test';
import canOverList from './ListTest/canOverList.test';
import canOverScroll from './ScrollTest/canOverScroll.test';
import gridStopDrag from './GridTest/gridStopDrag.test';
import listStopDrag from './ListTest/listStopDrag.test';
import scrollStopDrag from './ScrollTest/scrollStopDrag.test';
import waterFlowStopDrag from './WaterFlowTest/waterFlowStopDrag.test';
import syncLoadGrid from './GridTest/syncLoadGrid.test';
import syncLoadList from './ListTest/syncLoadList.test';
import syncLoadGroup from './ListTest/syncLoadGroup.test';
import syncLoadFlow from './WaterFlowTest/syncLoadFlow.test';
import stateChange from './SwiperTest/stateChange.test';
import zoomScaleScroll from './ScrollTest/zoomScaleScroll.test';
import zoomScaleNull from './ScrollTest/zoomScaleNull.test';
import animationCurve from './TabsTest/animationCurve.test';
import groupStickyBoth from './ListTest/groupStickyBoth.test';

export default function testsuite() {
  barHeightNoMinHeightLimit();
  maintainPosition()
  barMarginGrid()
  barMarginList()
  barMarginScroll()
  curvesTabs()
  maxDownRefresh()
  scrollBarColor()
  canOverGrid()
  canOverList()
  canOverScroll()
  gridStopDrag()
  listStopDrag()
  scrollStopDrag()
  waterFlowStopDrag()
  syncLoadGrid()
  syncLoadList()
  syncLoadGroup()
  syncLoadFlow()
  stateChange()
  zoomScaleScroll()
  zoomScaleNull()
  animationCurve()
  groupStickyBoth()
}