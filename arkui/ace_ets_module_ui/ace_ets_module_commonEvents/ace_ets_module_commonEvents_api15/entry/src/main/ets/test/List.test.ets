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

import getWithUniqueId from './ComponentSnapshotByUniqueId/getWithUniqueId.test';
import keyEventDispatchTest from './keyEventDispatchTest/keyEventDispatchone.test';
import keyEventDispatchTest2 from './keyEventDispatchTest/keyEventDispatchtwo.test';
import keyEventDispatchTest3 from './keyEventDispatchTest/keyEventDispatchthree.test';
import keyEventDispatchTest4 from './keyEventDispatchTest/keyEventDispatchfour.test';
import keyEventDispatchTest5 from './keyEventDispatchTest/keyEventDispatchfive.test';
import keyEventDispatchTest6 from './keyEventDispatchTest/keyEventDispatchsix.test';
import onKeyEventDispatchTest from './keyEventDispatchTest/onKeyEventDispatchone.test';
import onKeyEventDispatchTest3 from './keyEventDispatchTest/onkeyEventDispatchthree.test';
import onkeyEventDispatchTest4 from './keyEventDispatchTest/onkeyEventDispatchfour.test';
import onkeyEventDispatchTest6 from './keyEventDispatchTest/onkeyEventDispatchsix.test';
import onkeyEventDispatchTest7 from './keyEventDispatchTest/onkeyEventDispatchseven.test';
import onkeyEventDispatchTest8 from './keyEventDispatchTest/onkeyEventDispatcheight.test';
import GetChangedPointerId from './GetChangedPointerId/GetChangedPointerId.test';
import componentSnapshot from './componentSnapshot/componentSnapshot.test';
import longpressGestureTest from './isFingerCountLimited/LongPressGesture.test';
import panGestureTest from './isFingerCountLimited/PanGesture.test';
import pinchGestureTest from './isFingerCountLimited/PinchGesture.test';
import rotationGestureTest from './isFingerCountLimited/RotationGesture.test';
import swipeGestureTest from './isFingerCountLimited/SwipeGesture.test';
import tapGestureTest from './isFingerCountLimited/TapGesture.test';
import SnapshotOptions_region from './SnapshotOptions_region/SnapshotOptions_region.test';
import setKeyProcessingModeTest from './setKeyProcessingModeTest/setKeyProcessingModeTest.test';
import mouseEventTest from './EventItem/Mouse.test';
import touchEventTest from './EventItem/Touch.test';
import tapGestureEventTest from './EventItem/TapGesture.test';
import swipeGestureEventTest from './EventItem/SwipeGesture.test';
import longPressEventTest from './EventItem/LongPressGesture.test';
import panGestureEventTest from './EventItem/PanGesture.test';
import pinchGestureEventTest from './EventItem/PinchGesture.test';
import rotationGestureEventTest from './EventItem/RotationGesture.test';
import dataLoadingTest from './startDataLoading/dataLoadingTest.test';
import DragPreviewOptions from './DragPreviewOptions/DragPreviewOptions.test';
import EventTarget_id from './EventTarget_id/EventTarget_id.test';
import textAreaInputTest from './TextAreaTest/textAreaInputTest.test';

export default function testsuite() {
  textAreaInputTest()
  getWithUniqueId();
  keyEventDispatchTest();
  keyEventDispatchTest2();
  keyEventDispatchTest3();
  keyEventDispatchTest4();
  keyEventDispatchTest5();
  keyEventDispatchTest6();
  onKeyEventDispatchTest();
  onKeyEventDispatchTest3();
  onkeyEventDispatchTest4();
  onkeyEventDispatchTest6();
  onkeyEventDispatchTest7();
  onkeyEventDispatchTest8();
  GetChangedPointerId();
  componentSnapshot();
  longpressGestureTest();
  panGestureTest();
  pinchGestureTest();
  rotationGestureTest();
  swipeGestureTest();
  tapGestureTest();
  SnapshotOptions_region();
  setKeyProcessingModeTest();
  mouseEventTest();
  touchEventTest();
  tapGestureEventTest();
  swipeGestureEventTest();
  longPressEventTest();
  panGestureEventTest();
  pinchGestureEventTest();
  rotationGestureEventTest();
  dataLoadingTest();
  DragPreviewOptions();
  EventTarget_id();
}