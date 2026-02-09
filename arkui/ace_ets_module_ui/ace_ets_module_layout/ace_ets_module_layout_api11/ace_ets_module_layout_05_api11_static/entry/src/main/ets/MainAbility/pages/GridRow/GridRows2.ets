'use static';
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
import { Entry, Component, Flex, Scroll, Color, GridItem, Column, ColumnOptions, ForEach, ClickEvent, Margin, Button, Text, Grid, Alignment } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct GridRows2 {
  @State numbers: string[] = new Array<string>()
  @State rowsGap: string = '1fr 1fr 1fr'
  @State text: string = ''

  aboutToAppear() {
    for (let i = 1; i <= 10; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Scroll() {
      Column({ space: 5 } as ColumnOptions) {
        Button('rowsTemplate: -1fr').onClick((e: ClickEvent) => {
          this.rowsGap = '-1fr'
        }).key('GridRows2Bt1')

        Button('rowsTemplate: 0fr').onClick((e: ClickEvent) => {
          this.rowsGap = '0fr'
        }).key('GridRows2Bt2')

        Text(this.text).key('GridRows2Text')

        Grid() {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day).fontSize(16).backgroundColor(0xF9CF93)
            }.width(100).height(100).backgroundColor(Color.Pink).key('GridRows2_' + day)
            .onClick((e: ClickEvent) => {
              this.text = 'change'
            })
          }, (day: string) => day)
        }
        .key('GridRows2')
        .height('60%')
        .width('100%')
        .rowsGap(10)
        .backgroundColor(0xFAEEE0)
        .rowsTemplate(this.rowsGap)

      }
      .width('90%').margin({ top: 5, left: 5, right: 5 } as Margin)
      .align(Alignment.Center)
    }
  }
}