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

export default function testsuite() {
  SwiperMarginTest();

  Swiper07Test();
  SwiperLoop()
  SwiperVisibility()
  swiper1()
  swiper2()
  swiperWidthTest()
  swiperGroupTest()
  swiperPageTest()
  swiperNextPreTest()

  swiperDelAddTest()
  swiperEdgeTest()
  swipeleftScrollTest()
  swiperRightScrollTest()
  swiperTest();
  swiperTest_1();
  swiperJsunit2();
  swiperIndex()
  swiperVertical()
  swiperLoopTrue()
  swiperLoopFalse()
  swiperItemSpace()
  swiperPadding()
  swiperMargin()
  swiperMarPad()
  swiperDisableSwipeTrue()
  swiperDisableSwipeFalse()
  swiperItemSize()

  swiperItemSize2()
  swiperItemPadding()

  swiperItemVisibility()
  SwiperMinSize();
  SwiperNextPrevMarginAddJsunit();
  swiperAnimationJsunit();
  swiperMaskJsunit()
  swiperJsunit();
  swiperCurveJsunit()
  swiperSecTest();
}