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
struct PageTransitionExample1 {
  @State scale1: number = 1;
  @State opacity1: number = 1;
  @State active: boolean = false;
  @State type: RouteType = RouteType.Push;

  build() {
    Column() {
      Navigator({ target: 'pages/pageTransition2', type: NavigationType.Push }) {
        Image($rawfile('test.png'))
          .width("100%")
          .height("100%")
      }
      .key('Navigator')
      .onClick(() => {
        this.active = true
        console.info('pageTransition current action state is: ' + this.active);
        try {
          let backData: events_emitter.EventData = {
            data: {
              "scale": this.scale1,
              "opacity": this.opacity1,
              "type": this.type
            }
          }
          let backEvent: events_emitter.InnerEvent = {
            eventId: 144,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("pageTransition start to emit action state")
          events_emitter.emit(backEvent, backData)
        } catch (err) {
          console.info("pageTransition emit action state err: " + JSON.stringify((err as Error)?.message))
        }
      })
    }.scale({ x: this.scale1 }).opacity(this.opacity1)
  }

  pageTransition() {
    PageTransitionEnter({ duration: 1200, curve: Curve.Linear })
      .onEnter((type: RouteType, progress: number) => {
        this.scale1 = 1
        this.opacity1 = progress
      })
    PageTransitionExit({ duration: 1500, curve: Curve.Ease })
      .onExit((type: RouteType, progress: number) => {
        this.scale1 = 1 - progress
        this.opacity1 = 1
      })
  }

  onPageShow() {
    console.info('active page show called');

    let stateChangeEventOne: events_emitter.InnerEvent = {
      eventId: 145,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack)
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("active page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.scale != null) {
        this.scale1 = Number.parseInt(eventData.data?.scale);
      }
      if (eventData.data?.opacity != null) {
        this.opacity1 = Number.parseInt(eventData.data?.opacity);
      }
    }
  }
}