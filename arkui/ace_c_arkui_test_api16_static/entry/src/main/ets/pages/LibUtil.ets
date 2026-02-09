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
import { UIContext } from '@ohos.arkui.UIContext';

export class LibUtil {

  static {
    loadLibrary("entry")
  }

  native textImmutablfFontWeight_001(): number;

  native textImmutablfFontWeight_002(): number;

  native textImmutablfFontWeight_003(): number;

  native textImmutablfFontWeight_004(): number;

  native textImmutablfFontWeight_005(): number;

  native textImmutablfFontWeight_006(): number;

  native textImmutablfFontWeight_007(): number;

  native textImmutablfFontWeight_008(): number;

  native textImmutablfFontWeight_009(): number;

  native textImmutablfFontWeight_010(): number;

  native textImmutablfFontWeight_011(): number;

  native textImmutablfFontWeight_012(): number;

  native textImmutablfFontWeight_013(): number;

  native textImmutablfFontWeight_014(): number;

  native textImmutablfFontWeight_015(): number;

  native textImmutablfFontWeight_016(): number;

  native testButtonType006(): number;

  native testButtonType007(): number;

  native testTextInputWordBreak001(): number;

  native testTextInputWordBreak002(): number;

  native testTextInputWordBreak003(): number;

  native testTextInputWordBreak004(): number;

  native testTextInputWordBreak005(): number;

  native testTextInputWordBreak006(): number;

  native testPostFrameCallback(a: Content): void;

  native swiperAutoPlayTest(a: Content): void;

  native swiperOnSelectTest(a: Content): void;

  native textAreaLetterSpacing001(a: Content): void;

  native textInputLetterSpacing002(a: Content): void;

  native textPickerColumnWidths(a: Content): void;

  native TestDragStartDataLoading001(a: Content): void;

  native TestDragDisableDropDataPrefetch002(a: Content): void;

  native TestDragCancelDataLoading003(a: Content, context: UIContext): void;

  native GetResult(): number[];

  native testNodeUtilMove001(a: Content): void;

  native timePickerTest(a: Content): void;

}