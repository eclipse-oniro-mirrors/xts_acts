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
import PanGesture1 from './PanGestureTest/PanGesture1.test'
import PanGesture2 from './PanGestureTest/PanGesture2.test'
import PanGesture3 from './PanGestureTest/PanGesture3.test'
import PanDirectionJsunit from './PanGestureTest/PanDirectionJsunit.test';
import gestureSetDirectionJsunit from './PanGestureTest/gesture.test';
import PanGestureEventJsunit from './PanGestureTest/PanGestureEventJsunit.test.ets';
import gestureEnabledJsunit from './PanGestureTest/gestureEnabledJsunit.test.ets'
import PanGesture3Jsunit from './PanGestureTest/PanGestureJsunit.test.ets';
import PanGestureExample01Test from './PanGesture/PanGestureExample01Test.test';
import PanGestureExample02Test from './PanGesture/PanGestureExample02Test.test';
import PanGestureExample03Test from './PanGesture/PanGestureExample03Test.test';
import PanGestureExampleTemplateTest from './PanGesture/PanGestureExampleTemplateTest.test';
import typeNodeGestureTest from './PanGesture/Gesture.test';
import panGestureOnOffTest from './PanGesture/panGestureOnOff.test';
import panGestureDistanceTest from './PanGesture/panGestureDistance.test';
import PanGestureTest from './PanGestureTest/observer.test';
import setDistanceTest from "./PanGesture/setDistance.test";

export default function testsuite() {
  PanGesture1();
  PanGesture2();
  PanGesture3();
  PanDirectionJsunit();
  PanGestureEventJsunit();
  gestureEnabledJsunit();
  PanGesture3Jsunit();
  PanGestureExample01Test();
  PanGestureExample02Test();
  PanGestureExample03Test();
  PanGestureExampleTemplateTest();
  typeNodeGestureTest();
  panGestureOnOffTest();
  panGestureDistanceTest();
  PanGestureTest();
  // gestureSetDirectionJsunit();
  setDistanceTest();
}