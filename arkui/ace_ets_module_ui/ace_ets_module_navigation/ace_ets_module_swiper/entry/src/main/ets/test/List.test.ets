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
import swiperJsunit from './SwiperTest/SwiperJsunit.test';
import SwiperMarginTest from './SwiperTest/SwiperMargin.test'
import SwiperLoop from './SwiperTest/Swiper/SwiperLoop.test'
import SwiperVisibility from './SwiperTest/Swiper/SwiperVisibility.test'
import swiper1 from './SwiperTest/Swiper/swiper1.test'
import swiper2 from './SwiperTest/Swiper/swiper2.test'
import swiperWidthTest from './SwiperTest/swiper2/swiperTwidth.test'
import swiperGroupTest from './SwiperTest/swiper2/swiperGroup.test'
import swiperPageTest from './SwiperTest/swiper2/swiperPage.test'
import swiperNextPreTest from './SwiperTest/swiper2/swiperNextPrevious.test'
import swiperDelAddTest from './SwiperTest/swiper2/swiperDeleteAdd.test'
import swiperEdgeTest from './SwiperTest/swiper2/swiperEdge.test'
import swipeleftScrollTest from './SwiperTest/swiper2/swiperleftScroll.test'
import swiperRightScrollTest from './SwiperTest/swiper2/swiperightscroll.test'
import swiperIndex from './SwiperTest/Swiper_ParmsChange/swiperIndex.test.ets';
import swiperVertical from './SwiperTest/Swiper_ParmsChange/swiperVertical.test.ets';
import swiperLoopTrue from './SwiperTest/Swiper_ParmsChange/swiperLoopTrue.test.ets';
import swiperLoopFalse from './SwiperTest/Swiper_ParmsChange/swiperLoopFalse.test.ets';
import swiperItemSpace from './SwiperTest/Swiper_ParmsChange/swiperItemSpace.test.ets';
import swiperPadding from './SwiperTest/Swiper_ParmsChange/swiperPadding.test.ets';
import swiperMargin from './SwiperTest/Swiper_ParmsChange/swiperMargin.test.ets';
import swiperMarPad from './SwiperTest/Swiper_ParmsChange/swiperMarPad.test.ets';
import swiperDisableSwipeTrue from './SwiperTest/Swiper_ParmsChange/swiperDisableSwipeTrue.test.ets';
import swiperDisableSwipeFalse from './SwiperTest/Swiper_ParmsChange/swiperDisableSwipeFalse.test.ets';
import swiperItemSize from './SwiperTest/Swiper_ItemChange/swiperItemSize.test.ets';
import swiperItemSize2 from './SwiperTest/Swiper_ItemChange/swiperItemSize2.test.ets';
import swiperItemPadding from './SwiperTest/Swiper_ItemChange/swiperItemPadding.test.ets';
import swiperItemMargin from './SwiperTest/Swiper_ItemChange/swiperItemMargin.test.ets';
import swiperItemPadMar from './SwiperTest/Swiper_ItemChange/swiperItemPadMar.test.ets';
import swiperItemVisibility from './SwiperTest/Swiper_ItemChange/swiperItemVisibility.test.ets';
import swiperTest from './SwiperTest/swiper.test';
import swiperTest_1 from './SwiperTest/swiper_1.test';
import swiperSecTest from './SwiperTest/swipersec.test';
import swiperJsunit2 from './SwiperTest/SwiperJsunit2.test';
import Swiper07Test from './SwiperTest/Swiper07.test';
import SwiperMinSize from './SwiperTest/swiperUI/SwiperMinSize.test.ets';
import SwiperNextPrevMarginAddJsunit from './SwiperTest/swiperUI/SwiperNextPrevMarginAddJsunit.test.ets'
import swiperAnimationJsunit from './SwiperTest/swiperUI/swiperAnimationJsunit.test.ets'
import swiperMaskJsunit from './SwiperTest/swiper3.test';
import swiperCurveJsunit from './SwiperTest/swiper1.test';

