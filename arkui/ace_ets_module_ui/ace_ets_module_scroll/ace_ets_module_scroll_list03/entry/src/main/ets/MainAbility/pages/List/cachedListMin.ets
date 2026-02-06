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
struct cachedCountListMin {
  @State arr: number[] = []
  scroller: Scroller = new Scroller;

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.arr.push(i)
    }
  }
  build() {
    Column() {
      Text('cachedCount(0)')
      List() {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('50%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(20)
              .backgroundColor(0xF9CF93)
          }
        }, (item: string) => item)
      }
      .id('list_cached_0')
      .cachedCount(0)
      .clip(false)
      .border({width:1})
      .width('80%')
      .height('30%')
      .scrollBar(BarState.On)
      .backgroundColor(0xFAEEE0)

      Text('cachedCount(-1)')
      List() {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('50%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(20)
              .backgroundColor(0xF9CF93)
          }
        }, (item: string) => item)
      }
      .id('list_cached_negative')
      .clip(false)
      .cachedCount(-1)
      .border({width:1})
      .width('80%')
      .height('30%')
      .scrollBar(BarState.On)
      .backgroundColor(0xFAEEE0)

    }.width('100%')
    .height('100%')
  }
}