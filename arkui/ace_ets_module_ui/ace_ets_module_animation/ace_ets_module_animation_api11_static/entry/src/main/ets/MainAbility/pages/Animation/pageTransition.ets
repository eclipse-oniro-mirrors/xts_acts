'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import emitter from '@ohos.events.emitter';
import {
  $rawfile,
  Column,
  Component,
  Curve,
  Entry,
  Image,
  Navigation,
  PageTransitionEnter,
  PageTransitionExit,
  RouteType
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Callback } from '@ohos.base';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct PageTransitionExample1 {
  @State scale1: number = 1;
  @State opacity1: number = 1;
  @State active: boolean = false;
  @State type: RouteType = RouteType.Push;

  build() {
    Column() {
      Navigation() {
        Image($rawfile('test.png'))
          .width("100%")
          .height("100%")
      }
      .key('Navigator')
      .onClick(() => {
        this.active = true
        console.info('pageTransition current action state is: ' + this.active);
        try {
          let backData: emitter.EventData = {
            data: {
              "scale": this.scale1,
              "opacity": this.opacity1,
              "type": this.type
            } as Record<String,RecordData>
          } as emitter.EventData
          let backEvent: emitter.InnerEvent = {
            eventId: 144,
            priority: emitter.EventPriority.LOW
          } as emitter.InnerEvent
          console.info("pageTransition start to emit action state")
          emitter.emit(backEvent, backData)
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

    let stateChangeEventOne: emitter.InnerEvent = {
      eventId: 145,
      priority: emitter.EventPriority.LOW
    } as emitter.InnerEvent
    emitter.on(stateChangeEventOne,
      this.stateChangCallBack as Callback<emitter.EventData>)
  }

  private stateChangCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    if (eventData != null) {
      const data: Record<String,RecordData> = eventData.data as Record<String,RecordData>
      console.info("active page state change called:" + JSON.stringify(eventData));
      if (data['scale'] != null) {
        this.scale1 = data['scale'] as Double;
      }
      if (data['opacity'] != null) {
        this.opacity1 = data['opacity'] as Double;
      }
    }
  }
}