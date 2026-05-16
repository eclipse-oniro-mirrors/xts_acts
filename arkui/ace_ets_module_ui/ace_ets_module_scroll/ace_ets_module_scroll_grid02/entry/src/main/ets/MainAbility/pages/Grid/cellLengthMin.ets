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
struct cellLengthGridMin {
  @State arr: number[] = []
  scroller: Scroller = new Scroller;

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.arr.push(i)
    }
  }

  build() {
    Column() {
      Text('cellLength(0)')
      Grid(this.scroller) {
        GridItem() {
          Text('item0')
            .width('60%')
            .height('100%')
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xF9CF93)
        }
        .id('gi_cellLength_0')
      }
      .id('cellLength_0')
      .cellLength(0)
      .layoutDirection(GridDirection.Row)
      .height('30%')
      .backgroundColor(0xFAEEE0)

      Text('cellLength(1)')
      Grid(this.scroller) {
        GridItem() {
          Text('item1')
            .width('60%')
            .height('100%')
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xF9CF93)
        }
      }
      .id('cellLength_1')
      .cellLength(1)
      .layoutDirection(GridDirection.Row)
      .height('30%')
      .backgroundColor(0xFAEEE0)

    }
    .width('100%')
    .height('100%')
  }
}