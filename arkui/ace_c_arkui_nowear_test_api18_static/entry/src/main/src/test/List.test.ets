'use static';
/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import AccessibilityValueTest from "./accessibilityValue/accessibilityValue.test"
import ArkuiXComponentTest from "./arkuiXComponent/arkuiXComponent.test"
import calendarPickerDateTest from "./calendarPicker/CalendarPickerDate.test"
import CustomDialogTest from "./customDialog/customDialog.test"
import GetGestureParamTest from "./getGestureParam/getGestureParam.test"
import DragEndPendingTest from "./dragEndPending/dragEndPending.test"
import LayoutCallbackOnNodeHandleTest from "./layoutCallbackOnNodeHandle/layoutCallbackOnNodeHandle.test"
import SliderTest from "./slider/SliderEnableHapticFeedbackTest.test"
import SurfaceHolderTest from "./surfaceHolder/surfaceHolder.test"
import SwiperArrowStyleTest from "./swiperArrowStyle/swiperArrowStyle.test"
import swiperDigitIndicatorTest from "./swiperDigitIndicator/swiperDigitIndicator.test"
import SwiperIndicatorTest from "./swiperIndicator/swiperIndicator.test"
import TextPickerCascadeTest from "./textPickerCascade/textPickerCascade.test"
import PointerEventTest from "./pointerEvent/pointerEvent.test"


export default function testsuite() {
  ArkuiXComponentTest();
  AccessibilityValueTest();
  calendarPickerDateTest();
  CustomDialogTest();
  GetGestureParamTest();
  DragEndPendingTest();
  LayoutCallbackOnNodeHandleTest()
  SliderTest()
  SurfaceHolderTest()
  SwiperArrowStyleTest()
  swiperDigitIndicatorTest()
  SwiperIndicatorTest()
  TextPickerCascadeTest()
  PointerEventTest();
}