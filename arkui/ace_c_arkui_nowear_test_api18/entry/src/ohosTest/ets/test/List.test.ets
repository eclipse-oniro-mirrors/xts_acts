/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import calendarPickerDateTest from "./calendarPicker/CalendarPickerDate.test"
import SliderTest from "./slider/SliderEnableHapticFeedbackTest.test"
import DragEndPendingTest from "./dragEndPending/dragEndPending.test"
import SwiperIndicatorTest from "./swiperIndicator/swiperIndicator.test"
import PointerEventTest from "./pointerEvent/pointerEvent.test"
import swiperDigitIndicatorTest from "./swiperDigitIndicator/swiperDigitIndicator.test"
import GetGestureParamTest from "./getGestureParam/getGestureParam.test"
import LayoutCallbackOnNodeHandleTest from "./layoutCallbackOnNodeHandle/layoutCallbackOnNodeHandle.test"
import SwiperArrowStyleTest from "./swiperArrowStyle/swiperArrowStyle.test"
import ArkuiXComponentTest from "./arkuiXComponent/arkuiXComponent.test"
import AccessibilityValueTest from "./accessibilityValue/accessibilityValue.test"
import SurfaceHolderTest from "./surfaceHolder/surfaceHolder.test"
import TextPickerCascadeTest from "./textPickerCascade/textPickerCascade.test"
import CustomDialogTest from "./customDialog/customDialog.test"

export default function testsuite() {
   CustomDialogTest();
   calendarPickerDateTest();
   SliderTest();
   DragEndPendingTest();
   SwiperIndicatorTest();
   PointerEventTest();
   swiperDigitIndicatorTest();
   GetGestureParamTest();
   LayoutCallbackOnNodeHandleTest();
   SwiperArrowStyleTest();
   ArkuiXComponentTest();
   AccessibilityValueTest();
   SurfaceHolderTest();
   TextPickerCascadeTest();
}
