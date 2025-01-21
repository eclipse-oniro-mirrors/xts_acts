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
struct EnabledExample {
  @State enabledd: boolean = true;
  @State text: string = "enable";

  onPageShow() {
    console.info('[enabled] page show called ');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 93,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 1111,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);

  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("[stateChangCallBack] stateChangCallBack ");
    if (eventData != null) {
      console.info("[stateChangCallBack] state change called: " + JSON.stringify(eventData));
      if (eventData.data.enabled != null) {
        this.enabledd = eventData.data.enabled
      }
      if (eventData.data.text != null) {
        this.text = eventData.data.text
      }
    }
  }

  build() {
    Flex({ justifyContent: FlexAlign.SpaceAround }) {
      Button('disable')
        .enabled(false)
        .backgroundColor(0x317aff)
        .opacity(0.4)
      Button(this.text)
        .key('enabled')
        .backgroundColor(0x317aff)
        .enabled(this.enabledd)
    }
    .width('100%')
    .padding({ top: 5 })
  }
}