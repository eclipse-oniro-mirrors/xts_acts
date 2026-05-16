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


import { InputMethodListDialog } from '@ohos.inputMethodList'

@Entry
@Component
struct UIComponentScrollSwiperDisplaycount0210 {
  private swiperController: SwiperController = new SwiperController()
  @State index:string = '0'

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        Text('1').fontSize(80).width(200).textAlign(TextAlign.Center).borderWidth(3).borderColor(Color.Red)
        Text('2').fontSize(80).width(200).textAlign(TextAlign.Center).borderWidth(3).borderColor(Color.Red)
        Text('3').fontSize(80).width(200).textAlign(TextAlign.Center).borderWidth(3).borderColor(Color.Red)
        Text('4').fontSize(80).width(200).textAlign(TextAlign.Center).borderWidth(3).borderColor(Color.Red)
        Text('5').fontSize(80).width(200).textAlign(TextAlign.Center).borderWidth(3).borderColor(Color.Red)
        Text('6').fontSize(80).width(200).textAlign(TextAlign.Center).borderWidth(3).borderColor(Color.Red)
      }.id('swiperdisplaycount0210')
      .height('50%')
      .onChange((index: number) => {
        this.index = index.toString()
      })
      .backgroundColor(Color.Yellow)
      .width(160)
      Text(this.index).fontColor(80).key('swiperdisplaycount0210_1')
    }.width('100%')
    .margin({ top: 5 })
  }
}