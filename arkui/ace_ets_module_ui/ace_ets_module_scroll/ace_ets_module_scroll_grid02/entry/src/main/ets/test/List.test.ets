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

import GridReboundTest from './Grid/gridRebound.test';
import alignItemsGrid from './Grid/alignItemsGrid.test';
import GridFlingCallback from './Grid/GridFlingCallback.test'
import GridScrollEdgeCallbackJsunit from './Grid/GridScrollEdgeCallback.test.ets';
import gridAniTrue from './Grid/gridAniTrue.test';
import irregularAniGrid from './Grid/irregularAniGrid.test';
import repeatAniGrid from './Grid/repeatAniGrid.test';
import GridNodeTest from './Grid/gridNode.test';
import GridItemNodeTest from './Grid/gridItemNode.test';
import nodeTypeGrid from './Grid/nodeTypeGrid.test';
import rowColumnMin from './Grid/rowColumnMin.test';
import cellLengthMin from './Grid/cellLengthMin.test';
import cachedGridMin from './Grid/cachedGridMin.test';
import cachedShowGridMin from './Grid/cachedShowGridMin.test';
import cachedShowGrid from './Grid/cachedShowGrid.test';
import setGridEvent from './Grid/setGridEvent.test';
import LazyVGridLayout from './LazyVGridLayout/LazyVGridLayout.test';
import barMarginGrid from './Grid/barMarginGrid.test';
import canOverGrid from './Grid/canOverGrid.test';
import gridStopDrag from './Grid/gridStopDrag.test';
import syncLoadGrid from './Grid/syncLoadGrid.test';
import ModifierDraggingFling from './Grid/ModifierDraggingFling.test';
import gridDraggingFling from './Grid/gridDraggingFling.test';
import gridScrollbarColor from './Grid/gridScrollbarColor.test';
import GridContentSize from './Grid/GridContentSize.test';
import GridFillPolicy from './Grid/GridFillPolicy.test';
import gridOffsetRes from './Grid/gridOffsetRes.test';
import gridContentOffset from './Grid/gridContentOffset.test';
import GridFillPolicyModifier from './Grid/GridFillPolicyModifier.test';
import gridLazyTrue from './emptyBranch/gridLazyTrue.test';
import gridLazyFalse from './emptyBranch/gridLazyFalse.test';
import gridLazyUn from './emptyBranch/gridLazyUn.test';
import gridLazyNull from './emptyBranch/gridLazyNull.test';
import gridRepeatTrue from './emptyBranch/gridRepeatTrue.test';
import gridRepeatFalse from './emptyBranch/gridRepeatFalse.test';
import gridRepeatUn from './emptyBranch/gridRepeatUn.test';
import gridRepeatNull from './emptyBranch/gridRepeatNull.test';
import editModeGrid from './Grid/editModeGrid.test';
import editBadgeGrid from './Grid/editBadgeGrid.test';

export default function testsuite() {
  GridReboundTest()
  alignItemsGrid()
  GridFlingCallback();
  GridScrollEdgeCallbackJsunit()
  gridAniTrue()
  irregularAniGrid()
  repeatAniGrid()
  GridNodeTest()
  GridItemNodeTest()
  nodeTypeGrid()
  rowColumnMin()
  cellLengthMin()
  cachedGridMin()
  cachedShowGridMin()
  cachedShowGrid()
  setGridEvent()
  LazyVGridLayout()
  barMarginGrid()
  canOverGrid()
  gridStopDrag()
  syncLoadGrid()
  ModifierDraggingFling()
  gridDraggingFling()
  gridScrollbarColor()
  GridContentSize()
  GridFillPolicy()
  gridOffsetRes()
  gridContentOffset()
  GridFillPolicyModifier();
  gridLazyTrue()
  gridLazyFalse()
  gridLazyUn()
  gridLazyNull()
  gridRepeatTrue()
  gridRepeatFalse()
  gridRepeatUn()
  gridRepeatNull()
  editModeGrid()
  editBadgeGrid()
}