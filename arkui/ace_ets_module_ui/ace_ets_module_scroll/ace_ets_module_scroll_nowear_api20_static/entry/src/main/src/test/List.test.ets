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
import barMarginFlow from './WaterFlowTest/barMarginFlow.test';
import focusWrapDefault from './GridTest/focusWrapDefault.test';
import focusWrapWrap from './GridTest/focusWrapWrap.test';
import bindGridControllerTest from './FrameNode/bindGridController.test';
import bindListControllerTest from './FrameNode/bindListController.test';
import bindScrollControllerTest from './FrameNode/bindScrollController.test';
import bindWaterFlowControllerTest from './FrameNode/bindWaterFlowController.test';

import WaterFlowColumnsTemplateTest from './WaterFlowTest/waterFlowColumnsTemplateTest.test'
import WaterFlowContentEndOffsetTest from './WaterFlowTest/waterFlowContentEndOffsetTest.test'
import WaterFlowContentStartOffsetTest from './WaterFlowTest/waterFlowContentStartOffsetTest.test'
import WaterFlowContentSizeTest from './WaterFlowTest/waterFlowContentSizeTest.test'
import WaterFlowDraggingFlingTest from './WaterFlowTest/waterFlowDraggingFlingTest.test'
import WaterFlowScrollBarColorTest from './WaterFlowTest/waterFlowScrollBarColorTest.test'
import WaterFlowScrollBarMarginTest from './WaterFlowTest/waterFlowScrollBarMarginTest.test'
import WaterFlowSyncLoadTest from './WaterFlowTest/waterFlowSyncLoadTest.test'

import WaterFlowColumnsTemplateModifierTest from './waterFlowModifierTest/waterFlowColumnsTemplateModifierTest.test'
import WaterFlowContentEndOffsetModifierTest from './waterFlowModifierTest/waterFlowContentEndOffsetModifierTest.test'
import WaterFlowContentStartOffsetModifierTest
  from './waterFlowModifierTest/waterFlowContentStartOffsetModifierTest.test'
import WaterFlowDraggingFlingModifierTest from './waterFlowModifierTest/waterFlowDraggingFlingModifierTest.test'
import WaterFlowScrollBarColorModifierTest from './waterFlowModifierTest/waterFlowScrollBarColorModifierTest.test'
import WaterFlowScrollBarMarginModifierTest from './waterFlowModifierTest/waterFlowScrollBarMarginModifierTest.test'
import WaterFlowSyncLoadModifierTest from './waterFlowModifierTest/waterFlowSyncLoadModifierTest.test'
import ScrollContentEndOffsetTest from './scrollTest/scrollContentEndOffsetTest.test'
import ScrollContentStartOffsetTest from './scrollTest/scrollContentStartOffsetTest.test'
import EnableBouncesZoomTest from './scrollTest/scrollEnableBouncesZoomTest.test'
import ScrollMaxZoomScaleTest from './scrollTest/scrollMaxZoomScaleTest.test'
import ScrollMinZoomScaleTest from './scrollTest/scrollMinZoomScaleTest.test'
import ScrollDraggingFlingTest from './scrollTest/scrollDraggingFlingTest.test'
import ScrollZoomTest from './scrollTest/scrollZoomTest_test'
import ScrollContentSizeTest from './scrollTest/scrollContentSizeTest.test'
import ScrollBarColorTest from './scrollTest/scrollBarColorTest.test'
import ScrollBarMarginTest from './scrollTest/scrollBarMarginTest.test'
import ScrollableTest from './scrollTest/scrollableTest.test'
import ScrollContentEndOffsetModifierTest from './scrollModifierTest/scrollContentEndOffsetModifierTest.test'
import ScrollContentStartOffsetModifierTest from './scrollModifierTest/scrollContentStartOffsetModifierTest.test'
import EnableBouncesZoomModifierTest from './scrollModifierTest/scrollEnableBouncesZoomModifierTest.test'
import ScrollMaxZoomScaleModifierTest from './scrollModifierTest/scrollMaxZoomScaleModifierTest.test'
import ScrollMinZoomScaleModifierTest from './scrollModifierTest/scrollMinZoomScaleModifierTest.test'
import ScrollDraggingFlingModifierTest from './scrollModifierTest/scrollDraggingFlingModifierTest.test'
import ScrollZoomModifierTest from './scrollModifierTest/scrollZoomModifierTest_test'
import ScrollBarColorModifierTest from './scrollModifierTest/scrollBarColorModifierTest.test'
import ScrollBarMarginModifierTest from './scrollModifierTest/scrollBarMarginModifierTest.test'
import ScrollableModifierTest from './scrollModifierTest/scrollableModifierTest.test'
import ListScrollBarColorTest from './listTest/listScrollBarColorTest.test'
import ListScrollBarMarginTest from './listTest/listScrollBarMarginTest.test'
import ListSyncLoadTest from './listTest/listSyncLoadTest.test'
import ListDraggingFlingTest from './listTest/listDraggingFlingTest.test'
import ListContentEndOffsetTest from './listTest/listContentEndOffsetTest.test'
import ListContentStartOffsetTest from './listTest/listContentStartOffsetTest.test'
import ListScrollSnapAnimationSpeedTest from './listTest/listScrollSnapAnimationSpeedTest.test'

