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

'use static';

import {
  Column,
  ColumnOptions,
  Text,
  Span,
  ContainerSpan,
  SymbolSpan,
  SymbolGlyph,
  $r,
  Entry,
  Component,
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RichTextSpanSymbolBatchPage {
  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('rtsb_ready', true);
  }

  @Builder
  RtsbContainerInner() {
    Span('in').fontSize(9);
  }

  @Builder
  RtsbRichTextBody() {
    Span('plain ')
      .fontSize(9)
      .debugLine('span:richTextSpanSymbolBatch', 'entry');
    ContainerSpan(this.RtsbContainerInner)
      .debugLine('cspan:richTextSpanSymbolBatch', 'entry');
    SymbolSpan($r('sys.symbol.ohos_star'))
      .fontSize(14)
      .debugLine('symSpan:richTextSpanSymbolBatch', 'entry');
  }

  build() {
    Column({ space: 6 } as ColumnOptions) {
      Text('Span ContainerSpan SymbolSpan debugLine SymbolGlyph shader shadow')
        .fontSize(11)
        .width('100%')
        .height('10%')
        .id('rtsb_title');
      Text('', undefined, this.RtsbRichTextBody)
        .fontSize(10)
        .width('100%')
        .height('10%')
        .id('rtsb_text');
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .fontSize(28)
        .width('100%')
        .height('12%')
        .shaderStyle(undefined)
        .symbolShadow(undefined)
        .id('rtsb_symbol');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
