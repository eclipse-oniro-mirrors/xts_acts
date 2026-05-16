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

import GesturePanGesture from './onGestureJudgeBeginTest/GesturePanGesture.test'
import GestureClick from './onGestureJudgeBeginTest/GestureClick.test'
import GestureContiune from './onGestureJudgeBeginTest/GestureContiune.test'
import GestureDrag from './onGestureJudgeBeginTest/GestureDrag.test'
import GestureIsSystemGesture from './onGestureJudgeBeginTest/GestureIsSystemGesture.test'
import GesturePinchGesture from './onGestureJudgeBeginTest/GesturePinchGesture.test'
import GestureReject from './onGestureJudgeBeginTest/GestureReject.test'
import GestureRotationGesture from './onGestureJudgeBeginTest/GestureRotationGesture.test'
import GestureSwipeGesture from './onGestureJudgeBeginTest/GestureSwipeGesture.test'
import GestureTap from './onGestureJudgeBeginTest/GestureTap.test'
import GestureTapGesture from './onGestureJudgeBeginTest/GestureTapGesture.test'
import GestureLongPressGesture from './onGestureJudgeBeginTest/GestureLongPressGesture.test'
import GestureModeJsunit from './onGestureJudgeBeginTest/GestureModeJsunit.test';
import btnMonoLongPress from './customGestureTest/btnMonoLongPress.test'
import btnMonoTouch from './customGestureTest/btnMonoTouch.test'
import gestureDefine1 from './customGestureTest/gestureClick.test'
import gestureDefine2 from './customGestureTest/buttonDragStart.test'
import gestureDefine3 from './customGestureTest/dragIsSystem.test'
import gestureDefine4 from './customGestureTest/clickIsSystem.test'
import GestureRecognizerState from './GestureRecognizer/GestureRecognizerState.test';
import gestureDefine10 from './GestureRecognizer/GestureRecognizerIsValid.test'
import APIshouldBuiltInRecognizerParallelWith from './APIshouldBuiltInRecognizerParallelWith.test';
import LongPressRecognizer from './GestureRecognizer/LongPressRecognizer.test';
import PanRecognizer from './GestureRecognizer/PanRecognizer.test';
import PinchRecognizer from './GestureRecognizer/PinchRecognizer.test';
import RotationRecognizer from './GestureRecognizer/RotationRecognizer.test';
import SwipeRecognizer from './GestureRecognizer/SwipeRecognizer.test';
import TapRecognizer from './GestureRecognizer/TapRecognizer.test';
import onTouchTestDoneTest from './GestureRecognizerTest/onTouchTestDone.test';

export default function testsuite() {
  GestureClick();
  GestureContiune();
  GestureDrag();
  GestureIsSystemGesture();
  GesturePinchGesture();
  GestureReject();
  GestureRotationGesture();
  GestureSwipeGesture();
  GestureTap();
  GestureTapGesture();
  GestureLongPressGesture();
  GestureModeJsunit()
  GesturePanGesture();

  btnMonoLongPress();
  btnMonoTouch();
  gestureDefine1();
  gestureDefine2();
  gestureDefine3();
  gestureDefine4();
  GestureRecognizerState();
  gestureDefine10();
  APIshouldBuiltInRecognizerParallelWith();
  LongPressRecognizer();
  PanRecognizer();
  PinchRecognizer();
  RotationRecognizer();
  SwipeRecognizer();
  TapRecognizer();
  onTouchTestDoneTest();
}