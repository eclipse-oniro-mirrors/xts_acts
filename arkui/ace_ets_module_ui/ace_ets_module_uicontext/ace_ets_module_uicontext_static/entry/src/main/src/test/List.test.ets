'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import OverlayManagerTest from './OverlayManagerTest/OverlayManager.test';
import MagnifierTest from './MagnifierTest/Magnifier.test';
import MeasureUtilsTest from './MeasureUtilsTest/MeasureUtils.test';
import ResolveStrategyTest from './ResolveStrategyTest/ResolveStrategy.test';
import ResolvedUIContextTest from './ResolvedUIContextTest/ResolvedUIContext.test';
import CustomKeyboardContinueFeatureTest from './CustomKeyboardContinueFeatureTest/CustomKeyboardContinueFeature.test';
import UIContextTest from './UIContextTest/UIContext.test';
import ArkuiObserverScrollEventTest from './ArkuiObserverScrollEventTest/ArkuiObserverScrollEvent.test';
import UIObserverTextChangeTest from './UIObserverTextChangeTest/UIObserverTextChange.test';
import UIContextStaticMethodsTest from './UIContextStaticMethodsTest/UIContextStaticMethods.test';
import GetWindowIdTest from './window/GetWindowIdTest.test';

export default function testsuite() {
  OverlayManagerTest();
  MagnifierTest();
  MeasureUtilsTest();
  ResolveStrategyTest();
  ResolvedUIContextTest();
  UIContextTest();
  CustomKeyboardContinueFeatureTest();
  ArkuiObserverScrollEventTest();
  UIObserverTextChangeTest();
  UIContextStaticMethodsTest();
  GetWindowIdTest();
}