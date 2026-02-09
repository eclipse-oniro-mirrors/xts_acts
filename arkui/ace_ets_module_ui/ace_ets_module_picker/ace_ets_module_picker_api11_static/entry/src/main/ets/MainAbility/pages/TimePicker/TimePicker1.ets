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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { Entry, Component, Column, Text, Rating, Margin, PickerTextStyle, TimePicker, TimePickerResult, Color, FontWeight, $r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct TimePickerExample1 {
  private selectedTime: Date = new Date('2022-07-22T08:00:00')
  @State disappearTextStyle: PickerTextStyle = { color: Color.Black, font: { size: 8, weight: FontWeight.Lighter } } as PickerTextStyle
  @State textStyle: PickerTextStyle = { color: Color.Red, font: { size: '10px', weight: FontWeight.Normal } } as PickerTextStyle
  @State selectedTextStyle: PickerTextStyle = { color: Color.Blue, font: { size: '20px', weight: FontWeight.Bold } } as PickerTextStyle
  @State disappearTextStyleDefault: PickerTextStyle = {
    color: $r("sys.color.ohos_id_color_text_primary"),
    font: { size: $r("sys.float.ohos_id_text_size_sub_title3"), weight: FontWeight.Lighter }
  } as PickerTextStyle
  @State textStyleDefault: PickerTextStyle = {
    color: $r("sys.color.ohos_id_color_text_primary"),
    font: { size: $r("sys.float.ohos_id_text_size_sub_title2"), weight: FontWeight.Normal }
  } as PickerTextStyle
  @State selectedTextStyleDefault: PickerTextStyle = {
    color: $r("sys.color.ohos_id_color_text_primary_activated"),
    font: { size: $r("sys.float.ohos_id_text_size_dialog_tittle"), weight: FontWeight.Bold }
  } as PickerTextStyle
  private stateChangCallBack:(eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    console.info("select page state change called:" + JSON.stringify(eventData));
    if (eventData != null && eventData.data != null) {
      const data = eventData.data as Record<String,RecordData>
      if (data!['disappearTextStyle'] != null) {
        console.log('disappearTextStyledisappearTextStyle',data!['disappearTextStyle'] as PickerTextStyle)

        this.disappearTextStyle = data!['disappearTextStyle'] as PickerTextStyle
        console.log('disappearTextStyledisappearTextStyle',this.disappearTextStyle)
      }
      if (data!['textStyle'] != null) {
        this.textStyle = data!['textStyle'] as PickerTextStyle;
      }
      if (data!['selectedTextStyle'] != null) {
        this.selectedTextStyle = data!['selectedTextStyle'] as PickerTextStyle;
      }
    }
  }

  aboutToAppear() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 184,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
  }

  build() {
    Column() {
      TimePicker({ selected: this.selectedTime })
        .disappearTextStyle(this.disappearTextStyle)
        .textStyle(this.textStyle)
        .selectedTextStyle(this.selectedTextStyle)
        .key('timePicker')
        .onChange((date: TimePickerResult):void => {
          console.info('select current date is: ' + JSON.stringify(date))
        })

      TimePicker({ selected: this.selectedTime })
        .disappearTextStyle(this.disappearTextStyleDefault)
        .textStyle(this.textStyleDefault)
        .selectedTextStyle(this.selectedTextStyleDefault)
        .key('timePickerDefault')
        .onChange((date: TimePickerResult):void => {
          console.info('select current date is: ' + JSON.stringify(date))
        })
    }
  }
}
