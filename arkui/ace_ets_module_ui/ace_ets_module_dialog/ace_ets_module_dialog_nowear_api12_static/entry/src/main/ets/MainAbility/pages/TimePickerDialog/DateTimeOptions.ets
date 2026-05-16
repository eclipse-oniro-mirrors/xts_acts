'use static';
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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType, ShadowStyle,  RowOptions} from '@ohos.arkui.component'
import { State,UIUtils } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext';
import intl from '@ohos.intl';

@Entry
@Component
struct TimerPickerDialogExample {
  uiContext: UIContext = this.getUIContext()
  @State indexNumber1: number = 0
  @State isMilitaryTime: boolean = false
  @State opt: Array<intl.DateTimeOptions|undefined|null> = new Array<intl.DateTimeOptions|undefined|null>(
    { hour: 'numeric', minute: 'numeric' },
    { hour: 'numeric', minute: '2-digit' },
    { hour: 'numeric', minute: 'undefined' },
    { hour: 'numeric', minute: 'null' },
    { hour: 'numeric', minute: '' },
  )
  private selectTime: Date = new Date("2025-05-06T08:30:01")
  selectedDate: Date = new Date("2010-1-1")

  showdatepicker() {
    this.uiContext.showDatePickerDialog({
      start: new Date("2000-01-1"),
      end: new Date("2100-12-31"),
      selected: this.selectedDate,
      showTime: true,
      useMilitaryTime: this.isMilitaryTime,
      dateTimeOptions: this.opt[this.indexNumber1.toInt()] as intl.DateTimeOptions,
      onDateAccept: (value: Date) => {
        this.selectedDate = value
      }
    })
  }

  build() {
    Column() {
      Button('TimePicker 12/24-hour format')
        .margin(15)
        .onClick((e:ClickEvent) => {
          this.isMilitaryTime = !this.isMilitaryTime
        })
      Row({ space: 2 } as RowOptions) {
        Button("Set TimeType ++")
          .id("DateTimeOptions")
          .margin({ top: 15 } as Margin)
          .onClick((e:ClickEvent) => {
            this.indexNumber1 ++
            if(this.indexNumber1 > this.opt.length -1) {
              this.indexNumber1 = 0
            }
            // this.showdatepicker();
          })
        Button("Set TimeType --")
          .margin({ top: 15 }  as Margin)
          .onClick((e:ClickEvent) => {
            this.indexNumber1 --
            if(this.indexNumber1 < 0) {
              this.indexNumber1 = this.opt.length - 1
            }
            this.showdatepicker();
          })
      }
      Text(`${this.indexNumber1 + 1} / ${this.opt.length}`)
      Text(`${JSON.stringify(UIUtils.getTarget(this.opt[this.indexNumber1.toInt()]))} / ${this.isMilitaryTime}`)
        .id("DateTimeOptionsValue")
        .margin({ top: 15 } as Margin)
        .shadow(ShadowStyle.OUTER_DEFAULT_XS)
        .height("60vp")
        .width("100%")
    }.width("100%")
  }
}