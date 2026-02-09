'use static'
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
import { TouchEventData } from './gestureCancel/TouchEventData'
export class LibUtil {
  static {
    loadLibrary("entry")
  }

  native columnBackDropBlurTest001(): number;

  native testListItemGroupNodeAdapter001(): number;

  native testListItemGroupNodeAdapter002(): number;

  native testListItemGroupNodeAdapter003(): number;

  native checkboxGroupGroupTest(a: Content): void;

  native checkboxGroupSelectAllTest(a: Content): void;

  native checkboxGroupTest(a: Content): void;

  native testNodeHandleById(a: Content): void;

  native testGetWindowInfo(a: Content): void;

  native testHostWindowInfoGetName(a: Content): void;

  native testHostWindowInfoDestroy(a: Content): void;

  native ProgressLinearStyleTest(a: Content): void;

  native testProgressLinearStyle(a: Content): void;

  native testLazyForEachExpandMode001(a: Content): void;

  native testLazyForEachExpandMode002(a: Content): void;

  native testLazyForEachExpandMode003(a: Content): void;

  native testLazyForEachExpandMode004(a: Content): void;

  native testLazyForEachExpandMode005(a: Content): void;

  native testLazyForEachExpandMode006(a: Content): void;

  native testLazyForEachExpandMode007(a: Content): void;

  native testLazyForEachExpandMode008(a: Content): void;

  native testLazyForEachExpandMode009(a: Content): void;

  native FocusControlTest_001(a: Content): void;

  native FocusControlTest_002(a: Content): void;


  native listTestCallback(a: Content): void;

  native listScrollToTestCallback(a: Content): void;

  native gesturecancelTest(a: Content): void;

  native GetTouchEventData(): TouchEventData;

  native TestGestureRecognizerFinger001(a: Content): void;

  native TestGestureRecognizerGetResult(): string[];

  native TestEventInfoGetPressedTime001(a: Content): void;

  native TestEventInfoGetResultTouch(): string[];

  native TestEventInfoGetResultMove(): string[];

  native snapShotTest001(a: Content): void;

  native TestsnapShotetResult(): string[];

  native testSwiperChangeIndex(a: Content): void;
}