import ListScrollBarColorModifierTest from './listModifierTest/listScrollBarColorModifierTest.test'
import ListScrollBarMarginModifierTest from './listModifierTest/listScrollBarMarginModifierTest.test'
import ListSyncLoadModifierTest from './listModifierTest/listSyncLoadModifierTest.test'
import ListDraggingFlingModifierTest from './listModifierTest/listDraggingFlingModifierTest.test'
import ListContentEndOffsetModifierTest from './listModifierTest/listContentEndOffsetModifierTest.test'
import ListContentStartOffsetModifierTest from './listModifierTest/listContentStartOffsetModifierTest.test'
import ListScrollSnapAnimationSpeedModifierTest from './listModifierTest/listScrollSnapAnimationSpeedModifierTest.test'

import RefreshMaxPullDownDistanceTest from './refreshTest/refreshMaxPullDownDistanceTest.test'
import RefreshMaxPullDownDistanceModifierTest from './refreshModifierTest/refreshMaxPullDownDistanceModifierTest.test'


import columnsTemplateTest from './GridTest/columnsTemplate.test';
import contentEndOffsetTest from './GridTest/contentEndOffset.test'
import contentStartOffsetTest from './GridTest/contentStartOffset.test'
import contentSizeTest from './GridTest/contentSize.test'
import focusWrapModeTest from './GridTest/focusWrapMode.test'
import columnsTemplateModifierTest from './GridModifierTest/columnsTemplate.test';
import contentEndOffsetModifierTest from './GridModifierTest/contentEndOffset.test'
import focusWrapModeModifierTest from './GridModifierTest/focusWrapMode.test'
import scrollBarColorModifierTest from './GridModifierTest/scrollBarColor.test'
import scrollBarMarginModifierTest from './GridModifierTest/scrollBarMargin.test'
import syncLoadTest from './GridTest/syncLoad.test'
import syncLoadModifierTest from './GridModifierTest/syncLoad.test'
import onWillStartFlingTest from './GridTest/onWillStartFling.test'
import onDidStopFlingTest from './GridTest/onDidStopFling.test'
import onWillStartDraggingTest from './GridTest/onWillStartDragging.test'
import onWillStopDraggingTest from './GridTest/onWillStopDragging.test'
import onDidStopDraggingTest from './GridTest/onDidStopDragging.test'
import scrollToTest from './GridTest/scrollTo.test'
import bindGridControllerSetOnTest from './GridTest/bindGridController.test'
import onWillStartFlingModifierTest from './GridModifierTest/onWillStartFling.test'
import onDidStopFlingModifierTest from './GridModifierTest/onDidStopFling.test'
import onWillStartDraggingModifierTest from './GridModifierTest/onWillStartDragging.test'
import onWillStopDraggingModifierTest from './GridModifierTest/onWillStopDragging.test'
import onDidStopDraggingModifierTest from './GridModifierTest/onDidStopDragging.test'
import contentStartOffsetModifierTest from './GridModifierTest/contentStartOffset.test'
import scrollBarColorTest from './GridTest/scrollBarColor.test'
import scrollBarMarginTest from './GridTest/scrollBarMargin.test'
import bindListControllerSetOnTest from './listTest/bindListController.test'

