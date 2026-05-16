/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Entry,
  Component,
  Column,
  Text,
  Button,
  Search,
  TextDirection
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { ColorMetrics, ColorSpace } from '@kit.ArkUI';

@Entry
@Component
struct SearchStylePage {
  @State compressLeadingPunctuationValue: boolean = false;
  @State dividerColorValue: string = '#ff0000';
  @State includeFontPaddingValue: boolean = true;
  @State fallbackLineSpacingValue: boolean = true;
  @State textDirectionValue: TextDirection = TextDirection.LTR;
  private readonly stateKey: string = 'SearchStylePageState';

  aboutToAppear(): void {
    this.syncStateToStorage();
  }

  private syncStateToStorage(): void {
    const snapshot = `compressLeadingPunctuationValue=${this.compressLeadingPunctuationValue};` +
      `dividerColorValue=${this.dividerColorValue};includeFontPaddingValue=${this.includeFontPaddingValue};` +
      `fallbackLineSpacingValue=${this.fallbackLineSpacingValue};textDirectionValue=${this.textDirectionValue}`;
    AppStorage.setOrCreate<string>(this.stateKey, snapshot);
  }

  build() {
    Column() {
      Button('toggleCompressLeadingPunctuation')
        .id('toggleSearchCompressLeadingPunctuationBtn')
        .key('toggleSearchCompressLeadingPunctuationBtn')
        .onClick(() => {
          this.compressLeadingPunctuationValue = !this.compressLeadingPunctuationValue;
          this.syncStateToStorage();
        })
      Text(`search.compressLeadingPunctuation=${this.compressLeadingPunctuationValue}`)
        .id('searchCompressLeadingPunctuationValue')
        .key('searchCompressLeadingPunctuationValue')

      Button('toggleDividerColor')
        .id('toggleSearchDividerColorBtn')
        .key('toggleSearchDividerColorBtn')
        .onClick(() => {
          this.dividerColorValue = this.dividerColorValue === '#ff0000' ? '#00ff00' : '#ff0000';
          this.syncStateToStorage();
        })
      Text(`search.dividerColor=${this.dividerColorValue}`)
        .id('searchDividerColorValue')
        .key('searchDividerColorValue')

      Button('toggleIncludeFontPadding')
        .id('toggleSearchIncludeFontPaddingBtn')
        .key('toggleSearchIncludeFontPaddingBtn')
        .onClick(() => {
          this.includeFontPaddingValue = !this.includeFontPaddingValue;
          this.syncStateToStorage();
        })
      Text(`search.includeFontPadding=${this.includeFontPaddingValue}`)
        .id('searchIncludeFontPaddingValue')
        .key('searchIncludeFontPaddingValue')

      Button('toggleFallbackLineSpacing')
        .id('toggleSearchFallbackLineSpacingBtn')
        .key('toggleSearchFallbackLineSpacingBtn')
        .onClick(() => {
          this.fallbackLineSpacingValue = !this.fallbackLineSpacingValue;
          this.syncStateToStorage();
        })
      Text(`search.fallbackLineSpacing=${this.fallbackLineSpacingValue}`)
        .id('searchFallbackLineSpacingValue')
        .key('searchFallbackLineSpacingValue')

      Button('toggleTextDirection')
        .id('toggleSearchTextDirectionBtn')
        .key('toggleSearchTextDirectionBtn')
        .onClick(() => {
          this.textDirectionValue = this.textDirectionValue ===
          TextDirection.LTR ? TextDirection.RTL : TextDirection.LTR;
          this.syncStateToStorage();
        })
      Text(`search.textDirection=${this.textDirectionValue}`)
        .id('searchTextDirectionValue')
        .key('searchTextDirectionValue')

      Search({ value: 'search text', placeholder: 'placeholder' })
        .compressLeadingPunctuation(this.compressLeadingPunctuationValue)
        .dividerColor(
          this.dividerColorValue === '#ff0000'
            ? ColorMetrics.colorWithSpace(ColorSpace.SRGB, 1.0, 0.0, 0.0, 1)
            : ColorMetrics.colorWithSpace(ColorSpace.SRGB, 0.0, 1.0, 0.0, 1)
        )
        .includeFontPadding(this.includeFontPaddingValue)
        .fallbackLineSpacing(this.fallbackLineSpacingValue)
        .textDirection(this.textDirectionValue)
        .id('searchStyleCase')
        .key('searchStyleCase')
        .width('100%')

      Search({ value: '', placeholder: '' })
        .compressLeadingPunctuation(undefined)
        .dividerColor(undefined)
        .includeFontPadding(undefined)
        .fallbackLineSpacing(undefined)
        .textDirection(undefined)
        .id('searchUndefCase')
        .key('searchUndefCase')
        .width('100%')

      Search({ value: '', placeholder: '' })
        .textDirection(TextDirection.AUTO)
        .id('searchTextDirAutoCase')
        .key('searchTextDirAutoCase')
        .width('100%')

      Search({ value: '', placeholder: '' })
        .selectedDragPreviewStyle({ color: '#ff0000' })
        .id('searchSelectedDragCase')
        .key('searchSelectedDragCase')
        .width('100%')

      Search({ value: '', placeholder: '' })
        .selectedDragPreviewStyle(undefined)
        .id('searchSelectedDragUndef')
        .key('searchSelectedDragUndef')
        .width('100%')

      Search({ value: '', placeholder: '' })
        .customKeyboard(undefined)
        .id('searchCustomKbUndef')
        .key('searchCustomKbUndef')
        .width('100%')
    }.width('100%').height('100%')
  }
}
