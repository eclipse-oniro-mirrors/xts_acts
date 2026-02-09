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
import { Entry, Component, Column, AttributeModifier, MarqueeAttribute, Flex, FlexDirection, ItemAlign, FlexAlign, Marquee, Color } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class MarqueeModifier1 implements AttributeModifier<MarqueeAttribute> {
  applyNormalAttribute(instance: MarqueeAttribute): void {
    instance
      .fontColor('#FF00FFFF')
      .fontSize(35)
      .allowScale(true)
      .fontWeight(500)
      .fontFamily('medium')
  }
}

@Entry
@Component
struct MarqueeExample {
  @State marqueeModifier: MarqueeModifier1 = new MarqueeModifier1()
  @State start: boolean = false
  @State fromStart: boolean = true
  @State step: number = 50
  @State loop: int = 3
  @State src: string = "Running Marquee starts rolling"
  @State fontColor: Color = Color.Blue;
  @State fontSize: number = 50;
  @State onActionCalledThree: boolean = false;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Marquee({
        start: this.start,
        step: this.step,
        loop: this.loop,
        fromStart: this.fromStart,
        src: this.src
      })
        .key('MarqueeKey1')
        .attributeModifier(this.marqueeModifier)
    }
    .width('100%')
      .height('100%')
  }
}