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

import TapGestureHandlerTest from './GestureHandler/TapGesture.test';
import PanGestureHandlerTest from './GestureHandler/PanGesture.test';

import PinchGestureHandlerTest from './GestureHandler/PinchGesture.test';
import RotationGestureHandlerTest from './GestureHandler/RotationGesture.test';
import LongPressGestureHandlerTest from './GestureHandler/LongPressGesture.test';
import SourceToolTest from './GestureHandler/SourceTool.test';
import addParallelGestureTest1 from './GestureHandler/addParallelGestureTest1.test';
import clearGestureTest from './GestureHandler/clearGesture.test';
import TapGestureAllowedTypesTest from './GestureAllowedTypes/TapGestureAllowedTypesTest.test';
import LongPressGestureAllowedTypesTest from './GestureAllowedTypes/LongPressGestureAllowedTypesTest.test';
import PinchGestureAllowedTypesTest from './GestureAllowedTypes/PinchGestureAllowedTypesTest.test';
import PanGestureAllowedTypesTest from './GestureAllowedTypes/PanGestureAllowedTypesTest.test';
import RotationGestureAllowedTypesTest from './GestureAllowedTypes/RotationGestureAllowedTypesTest.test';
import SwipeGestureAllowedTypesTest from './GestureAllowedTypes/SwipeGestureAllowedTypesTest.test';
import TapGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/TapGestureHandlerAllowedTypesTest.test';
import LongPressGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/LongPressGestureHandlerAllowedTypesTest.test';
import PinchGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/PinchGestureHandlerAllowedTypesTest.test';
import mouseEventTest from './EventItem/Mouse.test';
import touchEventTest from './EventItem/Touch.test';
import tapGestureEventTest from './EventItem/TapGesture.test';
import swipeGestureEventTest from './EventItem/SwipeGesture.test';
import longPressEventTest from './EventItem/LongPressGesture.test';
import panGestureEventTest from './EventItem/PanGesture.test';
import pinchGestureEventTest from './EventItem/PinchGesture.test';
import rotationGestureEventTest from './EventItem/RotationGesture.test';
import longpressGestureTest from './isFingerCountLimited/LongPressGesture.test';
import panGestureTest from './isFingerCountLimited/PanGesture.test';
import pinchGestureTest from './isFingerCountLimited/PinchGesture.test';
import rotationGestureTest from './isFingerCountLimited/RotationGesture.test';
import swipeGestureTest from './isFingerCountLimited/SwipeGesture.test';
import tapGestureTest from './isFingerCountLimited/TapGesture.test';
import UIObserverEvent from './ListeningEvent/UIObserverEvent.test';
import distanceThresholdTest from './GestureHandler/TapGestureHandler_addTest/distanceThreshold.test';
import uIObserverClickNullUndefinedTest from './uIObserver/UIObserverClickNullUndefinedTest.test';
import uIObserverPanNullUndefinedTest from './uIObserver/UIObserverPanNullUndefinedTest.test';

export default function testsuite() {
  TapGestureHandlerTest();
  PanGestureHandlerTest();
  PinchGestureHandlerTest();
  RotationGestureHandlerTest();
  LongPressGestureHandlerTest();
  TapGestureAllowedTypesTest();
  LongPressGestureAllowedTypesTest();
  PinchGestureAllowedTypesTest();
  PanGestureAllowedTypesTest();
  RotationGestureAllowedTypesTest();
  SwipeGestureAllowedTypesTest();
  TapGestureHandlerAllowedTypesTest();
  LongPressGestureHandlerAllowedTypesTest();
  PinchGestureHandlerAllowedTypesTest();
  mouseEventTest();
  touchEventTest();
  tapGestureEventTest();
  swipeGestureEventTest();
  longPressEventTest();
  panGestureEventTest();
  pinchGestureEventTest();
  rotationGestureEventTest();
  longpressGestureTest();
  panGestureTest();
  pinchGestureTest();
  rotationGestureTest();
  swipeGestureTest();
  tapGestureTest();
  UIObserverEvent();
  distanceThresholdTest();
  uIObserverClickNullUndefinedTest();
  uIObserverPanNullUndefinedTest();
}