/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct ListContentOffsetMin {
  @State arr: number[] = []
  scroller: Scroller = new Scroller;

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.arr.push(i)
    }
  }

  build() {
    Column() {
      Text('contentOffset(0)')
      List() {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('50%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xF9CF93)
          }
        }, (item: string) => item)
      }
      .id('contentOffset_0')
      .contentStartOffset(0)
      .contentEndOffset(0)
      .width('80%')
      .height('30%')
      .scrollBar(BarState.On)
      .backgroundColor(Color.Green)

      Text('contentOffset(-1)')
      List() {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('50%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xF9CF93)
          }
          .id('item_min_ne_' + item)
        }, (item: string) => item)
      }
      .id('contentOffset_negative')
      .contentStartOffset(-1)
      .contentEndOffset(-1)
      .width('80%')
      .height('30%')
      .scrollBar(BarState.On)
      .backgroundColor(Color.Green)

    }
    .width('100%')
    .height('100%')
  }
}