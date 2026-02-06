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
  MarqueeAttribute,
  AttributeModifier,
  ColumnOptions,
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {

  applyNormalAttribute(MarqueeInstance: MarqueeAttribute): void {
    MarqueeInstance.fontSize(20);
  }
}

@Entry
@Component
struct MarqueeModifier1 {
  @State start: boolean = false;
  @State value: string = 'init';

  @State modifier: MarqueeModifier = new MarqueeModifier();

  aboutToAppear(): void {
    this.start = true
    // this.value = typeof MarqueeInstance;
    this.value = typeof undefined;
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Marquee({
        start: this.start,
        step: 10,
        loop: Number.parseInt(Number.POSITIVE_INFINITY.toString()).toInt(),
        fromStart: true,
        src: 'MarqueeModifier MarqueeInstance'
      })
      .attributeModifier(this.modifier)
        .id('MarqueeModifier_get_fontSize')
        .width('20%')
        .height('20%')

      TextArea({ text: this.value })
        .id('MarqueeModifier_get_type')
        .height('10%')
    }
  }
}