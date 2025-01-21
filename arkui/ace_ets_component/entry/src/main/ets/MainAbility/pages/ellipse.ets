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
struct EllipseExample {
  @State _width: string = "200.00px";
  @State _height: string = "200.00px";

  onPageShow() {
    console.info('[ellipse] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 92,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 907,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack);

    let stateChangeEventThree: events_emitter.InnerEvent = {
      eventId: 908,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventThree, this.stateChangCallBack);
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("[ellipse] page stateChangCallBack");
    if (eventData != null) {
      console.info("[ellipse] page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.width != null) {
        this._width = eventData.data.width;
      }
      if (eventData.data?.height != null) {
        this._height = eventData.data.height;
      }
    }
  }

  build() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Ellipse()
        .width(`${this._width}`)
        .height(`${this._height}`)
        .key('ellipse')
    }
    .width('100%')
    .height('100%')
  }
}