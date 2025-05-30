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
struct ScrollBarExampler {
  private scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State directionValue: ScrollBarDirection = ScrollBarDirection.Vertical;
  @State stateValue: BarState= BarState.Off;

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("scrollBar page state change called:" + JSON.stringify(eventData));
    if (eventData != null) {
      if (eventData.data?.directionValue != null) {
        let directionObject: Record<string, Object> = JSON.parse(eventData.data?.directionObject);
        this.directionValue = directionObject.directionValue as ScrollBarDirection;
      }
      if (eventData.data?.stateValue != null) {
        this.stateValue = eventData.data?.stateValue;
      }
    }
  }

  onPageShow() {
    console.info('scrollBar page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 183,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 184,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.End }) {
        Scroll(this.scroller) {
          Flex({ direction: FlexDirection.Column }) {
            ForEach(this.arr, (item: number) => {
              Row() {
                Text(item.toString())
                  .width('90%')
                  .height(100)
                  .backgroundColor('#3366CC')
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 5 })
              }
            }, (item: string) => item)
          }.margin({ left: 52 })
        }
        .scrollBar(BarState.Off)
        .scrollable(ScrollDirection.Vertical)

        ScrollBar({ scroller: this.scroller, direction: this.directionValue, state: this.stateValue }) {
          Text()
            .width(30)
            .height(100)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }.key('scroll').width(30).backgroundColor('#ededed')
      }
    }
  }
}