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
@ObservedV2
class ArrayGrid {
  @Trace arr: Array<number> = [];

  // constructor，用于初始化数组个数
  constructor(count: number) {
    for (let i = 0; i < count; i++) {
      this.arr.push(i);
    }
  }
}

@Entry
@ComponentV2
struct totalGridRepeat {
  @Local arrayGrid: ArrayGrid = new ArrayGrid(20);
  @Local totalCount: number = this.arrayGrid.arr.length;
  scroller: Scroller = new Scroller();
  @Local onText:string = 'Grid: '

  build() {
    Column({ space: 5 }) {
      Text(''+ this.onText)
        .id('grid_repeat_true_onText')
        .width('90%')

      Button('next page true')
        .id('grid_repeat_animation_true')
        .onClick(() => { // 点击后滑到下一页
          this.scroller.scrollPage({ next: true, animation: true })
        })
      Grid(this.scroller) {
        Repeat(this.arrayGrid.arr)
          .virtualScroll({ totalCount: this.totalCount })
          .templateId((item: number, index: number) => {
            return 'number';
          })
          .template('number', (r) => {
            GridItem() {
              Text(r.index! + ":" + r.item + "Reuse")
                .height('13%')
            }
          })
          .each((r) => {
            GridItem() {
              Text(r.index! + ":" + r.item + "eachMessage")
                .height('13%')
            }
          })
      }
      .width('90%')
      .height('40%')
      .columnsTemplate('1fr 1fr')
      .rowsGap('2%')
      .backgroundColor(0xFAEEE0)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Grey)
      .scrollBarWidth(4)
      .borderWidth(2)
      .onScrollIndex((first: number, last: number) => {
        console.info(first.toString())
        console.info(last.toString())
      })
      .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info('scrollSource: ' + scrollSource)
        console.info(`onWillScroll scrollState = ${scrollState[scrollState]}, offset = ${scrollOffset}`)
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info(`onDidScroll scrollState = ${scrollState[scrollState]}, offset = ${scrollOffset}`)
        if (scrollState == ScrollState.Idle) {
          this.onText += 'onDidScroll-'
          console.info('ScrollState.Idle: ' + scrollState)
        }
      })
      .onScrollStart(() => {
        this.onText += 'onScrollStart-'
        console.info("XXX" + "Grid onScrollStart")
      })
      .onScrollStop(() => {
        this.onText += 'onScrollStop'
        console.info("XXX" + "Grid onScrollStop")
      })
      .onReachStart(() => {
        this.onText += 'onReachStart-'
        console.info("XXX" + "Grid onReachStart")
      })
      .onReachEnd(() => {
        this.onText += 'onReachEnd-'
        console.info("XXX" + "Grid onReachEnd")
      })

    }
    .width('100%')
    .height('100%')
    .margin({ top: 5 })
  }
}