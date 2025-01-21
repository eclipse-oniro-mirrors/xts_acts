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

interface LinearGradientValue {
  angle: number;
  direction: GradientDirection;
  colors: Array<[ResourceColor, number]>;
  repeating: boolean;
}

interface SweepGradientValue {
  center: [number, number];
  start: number;
  colors: Array<[ResourceColor, number]>;
  end: number;
  repeating: boolean;
}

interface RadialGradientValue {
  center: [number, number];
  radius: number | string;
  colors: Array<[ResourceColor, number]>;
  repeating: boolean;
}

@Entry
@Component
struct ColorGradientExample {
  @State linearGradientValue: LinearGradientValue = {
    angle: 90,
    direction: GradientDirection.Left,
    colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]],
    repeating: true
  };
  @State sweepGradientValue: SweepGradientValue = {
    center: [50, 50],
    start: 0,
    end: 359,
    colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]],
    repeating: true
  };
  @State radialGradientValue: RadialGradientValue = {
    center: [50, 50],
    radius: 60,
    colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]],
    repeating: true
  };
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("[ColorGradient] page stateChangCallBack");
    if (eventData != null) {
      console.info("[ColorGradient] page state change called:" + JSON.stringify(eventData));
      if (eventData.data!.linearGradientValue != null) {
        this.linearGradientValue = JSON.parse(eventData.data!.linearGradientValue);
      }
      if (eventData.data!.sweepGradientValue != null) {
        this.sweepGradientValue = JSON.parse(eventData.data!.sweepGradientValue);
      }
      if (eventData.data!.radialGradientValue != null) {
        this.radialGradientValue = JSON.parse(eventData.data!.radialGradientValue);
      }
    }
  }

  onPageShow() {
    console.info('[ColorGradient] page show called');
    let stateChangeEvent1: events_emitter.InnerEvent = {
      eventId: 5,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent1, this.stateChangCallBack);

    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 6,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);

    let stateChangeEvent3: events_emitter.InnerEvent = {
      eventId: 7,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack);
  }

  build() {
    Column({ space: 5 }) {
      Text('linearGradient')
        .fontSize(12)
        .width('90%')
        .fontColor(0xCCCCCC)
      Row()
        .width('90%')
        .height(50)
        .linearGradient(this.linearGradientValue).key('linearGradient')
      Text('sweepGradient')
        .fontSize(12)
        .width('90%')
        .fontColor(0xCCCCCC)
      Row()
        .width(100)
        .height(100)
        .sweepGradient(this.sweepGradientValue).key('sweepGradient')
      Text('radialGradient')
        .fontSize(12)
        .width('90%')
        .fontColor(0xCCCCCC)
      Row()
        .width(100)
        .height(100)
        .radialGradient(this.radialGradientValue).key('radialGradient')
    }
    .width('100%')
    .padding({ top: 5 })
  }
}
