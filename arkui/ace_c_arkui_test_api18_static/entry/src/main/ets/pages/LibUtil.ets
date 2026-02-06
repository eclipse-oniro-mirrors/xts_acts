'use static';
/*
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
import { Content } from '@ohos.arkui.node'
export class LibUtil {
  static {
    loadLibrary("entry")
  }

  native TestGestureInterrupter(str: Content): string[];
  native datePickerEnableHapticFeedback(str: Content): void;
  native testDatePickerMode(str: Content): void;
  native testExpectedFrameRateRangeCallback(str: Content): void;
  native swiperIndicatorTest(str: Content): void;
  native testSwiperDigitIndicator001(): number
  native testSwiperDigitIndicator002(): number
  native testSwiperDigitIndicator003(): number
  native testSwiperDigitIndicator004(): number
  native testSwiperDigitIndicator005(): number
  native testSwiperDigitIndicator006(): number
  native testSwiperDigitIndicator007(): number
  native testSwiperDigitIndicator008(): number
  native testSwiperArrowStyle001(): number
  native testSwiperArrowStyle002(): number
  native testSwiperArrowStyle003(): number
  native testSwiperArrowStyle004(): number
  native testSwiperArrowStyle005(): number
  native testSwiperArrowStyle006(): number
  native textPickerEnableHapticFeedback(str: Content): void;
  native DragEndPendingTest_001(): string[]
  native VisibleAreaEventOptionsTest_a(): int
  native VisibleAreaEventOptionsTest_b(): int
  native VisibleAreaEventOptionsTest_c(): int
  native VisibleAreaEventOptionsTest_d(): int

}