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
struct frictionScrollMin {
  @State arr: number[] = []
  scroller: Scroller = new Scroller;

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.arr.push(i)
    }
  }
  build() {
    Column() {
      Text('friction(-1)')
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height('40%')
              .borderRadius(15)
              .textAlign(TextAlign.Center)
          }, (item: number) => item.toString())
        }
      }
      .friction(-1)
      .id('scroll_friction_negative')
      .width('80%')
      .height('20%')
      .backgroundColor(0xDCDCDC)
      Text('friction(0)')
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height('40%')
              .borderRadius(15)
              .textAlign(TextAlign.Center)
          }, (item: number) => item.toString())
        }
      }
      .friction(0)
      .id('scroll_friction_0')
      .width('80%')
      .height('20%')
      .backgroundColor(0xDCDCDC)

      Text('friction(1)')
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height('40%')
              .borderRadius(15)
              .textAlign(TextAlign.Center)
          }, (item: number) => item.toString())
        }
      }
      .friction(1)
      .id('scroll_friction_1')
      .width('80%')
      .height('20%')
      .backgroundColor(0xDCDCDC)

    }.width('100%')
    .height('100%')
  }
}