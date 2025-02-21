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
@Entry
@Component
struct GridRows2 {
  @State numbers: string[] = []
  @State rowsGap: string = '1fr 1fr 1fr'
  @State text: string = ''

  aboutToAppear() {
    for (let i = 1; i <= 10; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Grid() {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day).fontSize(16).backgroundColor(0xF9CF93)
            }.width(100).height(100).backgroundColor(Color.Pink).key('GridRows2_' + day)
            .onClick(() => {
              this.text = 'change'
            })
          }, (day: string) => day)
        }
        .key('GridRows2')
        .height(300)
        .width(410)
        .rowsGap(10)
        .backgroundColor(0xFAEEE0)
        .rowsTemplate(this.rowsGap)

        Row() {
          Button('rowsTemplate: -1fr').onClick(() => {
            this.rowsGap = '-1fr'
          }).key('GridRows2Bt1')

          Button('rowsTemplate: 0fr').onClick(() => {
            this.rowsGap = '0fr'
          }).key('GridRows2Bt2')
        }

        Text(this.text).key('GridRows2Text')

      }
      .width('90%').margin({ top: 5, left: 5, right: 5 })
      .align(Alignment.Center)
    }
  }
}