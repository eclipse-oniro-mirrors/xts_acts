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
@Entry
@Component
struct SwiperFillPolicyExample {
  @State numbers: string[] = []
  @State changeLanesValue: PresetFillType | number = -1;

  aboutToAppear() {
    for (let i = 1;i <= 9; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column() {
      Swiper() {
        ForEach(this.numbers, (item: string) => {
          Text(item.toString())
            .id('swiperType_' + item)
            .width('90%')
            .height('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: string) => item)
      }.id('swiper_fillType')
      .width('200vp').height('40%')
      .displayCount({ fillType: this.changeLanesValue})

      Text('ItemFillPolicy: ' + this.changeLanesValue)
        .id('swiper_fillType_text')
      Button('DEFAULT')
        .height('6%')
        .id('swiper_fillType_0')
        .onClick(() => {
          this.changeLanesValue = PresetFillType.BREAKPOINT_DEFAULT
        })
      Button('SM1MD2LG3')
        .height('6%')
        .id('swiper_fillType_1')
        .margin('3%')
        .onClick(() => {
          this.changeLanesValue = PresetFillType.BREAKPOINT_SM1MD2LG3
        })
      Button('SM2MD3LG5')
        .height('6%')
        .id('swiper_fillType_2')
        .onClick(() => {
          this.changeLanesValue = PresetFillType.BREAKPOINT_SM2MD3LG5
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}