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
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct Toggle3Example {
  @State selectedColor: Color|string = '#330A59F7';
  @State toggleType: ToggleType = ToggleType.Button;
  @State isOn: boolean = false;

  onPageShow() {
    console.info('[toggle] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 231,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEventOne: events_emitter.InnerEvent = {
      eventId: 232,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack);

    let stateChangeEventthree: events_emitter.InnerEvent = {
      eventId: 1033,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventthree, this.stateChangCallBack);

    let stateChangeEventfour: events_emitter.InnerEvent = {
      eventId: 1034,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventfour, this.stateChangCallBack);

    let stateChangeEventfive: events_emitter.InnerEvent = {
      eventId: 1035,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventfive, this.stateChangCallBack);

    let stateChangeEventsix: events_emitter.InnerEvent = {
      eventId: 1036,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventsix, this.stateChangCallBack);
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("[toggle] page stateChangCallBack");
    if (eventData != null) {
      console.info("[toggle] page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.selectedColor != null) {
        this.selectedColor = eventData.data.selectedColor;
      }
      if (eventData.data?.toggleType != null) {
        this.toggleType = eventData.data.toggleType;
      }
      if (eventData.data?.isOn != null) {
        this.isOn = eventData.data.isOn;
      }
    }
  }

  build() {
    Column({ space: 10 }) {
      Text('type: Button').fontSize(12).fontColor(0xcccccc).width('90%').key('button')
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
        Toggle({ type: this.toggleType, isOn: this.isOn }) {
          Text('status button').padding({ left: 12, right: 12 })
        }
        .key('toggle')
        .selectedColor(this.selectedColor)
        .onChange((isOn: boolean) => {
          console.info('Component status:' + isOn)
        })

        Toggle({ type: ToggleType.Button, isOn: true }) {
          Text('status button').padding({ left: 12, right: 12 })
        }
        .selectedColor(0x39a2db)
        .onChange((isOn: boolean) => {
          console.info('Component status:' + isOn)
        })
      }
    }.width('100%').padding(24)
  }
}