/*
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
import AreaChangeErrorCodeTest from './onAreaChange/AreaChangeErrorCodeTest.test'
import ScrollWithMouseTest from "./scroll/scrollWithMouseTest.test";
import AutoAdjustMarginTest from "./scroll/autoAdjustMarginTest.test";
import ListBackBehaviorTest from "./list/listBackBehaviorTest.test";
import RegisterCommonAreaApproximateChangeEventTest from './onAreaChange/RegisterCommonAreaApproximateChangeEventTest.test'
import UnregisterCommonAreaApproximateChangeEventTest from './onAreaChange/UnregisterCommonAreaApproximateChangeEventTest.test'
import OrphanCharOptimizationTest from './orphanCharOptimization/orphanCharOptimizationTest.test'
import GestureInterceptTest from './gestureIntercept/GestureInterceptTest.test'
import gestureErrorCodeTest from './gestureIntercept/GestureErrorCodeTest.test'
import passThroughTest from './passThrough/PassThroughTest.test'
import GetSizeLimitationTest from './getSizeLimitation/GetSizeLimitationTest.test'
import InspectorLabelTest from './inspectorLabel/InspectorLabelTest.test'
import AccessibilityFocusIdTest from './accessibilityFocusId/AccessibilityFocusIdTest.test'

export default function testsuite() {
  RegisterCommonAreaApproximateChangeEventTest();
  UnregisterCommonAreaApproximateChangeEventTest();
  AreaChangeErrorCodeTest();
  ScrollWithMouseTest();
  AutoAdjustMarginTest();
  ListBackBehaviorTest();
  OrphanCharOptimizationTest();
  passThroughTest();
  gestureErrorCodeTest();
  GestureInterceptTest();
  GetSizeLimitationTest();
  InspectorLabelTest();
  AccessibilityFocusIdTest();
}