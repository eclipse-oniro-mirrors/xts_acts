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
struct comSizeAbilityTest_13 {
  @State data: string = '<h1 style="text-align: center;">h1标题</h1>'
  @State ScrollSize: number[] = [261, 140]
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State space: number = 8
  build() {
    Scroll(){
      Column({ space: 20 }) {
        Column(){
          RichText(this.data)
            .backgroundColor(0XBDDB69)
            .key("RichText_Size")
            .size({ width: 210, height: 132 })
            .translate({ x: 1, y: 1, z: 1 })
            .scale({ x: 1, y: 1, z: 1, centerX: 1, centerY: 1 })
            .rotate({ x: 1, y: 1, z: 1, angle: 0, centerX: 1, centerY: 1 })
            .transform(matrix)
        }.key('RichText_Father')
        Column(){
          Scroll(this.scroller) {
            Column() {
              ForEach(this.arr, (item: number) => {
                Text(item.toString())
                  .width('90%')
                  .height(100)
                  .backgroundColor(0xFFFFFF)
                  .borderRadius(15)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 10 })
              }, (item: string) => item)
            }.width('100%')
          }
          .backgroundColor(0XBDDB69)
          .scrollable(ScrollDirection.Vertical)
          .scrollBar(BarState.On)
          .scrollBarColor(Color.Gray)
          .scrollBarWidth(10)
          .key("Scroll_Size")
          .size({ width: 261, height: 140})
          .translate({ x: 1, y: 1, z: 1 })
          .scale({ x: 1, y: 1, z: 1, centerX: 1, centerY: 1 })
          .rotate({ x: 1, y: 1, z: 1, angle: 0, centerX: 1, centerY: 1 })
          .transform(matrix)
        }.key('Scroll_Father')
        Column(){
          Search()
            .backgroundColor(0XBDDB69)
            .key("Search_Size")
            .size({ width: 360, height: 240 })
            .translate({ x: 1, y: 1, z: 1 })
            .scale({ x: 1, y: 1, z: 1, centerX: 1, centerY: 1 })
            .rotate({ x: 1, y: 1, z: 1, angle: 0, centerX: 1, centerY: 1 })
            .transform(matrix)
        }.key('Search_Father')
      }.width('100%')
    }.height('100%')
  }
}