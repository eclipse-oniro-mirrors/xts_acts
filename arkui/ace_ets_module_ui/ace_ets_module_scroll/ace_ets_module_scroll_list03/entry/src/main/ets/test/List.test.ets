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

import headerListJsunit from './ListItemGroup/headerListJsunit.test';
import listItemGroupComponent from './ListItemGroup/listItemGroupComponent.test';
import getListVisible from './ListItemGroup/getListVisible.test';
import itemIndexList from './List/itemIndexList.test';
import groupAnimation from './ListItemGroup/groupAnimation.test';
import animationCallback from './List/animationCallback.test';
import listAniAdd from './List/listAniAdd.test';
import listAniDel from './List/listAniDel.test';
import listAnVisible from './List/listAnVisible.test';
import listHeight from './List/listHeight.test';
import listScrollerBar from './List/listScrollerBar.test';
import groupAnVisible from './ListItemGroup/groupAnVisible.test';
import groupHeight from './ListItemGroup/groupHeight.test';
import cachedListMin from './List/cachedListMin.test';
import cachedShowListMin from './List/cachedShowListMin.test';
import cachedShowList from './List/cachedShowList.test';
import getItemError from './List/getItemError.test';
import getVisibleListError from './List/getVisibleListError.test';
import itemInGroupError from './ListItemGroup/itemInGroupError.test';
import ListSwipeTest from './List/ListSwipe.test'
import setListEvent from './List/setListEvent.test';
import listDividerOptions from './List/listDividerOptions.test';
import stackFromEndList from './List/stackFromEndList.test';
import barMarginList from './List/barMarginList.test';
import canOverList from './List/canOverList.test';
import listStopDrag from './List/listStopDrag.test';
import syncLoadList from './List/syncLoadList.test';
import syncLoadGroup from './ListItemGroup/syncLoadGroup.test';
import groupStickyBoth from './ListItemGroup/groupStickyBoth.test';
import ContentOffset from './List/ContentOffset.test';
import listDraggingFling from './List/listDraggingFling.test';
import scrollSnapAnimationSpeedModifier from './List/scrollSnapAnimationSpeedModifier.test';
import scrollSnapAnimationSpeed from './List/scrollSnapAnimationSpeed.test';
import ListFillPolicyModifier from './List/ListFillPolicyModifier.test';
import listScrollbarColor from './ListItemGroup/listScrollbarColor.test';
import ListContentSize from './List/ListContentSize.test';
import ListFillPolicy from './List/ListFillPolicy.test';
import listNoMakeObserved from './List/listNoMakeObserved.test';
import listCacheCount from './List/listCacheCount.test';
import listLazyTrue from './emptyBranch/listLazyTrue.test';
import listLazyFalse from './emptyBranch/listLazyFalse.test';
import listLazyUn from './emptyBranch/listLazyUn.test';
import listLazyNull from './emptyBranch/listLazyNull.test';
import listRepeatTrue from './emptyBranch/listRepeatTrue.test';
import listRepeatFalse from './emptyBranch/listRepeatFalse.test';
import listRepeatUn from './emptyBranch/listRepeatUn.test';
import listRepeatNull from './emptyBranch/listRepeatNull.test';
import editModeList from './List/editModeList.test';
import editBadgeList from './List/editBadgeList.test';

export default function testsuite() {
  headerListJsunit()
  listItemGroupComponent()
  getListVisible()
  itemIndexList()
  groupAnimation()
  animationCallback()
  listAniAdd()
  listAniDel()
  listAnVisible()
  listHeight()
  listScrollerBar()
  groupAnVisible()
  groupHeight()
  cachedListMin()
  cachedShowListMin()
  cachedShowList()
  getItemError()
  getVisibleListError()
  itemInGroupError()
  ListSwipeTest()
  setListEvent()
  listDividerOptions()
  stackFromEndList()
  barMarginList()
  canOverList()
  listStopDrag()
  syncLoadList()
  syncLoadGroup()
  groupStickyBoth()
  ContentOffset()
  listDraggingFling()
  scrollSnapAnimationSpeedModifier()
  ListFillPolicyModifier()
  scrollSnapAnimationSpeed()
  listScrollbarColor()
  ListContentSize()
  ListFillPolicy()
  listNoMakeObserved()
  listCacheCount()
  listLazyTrue()
  listLazyFalse()
  listLazyUn()
  listLazyNull()
  listRepeatTrue()
  listRepeatFalse()
  listRepeatUn()
  listRepeatNull()
  editModeList()
  editBadgeList()
}