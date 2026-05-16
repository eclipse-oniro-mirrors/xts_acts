/**
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
struct GridScrollBarWidthExample {
  scroller: Scroller = new Scroller();
  @State gridPosition: number = 0; // 0代表滚动到grid顶部，1代表中间值，2代表滚动到grid底部。
  @State changeScrollBarWidthIndex: number = 0;
  @State changeScrollBarWidthList: ( Resource )[] = [
    $r('app.string.scrollBarWidth_Normal'),$r('app.string.scrollBarWidth_Error')
  ]
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  build() {
    Column({ space: 5}  as ColumnOptions) {
      Row(){
        Button('0')
          .onClick(() => {
            this.changeScrollBarWidthIndex = 0
          })
          .id('changeGridScrollBarWidthValue0')
        Button('1')
          .onClick(() => {
            this.changeScrollBarWidthIndex = 1
          })
          .id('changeGridScrollBarWidthValue1')
      }
      Grid() {
        ForEach(this.data, (i: number) => {
          GridItem() {
            Text(`${i}`)
              .fontSize(20)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height(80)
              .backgroundColor(0xFFE4B5)
          }
        }, (i: number) => i.toString())
      }
      .id('gridScrollBarWidth')
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Grey)
      .scrollBarWidth(this.changeScrollBarWidthList[this.changeScrollBarWidthIndex])
      .columnsTemplate('1fr')
      .rowsGap(8)
      .backgroundColor(0xFFF8F0)
      .width('100%')
    }.width('100%').margin({ top: 5 })
  }
}