/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { MarqueeModifier } from "@ohos.arkui.modifier";

class CustomModifier extends MarqueeModifier {
  applyNormalAttribute(instance: MarqueeAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.fontSize(5)
  }
}

@Entry
@Component
struct MarqueeExample {
  @State start: boolean = false
  @State fromStart: boolean = true
  @State step: number = 50
  @State loop: number = 3
  @State src: string = "Running Marquee starts rolling"
  @State fontColor: Color = Color.Blue;
  @State fontSize: number = 50;
  @State onActionCalledThree: boolean = false;
  @State customModifier: MarqueeModifier = new CustomModifier()
    .fontColor('#FF00FFFF')
    .fontSize(35)
    .allowScale(true)
    .fontWeight(500)
    .fontFamily('medium')

  build() {
    Column({ space: 5 }) {
    Button("change value").onClick(() => {
      (this.customModifier as CustomModifier).onChange1();
    }).key("changeButton")
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Marquee({
        start: this.start,
        step: this.step,
        loop: this.loop,
        fromStart: this.fromStart,
        src: this.src
      })
        .key('MarqueeKey1')
        .attributeModifier(this.customModifier as CustomModifier)
    }
    .width('100%')
      .height('100%')
    }
    .margin({ top: 5 })
  }
}