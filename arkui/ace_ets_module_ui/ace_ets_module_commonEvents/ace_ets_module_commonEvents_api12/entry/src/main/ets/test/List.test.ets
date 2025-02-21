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
import APIPreDragStatusTest from './DragController/APIPreDragStatusTest.test';
import addGestureApplyGesture from './addGestureApplyGesture.test';
import ShortcutKeyTABTest from './keyboardShortcutTest/ShortcutKeyTABTest.test';
import ShortcutKeyDPADUPTest from './keyboardShortcutTest/ShortcutKeyDPADUPTest.test';
import gestureDefine10 from './GestureRecognizer/GestureRecognizerIsValid.test';
import ShortcutKeyDPADDOWNTest from './keyboardShortcutTest/ShortcutKeyDPADDOWNTest.test';
import ShortcutKeyDPADLEFTTest from './keyboardShortcutTest/ShortcutKeyDPADLEFTTest.test';
import ShortcutKeyDPADRIGHTTest from './keyboardShortcutTest/ShortcutKeyDPADRIGHTTest.test';
import TapGestureHandlerTest from './GestureHandler/TapGesture.test';
import PanGestureHandlerTest from './GestureHandler/PanGesture.test';
import SwiperGestureHandlerTest from './GestureHandler/SwiperGesture.test';
import PinchGestureHandlerTest from './GestureHandler/PinchGesture.test';
import RotationGestureHandlerTest from './GestureHandler/RotationGesture.test';
import LongPressGestureHandlerTest from './GestureHandler/LongPressGesture.test';
import DragInteractionOptionsTest from './DragController/DragInteractionOptions.test';
import SourceToolTest from './GestureHandler/SourceTool.test';
import initializeModifierTest from './AttributeUpdater/initializeModifier.test';
import addParallelGestureTest1 from './GestureHandler/addParallelGestureTest1.test';
import onKeyPreImeTest from './onKeyEventTest/onKeyPreIme.test';
import getModifierKeyStateTest from './onKeyEventTest/getModifierKeyState.test';
import clearGestureTest from './GestureHandler/clearGesture.test';
import TapGestureBasicClickTest from './TapGesture/TapGestureBasicClickTest.test';
import TapGestureBasicDoubleClickTest from './TapGesture/TapGestureBasicDoubleClickTest.test';
import LongPressGestureLongClickTest from './LongPressGesture/LongPressGestureLongClickTest.test';
import TapGestureBasicClickMouseTest from './TapGesture/TapGestureBasicClickMouseTest.test';
import TapGestureBasicDoubleClickMouseTest from './TapGesture/TapGestureBasicDoubleClickMouseTest.test';
import LongPressGestureLongClickMouseTest from './LongPressGesture/LongPressGestureLongClickMouseTest.test';
import PanGestureExample01Test from './PanGesture/PanGestureExample01Test.test';
import PanGestureExample02Test from './PanGesture/PanGestureExample02Test.test';
import SwipeGestureExample01Test from './SwipeGesture/SwipeGestureExample01Test.test';
import SwipeGestureExample02Test from './SwipeGesture/SwipeGestureExample02Test.test';
import PanGestureExample03Test from './PanGesture/PanGestureExample03Test.test';
import SwipeGestureExample03Test from './SwipeGesture/SwipeGestureExample03Test.test';
import RotationGestureBasic01Test from './RotationGesture/RotationGestureBasic01Test.test';
import RotationGestureBasic02Test from './RotationGesture/RotationGestureBasic02Test.test';
import PinchGestureBasic01Test from './PinchGesture/PinchGestureBasic01Test.test';
import PinchGestureBasic02Test from './PinchGesture/PinchGestureBasic02Test.test';
import PanGestureExampleTemplateTest from './PanGesture/PanGestureExampleTemplateTest.test';
import TapGestureTemplateTest from './TapGesture/TapGestureTemplateTest.test';
import LongPressGestureTemplateTest from './LongPressGesture/LongPressGestureTemplateTest.test';
import SwipeGestureTemplateTest from './SwipeGesture/SwipeGestureTemplateTest.test';
import PanGestureUpdateTest from './PanGesture/PanGestureUpdateTest.test';
import PinchGestureUpdateTest from './PinchGesture/PinchGestureUpdateTest.test';
import RotationGestureUpdateTest from './RotationGesture/RotationGestureUpdateTest.test';
import onAttachTest from './onAttachTest/onAttach.test';
import GestureRecognizerState from './GestureRecognizer/GestureRecognizerState.test';
import APIshouldBuiltInRecognizerParallelWith from './APIshouldBuiltInRecognizerParallelWith.test';
import typeNodeGestureTest from './PanGesture/Gesture.test';
import UIContextDragControllerTest from './DragController/UIContextDragController.test';



import tapGestureAddInterfaceTest from './tapGestureAddInterface/tapGestureAddInterfaceTest.test';


export default function testsuite() {
  APIshouldBuiltInRecognizerParallelWith();
  APIPreDragStatusTest();
  addGestureApplyGesture();
  ShortcutKeyTABTest();
  ShortcutKeyDPADUPTest();
  gestureDefine10();
  ShortcutKeyDPADDOWNTest();
  ShortcutKeyDPADLEFTTest();
  ShortcutKeyDPADRIGHTTest();
  TapGestureHandlerTest();
  PanGestureHandlerTest();
  SwiperGestureHandlerTest();
  PinchGestureHandlerTest();
  RotationGestureHandlerTest();
  LongPressGestureHandlerTest();
  DragInteractionOptionsTest();
  SourceToolTest();
  initializeModifierTest();
  addParallelGestureTest1();
  clearGestureTest();
  onKeyPreImeTest();
  getModifierKeyStateTest();
  TapGestureBasicClickTest();
  TapGestureBasicDoubleClickTest();
  LongPressGestureLongClickTest();
  TapGestureBasicClickMouseTest();
  TapGestureBasicDoubleClickMouseTest();
  LongPressGestureLongClickMouseTest();
  PanGestureExample01Test();
  PanGestureExample02Test();
  SwipeGestureExample01Test();
  PanGestureExample03Test();
  SwipeGestureExample03Test();
  SwipeGestureExample02Test();
  RotationGestureBasic01Test();
  RotationGestureBasic02Test();
  PinchGestureBasic01Test();
  PinchGestureBasic02Test();
  PanGestureExampleTemplateTest();
  TapGestureTemplateTest();
  LongPressGestureTemplateTest();
  SwipeGestureTemplateTest();
  PanGestureUpdateTest();
  PinchGestureUpdateTest();
  RotationGestureUpdateTest();
  onAttachTest();
  GestureRecognizerState();
  typeNodeGestureTest();
  UIContextDragControllerTest();




  

  tapGestureAddInterfaceTest();



}