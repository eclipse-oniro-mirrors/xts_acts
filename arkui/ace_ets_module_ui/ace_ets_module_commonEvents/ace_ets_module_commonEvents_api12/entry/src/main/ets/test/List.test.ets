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
import ShortcutKeyDPADDOWNTest from './keyboardShortcutTest/ShortcutKeyDPADDOWNTest.test';
import ShortcutKeyDPADLEFTTest from './keyboardShortcutTest/ShortcutKeyDPADLEFTTest.test';
import ShortcutKeyDPADRIGHTTest from './keyboardShortcutTest/ShortcutKeyDPADRIGHTTest.test';
import TapGestureHandlerTest from './GestureHandler/TapGesture.test';
import PanGestureHandlerTest from './GestureHandler/PanGesture.test';

import PinchGestureHandlerTest from './GestureHandler/PinchGesture.test';
import RotationGestureHandlerTest from './GestureHandler/RotationGesture.test';
import LongPressGestureHandlerTest from './GestureHandler/LongPressGesture.test';
import DragInteractionOptionsTest from './DragController/DragInteractionOptions.test';
import SourceToolTest from './GestureHandler/SourceTool.test';
import initializeModifierTest from './AttributeUpdater/initializeModifier.test';
import addParallelGestureTest1 from './GestureHandler/addParallelGestureTest1.test';

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

import PanGestureExample03Test from './PanGesture/PanGestureExample03Test.test';

import RotationGestureBasic01Test from './RotationGesture/RotationGestureBasic01Test.test';
import RotationGestureBasic02Test from './RotationGesture/RotationGestureBasic02Test.test';
import PinchGestureBasic01Test from './PinchGesture/PinchGestureBasic01Test.test';
import PinchGestureBasic02Test from './PinchGesture/PinchGestureBasic02Test.test';
import PanGestureExampleTemplateTest from './PanGesture/PanGestureExampleTemplateTest.test';
import TapGestureTemplateTest from './TapGesture/TapGestureTemplateTest.test';
import LongPressGestureTemplateTest from './LongPressGesture/LongPressGestureTemplateTest.test';




import onAttachTest from './onAttachTest/onAttach.test';
import GestureRecognizerState from './GestureRecognizer/GestureRecognizerState.test';
import APIshouldBuiltInRecognizerParallelWith from './APIshouldBuiltInRecognizerParallelWith.test';
import typeNodeGestureTest from './PanGesture/Gesture.test';

import btnMonoLongPress from './customGestureTest/btnMonoLongPress.test'
import btnMonoTouch from './customGestureTest/btnMonoTouch.test'

import gestureDefine1 from './customGestureTest/gestureClick.test'
import gestureDefine2 from './customGestureTest/buttonDragStart.test'
import gestureDefine3 from './customGestureTest/dragIsSystem.test'
import gestureDefine4 from './customGestureTest/clickIsSystem.test'

import gestureDefine10 from './GestureRecognizer/GestureRecognizerIsValid.test'


export default function testsuite() {
  APIPreDragStatusTest();
  APIshouldBuiltInRecognizerParallelWith();
  addGestureApplyGesture();
  ShortcutKeyTABTest();
  ShortcutKeyDPADUPTest();
  ShortcutKeyDPADDOWNTest();
  ShortcutKeyDPADLEFTTest();
  ShortcutKeyDPADRIGHTTest();
  TapGestureHandlerTest();
  PanGestureHandlerTest();
  PinchGestureHandlerTest();
  RotationGestureHandlerTest();
  LongPressGestureHandlerTest();
  DragInteractionOptionsTest();
  SourceToolTest();
  initializeModifierTest();
  addParallelGestureTest1();
  clearGestureTest();
  
  getModifierKeyStateTest();
  TapGestureBasicClickTest();
  TapGestureBasicDoubleClickTest();
  LongPressGestureLongClickTest();
  TapGestureBasicClickMouseTest();
  TapGestureBasicDoubleClickMouseTest();
  LongPressGestureLongClickMouseTest();
  PanGestureExample01Test();
  PanGestureExample02Test();
  PanGestureExample03Test();
  RotationGestureBasic01Test();
  RotationGestureBasic02Test();
  PinchGestureBasic01Test();
  PinchGestureBasic02Test();
  PanGestureExampleTemplateTest();
  TapGestureTemplateTest();
  LongPressGestureTemplateTest();
  
  
  
  
  onAttachTest();
  GestureRecognizerState();
  typeNodeGestureTest(); 
  btnMonoLongPress();
  btnMonoTouch();
  gestureDefine1();
  gestureDefine2();
  gestureDefine3();
  gestureDefine4();
  gestureDefine10();
  
  

}