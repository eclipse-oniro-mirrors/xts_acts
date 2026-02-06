/*
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
struct ButtonAlign {
  @State isLocalizedAlignment: LocalizedAlignment[] =
    [LocalizedAlignment.TOP_START, LocalizedAlignment.TOP, LocalizedAlignment.TOP_END, LocalizedAlignment.START,
      LocalizedAlignment.CENTER, LocalizedAlignment.END, LocalizedAlignment.BOTTOM_START, LocalizedAlignment.BOTTOM,
      LocalizedAlignment.BOTTOM_END]
  @State isLocalizedAlignmentIndex: number = 0
  @State isDirection: Direction[] = [Direction.Ltr, Direction.Rtl, Direction.Auto]
  @State isDirectionIndex: number = 0

  build() {
    Row() {
      Column({space:2}) {
        Row() {
          Button('TOP_START')
            .id('AlignTopStart')
            .onClick(() => {
              this.isLocalizedAlignmentIndex = 0
            })
            .width(65)
            .height(25)
          Button('TOP')
            .id('AlignTop')
            .onClick(() => {
              this.isLocalizedAlignmentIndex = 1
            })
            .width(65)
            .height(25)
          Button('TOP_END')
            .id('AlignTopEnd')
            .onClick(() => {
              this.isLocalizedAlignmentIndex = 2
            })
            .width(65)
            .height(25)
        }

        Row() {
          Button('START')
            .id('AlignStart')
            .onClick(() => {
              this.isLocalizedAlignmentIndex = 3
            })
            .width(65)
            .height(25)
          Button('CENTER')
            .id('AlignCenter')
            .onClick(() => {
              this.isLocalizedAlignmentIndex = 4
            })
            .width(65)
            .height(25)
          Button('END')
            .id('AlignEnd')
            .onClick(() => {
              this.isLocalizedAlignmentIndex = 5
            })
            .width(65)
            .height(25)
        }

        Row() {
          Button('BOTTOM_START')
            .id('AlignBottomStart')
            .onClick(() => {
              this.isLocalizedAlignmentIndex = 6
            })
            .width(65)
            .height(25)
          Button('BOTTOM')
            .id('AlignBottom')
            .onClick(() => {
              this.isLocalizedAlignmentIndex = 7
            })
            .width(65)
            .height(25)
          Button('BOTTOM_END')
            .id('AlignBottomEnd')
            .onClick(() => {
              this.isLocalizedAlignmentIndex = 8
            })
            .width(65)
            .height(25)
        }

        Row() {
          Button('Ltr')
            .onClick(() => {
              this.isDirectionIndex = 0
            })
            .width(65)
            .height(25)
          Button('Rtl')
            .onClick(() => {
              this.isDirectionIndex = 1
            })
            .width(65)
            .height(25)
          Button('Auto')
            .onClick(() => {
              this.isDirectionIndex = 2
            })
            .width(65)
            .height(25)
        }

        Button('OVER')
          .id('GetAlignButton1')
          .direction(this.isDirection[this.isDirectionIndex])
          .align(this.isLocalizedAlignment[this.isLocalizedAlignmentIndex])
          .width(120)
          .height(90)
          .backgroundColor(0x317aff)

      }
      .width('100%')
    }
    .width('100%')
  }
}