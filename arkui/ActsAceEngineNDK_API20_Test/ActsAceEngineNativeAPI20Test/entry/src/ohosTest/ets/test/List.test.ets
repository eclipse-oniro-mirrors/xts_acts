/*
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

import NativeXComponent from './nativexcomponent/NativeXComponent.test'
import NodeAttribute from './nativexcomponent/NodeAttribute.test'
import TouchPointTest from './nativexcomponent/TouchPoint.test'
import XComponentMouseTest from './nativexcomponent/XComponentMouse.test'
import AccessibilityNdkTest1 from './accessibilitytest/AccessibilityTest1.test'
import AccessibilityNdkTest2 from './accessibilitytest/AccessibilityTest2.test'
import AccessibilityNdkTest3 from './accessibilitytest/AccessibilityTest3.test'
import AccessibilityNdkTest4 from './accessibilitytest/AccessibilityTest4.test'
import AccessibilityNdkTest5 from './accessibilitytest/AccessibilityTest5.test'
import AccessibilityNdkTest6 from './accessibilitytest/AccessibilityTest6.test'
import KeyframeAnimateTest from './animatetest/KeyframeAnimateTest.test'
import AnimatorOptionTest1 from './animatetest/AnimatorOptionTest1.test'
import AnimatorOptionTest2 from './animatetest/AnimatorOptionTest2.test'
import FocusControlTest from './foucscontroltest/FocusRequestTest.test'
import KeyEventTest from './keyeventtest/KeyEventTest.test'
import NodeEventTest from './nodeeventtest/NodeEventTest.test'
import NodeAdapterTest from './nodeadaptertest/NodeAdapterTest.test'
import NodeContentTest from './nodecontenttest/NodeContentTest.test'
import SnapShotTest from './snapshottest/SnapShotTest.test'
import RunTaskInscopeTest from './scopetest/RunTaskInScopeTest.test'
import NodeNapiTest from './nodenapitest/NodeNapiTest.test'
import NodeNapiTest1 from './nodenapitest/NodeNapiTest1.test'
import NodeNapiTest2 from './nodenapitest/NodeNapiTest2.test'
import NodeNapiTest3 from './nodenapitest/NodeNapiTest3.test'
import NodeNapiTest4 from './nodenapitest/NodeNapiTest4.test'
import NavigationTest from './nodenapitest/NavigationTest.test'
import NodeUtilsTest from './nodeutilstest/NodeUtilsTest.test'
import NodeUtilsTest1 from './nodeutilstest/NodeUtilsTest1.test'
import NodeUtilsTest2 from './nodeutilstest/NodeUtilsTest2.test'
import TextInputContentTypeTest from './textinputcontenttypetest/TextInputContentTypeTest.test'
import ScrollStateTest from './textinputcontenttypetest/scrollstateTest.test'
import AccessibilityTypeTest from './textinputcontenttypetest/accessilbiltytypeTest.test'
import NodeEventTypeTest from './textinputcontenttypetest/nodeeventtypeTest.test'
import NodeEventTypeTest1 from './textinputcontenttypetest/nodeeventtypeTest1.test'
import NodeEventTypeTest2 from './textinputcontenttypetest/nodeeventtypeTest2.test'
import NapiEnvTest from './nodenapitest/NapiEnvTest.test'
import AnimatorTest from './animatetest/AnimatorTest.test'
import ArkUIKeyEventTypeTest from './arkuikeyeventtest/ArkUIKeyEventTypeTest.test'
import ArkUIKeyIntensionTest from './arkuikeyeventtest/ArkUIKeyIntensionTest.test'
import ArkUIKeySourceTypeTest from './arkuikeyeventtest/ArkUIKeySourceTypeTest.test'
import NativeDialogTest from './nativedialog/NativeDialogTest.test'
import NativeGestureTest1 from './nativegesture/NativeGestureTest1.test'
import NativeGestureTest2 from './nativegesture/NativeGestureTest2.test'
import NativeGestureTest3 from './nativegesture/NativeGestureTest3.test'
import NativeGestureTest4 from './nativegesture/NativeGestureTest4.test'
import NativeGestureTypeTest from './nativegesture/NativeGestureTypeTest.test'
import ActsUIInputEventNdkTest from './uiinputevent/ActsUIInputEventNdkTest.test'
import NativeTypeTest from './nativetype/NativeTypeTest.test'
import NavDestinationStateTest from './nativetype/NavDestinationStateTest.test'
import RouterPageStateTest from './nativetype/RouterPageStateTest.test'
import SwiperMaxDisplayCountTest from './nativetype/SwiperMaxDisplayCountTest.test'
import CustomSpanMetricsTest from './nativetype/CustomSpanMetricsTest.test'
import SnapshotOptionsSetScaleTest from './nativetype/SnapshotOptionsSetScaleTest.test'
import UnmarshallStyledStringDescriptorTest from './nativetype/UnmarshallStyledStringDescriptorTest.test'
import MarshallStyledStringDescriptorTest from './nativetype/MarshallStyledStringDescriptorTest.test'
import FocusMoveTest from './nativexcomponent/FocusMoveTest.test'
import AnimateOptionFinishCallbackTest from './componentapi/AnimateOptionFinishCallbackTest.test'
import NodeDetachTest  from './componentapi/NodeDetachTest.test'
import AccessibilityActionsTest from './componentapi/AccessibilityActionsTest.test'
import ComponentApiTest from './componentapi/ComponentApiTest.test'
import UiStatesTest from './componentapi/UiStatesTest.test'
import ListItemGroupAreaTest from './componentapi/ListItemGroupAreaTest.test'
import ArkUINdkTest from './ArkUINdkTest.test'
import DisplayManagerTest from './displaymanagertest/DisplayManager.test'
import ErrorCodeTest from './nativetype/ErrorCodeTest.test'
import ListItemSwipeActionStateTest from './componentapi/ListItemSwipeActionStateTest.test'
import ErrorCodeTest2 from './nativetype/ErrorCodeTest2.test'
import ErrorCodeTest1 from './nativetype/ErrorCodeTest1.test'
import NavigationErrorCodeTest from './nativetype/NavigationErrorCodeTest.test'

export default function testsuite() {
  NavDestinationStateTest()
  RouterPageStateTest()
  NavigationTest()
  NativeXComponent()
  TouchPointTest()
  XComponentMouseTest()
  NodeAttribute()
  AccessibilityNdkTest1()
  AccessibilityNdkTest2()
  AccessibilityNdkTest3()
  AccessibilityNdkTest4()
  AccessibilityNdkTest5()
  AccessibilityNdkTest6()
  KeyframeAnimateTest()
  AnimatorOptionTest1()
  AnimatorOptionTest2()
  FocusControlTest()
  KeyEventTest()
  NodeEventTest()
  NodeAdapterTest()
  NodeContentTest()
  SnapShotTest()
  RunTaskInscopeTest()
  NodeNapiTest()
  NodeNapiTest1()
  NodeNapiTest2()
  NodeNapiTest3()
  NodeNapiTest4()
  NodeUtilsTest1()
  NodeUtilsTest()
  NodeUtilsTest2()
  TextInputContentTypeTest()
  ScrollStateTest()
  AccessibilityTypeTest()
  NodeEventTypeTest()
  NodeEventTypeTest1()
  NodeEventTypeTest2()
  NapiEnvTest()
  AnimatorTest()
  ArkUIKeyEventTypeTest()
  ArkUIKeyIntensionTest()
  ArkUIKeySourceTypeTest()
  NativeDialogTest()
  NativeGestureTest1()
  NativeGestureTest2()
  NativeGestureTest3()
  NativeGestureTest4()
  NativeGestureTypeTest()
  ActsUIInputEventNdkTest()
  NativeTypeTest()
  SwiperMaxDisplayCountTest()
  CustomSpanMetricsTest()
  SnapshotOptionsSetScaleTest()
  UnmarshallStyledStringDescriptorTest()
  MarshallStyledStringDescriptorTest()
  FocusMoveTest()
  AnimateOptionFinishCallbackTest()
  NodeDetachTest()
  AccessibilityActionsTest()
  ComponentApiTest()
  UiStatesTest()
  ListItemGroupAreaTest()
  ArkUINdkTest()
  DisplayManagerTest()
  ErrorCodeTest()
  ListItemSwipeActionStateTest()
  NavigationErrorCodeTest()
}
