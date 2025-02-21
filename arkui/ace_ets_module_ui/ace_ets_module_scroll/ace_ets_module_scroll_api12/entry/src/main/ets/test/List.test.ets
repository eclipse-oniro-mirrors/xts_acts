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
import ListScrollTest1 from './ScrollTest/ListScroll.test';
import PopupAlphaTest from './AlphabetIndexerTest/PopupAlpha.test';
import ListMainChildrenTest from './ListTest/ListMainChildren.test';
import ListLevel1Test from './ListTest/ListLevel1.test';
import ListLevel1HorizontalTest from './ListTest/ListLevel1Horizontal.test';
import refreshOffsetJsunit from './RefreshTest/refreshOffsetJsunit.test';
import refreshOffsetChangeJsunit from './RefreshTest/refreshOffsetChangeJsunit.test';
import refreshResourceTest from './RefreshTest/refreshResource.test';
import refreshStringTest from './RefreshTest/refreshString.test';
import ListAddApi from './ListTest/ListAddApi.test';
import listVisibleJsunit from './ListTest/listVisibleJsunit.test';
import scrollOffsetJsunit from './ScrollTest/scrollOffsetJsunit.test';
import swiperCustomJsunit from './SwiperTest/swiperCustomJsunit.test';
import tabIconJsunit from './TabsTest/tabIconJsunit.test';
import listSwipeActionApi12Test from './ListTest/listSwipeActionApi12.test';
import ScrollSourceOther from './ScrollTest/ScrollSourceOther.test';
import ScrollSource from './ScrollTest/ScrollSource.test';
import offsetRemain from './ScrollTest/offsetRemain.test';
import TabsAp1 from './TabsTest/TabsAp1.test'
import ScrollApi1 from './ScrollTest/ScrollApi1.test'
import scrollXOffsetJsunit from './ScrollTest/scrollXOffsetJsunit.test';
import SwiperApi from './SwiperTest/SwiperApi.test';
import tabsAnimationMode from './TabsTest/tabsAnimationMode.test'
import tabsAnimationDuration from './TabsTest/tabsAnimationDuration.test'
import setTest from './ListTest/childrenMainSizeTest/setTest.test'
import getTest from './ListTest/childrenMainSizeTest/getTest.test'
import alphabetEnableJsunit from './AlphabetIndexerTest/alphabetEnableJsunit.test';
import alphabetBorderRadiusTest from './AlphabetIndexerTest/alphabetBorderRadius.test';
import swiperCountJsunit from './SwiperTest/swiperCountJsunit.test';
import waterFlowLayoutMode from './WaterFlowTest/waterFlowLayoutMode.test';
import listOffsetJsunit from './ListTest/listOffsetJsunit.test';
import swiperSyncType from './SwiperTest/swiperSyncType.test';
import waterFlow1Jsunit from './WaterFlowTest/waterFlow1Jsunit.test';
import waterFlow2Jsunit from './WaterFlowTest/waterFlow2Jsunit.test';
import waterFlow3Jsunit from './WaterFlowTest/waterFlow3Jsunit.test';
import waterFlow4Jsunit from './WaterFlowTest/waterFlow4Jsunit.test';
import waterFlow5Jsunit from './WaterFlowTest/waterFlow5Jsunit.test';
import waterFlow6Jsunit from './WaterFlowTest/waterFlow6Jsunit.test';
import SwiperAttribute_1 from './SwiperTest/SwiperAttributeTest/SwiperAttribute_1.test';
import SwiperAttribute_2 from './SwiperTest/SwiperAttributeTest/SwiperAttribute_2.test';
import SwiperAttribute_3 from './SwiperTest/SwiperAttributeTest/SwiperAttribute_3.test';
import SwiperAttribute_4 from './SwiperTest/SwiperAttributeTest/SwiperAttribute_4.test';
import SwiperAttribute_5 from './SwiperTest/SwiperAttributeTest/SwiperAttribute_5.test';
import SwiperAttribute_6 from './SwiperTest/SwiperAttributeTest/SwiperAttribute_6.test';
import SwiperAttribute_7 from './SwiperTest/SwiperAttributeTest/SwiperAttribute_7.test';
import SwiperAttribute_8 from './SwiperTest/SwiperAttributeTest/SwiperAttribute_8.test';
import SwiperAttribute_9 from './SwiperTest/SwiperAttributeTest/SwiperAttribute_9.test';
import SwiperMargin_1 from './SwiperTest/SwiperAttributeTest/SwiperMargin_1.test';
import SwiperMargin_2 from './SwiperTest/SwiperAttributeTest/SwiperMargin_2.test';
import SwiperMargin_3 from './SwiperTest/SwiperAttributeTest/SwiperMargin_3.test';
import SwiperAutoPlay_1 from './SwiperTest/SwiperAttributeTest/SwiperAutoPlay_1.test';
import SwiperAutoPlay_2 from './SwiperTest/SwiperAttributeTest/SwiperAutoPlay_2.test';
import SwiperDisplayCount from './SwiperTest/SwiperAttributeTest/SwiperDisplayCount.test';
import SwiperLoopFalse from './SwiperTest/SwiperAttributeTest/SwiperLoopFalse.test';
import RefreshingContent from './RefreshTest/RefreshingContent.test';
import listVisibleContent from './ListTest/listVisibleContent.test';

export default function testsuite() {
  ListScrollTest1()
  PopupAlphaTest()
  ListMainChildrenTest()
  ListLevel1Test()
  ListLevel1HorizontalTest()
  refreshOffsetJsunit();
  refreshOffsetChangeJsunit();
  refreshResourceTest();
  refreshStringTest()
  ListAddApi()
  listVisibleJsunit();
  scrollOffsetJsunit();
  swiperCustomJsunit();
  tabIconJsunit();
  listSwipeActionApi12Test();
  ScrollSourceOther()
  ScrollSource();
  offsetRemain()
  TabsAp1()
  ScrollApi1()
  scrollXOffsetJsunit();
  SwiperApi()
  tabsAnimationMode()
  tabsAnimationDuration()
  setTest();
  getTest();
  alphabetEnableJsunit()
  alphabetBorderRadiusTest()
  swiperCountJsunit()
  waterFlowLayoutMode()
  listOffsetJsunit()
  swiperSyncType()
  waterFlow1Jsunit()
  waterFlow2Jsunit()
  waterFlow3Jsunit()
  waterFlow4Jsunit();
  waterFlow5Jsunit();
  waterFlow6Jsunit();
  SwiperAttribute_1()
  SwiperAttribute_2()
  SwiperAttribute_3()
  SwiperAttribute_4()
  SwiperAttribute_5()
  SwiperAttribute_6()
  SwiperAttribute_7()
  SwiperAttribute_8()
  SwiperAttribute_9()
  SwiperMargin_1()
  SwiperMargin_2()
  SwiperMargin_3()
  SwiperAutoPlay_1()
  SwiperAutoPlay_2()
  SwiperDisplayCount()
  SwiperLoopFalse()
  RefreshingContent()
  listVisibleContent()
}