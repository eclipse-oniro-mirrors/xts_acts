'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Content } from '@ohos.arkui.node'
export class LibUtil {
  static{
    loadLibrary("entry")
  }

  native testCalendarPickerDate(str: Content): void;

  native sliderTest(str: Content): void;  // 无映射且c侧未实现

  native DragEndPendingTest_a(): int;

  native DragEndPendingTest_a1(): int;

  native DragEndPendingTest_b(): int;

  native DragEndPendingTest_c(): int;

  native SwiperIndicatorTest_a(): int;

  native SwiperIndicatorTest_b(): int;

  native SwiperIndicatorTest_a1(): int;

  native SwiperIndicatorTest_b1(): int;

  native PointerEventTest_a(): int;

  native PointerEventTest_b(): int;

  native PointerEventTest_a1(): int;

  native PointerEventTest_b1(): int;

  native swiperDigitIndicatorTest_a(): int;

  native swiperDigitIndicatorTest_b(): int;

  native swiperDigitIndicatorTest_c(): int;

  native swiperDigitIndicatorTest_d(): int;

  native swiperDigitIndicatorTest_e(): int;

  native swiperDigitIndicatorTest_f(): int;

  native swiperDigitIndicatorTest_g(): int;

  native swiperDigitIndicatorTest_h(): int;

  native swiperDigitIndicatorTest_i(): int;

  native swiperDigitIndicatorTest_j(): int;

  native swiperDigitIndicatorTest_k(): int;

  native swiperDigitIndicatorTest_l(): int;

  native swiperDigitIndicatorTest_b1(): int;

  native swiperDigitIndicatorTest_c1(): int;

  native swiperDigitIndicatorTest_d1(): int;

  native swiperDigitIndicatorTest_e1(): int;

  native swiperDigitIndicatorTest_f1(): int;

  native swiperDigitIndicatorTest_g1(): int;

  native swiperDigitIndicatorTest_h1(): int;

  native swiperDigitIndicatorTest_i1(): int;

  native swiperDigitIndicatorTest_j1(): int;

  native swiperDigitIndicatorTest_k1(): int;

  native swiperDigitIndicatorTest_l1(): int;

  native GetGestureParamTest_a(): int;

  native GetGestureParamTest_a1(): int;

  native GetGestureParamTest_b(): int;

  native GetGestureParamTest_c(): int;

  native GetGestureParamTest_d(): int;

  native GetGestureParamTest_e(): int;

  native GetGestureParamTest_f(): int;

  native GetGestureParamTest_g(): int;

  native GetGestureParamTest_h(): int;

  native GetGestureParamTest_i(): int;

  native GetGestureParamTest_j(): int;

  native GetGestureParamTest_j1(): int;

  native LayoutCallbackOnNodeHandleTest_a(): int;

  native LayoutCallbackOnNodeHandleTest_a1(): int;

  native LayoutCallbackOnNodeHandleTest_b(): int;

  native LayoutCallbackOnNodeHandleTest_b1(): int;

  native LayoutCallbackOnNodeHandleTest_c(): int;

  native LayoutCallbackOnNodeHandleTest_d(): int;

  native LayoutCallbackOnNodeHandleTest_c1(): int;

  native LayoutCallbackOnNodeHandleTest_d1(): int;

  native SwiperArrowStyleTest_a(): int;

  native SwiperArrowStyleTest_b(): int;

  native SwiperArrowStyleTest_c(): int;

  native SwiperArrowStyleTest_c1(): int;

  native SwiperArrowStyleTest_c2(): int;

  native SwiperArrowStyleTest_d(): int;

  native SwiperArrowStyleTest_d1(): int;

  native SwiperArrowStyleTest_d2(): int;

  native SwiperArrowStyleTest_e(): int;

  native SwiperArrowStyleTest_e1(): int;

  native SwiperArrowStyleTest_f(): int;

  native SwiperArrowStyleTest_f1(): int;

  native SwiperArrowStyleTest_g(): int;

  native SwiperArrowStyleTest_g1(): int;

  native SwiperArrowStyleTest_h(): int;

  native SwiperArrowStyleTest_h1(): int;

  native ArkuiXComponentTest_a(): int;

  native ArkuiXComponentTest_b(): int;

  native ArkuiXComponentTest_c(): int;

  native ArkuiXComponentTest_d(): int;

  native ArkuiXComponentTest_e(): int;

  native ArkuiXComponentTest_f(): int;

  native ArkuiXComponentTest_g(): int;

  native ArkuiXComponentTest_g1(): int;

  native ArkuiXComponentTest_h(): int;

  native ArkuiXComponentTest_h1(): int;

  native ArkuiXComponentTest_i(): int;

  native ArkuiXComponentTest_i1(): int;

  native ArkuiXComponentTest_j(): int;

  native ArkuiXComponentTest_j1(): int;

  native AccessibilityValueTest_a(): int;

  native AccessibilityValueTest_a1(): int;

  native AccessibilityValueTest_b(): int;

  native AccessibilityValueTest_c(): int;

  native AccessibilityValueTest_b1(): int;

  native AccessibilityValueTest_c1(): int;

  native AccessibilityValueTest_d(): int;

  native AccessibilityValueTest_d1(): int;

  native AccessibilityValueTest_d2(): int;

  native AccessibilityValueTest_d3(): int;

  native AccessibilityValueTest_d4(): int;

  native AccessibilityValueTest_d5(): int;

  native AccessibilityValueTest_d6(): int;

  native AccessibilityValueTest_d7(): int;