import swiperCustomJsunit from './SwiperTest/swiperCustomJsunit.test';
import nestedScrollSwiper from './SwiperTest/nestedScrollSwiper.test'; 
import finishTransSwiper from './SwiperTest/finishTransSwiper.test';
import SwiperApi from './SwiperTest/SwiperApi.test';
import swiperCountJsunit from './SwiperTest/swiperCountJsunit.test';
import SyncTypeNull from './SwiperTest/SyncTypeNull.test';
import swiperSyncType from './SwiperTest/swiperSyncType.test';
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
import SwiperMargin_4 from './SwiperTest/SwiperAttributeTest/SwiperMargin_4.test';
import SwiperAutoPlay_1 from './SwiperTest/SwiperAttributeTest/SwiperAutoPlay_1.test';
import SwiperAutoPlay_2 from './SwiperTest/SwiperAttributeTest/SwiperAutoPlay_2.test';
import SwiperDisplayCount from './SwiperTest/SwiperAttributeTest/SwiperDisplayCount.test';
import SwiperLoopFalse from './SwiperTest/SwiperAttributeTest/SwiperLoopFalse.test';
import swiperLoops from './SwiperTest/swiperLoops.test';
import SwiperImplicitanimation0050 from  './SwiperTest/SwiperImplicitanimationTest/SwiperImplicitanimation0050.test';
import SwiperImplicitanimation0010 from  './SwiperTest/SwiperImplicitanimationTest/SwiperImplicitanimation0010.test';
import SwiperImplicitanimation0020 from  './SwiperTest/SwiperImplicitanimationTest/SwiperImplicitanimation0020.test';
import SwiperImplicitanimation0030 from  './SwiperTest/SwiperImplicitanimationTest/SwiperImplicitanimation0030.test';
import SwiperImplicitanimation0060 from  './SwiperTest/SwiperImplicitanimationTest/SwiperImplicitanimation0060.test';
import SwiperImplicitanimation0070 from  './SwiperTest/SwiperImplicitanimationTest/SwiperImplicitanimation0070.test';
import SwiperAcross0300 from  './SwiperTest/SwiperAcrossTest/SwiperAcross0300.test';
import SwiperInterfaceMix0220 from  './SwiperTest/SwiperInterfaceMixTest/SwiperInterfaceMix0220.test';
import SwiperMirroring0010 from  './SwiperTest/SwiperMirroringTest/SwiperMirroring0010.test';
import SwiperAdd0510 from  './SwiperTest/SwiperAddTest/SwiperAdd0510.test';
import SwiperInterface01 from  './SwiperTest/swiperinterfaceTest/SwiperInterface01.test';
import SwiperInterface02 from  './SwiperTest/swiperinterfaceTest/SwiperInterface02.test';
import SwiperInterface03 from  './SwiperTest/swiperinterfaceTest/SwiperInterface03.test';
import SwiperInterface1570 from  './SwiperTest/swiperinterfaceTest/SwiperInterface1570.test';
import SwiperDrag0710 from  './SwiperTest/SwiperDragTest/SwiperDrag0710.test';
import SwiperDrag0230 from  './SwiperTest/SwiperDragTest/SwiperDrag0230.test';
import SwiperDrag0240 from  './SwiperTest/SwiperDragTest/SwiperDrag0240.test';
import SwiperDrag0250 from  './SwiperTest/SwiperDragTest/SwiperDrag0250.test';
import SwiperDrag0260 from  './SwiperTest/SwiperDragTest/SwiperDrag0260.test';
import SwiperDrag0270 from  './SwiperTest/SwiperDragTest/SwiperDrag0270.test';
import SwiperDrag0280 from  './SwiperTest/SwiperDragTest/SwiperDrag0280.test';
import SwiperDrag0300 from  './SwiperTest/SwiperDragTest/SwiperDrag0300.test';
import SwiperDrag0310 from  './SwiperTest/SwiperDragTest/SwiperDrag0310.test';
import UIComponentScrollSwiperDisplaycount0200
  from './SwiperTest/UIComponentScrollSwiperDisplaycountTest/UIComponentScrollSwiperDisplaycount0200.test';
import UIComponentScrollSwiperDisplaycount0210
  from './SwiperTest/UIComponentScrollSwiperDisplaycountTest/UIComponentScrollSwiperDisplaycount0210.test';
import UIComponentScrollSwiperAnimated0260
  from './SwiperTest/UIComponentScrollSwiperAnimatedTest/UIComponentScrollSwiperAnimated0260.test';
