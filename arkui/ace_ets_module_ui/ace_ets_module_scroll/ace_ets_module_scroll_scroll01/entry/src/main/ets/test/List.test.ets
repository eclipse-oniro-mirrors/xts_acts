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

import OnScrollBeginJsunit from './Scroll/OnScrollBegin.test';
import ScrollAddJsunit from './Scroll/ScrollAddJsunit.test';
import APIScrollflingSpeedLimitJsunit from './Scroll/APIScrollflingSpeedLimitJsunit.test';
import TouchTestStrategy from './Scroll/TouchTestStrategy.test';
import ScrollTest from './Scroll/Scroll.test'
import ScrollTest2 from './Scroll/Scroll2.test'
import ScrollFrictionTest from './Scroll/ScrollFriction.test';
import ScrollAJsunit from './Scroll/ScrollAJsunit.test';
import scrollCodeJsunit from './Scroll/scrollCodeJsunit.test.ets';
import IsAtEndScroll from './Scroll/IsAtEndScroll.test';
import scrollOffsetJsunit from './scrollCallback/scrollOffsetJsunit.test';
import scrollerbarJsunit from './ScrollBar/ScrollerBarJsunit.test';
import ScrollBarJsunit from './ScrollBar/ScrollBarJsunit.test';
import scrollBarJsunitt from './ScrollBar/ScrollBarJsunitt.test';
import enableScrollJsunit from './ScrollBar/enableScrollJsunit.test';
import scrollSourceDrag from './ScrollSource/scrollSourceDrag.test';
import ScrollSourceOther from './ScrollSource/ScrollSourceOther.test';
import ScrollSource from './ScrollSource/ScrollSource.test';
import ScrollSourceBar from './ScrollSource/ScrollSourceBar.test';
import ScrollApi1 from './Scroll/ScrollApi1.test'
import scrollXOffsetJsunit from './Scroll/scrollXOffsetJsunit.test';
import scrollDidJsunit from './scrollCallback/scrollDidJsunit.test';
import scrollReachJsunit from './scrollCallback/scrollReachJsunit.test';
import ScrollFlingCallback from './Scroll/ScrollFlingCallback.test'
import ScrollEdgeCallbackJsunit from './Scroll/ScrollEdgeCallback.test.ets';
import offsetRemainScroll from './scrollCallback/offsetRemainScroll.test';
import scrollAniFalse from './scrollAnimation/scrollAniFalse.test';
import scrollAniUn from './scrollAnimation/scrollAniUn.test';
import scrollAniTrue from './scrollAnimation/scrollAniTrue.test';
import ScrollEffectEdge from './Scroll/ScrollEffectEdge.test'
import getAttributeScroll from './FrameNode/getAttributeScroll.test';
import setScrollEvent from './FrameNode/setScrollEvent.test';
import GetEventUn from './FrameNode/GetEventUn.test';
import scrollBarColor from './ScrollBar/scrollBarColor.test';
import barMarginScroll from './Scroll/barMarginScroll.test';
import canOverScroll from './Scroll/canOverScroll.test';
import scrollStopDrag from './Scroll/scrollStopDrag.test';
import zoomScaleScroll from './Scroll/zoomScaleScroll.test';
import zoomScaleNull from './Scroll/zoomScaleNull.test';
import scrollZoomModifier from './Scroll/scrollZoomModifier.test';
import scrollDraggingFling from './Scroll/scrollDraggingFling.test';
import scrollScrollbarColor from './Scroll/scrollScrollbarColor.test';
import ScrollContentSize from './Scroll/ScrollContentSize.test';
import scrollFlingMin from './Scroll/scrollFlingMin.test';
import scrollFrictionMin from './Scroll/scrollFrictionMin.test';
import scrollFrictionRes from './Scroll/scrollFrictionRes.test';
import scrollOffsetRes from './Scroll/scrollOffsetRes.test';
import scrollContentOffset from './Scroll/scrollContentOffset.test';
import currentScroll from './scrollCallback/currentScroll.test';

export default function testsuite() {
  OnScrollBeginJsunit()
  ScrollAddJsunit()
  APIScrollflingSpeedLimitJsunit()
  TouchTestStrategy()
  ScrollTest()
  ScrollTest2()
  ScrollFrictionTest()
  ScrollAJsunit()
  scrollCodeJsunit()
  IsAtEndScroll()
  scrollOffsetJsunit();
  scrollerbarJsunit()
  ScrollBarJsunit()
  scrollBarJsunitt()
  enableScrollJsunit()
  scrollSourceDrag()
  ScrollSourceOther()
  ScrollSource();
  ScrollSourceBar()
  ScrollApi1()
  scrollXOffsetJsunit();
  scrollDidJsunit()
  scrollReachJsunit()
  ScrollFlingCallback();
  ScrollEdgeCallbackJsunit()
  offsetRemainScroll()
  scrollAniFalse()
  scrollAniUn()
  scrollAniTrue()
  ScrollEffectEdge()
  getAttributeScroll()
  setScrollEvent()
  GetEventUn()
  scrollBarColor()
  barMarginScroll()
  canOverScroll()
  scrollStopDrag()
  zoomScaleScroll()
  zoomScaleNull()
  scrollZoomModifier()
  scrollDraggingFling()
  scrollScrollbarColor()
  ScrollContentSize()
  scrollFlingMin()
  scrollFrictionMin()
  scrollFrictionRes()
  scrollOffsetRes()
  scrollContentOffset()
  currentScroll()
}