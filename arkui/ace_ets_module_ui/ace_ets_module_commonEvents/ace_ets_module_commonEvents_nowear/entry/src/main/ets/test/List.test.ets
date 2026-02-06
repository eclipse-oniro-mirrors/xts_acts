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

import PanGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/PanGestureHandlerAllowedTypesTest.test';
import RotationGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/RotationGestureHandlerAllowedTypesTest.test';
import SwipeGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/SwipeGestureHandlerAllowedTypesTest.test';
import FrameNodeTest from './frameNode/framenode.test';
import ClickRecognizerTest from "./GestureRecognizer/ClickRecognizer.test";
import DragRecognizerTest from "./GestureRecognizer/DragRecognizer.test";
import IsvalidRecognizerTest from "./GestureRecognizer/IsvalidRecognizer.test";
import LongPressRecognizerTest from "./GestureRecognizer/LongPressRecognizer.test";
import PanRecognizerTest from "./GestureRecognizer/PanRecognizer.test";
import PinchRecognizerTest from "./GestureRecognizer/PinchRecognizer.test";
import rotationGestureTest from "./GestureRecognizer/RotationRecognizer.test";
import SwipeRecognizerTest from "./GestureRecognizer/SwipeRecognizer.test";
import TapRecognizerTest from "./GestureRecognizer/TapRecognizer.test";
import ToolBarItemTest from './toolbar/ToolBarItem.test';
import setCursorTest from './cursorControlTest/setCursorTest.test';
import onKeyPreImeTest from './onKeyEventTest/onKeyPreIme.test';
import SwipeGestureTemplateTest from './SwipeGesture/SwipeGestureTemplateTest.test';
import PanGestureUpdateTest from './PanGesture/PanGestureUpdateTest.test';
import PinchGestureUpdateTest from './PinchGesture/PinchGestureUpdateTest.test';
import RotationGestureUpdateTest from './RotationGesture/RotationGestureUpdateTest.test';
import SwipeGestureExample03Test from './SwipeGesture/SwipeGestureExample03Test.test';

import tapGestureAddInterfaceTest from './tapGestureAddInterface/tapGestureAddInterfaceTest.test';

import columnMonopolize from './customGestureTest/columnMonopolize.test'
import columnMonopolizeFalse from './customGestureTest/columnMonopolizeFalse.test'
import listMonopolize from './customGestureTest/listMonopolize.test'
import gestureDefine6 from './customGestureTest/gestureParallel.test';
import SwipeGestureExample01Test from './SwipeGesture/SwipeGestureExample01Test.test';
import SwipeGestureExample02Test from './SwipeGesture/SwipeGestureExample02Test.test';
import textAreaInputTest from './TextAreaTest/textAreaInputTest.test';

export default function testsuite() {
  textAreaInputTest()
  // FrameNodeTest();
  setCursorTest();
  tapGestureAddInterfaceTest();
  gestureDefine6();
  SwipeGestureExample03Test();
  SwipeGestureExample02Test();
  SwipeGestureExample01Test();
  SwipeGestureTemplateTest();
  PanGestureUpdateTest();
  PinchGestureUpdateTest();
  RotationGestureUpdateTest();
  onKeyPreImeTest();
  PanGestureHandlerAllowedTypesTest();
  RotationGestureHandlerAllowedTypesTest();
  SwipeGestureHandlerAllowedTypesTest();
  SwipeRecognizerTest();
  PanRecognizerTest();
  DragRecognizerTest();
  ClickRecognizerTest();
  LongPressRecognizerTest();
  PinchRecognizerTest();
  rotationGestureTest();
  TapRecognizerTest();
  IsvalidRecognizerTest();
  ToolBarItemTest();
  columnMonopolize();
  columnMonopolizeFalse();
  listMonopolize();
  gestureDefine6();
}