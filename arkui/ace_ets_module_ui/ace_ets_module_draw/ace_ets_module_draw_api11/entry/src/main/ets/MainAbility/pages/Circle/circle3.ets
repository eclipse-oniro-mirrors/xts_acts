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
struct CircleExample {
  @State theWidth: string = "450px";
  @State theHeight: string = "450px";

  onPageShow() {
    console.info('[circle] page show called');
    let stateChangeEvent:events_emitter.InnerEvent = {
      eventId: 77,
      priority: events_emitter.EventPriority.LOW
    }
    console.info('[circle] page show calledA');
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  private stateChangCallBack  = (eventData:events_emitter.EventData) => {
    console.info("[circle] page stateChangCallBack");
    if (eventData != null) {
      console.info("[circle] page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.height != null) {
        this.theHeight = eventData.data?.height;
      }
      if (eventData.data?.width != null) {
        this.theWidth = eventData.data?.width;
      }
    }
  }

  build() {
    Flex({ justifyContent: FlexAlign.SpaceAround }) {
      Circle({ width: 150, height: 150 })
      Circle()
        .width(`${this.theWidth}`)
        .height(`${this.theHeight}`)
        .key('circle')
    }.width('100%').height('100%').margin({ top: 5 })
  }
}
