/**
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
import { window } from '@kit.ArkUI';
import { abilityManager, common } from '@kit.AbilityKit';
import EnvironmentCallback from '@ohos.app.ability.EnvironmentCallback';

let environmentCallback: EnvironmentCallback

@Entry
@Component
struct CalendarPickerDialogExample {
  @State selectedDate: Date = new Date('2025-01-02')
  @State startDate: Date = new Date('2025-01-01')
  @State endDate: Date = new Date('2025-02-28')
  @State directions: Direction = Direction.Ltr
  @State markToday: boolean | undefined | null = true;
  @State count1: number = 0
  @State disableDateRange: DateRange[] | null | undefined = [
    { start: new Date('1970-01-01'), end: new Date('2024-11-10') },
    { start: new Date('2025-01-16'), end: new Date('2025-01-01') },
    { start: new Date('2025-01-03'), end: new Date('2025-01-06') },
    { start: new Date('2025-01-09'), end: new Date('2025-01-10') },
  ]

  build() {
    Scroll() {
      Column({ space: 2 }) {
        Text('disableDateRange:' + JSON.stringify(this.disableDateRange))
        Text('startDate:' + JSON.stringify(this.startDate))
        Text('endDate:' + JSON.stringify(this.endDate))

        Button('CalendarPickerDialog')
          .key('calendarPickerDialog')
          .margin(20)
          .onClick(() => {
            console.info('CalendarDialog.show')
            CalendarPickerDialog.show({
              markToday: this.markToday,
              start: this.startDate,
              end: this.endDate,
              disabledDateRange: this.disableDateRange,
              selected: this.selectedDate,
              onAccept: (value) => {
                this.selectedDate = value
                console.info('calendar onAccept:' + JSON.stringify(value))
              },
              onCancel: () => {
                console.info('calendar onCancel')
              },
              onChange: (value) => {
                console.info('calendar onChange:' + JSON.stringify(value))
              },
              onDidAppear: () => {
                console.info('calendar onDidAppear')
              },
              onDidDisappear: () => {
                console.info('calendar onDidDisappear')
              },
              onWillAppear: () => {
                console.info('calendar onWillAppear')
              },
              onWillDisappear: () => {
                console.info('calendar onWillDisappear')
              }
            })
          })

        Row({ space: 1 }) {
          Button('正常值 ').onClick(() => {
            this.disableDateRange = [{ start: new Date('2025-01-09'), end: new Date('2025-01-10') }]
          }).height(30)
            .id('normal-2025-01-09-2025-01-10')
        }

        Row() {
          Button('onlystart').onClick(() => {
            this.disableDateRange = [{ start: new Date('2025-01-09') }]
          }).height(30)
            .id('outlier-start')
          Button('undefined ').onClick(() => {
            this.disableDateRange = undefined
          }).height(30)
            .id('outlier-undefined')
        }

        Row() {
          Button('null').onClick(() => {
            this.disableDateRange = null
          }).height(30)
            .id('outlier-null')
        }

        Row({ space: 1 }) {
          Button('Today-true').onClick(() => {
            this.markToday = true
          }).height(30)
            .id('Today-true')
          Button('Today-false').onClick(() => {
            this.markToday = false
          }).height(30)
            .id('Today-false')


        }

        Button('Today-null').onClick(() => {
          this.markToday = null
        }).height(30)
          .id('Today-null')

        Button('Today-undefined').onClick(() => {
          this.markToday = undefined
        }).height(30)
          .id('Today-undefined')
      }.width('100%')
    }
  }
}