import interceptSwiperTest from './SwiperTest/interceptSwiperTest.test'; 
import swiperModeTest from './SwiperTest/swiperModeTest.test';
import swiperPageMode from './SwiperTest/swiperPageMode.test'; 
import SwiperChangeIndexTest from './SwiperTest/SwiperChangeIndex.test';
import SwiperOnSelected from './SwiperTest/SwiperOnSelected.test'
import preloadSwiper from './SwiperTest/preloadSwiper.test'; 
import selectedSwiper from './SwiperTest/selectedSwiper.test'; 
import SwiperIndicatorDistanceTest from './SwiperTest/SwiperIndicatorDistanceTest.test';
import maintainPosition from './SwiperTest/maintainPosition.test';
import stateChange from './SwiperTest/stateChange.test';
import arcDotIndicator from './ArcSwiperTest/arcDotIndicator.test';
import arcSwiperEvent from './ArcSwiperTest/arcSwiperEvent.test';
import arcSwiperShow from './ArcSwiperTest/arcSwiperShow.test';
import arcSwiperContent from './ArcSwiperTest/arcSwiperContent.test';
import SwiperContentUpdateOne from './SwiperTest/SwiperContentUpdate/SwiperContentUpdateOne.test';
import SwiperContentUpdateTwo from './SwiperTest/SwiperContentUpdate/SwiperContentUpdateTwo.test';

export default function testsuite() {
  Swiper07Test();
  swiperJsunit();
  SwiperMarginTest();
  SwiperLoop();
  SwiperVisibility();
  swiper1();
  swiper2();
  swiperWidthTest();
  swiperGroupTest();
  swiperPageTest();
  swiperNextPreTest();
  swiperDelAddTest();
  swiperEdgeTest();
  swipeleftScrollTest();
  swiperRightScrollTest();
  swiperTest();
  swiperTest_1();
  swiperSecTest();
  swiperJsunit2();
  swiperIndex();
  swiperVertical();
  swiperLoopTrue();
  swiperLoopFalse();
  swiperItemSpace();
  swiperPadding();
  swiperMargin();
  swiperMarPad();
  swiperDisableSwipeTrue();
  swiperDisableSwipeFalse();
  swiperItemSize();
  swiperItemSize2();
  swiperItemPadding();
  swiperItemMargin();
  swiperItemPadMar();
  swiperItemVisibility();
  SwiperMinSize();
  SwiperNextPrevMarginAddJsunit();
  swiperAnimationJsunit();
  swiperMaskJsunit();
  swiperCurveJsunit();
  swiperCustomJsunit();
  nestedScrollSwiper();
  finishTransSwiper();
  SwiperApi();
  swiperCountJsunit();
  SyncTypeNull();
  swiperSyncType();
  SwiperAttribute_1();
  SwiperAttribute_2();
  SwiperAttribute_3();
  SwiperAttribute_4();
  SwiperAttribute_5();
  SwiperAttribute_6();
  SwiperAttribute_7();
  SwiperAttribute_8();
  SwiperAttribute_9();
  SwiperMargin_1();
  SwiperMargin_2();
  SwiperMargin_3();
  SwiperMargin_4();
  SwiperAutoPlay_1();
  SwiperAutoPlay_2();
  SwiperDisplayCount();
  SwiperLoopFalse();
  swiperLoops();
  SwiperImplicitanimation0050();
  SwiperImplicitanimation0010();
  SwiperImplicitanimation0020();
  SwiperImplicitanimation0030();
  SwiperImplicitanimation0060();
  SwiperImplicitanimation0070();
  SwiperAcross0300();
  SwiperInterfaceMix0220();
  SwiperMirroring0010();
  SwiperAdd0510();
  SwiperInterface01();
  SwiperInterface02();
  SwiperInterface03();
  SwiperInterface1570();
  SwiperDrag0710();
  SwiperDrag0230();
  SwiperDrag0240();
  SwiperDrag0250();
  SwiperDrag0260();
  SwiperDrag0270();
  SwiperDrag0280();
  SwiperDrag0300();
  SwiperDrag0310();
  UIComponentScrollSwiperDisplaycount0200();
  UIComponentScrollSwiperDisplaycount0210();
  UIComponentScrollSwiperAnimated0260();
  interceptSwiperTest();
  swiperModeTest();
  swiperPageMode();
  SwiperChangeIndexTest();
  SwiperOnSelected();
  preloadSwiper();
  selectedSwiper();
  SwiperIndicatorDistanceTest();
  maintainPosition();
  stateChange();
  arcDotIndicator();
  arcSwiperEvent();
  arcSwiperShow();
  arcSwiperContent();
  SwiperContentUpdateOne();
  SwiperContentUpdateTwo();
} 