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
struct ScrollPropertiesTestPage {
  private scroller: Scroller = new Scroller()

  build() {
    Scroll() {
      Column() {
        Text('autoAdjustScrollBarMargin Tests')
        Row(){
          Scroll(this.scroller) {
            Column() {
              ForEach([1, 2, 3, 4, 5], (item: number) => {
                Text('Item ' + item)
                  .width('100%')
                  .height('30%')
                  .backgroundColor('#F0F0F0')
                  .borderRadius(5)
                  .margin({ bottom: 5 })
              })
            }
          }
          .id('scroll_autoAdjust_true')
          .width('50%')
          .height('100%')
          .scrollBar(BarState.On)
          .autoAdjustScrollBarMargin(true)

          Scroll(this.scroller) {
            Column() {
              ForEach([1, 2, 3, 4, 5], (item: number) => {
                Text('Item ' + item)
                  .width('100%')
                  .height('30%')
                  .backgroundColor('#E0E0E0')
                  .borderRadius(5)
                  .margin({ bottom: 5 })
              })
            }
          }
          .id('scroll_autoAdjust_false')
          .width('50%')
          .height('100%')
          .scrollBar(BarState.On)
          .autoAdjustScrollBarMargin(false)
        }
        .width('100%')
        .height('20%')

        Row(){
          Scroll(this.scroller) {
            Column() {
              ForEach([1, 2, 3, 4, 5], (item: number) => {
                Text('Item ' + item)
                  .width('100%')
                  .height('30%')
                  .backgroundColor('#D0D0D0')
                  .borderRadius(5)
                  .margin({ bottom: 5 })
              })
            }
          }
          .id('scroll_autoAdjust_undefined')
          .width('50%')
          .height('100%')
          .scrollBar(BarState.On)
          .autoAdjustScrollBarMargin(undefined)

          Scroll(this.scroller) {
            Column() {
              ForEach([1, 2, 3, 4, 5], (item: number) => {
                Text('Item ' + item)
                  .width('100%')
                  .height('30%')
                  .backgroundColor('#C0C0C0')
                  .borderRadius(5)
                  .margin({ bottom: 5 })
              })
            }
          }
          .id('scroll_autoAdjust_null')
          .width('50%')
          .height('100%')
          .scrollBar(BarState.On)
          .autoAdjustScrollBarMargin(null)
        }
        .width('100%')
        .height('20%')

        Text('enableScrollWithMouse Tests')
        Row(){
          Scroll(this.scroller) {
            Column() {
              ForEach([1, 2, 3, 4, 5], (item: number) => {
                Text('Item ' + item)
                  .width('100%')
                  .height('30%')
                  .backgroundColor('#F0F0F0')
                  .borderRadius(5)
                  .margin({ bottom: 5 })
              })
            }
          }
          .id('scroll_enableMouse_true')
          .width('50%')
          .height('100%')
          .scrollBar(BarState.On)
          .enableScrollWithMouse(true)

          Scroll(this.scroller) {
            Column() {
              ForEach([1, 2, 3, 4, 5], (item: number) => {
                Text('Item ' + item)
                  .width('100%')
                  .height('30%')
                  .backgroundColor('#E0E0E0')
                  .borderRadius(5)
                  .margin({ bottom: 5 })
              })
            }
          }
          .id('scroll_enableMouse_false')
          .width('50%')
          .height('100%')
          .scrollBar(BarState.On)
          .enableScrollWithMouse(false)
        }
        .width('100%')
        .height('20%')

        Row(){
          Scroll(this.scroller) {
            Column() {
              ForEach([1, 2, 3, 4, 5], (item: number) => {
                Text('Item ' + item)
                  .width('100%')
                  .height('30%')
                  .backgroundColor('#D0D0D0')
                  .borderRadius(5)
                  .margin({ bottom: 5 })
              })
            }
          }
          .id('scroll_enableMouse_undefined')
          .width('50%')
          .height('100%')
          .scrollBar(BarState.On)
          .enableScrollWithMouse(undefined)

          Scroll(this.scroller) {
            Column() {
              ForEach([1, 2, 3, 4, 5], (item: number) => {
                Text('Item ' + item)
                  .width('100%')
                  .height('30%')
                  .backgroundColor('#C0C0C0')
                  .borderRadius(5)
                  .margin({ bottom: 5 })
              })
            }
          }
          .id('scroll_enableMouse_null')
          .width('50%')
          .height('100%')
          .scrollBar(BarState.On)
          .enableScrollWithMouse(null)
        }
        .width('100%')
        .height('20%')
      }
      .width('100%')
      .padding(2)
    }
    .width('100%')
    .height('100%')
  }
}