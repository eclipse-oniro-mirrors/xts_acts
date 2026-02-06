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

import onVisiable from './onVisiable/onVisiable.test';
import panGestureOnOffTest from './PanGesture/panGestureOnOff.test';
import panGestureDistanceTest from './PanGesture/panGestureDistance.test';
import InteractionEventBindingInfoTest from './InteractionEventBindingInfo/InteractionEventBindingInfo.test';
import PreDrag from './Drag/PreDrag.test';
import enableEdgeAutoScroll_false from './DragInteractionOptions/enableEdgeAutoScroll_false.test';
import enableEdgeAutoScroll_true from './DragInteractionOptions/enableEdgeAutoScroll_true.test';
import enableEdgeAutoScroll from './DragInteractionOptions/enableEdgeAutoScroll.test';
import nextFocus from './nextFocus/nextFocus.test';
import nextFocus2 from './nextFocus2/nextFocus2.test';
import notifyDragStartRequest from './Drag/notifyDragStartRequest.test';
import UIObserverEvent from './ListeningEvent/UIObserverEvent.test';
import LongPressRecognizer from './GestureRecognizer/LongPressRecognizer.test';
import PanRecognizer from './GestureRecognizer/PanRecognizer.test';
import PinchRecognizer from './GestureRecognizer/PinchRecognizer.test';
import RotationRecognizer from './GestureRecognizer/RotationRecognizer.test';
import SwipeRecognizer from './GestureRecognizer/SwipeRecognizer.test';
import TapRecognizer from './GestureRecognizer/TapRecognizer.test';
import onVisibleTest from "./onVisiable/onVisibleAreaApproximateChange.test";
import RequestFocusTest from "./Focus/requestFocus.test";

export default function testsuite() {
  onVisiable();
  panGestureOnOffTest();
  panGestureDistanceTest();
  InteractionEventBindingInfoTest();
  PreDrag();
  enableEdgeAutoScroll_false();
  enableEdgeAutoScroll_true();
  enableEdgeAutoScroll();
  nextFocus();
  nextFocus2();
  notifyDragStartRequest()
  UIObserverEvent()
  LongPressRecognizer();
  PanRecognizer();
  PinchRecognizer();
  RotationRecognizer();
  SwipeRecognizer();
  TapRecognizer();
  onVisibleTest();
  RequestFocusTest();
}