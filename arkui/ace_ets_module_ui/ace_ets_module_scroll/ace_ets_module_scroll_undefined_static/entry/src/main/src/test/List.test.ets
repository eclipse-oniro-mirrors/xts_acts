'use static';
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


import listUndefinedTest from './ListTest/listUndefined.test';
import listAttrsModifierUndefinedTest from './ListTest/listAttrsModifierUndefined.test';
import listUndefinedTest1 from './ListTest/listUndefined1.test';
import listAttrsModifierUndefinedTest1 from './ListTest/listAttrsModifierUndefined1.test';
import gridEventUndefinedTest from './GridTest/gridEventUndefinedTest.test';
import gridEventModifierUndefined from './GridTest/gridEventModifierUndefined.test';
import gridDragEventUndefinedTest from './GridTest/gridDragEventUndefinedTest.test';
import gridDragEventModifierUndefined from './GridTest/gridDragEventModifierUndefined.test';
import gridAttrsUndefined from './GridTest/gridAttrsUndefined.test';
import gridAttrsModifierUndefined from './GridTest/gridAttrsModifierUndefined.test';
import WaterFlowUndefinedTest from './WaterFlowTest/waterFlowUndefined.test'
import WaterFlowModifierUndefinedTest from './WaterFlowTest/waterFlowModifierUndefined.test'
import GridItemUndefinedTest from './GridItemTest/gridItemUndefined.test'
import GridItemModifierUndefinedTest from './GridItemTest/gridItemModifierUndefined.test'
import LazyGridLayoutUndefinedTest from './LazyGridLayoutTest/lazyGridLayoutUndefined.test'
import clipContentUndefinedTest from './ScrollTest/clipContentUndefined.test';
import edgeEffectUndefinedTest from './ScrollTest/edgeEffectUndefined.test';
import fadingEdgeUndefinedTest from './ScrollTest/fadingEdgeUndefined.test';
import onReachStartUndefinedTest from './ScrollTest/onReachStartUndefined.test';
import onScrollStartUndefinedTest from './ScrollTest/onScrollStartUndefined.test';
import onScrollStopUndefinedTest from './ScrollTest/onScrollStopUndefined.test';
import clipContentModifierUndefinedTest from './ScrollTest/clipContentModifierUndefined.test';
import edgeEffectModifierUndefinedTest from './ScrollTest/edgeEffectModifierUndefined.test';
import fadingEdgeModifierUndefinedTest from './ScrollTest/fadingEdgeModifierUndefined.test';
import onReachStartModifierUndefinedTest from './ScrollTest/onReachStartModifierUndefined.test';
import onReachEndModifierUndefinedTest from './ScrollTest/onReachEndModifierUndefined.test';
import onScrollStartModifierUndefinedTest from './ScrollTest/onScrollStartModifierUndefined.test';
import onScrollStopModifierUndefinedTest from './ScrollTest/onScrollStopModifierUndefined.test';
import enableScrollInteractionUndefinedTest from './ScrollTest/enableScrollInteractionUndefined.test';
import flingSpeedLimitUndefinedTest from './ScrollTest/flingSpeedLimitUndefined.test';
import frictionUndefinedTest from './ScrollTest/frictionUndefined.test';
import nestedScrollUndefinedTest from './ScrollTest/nestedScrollUndefined.test';
import scrollBarUndefinedTest from './ScrollTest/scrollBarUndefined.test';
import scrollBarWidthUndefinedTest from './ScrollTest/scrollBarWidthUndefined.test';
import enableScrollInteractionModifierUndefinedTest from './ScrollTest/enableScrollInteractionModifierUndefined.test';
import flingSpeedLimitModifierUndefinedTest from './ScrollTest/flingSpeedLimitModifierUndefined.test';
import frictionModifierUndefinedTest from './ScrollTest/frictionModifierUndefined.test';
import nestedScrollModifierUndefinedTest from './ScrollTest/nestedScrollModifierUndefined.test';
import scrollBarModifierUndefinedTest from './ScrollTest/scrollBarModifierUndefined.test';
import scrollBarWidthModifierUndefinedTest from './ScrollTest/scrollBarWidthModifierUndefined.test';
import rowsGapUndefinedTest from './GridTest/rowsGapUndefined.test';
import rowsTemplateUndefinedTest from './GridTest/rowsTemplateUndefined.test';
import columnsGapUndefinedTest from './GridTest/columnsGapUndefined.test';
import columnsTemplateUndefinedTest from './GridTest/columnsTemplateUndefined.test';
import maxCountUndefinedTest from './GridTest/maxCountUndefined.test';
import multiSelectableUndefinedTest from './GridTest/multiSelectableUndefined.test';
import cachedCountUndefinedTest from './GridTest/cachedCountUndefined.test';
import editModeUndefinedTest from './GridTest/editModeUndefined.test';
import rowsGapModifierUndefinedTest from './GridTest/rowsGapModifierUndefined.test';
import rowsTemplateModifierUndefinedTest from './GridTest/rowsTemplateModifierUndefined.test';
import columnsGapModifierUndefinedTest from './GridTest/columnsGapModifierUndefined.test';
import columnsTemplateModifierUndefinedTest from './GridTest/columnsTemplateModifierUndefined.test';
import maxCountModifierUndefinedTest from './GridTest/maxCountModifierUndefined.test';
import multiSelectableModifierUndefinedTest from './GridTest/multiSelectableModifierUndefined.test';
import cachedCountModifierUndefinedTest from './GridTest/cachedCountModifierUndefined.test';
import editModeModifierUndefinedTest from './GridTest/editModeModifierUndefined.test';
import nestedScrollListUndefinedTest from './ListTest/nestedScrollUndefined.test';
import enableScrollInteractionListUndefinedTest from './ListTest/enableScrollInteractionUndefined.test';
import scrollSnapAlignUndefinedTest from './ListTest/scrollSnapAlignUndefined.test';
import frictionListUndefinedTest from './ListTest/frictionUndefined.test';
import nestedScrollListModifierUndefinedTest from './ListTest/nestedScrollModifierUndefined.test';
import enableScrollInteractionListModifierUndefinedTest from './ListTest/enableScrollInteractionModifierUndefined.test';
import scrollSnapAlignModifierUndefinedTest from './ListTest/scrollSnapAlignModifierUndefined.test';
import frictionListModifierUndefinedTest from './ListTest/frictionModifierUndefined.test';
import onItemDragStartUndefinedTest from './ListTest/onItemDragStartUndefined.test';
import onItemMoveUndefinedTest from './ListTest/onItemMoveUndefined.test';
import onItemDropUndefinedTest from './ListTest/onItemDropUndefined.test';
import onItemDragMoveUndefinedTest from './ListTest/onItemDragMoveUndefined.test';
import onItemDragLeaveUndefinedTest from './ListTest/onItemDragLeaveUndefined.test';
import onItemDragEnterUndefinedTest from './ListTest/onItemDragEnterUndefined.test';
import onItemDragStartModifierUndefinedTest from './ListTest/onItemDragStartModifierUndefined.test';
import onItemMoveModifierUndefinedTest from './ListTest/onItemMoveModifierUndefined.test';
import onItemDropModifierUndefinedTest from './ListTest/onItemDropModifierUndefined.test';
import onItemDragMoveModifierUndefinedTest from './ListTest/onItemDragMoveModifierUndefined.test';
import onItemDragLeaveModifierUndefinedTest from './ListTest/onItemDragLeaveModifierUndefined.test';
import onItemDragEnterModifierUndefinedTest from './ListTest/onItemDragEnterModifierUndefined.test';
import ScrollUndefinedTest from './ScrollTest/scrollUndefined.test';
import ListItemUndefinedTest from './ListItemTest/listItemUndefined.test';
import ScrollUndefinedModifierTest from './ScrollTest/scrollUndefinedModifier.test';
import ListItemUndefinedModifierTest from './ListItemTest/listItemUndefinedModifier.test';

