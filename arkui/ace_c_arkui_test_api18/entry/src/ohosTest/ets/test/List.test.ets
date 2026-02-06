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

import datePickerTest from "./datepicker/DatePickerMode.test"
import textPickerEnableHapticFeedbackTest from "./textpicker/textPickerEnableHapticFeedback.test"
import datePickerEnableHapticFeedbackTest from "./datepicker/datePickerEnableHapticFeedback.test"
import swiperIndicatorDistanceTest from "./swiper/SwiperIndicatorDistanceTest.test"
import ExpectedFrameRateRangeCallback from "./ExpectedFrameRateRange/ExpectedFrameRateRangeCallback.test"
import XComponentLifeCycleTest from './XComponent/XComponentLifeCycleTest.test'
import visibleAreaEventOptions from './visibleAreaEventOptions/visibleAreaEventOptions.test'
import gestureInterrupterTest from './gestureRecognizer/GestureInterrupterTest.test'
import swiperDigitIndicatorTest from "./swiper/SwiperDigitIndicatorTest.test"
import swiperArrowStyleTest from "./swiper/SwiperArrowStyleTest.test"
import buttonFontScaleTest from  "./button/buttonFontScale.test"
import ExpectedFrameRateRangeNullTest from "./ExpectedFrameRateRange/ExpectedFrameRateRangeNull.test"

export default function testsuite() {
  datePickerTest();
  textPickerEnableHapticFeedbackTest();
  datePickerEnableHapticFeedbackTest();
  swiperIndicatorDistanceTest();
  ExpectedFrameRateRangeCallback();
  XComponentLifeCycleTest();
  visibleAreaEventOptions();
  gestureInterrupterTest();
  swiperDigitIndicatorTest();
  swiperArrowStyleTest();
  buttonFontScaleTest();
  ExpectedFrameRateRangeNullTest();
}
