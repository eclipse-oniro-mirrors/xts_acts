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
struct Text3Example {
  @State fontSize: number = 9;
  @State fontColor: string = "#330A59F8";
  @State textAlign: TextAlign = TextAlign.Start;
  @State textOverflow: TextOverflow = TextOverflow.Clip;
  @State decoration: TextDecorationType = TextDecorationType.None;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      Text('lineHeightt')
        .fontSize(this.fontSize)
        .fontColor(this.fontColor)
        .textAlign(this.textAlign)
        .textOverflow({ overflow: this.textOverflow })
        .decoration({ type: this.decoration, color: Color.Red })
        .key('text')
      Image($rawfile('test.png'))
        .key('image')
    }
    .height(600)
    .width(350)
    .padding({ left: 35, right: 35, top: 35 })
  }

  onPageShow() {
    console.info('text page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 226,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)

    let stateChangeEventOne: events_emitter.InnerEvent = {
      eventId: 227,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack)

    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 228,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack)

    let stateChangeEventThree: events_emitter.InnerEvent = {
      eventId: 229,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventThree, this.stateChangCallBack)

    let stateChangeEventFour: events_emitter.InnerEvent = {
      eventId: 230,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventFour, this.stateChangCallBack)

    let stateChangeEventFive: events_emitter.InnerEvent = {
      eventId: 231,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventFive, this.stateChangCallBack)

    let stateChangeEventSix: events_emitter.InnerEvent = {
      eventId: 232,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventSix, this.stateChangCallBack)

    let stateChangeEventSeven: events_emitter.InnerEvent = {
      eventId: 233,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventSeven, this.stateChangCallBack)
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("text page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.fontSize != null) {
        this.fontSize = parseInt(eventData.data?.fontSize);
      }
      if (eventData.data?.fontColor != null) {
        this.fontColor = eventData.data?.fontColor;
      }
      if (eventData.data?.textAlign != null) {
        this.textAlign = parseInt(eventData.data?.textAlign);
      }
      if (eventData.data?.textOverflow != null) {
        this.textOverflow = parseInt(eventData.data?.textOverflow);
      }
    }
  }
}
