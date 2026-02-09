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
import { MessageManager, Callback } from '../../common/MessageManager';
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct PickerIndicatorPage {
  @State index: number = 0;
  @State selectedIndex: number = 0;
  startBorderStyle: LocalizedBorderRadiuses = {
    topStart: LengthMetrics.vp(10),
    bottomStart: LengthMetrics.vp(10),
    topEnd: LengthMetrics.vp(10),
    bottomEnd: LengthMetrics.vp(10)
  }
  startBorderStyle1: LocalizedBorderRadiuses = {
    topStart: LengthMetrics.vp(-1),
    bottomStart: LengthMetrics.vp(-1),
    topEnd: LengthMetrics.vp(-1),
    bottomEnd: LengthMetrics.vp(-1)
  }
  private fontSize: number | string | Resource = '25vp';
  private monthArray: string[] = [];

  aboutToAppear(): void {
    for (let i = 1; i <= 12; i++) {
      this.monthArray.push(i + '月')
    }
  }

  build() {
    Column() {
      Row() {
        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker1')
        .selectionIndicator({
          type: PickerIndicatorType.DIVIDER,
          strokeWidth: LengthMetrics.vp(2),
          dividerColor: Color.Blue,
          startMargin: LengthMetrics.vp(2),
          endMargin: LengthMetrics.vp(2)
        })

        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker2')
        .selectionIndicator({
          type: PickerIndicatorType.DIVIDER,
          strokeWidth: LengthMetrics.vp(-1),
          dividerColor: Color.Red,
          startMargin: LengthMetrics.vp(-1),
          endMargin: LengthMetrics.vp(-1)
        })

        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker3')
        .selectionIndicator({
          type: PickerIndicatorType.BACKGROUND, backgroundColor: Color.Blue, borderRadius: {
            topLeft: 2,
            topRight: 2,
            bottomLeft: 2,
            bottomRight: 2
          }
        })

        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker4')
        .selectionIndicator({
          type: PickerIndicatorType.BACKGROUND,
          backgroundColor: Color.Blue,
          borderRadius: LengthMetrics.vp(2)
        })

        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker5')
        .selectionIndicator({
          type: PickerIndicatorType.BACKGROUND,
          backgroundColor: Color.Blue,
          borderRadius: this.startBorderStyle
        })
      }

      Row() {
        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker6')
        .selectionIndicator({
          type: PickerIndicatorType.BACKGROUND, backgroundColor: Color.Blue, borderRadius: {
            topLeft: -1,
            topRight: -1,
            bottomLeft: -1,
            bottomRight: -1
          }
        })

        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker7')
        .selectionIndicator({
          type: PickerIndicatorType.BACKGROUND,
          backgroundColor: Color.Blue,
          borderRadius: LengthMetrics.vp(-1)
        })

        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker8')
        .selectionIndicator(
          { type: PickerIndicatorType.BACKGROUND, backgroundColor: Color.Blue, borderRadius: this.startBorderStyle1 })

        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker9')
        .selectionIndicator(undefined)

        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker10')
        .selectionIndicator(null)
      }

      Row() {
        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker11')
        .selectionIndicator({ type: undefined })

        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker12')
        .selectionIndicator({
          type: PickerIndicatorType.BACKGROUND,
          backgroundColor: undefined,
          borderRadius: this.startBorderStyle1
        })

        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker13')
        .selectionIndicator({
          type: PickerIndicatorType.BACKGROUND,
          backgroundColor: null,
          borderRadius: this.startBorderStyle1
        })

        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker14')
        .selectionIndicator({
          type: PickerIndicatorType.DIVIDER,
          strokeWidth: LengthMetrics.vp(-1),
          dividerColor: undefined,
          startMargin: LengthMetrics.vp(-1),
          endMargin: LengthMetrics.vp(-1)
        })

        UIPickerComponent({
          selectedIndex: this.selectedIndex,
        }) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('picker15')
        .selectionIndicator({
          type: PickerIndicatorType.DIVIDER,
          strokeWidth: LengthMetrics.vp(-1),
          dividerColor: null,
          startMargin: LengthMetrics.vp(-1),
          endMargin: LengthMetrics.vp(-1)
        })
      }
    }
  }
}
