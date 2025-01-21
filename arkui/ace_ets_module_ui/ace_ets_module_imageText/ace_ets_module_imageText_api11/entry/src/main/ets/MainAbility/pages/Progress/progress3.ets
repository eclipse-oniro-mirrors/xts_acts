/**
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

import events_emitter from '@ohos.events.emitter'

@Entry
@Component
struct ProgressExample {
  @State value: number = 20
  @State total: number = 100
  @State style: ProgressStyle = ProgressStyle.Linear
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("progress page stateChangCallBack");
    if (eventData != null) {
      console.info("progress page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.value != null) {
        this.value = eventData.data?.value;
      }
      if (eventData.data?.total != null) {
        this.total = eventData.data?.total;
      }
    }
  }

  onPageShow() {
    console.info('progress page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 164,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)

    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 165,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack)

    let stateChangeEventThree: events_emitter.InnerEvent = {
      eventId: 166,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventThree, this.stateChangCallBack)

    let stateChangeEventFour: events_emitter.InnerEvent = {
      eventId: 167,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventFour, this.stateChangCallBack)

    let stateChangeEventFive: events_emitter.InnerEvent = {
      eventId: 168,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventFive, this.stateChangCallBack)

    let stateChangeEventSix: events_emitter.InnerEvent = {
      eventId: 169,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventSix, this.stateChangCallBack)
    let stateChangeEventseven: events_emitter.InnerEvent = {
      eventId: 1021,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventseven, this.stateChangCallBack)
    let stateChangeEventeight: events_emitter.InnerEvent = {
      eventId: 1022,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventeight, this.stateChangCallBack)
  }

  build() {
    Column({ space: 15 }) {
      Text('Linear Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Progress({ value: 20, style: ProgressStyle.Linear }).width(200).value(this.value).key('LPValue')
      Progress({ value: 20, total: 150, style: ProgressStyle.Linear }).color(Color.Red).width(200)

      Text('Eclipse Progress').fontSize(40).fontColor(0x0F0F0F).width('90%')
      Row({ space: 40 }) {
        Progress({ value: 25, style: ProgressStyle.Eclipse }).width(100).value(this.value).key('EPValue')
        Progress({ value: 20, total: 150, style: ProgressStyle.Eclipse }).color(Color.Grey).width(110)
      }

      Text('Capsule Progress').fontSize(19).fontColor(0xEE2C2C).width('90%')
      Row({ space: 40 }) {
        Progress({ value: 27, style: ProgressStyle.Capsule }).width(100).value(this.value).key('CPValue')
        Progress({ value: 20, total: 150, style: ProgressStyle.Capsule }).color(Color.Grey).value(50).width(120)
      }
    }.width('100%').margin({ top: 30 })
  }
}