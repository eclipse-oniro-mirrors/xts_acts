/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

@Entry
@Component
struct onvExample {
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State testTextStr: string = "test"
  @State testRowStr: string = "test"

  build() {
    Column() {
      Column() {
        Text(this.testTextStr).id("onVisibleAreaApproximateChange_column_id")
          .fontSize(20)

        Text(this.testRowStr).id("onVisibleAreaApproximateChange_row_id")
          .fontSize(20)
      }
      .height('5%')
      .backgroundColor(Color.Gray)
      .opacity(0.3)

      Scroll(this.scroller) {
        Column() {
          Text("Test Text Visible Change")
            .fontSize(20)
            .height('50%')
            .margin({ top: 1, bottom: 1 })
            .backgroundColor(Color.Green)// 通过设置ratios为[0.0, 1.0]，实现当组件完全显示或完全消失在屏幕中时触发回调
            .onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number) => {
              console.info("Test Text isVisible: " + isVisible + ", currentRatio:" + currentRatio)
              if (isVisible && currentRatio >= 1.0) {
                console.info("Test Text is fully visible. currentRatio:" + currentRatio)
                this.testTextStr = "Test Text is fully visible"
              } 

              if (!isVisible && currentRatio <= 0.0) {
                console.info("Test Text is completely invisible.")
                this.testTextStr = "Test Text is completely invisible"
              }
            })

          Row() {
            Text("Test Row Visible  Change")
              .fontSize(20)
              .margin({ bottom: 1 })

          }
          .height('50%')
          .backgroundColor(Color.Yellow)
          .onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number) => {
            console.info("Test Row isVisible:" + isVisible + ", currentRatio:" + currentRatio)
            if (isVisible && currentRatio >= 1.0) {
              console.info("Test Row is fully visible.")
              this.testRowStr = "Test Row is fully visible"
            }

            if (!isVisible && currentRatio <= 0.0) {
              console.info("Test Row is is completely invisible.")
              this.testRowStr = "Test Row is is completely invisible"
            }
          })

          ForEach(this.arr, (item: string) => {
            Text(item.toString())
              .width('90%')
              .height('20%')
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 1 })
          }, (item: string) => item)

        }.width('100%')
      }
      .id('onVisibleAreaApproximateChange_scroll_id')
      .backgroundColor(0x317aff)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .onScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollEnd(() => {
        console.info('Scroll Stop')
      })

    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}