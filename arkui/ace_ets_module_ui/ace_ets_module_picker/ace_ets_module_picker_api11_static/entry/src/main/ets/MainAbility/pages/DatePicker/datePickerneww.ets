'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Component,
  Column,
  Text,
  Margin,
    Row,
  ClickEvent,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  Color,
  $r,
  DatePicker,
  DatePickerResult
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct DatePickerExample01 {
  private selectedDate: Date = new Date('2021-08-08')
  @State useMilitaryTime: boolean = true
  build() {
    Column() {
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2200-1-1'),
        selected: this.selectedDate
      })
        .key('datePicker')
        .id('datePicker')
        .lunar(true)
        .onDateChange((date: Date) => {
          console.info('select current date is: ' + JSON.stringify(date));
          try {
            let backData: events_emitter.EventData = {
              data: {
                "useMilitaryTime" : this.useMilitaryTime,
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 80,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("DatePicker start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("DatePicker emit action state err: " + JSON.stringify((err as Error).message))
          }
        })
    }.width('100%')
  }

  onPageShow() {
    console.info('DatePicker page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 81,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  private stateChangCallBack:(eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    if (eventData != null) {
      console.info("DatePicker page state change called:" + JSON.stringify(eventData));
      if (eventData != null && eventData.data != null) {
        const data = eventData.data as ESObject                        //需要先获取并声明类型之后  再访问成员属性
        if (data.getProperty('useMilitaryTime') != null) {
          this.useMilitaryTime = data.getProperty('useMilitaryTime').toBoolean();
        }
      }
    }
  }
}


