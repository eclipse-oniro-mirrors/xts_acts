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
 
import enableScrollJsunit from './ScrollBarTest/enableScrollJsunit.test';
import getListVisible from './ListTest/getListVisible.test'; 
import itemIndexList from './ListTest/itemIndexList.test'; 
import groupAnimation from './ListTest/groupAnimation.test'; 
import animationCallback from './ListTest/animationCallback.test';
import listAniAdd from './ListTest/listAniAdd.test';
import listAniDel from './ListTest/listAniDel.test';
import listAnVisible from './ListTest/listAnVisible.test'; 
import listHeight from './ListTest/listHeight.test'; 
import groupAnVisible from './ListTest/groupAnVisible.test'; 
import groupHeight from './ListTest/groupHeight.test';   
import scrollAniFalse from './ScrollTest/scrollAniFalse.test';
import scrollAniUn from './ScrollTest/scrollAniUn.test';
import scrollAniTrue from './ScrollTest/scrollAniTrue.test'; 
import gridAniTrue from './GridTest/gridAniTrue.test'; 
import irregularAniGrid from './GridTest/irregularAniGrid.test'; 
import repeatAniGrid from './GridTest/repeatAniGrid.test'; 
import gridNode from './GridTest/gridNode.test';
import griditemNode from './GridItemTest/griditemNode.test';
import barBackEffect from './TabsTest/barBackEffect.test';
import nodeTypeGrid from './GridTest/nodeTypeGrid.test'; 
import listScrollerBar from './ScrollBarTest/listScrollerBar.test';
import cachedShowGrid from './GridTest/cachedShowGrid.test';
import cachedShowList from './ListTest/cachedShowList.test';
import getItemError from './ListTest/getItemError.test'; 
import getVisibleListError from './ListTest/getVisibleListError.test'; 
import itemInGroupError from './ListTest/itemInGroupError.test'; 

export default function testsuite() {
  enableScrollJsunit()
  getListVisible()
  itemIndexList()
  groupAnimation()
  animationCallback()
  listAniAdd()
  listAniDel()
  listAnVisible()
  listHeight()
  groupAnVisible()
  groupHeight()
  scrollAniFalse()
  scrollAniUn()
  scrollAniTrue()
  gridAniTrue()
  irregularAniGrid()
  repeatAniGrid()
  gridNode();
  griditemNode();
  barBackEffect()
  nodeTypeGrid()
  listScrollerBar()
  cachedShowGrid()
  cachedShowList()
  getItemError()
  getVisibleListError()
  itemInGroupError()
}