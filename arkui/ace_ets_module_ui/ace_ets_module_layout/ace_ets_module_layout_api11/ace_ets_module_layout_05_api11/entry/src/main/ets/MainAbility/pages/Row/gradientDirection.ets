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
struct linearGradientExample {
  @State sDirection: GradientDirection = GradientDirection.LeftTop

  build() {
    Column({ space: 5 }) {
      Text('linearGradient').fontSize(12).width('90%').fontColor(0xCCCCCC)
      Row()
        .width(100)
        .height(100)
        .linearGradient({
          angle: 45,
          direction: this.sDirection,
          colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
        }).key("GradientDirection")
    }
    .width('100%')
    .padding({ top: 5 })
  }

  onPageShow() {
    console.info('gradientDirection page show called');
    let stateChangeEventOne: events_emitter.InnerEvent = {
      eventId: 106,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack)
    console.info('gradientDirection page show called');
    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 107,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack)
    console.info('gradientDirection page show called');
    let stateChangeEventThree: events_emitter.InnerEvent = {
      eventId: 108,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventThree, this.stateChangCallBack)
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("GradientDirection page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.sDirection = eventData.data?.ACTION;
        console.log("direction1 is" + eventData.data?.ACTION)
      }
    }
  }
}