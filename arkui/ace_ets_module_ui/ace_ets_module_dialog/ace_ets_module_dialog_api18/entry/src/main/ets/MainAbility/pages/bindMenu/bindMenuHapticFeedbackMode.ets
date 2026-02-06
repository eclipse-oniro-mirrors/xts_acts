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
struct BindMenuExample {
  @State listData: number[] = [0, 0, 0]
  @State hap1: HapticFeedbackMode | undefined | null = HapticFeedbackMode.DISABLED
  @State txt1: string = ''
  @State hap2: HapticFeedbackMode | undefined | null = HapticFeedbackMode.ENABLED
  @State txt2: string = ''
  @State hap3: HapticFeedbackMode | undefined | null = HapticFeedbackMode.AUTO
  @State txt3: string = ''
  @State hap4: HapticFeedbackMode | undefined | null = undefined
  @State txt4: string = ''
  @State hap5: HapticFeedbackMode | undefined | null = null
  @State txt5: string = ''

   @Builder
  MenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      ForEach(this.listData, (item: number, index) => {
        Column() {
          Row() {
            Image($r('app.media.app_icon')).width('%1').height('%1').margin({ right: 5 })
            Text(`Menu${index as number + 1}`)
          }
          .id('menu')
          .width('100%')
          .height('%10')
          .justifyContent(FlexAlign.Start)
          .align(Alignment.Start)
          .onClick(() => {
            console.info(`Menu${index as number + 1} Clicked!`)
          })

          if (index != this.listData.length - 1) {
            Divider().height('%1').width('80%').color('#ccc')
          }
        }.height('%20').width('40%')
      })
    }.width('50%')
  }

  build() {
    Column() {
      Row() {
        Column() {
          Button('1')
            .id('button1')
            .fontSize(15)
            .fontColor(Color.White)
            .bindMenu(this.MenuBuilder, {
              hapticFeedbackMode: this.hap1,
              onDisappear: () => {
                this.txt1 = JSON.stringify(this.hap1)
              }
            })
          Text(this.txt1)
            .id('text1')
        }
        Column() {
          Button('2')
            .id('button2')
            .fontSize(15)
            .fontColor(Color.White)
            .bindMenu(this.MenuBuilder, {
              hapticFeedbackMode: this.hap2,
              onDisappear: () => {
                this.txt2 = JSON.stringify(this.hap2)
              }
            })
          Text(this.txt2)
            .id('text2')
        }
        Column() {
          Button('3')
            .id('button3')
            .fontSize(15)
            .fontColor(Color.White)
            .bindMenu(this.MenuBuilder, {
              hapticFeedbackMode: this.hap3,
              onDisappear: () => {
                this.txt3 = JSON.stringify(this.hap3)
              }
            })
          Text(this.txt3)
            .id('text3')
        }
      }.margin({top:5})
      Row() {
        Column() {
          Button('4')
            .id('button4')
            .fontSize(15)
            .fontColor(Color.White)
            .bindMenu(this.MenuBuilder, {
              hapticFeedbackMode: this.hap4,
              onDisappear: () => {
                this.txt4 = JSON.stringify(this.hap4)
              }
            })
          Text(this.txt4)
            .id('text4')
        }

        Column() {
          Button('5')
            .id('button5')
            .fontSize(15)
            .fontColor(Color.White)
            .bindMenu(this.MenuBuilder, {
              hapticFeedbackMode: this.hap5,
              onDisappear: () => {
                this.txt5 = JSON.stringify(this.hap5)
              }
            })
          Text(this.txt5)
            .id('text5')
        }
      }.margin({top:5})
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f0f0f0')
  }
}