'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import DragControllerTest from './DragControllerTest/DragController.test';
import CommonEventGlobalDisplayTest from './CommonEventGlobalDisplayTest/CommonEventGlobalDisplay.test';
import CommonDragEventTest from './CommonDragEventTest/CommonDragEvent.test';
import CommonKeyEventTest from './CommonKeyEventTest/CommonKeyEvent.test';
import GestureStaticSuiteTest from './GestureStaticSuite/GestureStaticSuite.test';
import UIContextGestureTest from './UIContextGestureTest/UIContextGesture.test';
import UIContextUIObserverApiTest from './UIContextUIObserverApiTest/UIContextUIObserverApi.test';
import AutoHideComponentUniqueIdsTest from './autoHideComponentUniqueIds/AutoHideComponentUniqueIdsTest.test';
import getCurrentLocalPositionTest_ClickEvent from './getCurrentLocalPositionTest/getCurrentLocalPositionTest_ClickEvent.test';
import getCurrentLocalPositionTest_TouchEvent from './getCurrentLocalPositionTest/getCurrentLocalPositionTest_TouchEvent.test';
import getCurrentLocalPositionTest_MouseEvent from './getCurrentLocalPositionTest/getCurrentLocalPositionTest_MouseEvent.test';
import getCurrentLocalPositionTest_AxisEvent from './getCurrentLocalPositionTest/getCurrentLocalPositionTest_AxisEvent.test';
import getCurrentLocalPositionTest_EventLocationInfo from './getCurrentLocalPositionTest/getCurrentLocalPositionTest_EventLocationInfo.test';
import getCurrentLocalPositionTest_FingerInfo from './getCurrentLocalPositionTest/getCurrentLocalPositionTest_FingerInfo.test';
import expectedUpdateIntervalTest from './CommonEventOnAreaChangeTest/expectedUpdateInterval.test';
import gestureInterceptTest from './gestureIntercept/gestureInterceptTest.test';
import globalListenerTest from './globalListener/globalListenerTest.test';
import getHistoricalPoints from './getHistoricalPointsTest/getHistoricalPoints.test';
import getHistoricalPointsY from './getHistoricalPointsTest/getHistoricalPointsY.test';
import getHistoricalPoints_displayY from './getHistoricalPointsTest/getHistoricalPoints_displayY.test';
import getHistoricalPoints_displayX from './getHistoricalPointsTest/getHistoricalPoints_displayX.test';
import getHistoricalPoints_windowY from './getHistoricalPointsTest/getHistoricalPoints_windowY.test';
import getHistoricalPoints_windowX from './getHistoricalPointsTest/getHistoricalPoints_windowX.test';
import getHistoricalPoints_globalDisplayX from './getHistoricalPointsTest/getHistoricalPoints_globalDisplayX.test';
import getHistoricalPoints_globalDisplayY from './getHistoricalPointsTest/getHistoricalPoints_globalDisplayX.test';
import Marquee from './getHistoricalPointsTest/Marquee.test';
import getSizeLimitationTest from './getSizeLimitation/GetSizeLimitationTest.test';
import setCustomCursorundefined from './setCustomCursor/setCustomCursor_unedfined.test';
import setCustomCursor from './setCustomCursor/setCustomCursor.test';
import shouldRecognizerParallelWith from './shouldRecognizerParallelWith/shouldRecognizerParallelWith.test'

export default function testsuite() {
  getSizeLimitationTest();
  Marquee();
  DragControllerTest();
  CommonEventGlobalDisplayTest();
  CommonDragEventTest();
  CommonKeyEventTest();
  GestureStaticSuiteTest();
  UIContextGestureTest();
  UIContextUIObserverApiTest();
  AutoHideComponentUniqueIdsTest();
  getCurrentLocalPositionTest_ClickEvent();
  getCurrentLocalPositionTest_TouchEvent();
  getCurrentLocalPositionTest_MouseEvent();
  getCurrentLocalPositionTest_AxisEvent();
  getCurrentLocalPositionTest_EventLocationInfo();
  getCurrentLocalPositionTest_FingerInfo();
  expectedUpdateIntervalTest();
  gestureInterceptTest();
  globalListenerTest();
  getHistoricalPoints();
  getHistoricalPointsY();
  getHistoricalPoints_displayX();
  getHistoricalPoints_displayY();
  getHistoricalPoints_windowX();
  getHistoricalPoints_windowY();
  getHistoricalPoints_globalDisplayX();
  getHistoricalPoints_globalDisplayX();
  setCustomCursorundefined();
  setCustomCursor();
  shouldRecognizerParallelWith();
}