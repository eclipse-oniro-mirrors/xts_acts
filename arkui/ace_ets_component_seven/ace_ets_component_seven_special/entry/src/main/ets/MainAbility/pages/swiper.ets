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

class SwiperModifier1 implements AttributeModifier<SwiperAttribute> {
  applyNormalAttribute(instance: SwiperAttribute): void {
    instance
      .nextMargin(10)
      .prevMargin(2)
      .displayCount(2)
      .displayArrow(false)
      .curve(Curve.Linear)
      .disableSwipe(true)
      .effectMode(EdgeEffect.Spring)
      .cachedCount(2)
      .displayMode(SwiperDisplayMode.Stretch)
      .itemSpace(10)
      .vertical(true)
      .loop(true)
      .interval(4000)
      .autoPlay(true)
      .index(1)
      .indicator(true)
      .duration(300)
  }
}

@Entry
@Component
struct SwiperExample {
  @State swiperModifier: SwiperModifier1 = new SwiperModifier1()
  private swiperController: SwiperController = new SwiperController()

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        ForEach(['1', '2', '3', '4', '5'], (item: string) => {
          Text(item)
            .width('90%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(20)
        }, (item: string) => item)
      }
      .key('swiper')
        .attributeModifier(this.swiperModifier)

    }
    .margin({ top: 5 })
  }
}