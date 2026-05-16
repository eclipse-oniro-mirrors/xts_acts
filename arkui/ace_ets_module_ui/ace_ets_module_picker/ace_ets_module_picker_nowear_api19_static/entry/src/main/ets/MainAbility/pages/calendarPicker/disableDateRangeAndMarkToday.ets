'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// import abilityManager from '@ohos.app.abilityManager'
// import common from '@ohos.app.ability.common';

import EnvironmentCallback from '@ohos.app.ability.EnvironmentCallback';
import { Entry, Component, Column, Text, Image, Color, Padding, Button, ClickEvent, ColumnOptions, Direction, Scroll, FontWeight, CalendarPicker,
  Row, RowOptions, DateRange, CalendarOptions } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

let environmentCallback: EnvironmentCallback

@Entry
@Component
struct CalendarPickerExample {
  @State selectedDate: Date = new Date('2025-01-02')
  @State startDate: Date = new Date('2025-01-01')
  @State endDate: Date = new Date('2025-02-28')
  @State directions: Direction = Direction.Ltr
  // 1.1源码
  // @State markToday: boolean | undefined | null = true;
  @State markToday: boolean | undefined = true;
  @State count1: number = 0

  // 1.1源码
  // @State disableDateRange: DateRange[] | null | undefined = [
  //   { start: new Date('1970-01-01'), end: new Date('2024-11-10') },
  //   { start: new Date('2025-01-16'), end: new Date('2025-01-01') },
  //   { start: new Date('2025-01-03'), end: new Date('2025-01-06') },
  //   { start: new Date('2025-01-09'), end: new Date('2025-01-10') },
  // ]
  @State disableDateRange: DateRange[] | undefined = [
    { start: new Date('1970-01-01'), end: new Date('2024-11-10') } as DateRange,
    { start: new Date('2025-01-16'), end: new Date('2025-01-01') } as DateRange,
    { start: new Date('2025-01-03'), end: new Date('2025-01-06') } as DateRange,
    { start: new Date('2025-01-09'), end: new Date('2025-01-10') } as DateRange,
  ]

  build() {
    Scroll() {
      Column({ space: 2 } as ColumnOptions) {
        Text('disableDateRange:' + JSON.stringify(this.disableDateRange))
        Text('startDate:' + JSON.stringify(this.startDate))
        Text('endDate:' + JSON.stringify(this.endDate))
        
        Row({ space: 1 } as RowOptions) {
          Button('正常值 ').onClick((e: ClickEvent) => {
            this.disableDateRange = [{ start: new Date('2025-01-09'), end: new Date('2025-01-10') }]
          }).height(30)
            .id('normal-2025-01-09-2025-01-10')
        }

        Row() {
          Button('onlystart').onClick((e: ClickEvent) => {
            this.disableDateRange = [{ start: new Date('2025-01-09') }]
          }).height(30)
            .id('outlier-start')
          Button('undefined ').onClick((e: ClickEvent) => {
            this.disableDateRange = undefined
          }).height(30)
            .id('outlier-undefined')
        }

        Row() {
          Button('null').onClick((e: ClickEvent) => {
            // this.disableDateRange = null
          }).height(30)
            .id('outlier-null')
        }

        Row({ space: 1 } as RowOptions) {
          Button('Today-true').onClick((e: ClickEvent) => {
            this.markToday = true
          }).height(30)
            .id('Today-true')
          Button('Today-false').onClick((e: ClickEvent) => {
            this.markToday = false
          }).height(30)
            .id('Today-false')
        }

        Button('Today-null').onClick((e: ClickEvent) => {
          // this.markToday = null
        }).height(30)
          .id('Today-null')

        Button('Today-undefined').onClick((e: ClickEvent) => {
          this.markToday = undefined
        }).height(30)
          .id('Today-undefined')
        Row() {
          CalendarPicker({ disabledDateRange: this.disableDateRange } as CalendarOptions)
            .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
            .margin(10)
            .markToday(this.markToday)
            .onChange((value :Date) => {
              console.info('CalendarPicker onChange:' + JSON.stringify(value))
            })
            .key('calendarPicker')
        }
      }.width('100%')
    }
  }
}