import listModifier_cachedCount from './listModifierTest/listModifier_cachedCount.test';
import listModifier_focusWrapMode from './listModifierTest/listModifier_focusWrapMode.test';
import listModifier_lanes from './listModifierTest/listModifier_lanes.test';
import List_cachedCount from './listTest/List_cachedCount.test';
import List_focusWrapMode from './listTest/List_focusWrapMode.test';
import List_lanes from './listTest/List_lanes.test';
import List_scrollTo from './listTest/List_scrollTo.test';
import bindScrollController from './scrollTest/bindScrollController.test';
import Scroll_scrollTo from './scrollTest/Scroll_scrollTo.test';
import bindWaterFlowController from './WaterFlowTest/bindWaterFlowController.test';
import WaterFlow_scrollTo from './WaterFlowTest/WaterFlow_scrollTo.test';

export default function testsuite() {
  barMarginFlow();
  focusWrapDefault();
  focusWrapWrap();
  bindGridControllerTest();
  bindListControllerTest();
  bindScrollControllerTest();
  bindWaterFlowControllerTest();

  WaterFlowColumnsTemplateTest();
  WaterFlowContentEndOffsetTest();
  WaterFlowContentStartOffsetTest();
  WaterFlowContentSizeTest();
  WaterFlowDraggingFlingTest();
  WaterFlowScrollBarColorTest();
  WaterFlowScrollBarMarginTest();
  WaterFlowSyncLoadTest();
  WaterFlowColumnsTemplateModifierTest();
  WaterFlowContentEndOffsetModifierTest();
  WaterFlowContentStartOffsetModifierTest();
  WaterFlowDraggingFlingModifierTest();
  WaterFlowScrollBarColorModifierTest();
  WaterFlowScrollBarMarginModifierTest();
  WaterFlowSyncLoadModifierTest();

  ScrollDraggingFlingTest()
  ScrollContentEndOffsetTest()
  ScrollContentStartOffsetTest()
  EnableBouncesZoomTest()
  ScrollMaxZoomScaleTest()
  ScrollMinZoomScaleTest()
  ScrollZoomTest()
  ScrollContentSizeTest()
  ScrollBarColorTest()
  ScrollBarMarginTest()
  ScrollableTest()
  ScrollContentEndOffsetModifierTest()
  ScrollContentStartOffsetModifierTest()
  EnableBouncesZoomModifierTest()
  ScrollMaxZoomScaleModifierTest()
  ScrollMinZoomScaleModifierTest()
  ScrollDraggingFlingModifierTest()
  ScrollBarMarginModifierTest()
  ScrollBarColorModifierTest()
  ScrollableModifierTest()
  ScrollZoomModifierTest()

  ListScrollBarColorTest()
  ListScrollBarMarginTest()
  ListSyncLoadTest()
  ListDraggingFlingTest()
  ListContentEndOffsetTest()
  ListContentStartOffsetTest()
  ListScrollSnapAnimationSpeedTest()
  ListScrollSnapAnimationSpeedModifierTest()
  ListScrollBarColorModifierTest()
  ListScrollBarMarginModifierTest()
  ListSyncLoadModifierTest()
  ListDraggingFlingModifierTest()
  ListContentEndOffsetModifierTest()
  ListContentStartOffsetModifierTest()

  RefreshMaxPullDownDistanceTest()
  RefreshMaxPullDownDistanceModifierTest()


  bindGridControllerSetOnTest();
  columnsTemplateModifierTest();
  contentEndOffsetModifierTest();
  contentStartOffsetModifierTest();
  focusWrapModeModifierTest();
  onDidStopDraggingModifierTest();
  onDidStopFlingModifierTest();
  onWillStartDraggingModifierTest();
  onWillStartFlingModifierTest();
  onWillStopDraggingModifierTest();
  scrollBarColorModifierTest();
  scrollBarMarginModifierTest();
  syncLoadModifierTest();
  columnsTemplateTest();
  contentEndOffsetTest();
  contentSizeTest();
  contentStartOffsetTest();
  focusWrapModeTest();
  onDidStopDraggingTest();
  onDidStopFlingTest();
  onWillStartDraggingTest();

  onWillStartFlingTest();
  onWillStopDraggingTest();
  scrollBarColorTest();
  scrollBarMarginTest();
  scrollToTest();
  syncLoadTest();
  bindListControllerSetOnTest();

  listModifier_cachedCount();
  listModifier_focusWrapMode();
  listModifier_lanes();
  List_cachedCount();
  List_focusWrapMode();
  List_lanes();
  List_scrollTo();
  bindScrollController();
  Scroll_scrollTo();
  bindWaterFlowController();
  WaterFlow_scrollTo();
}