export default function testsuite() {
  listUndefinedTest();
  listAttrsModifierUndefinedTest();
  listUndefinedTest1();
  listAttrsModifierUndefinedTest1();
  gridEventUndefinedTest()
  gridDragEventUndefinedTest()
  gridAttrsUndefined()
  gridEventModifierUndefined()
  gridDragEventModifierUndefined()
  gridAttrsModifierUndefined()
  LazyGridLayoutUndefinedTest()
  GridItemModifierUndefinedTest()
  GridItemUndefinedTest()
  WaterFlowModifierUndefinedTest()
  WaterFlowUndefinedTest()
  clipContentUndefinedTest();
  edgeEffectUndefinedTest();
  enableScrollInteractionUndefinedTest();
  fadingEdgeUndefinedTest();
  flingSpeedLimitUndefinedTest();
  frictionUndefinedTest();
  nestedScrollUndefinedTest();
  onReachStartUndefinedTest();
  onScrollStartUndefinedTest();
  onScrollStopUndefinedTest();
  scrollBarUndefinedTest();
  scrollBarWidthUndefinedTest();
  clipContentModifierUndefinedTest();
  edgeEffectModifierUndefinedTest();
  fadingEdgeModifierUndefinedTest();
  onReachStartModifierUndefinedTest();
  onReachEndModifierUndefinedTest();
  onScrollStartModifierUndefinedTest();
  onScrollStopModifierUndefinedTest();
  enableScrollInteractionModifierUndefinedTest();
  flingSpeedLimitModifierUndefinedTest();
  frictionModifierUndefinedTest();
  nestedScrollModifierUndefinedTest();
  scrollBarModifierUndefinedTest();
  scrollBarWidthModifierUndefinedTest();
  rowsGapUndefinedTest();
  rowsTemplateUndefinedTest();
  columnsGapUndefinedTest();
  columnsTemplateUndefinedTest();
  maxCountUndefinedTest();
  multiSelectableUndefinedTest();
  cachedCountUndefinedTest();
  editModeUndefinedTest();
  rowsGapModifierUndefinedTest();
  rowsTemplateModifierUndefinedTest();
  columnsGapModifierUndefinedTest();
  columnsTemplateModifierUndefinedTest();
  maxCountModifierUndefinedTest();
  multiSelectableModifierUndefinedTest();
  cachedCountModifierUndefinedTest();
  editModeModifierUndefinedTest();
  nestedScrollListUndefinedTest();
  enableScrollInteractionListUndefinedTest();
  scrollSnapAlignUndefinedTest();
  frictionListUndefinedTest();
  onItemDragStartUndefinedTest();
  onItemMoveUndefinedTest();
  onItemDropUndefinedTest();
  onItemDragMoveUndefinedTest();
  onItemDragLeaveUndefinedTest();
  onItemDragEnterUndefinedTest();
  nestedScrollListModifierUndefinedTest();
  enableScrollInteractionListModifierUndefinedTest();
  scrollSnapAlignModifierUndefinedTest();
  frictionListModifierUndefinedTest();
  onItemDragStartModifierUndefinedTest();
  onItemMoveModifierUndefinedTest();
  onItemDropModifierUndefinedTest();
  onItemDragMoveModifierUndefinedTest();
  onItemDragLeaveModifierUndefinedTest();
  onItemDragEnterModifierUndefinedTest();
  ScrollUndefinedTest();
  ListItemUndefinedTest();
  ScrollUndefinedModifierTest();
  ListItemUndefinedModifierTest();
}
