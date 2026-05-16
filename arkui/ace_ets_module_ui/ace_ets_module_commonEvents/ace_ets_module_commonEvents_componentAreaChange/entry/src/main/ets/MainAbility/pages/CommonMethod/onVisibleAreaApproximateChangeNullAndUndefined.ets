/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct CommonMethodOnVisibleAreaApproximateChangeNullAndUndefined {
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State testTextStr: string = 'test'
  @State testRowStr: string = 'test'

  build() {
    Column() {
      Column() {
        Text(this.testTextStr).id('onVisibleAreaApproximateChange_column_id')
        Text(this.testRowStr).id('onVisibleAreaApproximateChange_row_id')
      }
      .height('10%')
      .backgroundColor(Color.Gray)
      .opacity(0.3)

      Scroll(this.scroller) {
        Column() {
          Text('Test Text Visible Change')
            .height('30%')
            .backgroundColor(Color.Green)
            .onVisibleAreaApproximateChange({ ratios: [], expectedUpdateInterval: 1000 },
              (isExpanding: boolean, currentRatio: number) => {
                console.info('Test Text isExpanding: ' + isExpanding + ', currentRatio:' + currentRatio)
                if (isExpanding && currentRatio >= 1.0) {
                  console.info('Test Text is fully visible. currentRatio:' + currentRatio)
                  this.testTextStr = 'Test Text is fully visible'
                }

                if (!isExpanding && currentRatio <= 0.0) {
                  console.info('Test Text is completely invisible.')
                  this.testTextStr = 'Test Text is completely invisible'
                }
              })
          Text('Test Text Visible Change')
            .height('30%')
            .backgroundColor(Color.Green)
            .onVisibleAreaApproximateChange(null,
              (isExpanding: boolean, currentRatio: number) => {
                console.info('Test Text isExpanding: ' + isExpanding + ', currentRatio:' + currentRatio)
                if (isExpanding && currentRatio >= 1.0) {
                  console.info('Test Text is fully visible. currentRatio:' + currentRatio)
                  this.testTextStr = 'Test Text is fully visible'
                }

                if (!isExpanding && currentRatio <= 0.0) {
                  console.info('Test Text is completely invisible.')
                  this.testTextStr = 'Test Text is completely invisible'
                }
              })
          Text('Test Text Visible Change')
            .height('30%')
            .backgroundColor(Color.Green)
            .onVisibleAreaApproximateChange(undefined,
              (isExpanding: boolean, currentRatio: number) => {
                console.info('Test Text isExpanding: ' + isExpanding + ', currentRatio:' + currentRatio)
                if (isExpanding && currentRatio >= 1.0) {
                  console.info('Test Text is fully visible. currentRatio:' + currentRatio)
                  this.testTextStr = 'Test Text is fully visible'
                }

                if (!isExpanding && currentRatio <= 0.0) {
                  console.info('Test Text is completely invisible.')
                  this.testTextStr = 'Test Text is completely invisible'
                }
              })
          Text('Test Text Visible Change')
            .height('30%')
            .backgroundColor(Color.Green)
            .onVisibleAreaApproximateChange({ ratios: [0.0, 1.0], expectedUpdateInterval: 1000 },
              null)
          Text('Test Text Visible Change')
            .height('30%')
            .backgroundColor(Color.Green)
            .onVisibleAreaApproximateChange({ ratios: [0.0, 1.0], expectedUpdateInterval: 1000 },
              undefined)

          Row() {
            Text('Test Row Visible  Change')
          }
          .height('30%')
          .backgroundColor(Color.Yellow)
          .onVisibleAreaChange(null, (isExpanding: boolean, currentRatio: number) => {
            console.info('Test Row isExpanding:' + isExpanding + ', currentRatio:' + currentRatio)
            if (isExpanding && currentRatio >= 1.0) {
              console.info('Test Row is fully visible.')
              this.testRowStr = 'Test Row is fully visible'
            }

            if (!isExpanding && currentRatio <= 0.0) {
              console.info('Test Row is completely invisible.')
              this.testRowStr = 'Test Row is completely invisible'
            }
          })
          Row() {
            Text('Test Row Visible  Change')
          }
          .height('30%')
          .backgroundColor(Color.Yellow)
          .onVisibleAreaChange(undefined, (isExpanding: boolean, currentRatio: number) => {
            console.info('Test Row isExpanding:' + isExpanding + ', currentRatio:' + currentRatio)
            if (isExpanding && currentRatio >= 1.0) {
              console.info('Test Row is fully visible.')
              this.testRowStr = 'Test Row is fully visible'
            }

            if (!isExpanding && currentRatio <= 0.0) {
              console.info('Test Row is completely invisible.')
              this.testRowStr = 'Test Row is completely invisible'
            }
          })
          Row() {
            Text('Test Row Visible  Change')
          }
          .height('30%')
          .backgroundColor(Color.Yellow)
          .onVisibleAreaChange([], (isExpanding: boolean, currentRatio: number) => {
            console.info('Test Row isExpanding:' + isExpanding + ', currentRatio:' + currentRatio)
            if (isExpanding && currentRatio >= 1.0) {
              console.info('Test Row is fully visible.')
              this.testRowStr = 'Test Row is fully visible'
            }

            if (!isExpanding && currentRatio <= 0.0) {
              console.info('Test Row is completely invisible.')
              this.testRowStr = 'Test Row is completely invisible'
            }
          })

          Row() {
            Text('Test Row Visible  Change')
          }
          .height('30%')
          .backgroundColor(Color.Yellow)
          .onVisibleAreaChange(null, (isExpanding: boolean, currentRatio: number) => {
            console.info('Test Row isExpanding:' + isExpanding + ', currentRatio:' + currentRatio)
            if (isExpanding && currentRatio >= 1.0) {
              console.info('Test Row is fully visible.')
              this.testRowStr = 'Test Row is fully visible'
            }

            if (!isExpanding && currentRatio <= 0.0) {
              console.info('Test Row is completely invisible.')
              this.testRowStr = 'Test Row is completely invisible'
            }
          },true)
          Row() {
            Text('Test Row Visible  Change')
          }
          .height('30%')
          .backgroundColor(Color.Yellow)
          .onVisibleAreaChange(undefined, (isExpanding: boolean, currentRatio: number) => {
            console.info('Test Row isExpanding:' + isExpanding + ', currentRatio:' + currentRatio)
            if (isExpanding && currentRatio >= 1.0) {
              console.info('Test Row is fully visible.')
              this.testRowStr = 'Test Row is fully visible'
            }

            if (!isExpanding && currentRatio <= 0.0) {
              console.info('Test Row is completely invisible.')
              this.testRowStr = 'Test Row is completely invisible'
            }
          },true)
          Row() {
            Text('Test Row Visible  Change')
          }
          .height('30%')
          .backgroundColor(Color.Yellow)
          .onVisibleAreaChange([], (isExpanding: boolean, currentRatio: number) => {
            console.info('Test Row isExpanding:' + isExpanding + ', currentRatio:' + currentRatio)
            if (isExpanding && currentRatio >= 1.0) {
              console.info('Test Row is fully visible.')
              this.testRowStr = 'Test Row is fully visible'
            }

            if (!isExpanding && currentRatio <= 0.0) {
              console.info('Test Row is completely invisible.')
              this.testRowStr = 'Test Row is completely invisible'
            }
          },true)

          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height('10%')
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .textAlign(TextAlign.Center)
          }, (item: number) => (item.toString()))

        }.width('100%')
      }
      .id('onVisibleAreaApproximateChange_scroll_id')
      .backgroundColor(0x317aff)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })

    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}
