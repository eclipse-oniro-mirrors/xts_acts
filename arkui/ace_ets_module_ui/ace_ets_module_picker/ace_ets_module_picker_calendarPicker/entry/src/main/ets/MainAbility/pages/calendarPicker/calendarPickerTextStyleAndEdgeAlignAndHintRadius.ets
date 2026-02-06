/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';

@Entry
@Component
struct CalendarPickerStyleExample {
  @State textStyle: PickerTextStyle = { color: Color.Black, font: { size: 8, weight: FontWeight.Lighter } }
  @State edgeAlign: CalendarAlign = CalendarAlign.END
  @State textStyleDefault: PickerTextStyle = {
    color: $r('sys.color.ohos_id_color_text_primary'),
    font: { size: $r('sys.float.ohos_id_text_size_body1'), weight: FontWeight.Lighter }
  }
  private selectedDate: Date = new Date('2026-02-11')
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info('select page state change called:' + JSON.stringify(eventData));
    if (eventData != null) {
      if (eventData.data?.textStyle != null) {
        this.textStyle = JSON.parse(eventData.data.textStyle);
      }
      if (eventData.data?.edgeAlign != null) {
        this.edgeAlign = eventData.data.edgeAlign;
        console.info('eventData.data.edgeAlign:' + this.edgeAlign);
      }
    }
  }

  aboutToAppear() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 185,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
  }

  build() {
    Column() {
      CalendarPicker({ selected: this.selectedDate })
        .textStyle(this.textStyle)
        .edgeAlign(this.edgeAlign)
        .onChange((value) => {
          console.info('CalendarPicker onChange:' + JSON.stringify(value))
        })
        .key('CalendarPicker')

      CalendarPicker({ selected: this.selectedDate })
        .textStyle(this.textStyleDefault)
        .onChange((value) => {
          console.info('CalendarPicker onChange:' + JSON.stringify(value))
        })
        .key('CalendarPickerDefault')

      CalendarPicker({ selected: this.selectedDate })
        .textStyle(this.textStyle)
        .edgeAlign(CalendarAlign.START, { dx: 5, dy: 5 })
        .onChange((value) => {
          console.info('CalendarPicker onChange:' + JSON.stringify(value))
        })
        .key('CalendarPicker1')

      CalendarPicker({ selected: this.selectedDate })
        .textStyle(this.textStyle)
        .edgeAlign(CalendarAlign.CENTER, { dx: -10, dy: 0 })
        .onChange((value) => {
          console.info('CalendarPicker onChange:' + JSON.stringify(value))
        })
        .key('CalendarPicker2')

      CalendarPicker({ selected: this.selectedDate })
        .textStyle(this.textStyle)
        .edgeAlign(CalendarAlign.END, { dx: -20, dy: -10 })
        .onChange((value) => {
          console.info('CalendarPicker onChange:' + JSON.stringify(value))
        })
        .key('CalendarPicker3')

    }
  }
}
