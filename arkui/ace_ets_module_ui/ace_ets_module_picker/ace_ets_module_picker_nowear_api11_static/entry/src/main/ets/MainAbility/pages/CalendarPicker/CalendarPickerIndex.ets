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
import emitter from '@ohos.events.emitter';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  PickerTextStyle,
  CalendarAlign,
  FontWeight,
  $r,
  CalendarPicker,
  CalendarOptions,
  Optional,
  Callback
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import  emitter  from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

interface EventDataContent {
  textStyle?: PickerTextStyle;
  edgeAlign?: CalendarAlign;
}

@Entry
@Component
struct CalendarPickerExample {
  @State textStyle: PickerTextStyle =
    { color: Color.Black, font: { size: 8, weight: FontWeight.Lighter } } as PickerTextStyle
  @State edgeAlign: CalendarAlign = CalendarAlign.END
  @State TextStyleDefault: PickerTextStyle = {
    color: $r("sys.color.ohos_id_color_text_primary"),
    font: { size: $r("sys.float.ohos_id_text_size_body1"), weight: FontWeight.Lighter }
  } as PickerTextStyle
  private selectedDate: Date = new Date('2026-02-11')

  private stateChangCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    console.info("select page state change called:" + JSON.stringify(eventData));
    if (eventData != null) {

      const data = eventData.data as Record<String,RecordData>

      if (data['textStyle'] != null) {
        this.textStyle = data['textStyle'] as PickerTextStyle
      }
      if (data['edgeAlign'] != null) {
        this.edgeAlign = data['edgeAlign'] as CalendarAlign;
        console.info("eventData.data.edgeAlign:" + this.edgeAlign);
      }
    }
  }

  aboutToAppear() {
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 185,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangCallBack);

    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
  }

  build() {
    Column() {
      CalendarPicker({ selected: this.selectedDate })
        .textStyle(this.textStyle)
        .edgeAlign(this.edgeAlign)
        .onChange((value: Date) => {
          console.info("CalendarPicker onChange:" + JSON.stringify(value))
        } as Optional<Callback<Date>>)
        .key('CalendarPicker')

      CalendarPicker({ selected: this.selectedDate })
        .textStyle(this.TextStyleDefault)
        .onChange((value: Date) => {
          console.info("CalendarPicker onChange:" + JSON.stringify(value))
        } as Optional<Callback<Date>>)
        .key('CalendarPickerDefault')

      CalendarPicker({ selected: this.selectedDate })
        .textStyle(this.textStyle)
        .edgeAlign(CalendarAlign.START, { dx: 5, dy: 5 })
        .onChange((value: Date) => {
          console.info("CalendarPicker onChange:" + JSON.stringify(value))
        } as Optional<Callback<Date>>)
        .key('CalendarPicker1')

      CalendarPicker({ selected: this.selectedDate })
        .textStyle(this.textStyle)
        .edgeAlign(CalendarAlign.CENTER, { dx: -10, dy: 0 })
        .onChange((value: Date) => {
          console.info("CalendarPicker onChange:" + JSON.stringify(value))
        } as Optional<Callback<Date>>)
        .key('CalendarPicker2')

      CalendarPicker({ selected: this.selectedDate })
        .textStyle(this.textStyle)
        .edgeAlign(CalendarAlign.END, { dx: -20, dy: -10 })
        .onChange((value: Date) => {
          console.info("CalendarPicker onChange:" + JSON.stringify(value))
        } as Optional<Callback<Date>>)
        .key('CalendarPicker3')

    }
  }
}
