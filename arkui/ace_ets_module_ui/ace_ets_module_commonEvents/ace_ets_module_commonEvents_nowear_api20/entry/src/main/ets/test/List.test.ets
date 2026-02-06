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

import DragModifier from './DragEvent/DragModifier.test';
import normalDrag from './DragEvent/normalDrag.test';
import dragSpringLoading from './DragEvent/dragSpringLoading.test';
import enableInternalDropAnimation from './DragEvent/enableInternalDropAnimation.test';
import FrameNodeTest from './frameNode/framenode.test';
import isActive from './UIContext/isActive.test';
import ToolBarItemTest from './toolbar/ToolBarItem.test';
import ClickRecognizerTest from "./GestureRecognizer/ClickRecognizer.test";
import DragRecognizerTest from "./GestureRecognizer/DragRecognizer.test";
import IsvalidRecognizerTest from "./GestureRecognizer/IsvalidRecognizer.test";
import LongPressRecognizerTest from "./GestureRecognizer/LongPressRecognizer.test";
import PanRecognizerTest from "./GestureRecognizer/PanRecognizer.test";
import PinchRecognizerTest from "./GestureRecognizer/PinchRecognizer.test";
import rotationGestureTest from "./GestureRecognizer/RotationRecognizer.test";
import SwipeRecognizerTest from "./GestureRecognizer/SwipeRecognizer.test";
import TapRecognizerTest from "./GestureRecognizer/TapRecognizer.test";

export default function testsuite() {
  DragModifier();
  normalDrag();
  dragSpringLoading();
  enableInternalDropAnimation();
  FrameNodeTest();
  isActive();
  ToolBarItemTest();
  SwipeRecognizerTest();
  PanRecognizerTest();
  DragRecognizerTest();
  ClickRecognizerTest();
  LongPressRecognizerTest();
  PinchRecognizerTest();
  rotationGestureTest();
  TapRecognizerTest();
  IsvalidRecognizerTest();
}