  native AccessibilityValueTest_d8(): int;

  native AccessibilityValueTest_d9(): int;

  native AccessibilityValueTest_e(): int;

  native AccessibilityValueTest_e1(): int;

  native AccessibilityValueTest_e2(): int;

  native AccessibilityValueTest_f(): int;

  native AccessibilityValueTest_f1(): int;

  native AccessibilityValueTest_g(): int;

  native AccessibilityValueTest_g1(): int;

  native AccessibilityValueTest_h(): int;

  native AccessibilityValueTest_h1(): int;

  native AccessibilityValueTest_i(): int;

  native AccessibilityValueTest_i1(): int;

  native AccessibilityValueTest_j(): int;

  native AccessibilityValueTest_j1(): int;

  native AccessibilityValueTest_k(): int;

  native AccessibilityValueTest_k1(): int;

  native AccessibilityValueTest_l(): int;

  native AccessibilityValueTest_l1(): int;

  native AccessibilityValueTest_m(): int;

  native AccessibilityValueTest_m1(): int;

  native AccessibilityValueTest_n(): int;

  native AccessibilityValueTest_n1(): int;

  native AccessibilityValueTest_o(): int;

  native AccessibilityValueTest_o1(): int;

  native AccessibilityValueTest_p(): int;

  native AccessibilityValueTest_p1(): int;

  native SurfaceHolderTest_a(): int;

  native SurfaceHolderTest_a1(): int;

  native SurfaceHolderTest_b(): int;

  native SurfaceHolderTest_c(): int;

  native SurfaceHolderTest_c1(): int;

  native SurfaceHolderTest_d(): int;

  native SurfaceHolderTest_e(): int;

  native SurfaceHolderTest_f(): int;

  native SurfaceHolderTest_e1(): int;

  native SurfaceHolderTest_f1(): int;

  native SurfaceHolderTest_g(): int;

  native SurfaceHolderTest_g1(): int;

  native SurfaceHolderTest_h(): int;

  native SurfaceHolderTest_h1(): int;

  native TextPickerCascadeTest_a(): int;

  native TextPickerCascadeTest_a1(): int;

  native TextPickerCascadeTest_b(): int;

  native TextPickerCascadeTest_b1(): int;

  native TextPickerCascadeTest_c(): int;

  native TextPickerCascadeTest_c1(): int;

  native TextPickerCascadeTest_d(): int;

  native TextPickerCascadeTest_d1(): int;

  native TextPickerCascadeTest_e(): int;

  native TextPickerCascadeTest_e1(): int;

  native TextPickerCascadeTest_f(): int;

  native TextPickerCascadeTest_f1(): int;

  native CustomDialogTest_a(): int;

  native CustomDialogTest_a1(): int;

  native CustomDialogTest_b(): int;

  native CustomDialogTest_c(): int;

  native CustomDialogTest_d(): int;

  native CustomDialogTest_b1(): int;

  native CustomDialogTest_c1(): int;

  native CustomDialogTest_d1(): int;

  native CustomDialogTest_e(): int;

  native CustomDialogTest_e1(): int;

  native CustomDialogTest_f(): int;

  native CustomDialogTest_f1(): int;

  native CustomDialogTest_g(): int;

  native CustomDialogTest_g1(): int;

  native CustomDialogTest_h(): int;

  native CustomDialogTest_h1(): int;

  native CustomDialogTest_i(): int;

  native CustomDialogTest_j(): int;

  native CustomDialogTest_k(): int;

  native CustomDialogTest_l(): int;

  native CustomDialogTest_m(): int;

  native CustomDialogTest_n(): int;

  native CustomDialogTest_i1(): int;

  native CustomDialogTest_j1(): int;

  native CustomDialogTest_k1(): int;

  native CustomDialogTest_l1(): int;

  native CustomDialogTest_m1(): int;

  native CustomDialogTest_n1(): int;

  native CustomDialogTest_o(): int;

  native CustomDialogTest_o1(): int;

  native CustomDialogTest_p(): int;

  native CustomDialogTest_p1(): int;

  native CustomDialogTest_q(): int;

  native CustomDialogTest_q1(): int;

  native CustomDialogTest_r(): int;

  native CustomDialogTest_r1(): int;

  native CustomDialogTest_s(): int;

  native CustomDialogTest_t(): int;

  native CustomDialogTest_s1(): int;

  native CustomDialogTest_t1(): int;

  native CustomDialogTest_u(): int;

  native CustomDialogTest_v(): int;

  native CustomDialogTest_w(): int;

  native CustomDialogTest_x(): int;

  native CustomDialogTest_y(): int;

  native CustomDialogTest_z(): int;

  native CustomDialogTest_u1(): int;

  native CustomDialogTest_v1(): int;

  native CustomDialogTest_w1(): int;

  native CustomDialogTest_x1(): int;

  native CustomDialogTest_y1(): int;

  native CustomDialogTest_z1(): int;

  native CustomDialogTest_A(): int;

  native CustomDialogTest_B(): int;

  native CustomDialogTest_C(): int;

  native CustomDialogTest_D(): int;

  native CustomDialogTest_A1(): int;

  native CustomDialogTest_B1(): int;

  native CustomDialogTest_C1(): int;

  native CustomDialogTest_D1(): int;


  native testSliderEnableHpaticFeedback001(): int;
  native testSliderEnableHpaticFeedback002(): int;
  native testSliderEnableHpaticFeedback003(): int;
  native testSliderEnableHpaticFeedback004(): int;
  native testSliderEnableHpaticFeedback005(): int;
}