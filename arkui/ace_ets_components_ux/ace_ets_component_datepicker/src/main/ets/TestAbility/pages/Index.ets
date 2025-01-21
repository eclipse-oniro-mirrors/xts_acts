/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../test/List.test'

@Entry
@Component
struct DatePickerExample {
  private selectedDate: Date = new Date('2021-08-08')
  @State disappearTextStyle: PickerTextStyle = { color: Color.Black, font: { size: 8, weight: FontWeight.Lighter } }
  @State textStyle: PickerTextStyle = { color: Color.Red, font: { size: '10px', weight: FontWeight.Normal } }
  @State selectedTextStyle: PickerTextStyle = { color: Color.Blue, font: { size: '20px', weight: FontWeight.Bold } }
  @State disappearTextStyleDefault: PickerTextStyle = {
    color: $r("sys.color.ohos_id_color_text_primary"),
    font: { size: $r("sys.float.ohos_id_text_size_sub_title3"), weight: FontWeight.Lighter }
  }
  @State textStyleDefault: PickerTextStyle = {
    color: $r("sys.color.ohos_id_color_text_primary"),
    font: { size: $r("sys.float.ohos_id_text_size_sub_title2"), weight: FontWeight.Normal }
  }
  @State selectedTextStyleDefault: PickerTextStyle = {
    color: $r("sys.color.ohos_id_color_text_primary_activated"),
    font: { size: $r("sys.float.ohos_id_text_size_headline8"), weight: FontWeight.Bold }
  }
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("select page state change called:" + JSON.stringify(eventData));
    if (eventData != null) {
      if (eventData.data.disappearTextStyle != null) {
        this.disappearTextStyle = JSON.parse(eventData.data.disappearTextStyle);
      }
      if (eventData.data.textStyle != null) {
        this.textStyle = JSON.parse(eventData.data.textStyle);
      }
      if (eventData.data.selectedTextStyle != null) {
        this.selectedTextStyle = JSON.parse(eventData.data.selectedTextStyle);
      }
    }
  }

  aboutToAppear() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 185,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
        .lunar(true)
        .disappearTextStyle(this.disappearTextStyle)
        .textStyle(this.textStyle)
        .selectedTextStyle(this.selectedTextStyle)
        .key('datePicker')
        .onChange((date: DatePickerResult) => {
          console.info('select current date is: ' + JSON.stringify(date))
        })

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
        .lunar(true)
        .disappearTextStyle(this.disappearTextStyleDefault)
        .textStyle(this.textStyleDefault)
        .selectedTextStyle(this.selectedTextStyleDefault)
        .key('datePickerDefault')
        .onChange((date: DatePickerResult) => {
          console.info('select current date is: ' + JSON.stringify(date))
        })

      Button('Dialog')
        .fontColor('black')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height(40)
        .key("Dialog")
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
            selected: this.selectedDate,
            lunar: true,
            showTime: true,
            disappearTextStyle: this.disappearTextStyle,
            textStyle: this.textStyle,
            selectedTextStyle: this.selectedTextStyle,
          })
        })
    }
  }
}