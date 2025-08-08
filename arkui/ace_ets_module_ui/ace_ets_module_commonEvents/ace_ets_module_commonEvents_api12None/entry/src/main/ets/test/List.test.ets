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
import UIContextDragControllerTest from './DragController/UIContextDragController.test';
import SwipeGestureExample03Test from './SwipeGesture/SwipeGestureExample03Test.test';

import tapGestureAddInterfaceTest from './tapGestureAddInterface/tapGestureAddInterfaceTest.test';

import columnMonopolize from './customGestureTest/columnMonopolize.test'
import columnMonopolizeFalse from './customGestureTest/columnMonopolizeFalse.test'
import listMonopolize from './customGestureTest/listMonopolize.test'
import gestureDefine6 from './customGestureTest/gestureParallel.test';
import SwiperGestureHandlerTest from './GestureHandler/SwiperGesture.test';
import SwipeGestureExample01Test from './SwipeGesture/SwipeGestureExample01Test.test';
import SwipeGestureExample02Test from './SwipeGesture/SwipeGestureExample02Test.test';
import onKeyPreImeTest from './onKeyEventTest/onKeyPreIme.test';
import SwipeGestureTemplateTest from './SwipeGesture/SwipeGestureTemplateTest.test';
import PanGestureUpdateTest from './PanGesture/PanGestureUpdateTest.test';
import PinchGestureUpdateTest from './PinchGesture/PinchGestureUpdateTest.test';
import RotationGestureUpdateTest from './RotationGesture/RotationGestureUpdateTest.test';


export default function testsuite() {
  UIContextDragControllerTest();
  tapGestureAddInterfaceTest();
  
  columnMonopolize();
  columnMonopolizeFalse();
  listMonopolize();
  
  gestureDefine6();
  SwiperGestureHandlerTest();
  SwipeGestureExample03Test();
  SwipeGestureExample02Test();
  SwipeGestureExample01Test();
  onKeyPreImeTest();
  SwipeGestureTemplateTest();
  PanGestureUpdateTest();
  PinchGestureUpdateTest();
  RotationGestureUpdateTest();


}