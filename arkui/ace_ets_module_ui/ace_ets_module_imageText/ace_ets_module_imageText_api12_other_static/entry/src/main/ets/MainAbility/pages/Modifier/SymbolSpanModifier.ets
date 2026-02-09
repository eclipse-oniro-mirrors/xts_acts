'use static';
/**
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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  PixelMap,
  ImageSpan,
  TextArea,
  Marquee,
  RichEditor,
  RichEditorOptions,
  RichEditorController,
  RichText,
  SymbolSpanAttribute,
  AttributeModifier,
  ColumnOptions,
  SymbolSpan
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

class SymbolSpanModifier implements AttributeModifier<SymbolSpanAttribute> {
  applyNormalAttribute(SymbolSpanInstance: SymbolSpanAttribute): void {
    SymbolSpanInstance.fontSize(100);
  }
}

@Entry
@Component
struct SymbolSpanModifier1 {
  @State value: string = 'init'

  @State modifier: SymbolSpanModifier = new SymbolSpanModifier();

  aboutToAppear(): void {
    // this.value = (typeof SymbolSpanInstance).toString()
    this.value = (typeof undefined).toString()

  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text() {
        SymbolSpan($r('sys.symbol.ohos_wifi')).attributeModifier(this.modifier)
          .id('SymbolSpanModifier_get_fontSize')
          // .height('20%')
      }

      TextArea({ text: this.value })
        .id('SymbolSpanModifier_get_type')
        .height('10%')
    }
  }
}