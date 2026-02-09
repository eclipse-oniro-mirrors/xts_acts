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
struct GridExample1 {
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  @State numbers: number[] = []
  @State translateY: number = 0
  private scroller: Scroller = new Scroller()

  aboutToAppear() {
    for (let i = 0; i < 100; i++) {
      this.numbers.push(i)
    }
  }

  build() {
    Stack() {
      Column() {
        Column() {
          Grid(this.scroller ) {
            GridItem() {
              Text('GoodsTypeList1')
            }
            .backgroundColor(this.colors[0])

            .columnStart(0)
            .columnEnd(1)

            GridItem() {
              Text('GoodsTypeList2')
            }
            .backgroundColor(this.colors[1])
            .columnStart(0)
            .columnEnd(1)

            GridItem() {
              Text('GoodsTypeList3')
            }
            .backgroundColor(this.colors[2])
            .columnStart(0)
            .columnEnd(1)

            GridItem() {
              Text('GoodsTypeList4')
            }
            .backgroundColor(this.colors[3])
            .columnStart(0)
            .columnEnd(1)

            GridItem() {
              Text('GoodsTypeList5')
            }
            .backgroundColor(this.colors[4])
            .columnStart(0)
            .columnEnd(1)
            GridItem() {
              Text('GoodsTypeList1')
            }
            .backgroundColor(this.colors[0])

            .columnStart(0)
            .columnEnd(1)

            GridItem() {
              Text('GoodsTypeList2')
            }
            .backgroundColor(this.colors[1])
            .columnStart(0)
            .columnEnd(1)

            GridItem() {
              Text('GoodsTypeList3')
            }
            .backgroundColor(this.colors[2])
            .columnStart(0)
            .columnEnd(1)

            GridItem() {
              Text('GoodsTypeList4')
            }
            .backgroundColor(this.colors[3])
            .columnStart(0)
            .columnEnd(1)

          }

          .id('Grid')
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .scrollBarWidth(4)
          .scrollBar(BarState.On)
          .scrollBarColor($r('app.color.color_yellow'))
        }
        .width('100%')
        .height('100%')
        .padding({ left: 10, right: 10 })
      }
    }
    .align(Alignment.BottomEnd)
  }
}
