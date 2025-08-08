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
struct GridRows1 {
  @State numbers: string[] = []
  @State rowsGap: number = 0

  aboutToAppear() {
    for (let i = 1; i <= 10; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Button('rowsGap: -5')
          .height('5%')
          .onClick(() => {
            this.rowsGap = -5
          }).key('GridRows1Bt1')

        Button('rowsGap: 500')
          .height('5%')
          .onClick(() => {
            this.rowsGap = 500
          }).key('GridRows1Bt2')

        Button('rowsGap: 5')
          .height('5%')
          .onClick(() => {
            this.rowsGap = 5
          }).key('GridRows1Bt3')
        
        Grid() {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day).fontSize(16).backgroundColor(0xF9CF93)
            }.width('30%').height('20%').backgroundColor(Color.Pink).key('GridRows1_' + day)
          }, (day: string) => day)
        }
        .key('GridRows1')
        .height('60%')
        .width('100%')
        .columnsGap(0)
        .rowsGap(this.rowsGap)
        .backgroundColor(0xFAEEE0)

      }
      .width('90%').margin({ top: 5, left: 5, right: 5 })
      .align(Alignment.Center)
    }
  }
}