'use static'

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
import { UIUtils, Local, Trace, ObservedV2, IMonitor, IMonitorDecoratedVariable } from '@ohos.arkui.stateManagement';
import { ComponentV2, Entry, Column, Row, Button, Scroll, ForEach, Text, Divider, DatePicker, TextAlign, Color } from '@ohos.arkui.component';

//Date类型
@ObservedV2
class DateInfo {
  @Trace public selectedDate: Date = new Date('2023-09-08')
  public selectedDateMonitor?: IMonitorDecoratedVariable;
  @Trace public text: string = '';

  constructor(){
    this.selectedDateMonitor = UIUtils.addMonitor(() => this.selectedDate, this.selectedDateChange, { path: ['Date'] });
  }
  selectedDateChange(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      console.log(`[addMonitorTest] ${path} has changed to ${this.selectedDate}`);
      this.text = `[addMonitorTest] ${path} has changed to ${this.selectedDate}`
    })
  }
}

@Entry
@ComponentV2
struct Page {
  @Local dateInfo: DateInfo = new DateInfo()

  build() {
    Scroll(undefined) {
      Column(undefined) {
        Text('@Observed/@Trace')
          .width('100%')
          .height('5%')
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Pink)
        //监听Date
        Text(`${this.dateInfo.text}`)
          .id('ObservedDate')
          .height('5%')
        DatePicker({
          start: new Date('1970-1-1'), end: new Date('2100-1-1'), selected: this.dateInfo.selectedDate
        })
          .height('5%')
          .width('100%')
        Row(undefined) {
          Button('SetNewDay1')
            .id('ObservedDate1')
            .width('25%')
            .height('5%')
            .onClick(() => {
              this.dateInfo.selectedDate = new Date('2025-09-19');
            })
          Button('SetNewDay2')
            .id('ObservedDate2')
            .width('25%')
            .height('5%')
            .onClick(() => {
              this.dateInfo.selectedDate = new Date('2021-08-21');
            })
          Button(`clearMonitor`)
            .id('ObservedDateClear')
            .height('5%')
            .onClick((e) => {
            UIUtils.clearMonitor(this.dateInfo.selectedDateMonitor!);
            console.info('[addMonitorTest]:clearMonitor success')
          })
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}