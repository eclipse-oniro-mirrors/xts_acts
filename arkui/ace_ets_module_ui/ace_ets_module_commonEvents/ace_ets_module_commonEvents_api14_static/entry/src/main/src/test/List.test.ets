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

import unicodeTest from './onKeyEventTest/UniCode1.test';
import defaultFocus from './FocusView/DefaultFocus1.test';
import tabStopApiTest from './tabStopApiTest/TabStopApiTest1.test';
import TapGestureAllowedTypesTest from './GestureAllowedTypes/TapGestureAllowedTypesTest.test';
import LongPressGestureAllowedTypesTest from './GestureAllowedTypes/LongPressGestureAllowedTypesTest.test';
import PinchGestureAllowedTypesTest from './GestureAllowedTypes/PinchGestureAllowedTypesTest.test';
import PanGestureAllowedTypesTest from './GestureAllowedTypes/PanGestureAllowedTypesTest.test';
import RotationGestureAllowedTypesTest from './GestureAllowedTypes/RotationGestureAllowedTypesTest.test';
import SwipeGestureAllowedTypesTest from './GestureAllowedTypes/SwipeGestureAllowedTypesTest.test';
import TapGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/TapGestureHandlerAllowedTypesTest.test';
import LongPressGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/LongPressGestureHandlerAllowedTypesTest.test';
import PinchGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/PinchGestureHandlerAllowedTypesTest.test';
export default function testsuite() {
  unicodeTest();
  defaultFocus();
  tabStopApiTest();
  TapGestureAllowedTypesTest();
  LongPressGestureAllowedTypesTest();
  PinchGestureAllowedTypesTest();
  PanGestureAllowedTypesTest();
  RotationGestureAllowedTypesTest();
  SwipeGestureAllowedTypesTest();
  TapGestureHandlerAllowedTypesTest();
  LongPressGestureHandlerAllowedTypesTest();
  PinchGestureHandlerAllowedTypesTest();
}