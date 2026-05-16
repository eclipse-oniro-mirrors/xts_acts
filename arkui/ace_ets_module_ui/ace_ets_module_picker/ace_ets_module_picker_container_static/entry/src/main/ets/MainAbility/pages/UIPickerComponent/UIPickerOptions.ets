'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Entry, Scroll, Column, Component, Button, $r, Row,Color,
  Text, ClickEvent,TextAlign,FlexAlign, PickerIndicatorType,
  Resource, UIPickerComponent, ForEach, UIPickerComponentOptions, LengthMetrics,
  UIPickerComponentAttribute} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct UIPickerOptions {
  private fontSize: Double  =  20.0;
  private monthArray: string[] = [] as string[];

  aboutToAppear(): void {
    for (let i = 1; i <= 12; i++) {
      this.monthArray.push(i + '月')
    }
  }

  build() {
    Column(undefined) {
      Row() {
        UIPickerComponent() {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('10%')
        .id('UIPickerIndex1')

        UIPickerComponent({selectedIndex: -1} as UIPickerComponentOptions) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('10%')
        .id('UIPickerIndex2')

        UIPickerComponent({selectedIndex: 0} as UIPickerComponentOptions) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('10%')
        .id('UIPickerIndex3')

        UIPickerComponent({selectedIndex: 12} as UIPickerComponentOptions) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('UIPickerIndex4')
      }
      Row() {
        UIPickerComponent({selectedIndex: 13} as UIPickerComponentOptions) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('10%')
        .id('UIPickerIndex5')

        UIPickerComponent({selectedIndex: 5} as UIPickerComponentOptions) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('10%')
        .id('UIPickerIndex6')

        UIPickerComponent({selectedIndex: undefined}) {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('10%')
        .id('UIPickerIndex7')
      }
    }.width('100%').height('100%')
  }
}