/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import matrix4 from '@ohos.matrix4'
let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])
@Entry
@Component
struct comSizeAbilityTest_16 {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  @State TextAreaSize: number[] = [150, 120]
  @State TextClockSize: number[] = [145, 110]
  @State text: string = ''

  @Builder TabBuilder(index: number) {
    Column() {
      Text(`Tab${index + 1}`)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(10)
        .fontWeight(500)
        .lineHeight(14)
    }.width('100%')
  }
build() {
    Scroll(){
      Column({ space: 20 }) {
        Column() {
          Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
            TabContent() {
              Column() {
                Text('Tab1')
                  .fontColor('#182431')
                  .fontWeight(500)
                  .opacity(0.4)
                Divider()
                  .strokeWidth(0.5)
                  .color('#182431')
                  .opacity(0.05)
              }.width('100%')
            }.tabBar(this.TabBuilder(0))
            .backgroundColor(0XBDDB69)
          }
          .backgroundColor(0XBDDB69)
          .key("Tab_Size")
          .vertical(false)
          .barHeight(56)
          .backgroundColor('#F1F3F5')
          .margin({ top: 38 })
          .size({ width: 240, height: 140})
          .translate({ x: 1, y: 1, z: 1 })
          .scale({ x: 1, y: 1, z: 1, centerX: 1, centerY: 1 })
          .rotate({ x: 1, y: 1, z: 1, angle: 0, centerX: 1, centerY: 1 })
          .transform(matrix)
        }.width('100%').key('Tab_Father')
        Column(){
          TextArea()
            .backgroundColor(0XBDDB69)
            .key("TextArea_Size")
            .size({ width: 150, height: 120})
            .translate({ x: 1, y: 1, z: 1 })
            .scale({ x: 1, y: 1, z: 1, centerX: 1, centerY: 1 })
            .rotate({ x: 1, y: 1, z: 1, angle: 0, centerX: 1, centerY: 1 })
            .transform(matrix)
        }.key('TextArea_Father')
        Column(){
          TextClock()
            .backgroundColor(0XBDDB69)
            .key("TextClock_Size")
            .size({ width: 145, height: 110})
            .translate({ x: 1, y: 1, z: 1 })
            .scale({ x: 1, y: 1, z: 1, centerX: 1, centerY: 1 })
            .rotate({ x: 1, y: 1, z: 1, angle: 0, centerX: 1, centerY: 1 })
            .transform(matrix)
        }.key('TextClock_Father')
      }.width('100%')
    }.height('100%')
  }
}


