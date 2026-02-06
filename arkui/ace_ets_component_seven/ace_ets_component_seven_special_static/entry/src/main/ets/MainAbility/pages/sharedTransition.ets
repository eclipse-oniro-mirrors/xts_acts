'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { Entry, Component, AttributeModifier, SharedTransitionEffectType, ListItem, Row, Column, List, Navigation, Text,
  Padding, Image, TextAlign, ClickEvent, $r } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct SharedTransition7Example {
  @State active: boolean = false
  @State duration: number = 1000
  @State delay: number = 0
  @State type: SharedTransitionEffectType = SharedTransitionEffectType.Static

  build() {
    List() {
      ListItem() {
        Row() {
          // Navigator({ target: 'pages/sharedTransition2', type: NavigationType.Push }) {
          //   Image($r('app.media.icon')).width(50).height(50)
          //     .sharedTransition('sharedImage1', { duration: this.duration, delay: this.delay, type: this.type })
          // }
          // .key('Navigator')
          // .padding({ left: 10 } as Padding)
          // .onClick((e: ClickEvent) => {
          //   this.active = true
          //   console.info('SharedTransition current action state is: ' + this.active);
          //   try {
          //     let backData: events_emitter.EventData = {
          //       data: {
          //         "duration": this.duration,
          //         "delay": this.delay,
          //         "type": this.type
          //       } as Record<String,RecordData>
          //     }
          //     let backEvent: events_emitter.InnerEvent = {
          //       eventId: 193,
          //       priority: events_emitter.EventPriority.LOW
          //     }
          //     console.info("SharedTransition start to emit action state")
          //     events_emitter.emit(backEvent, backData)
          //   } catch (err) {
          //     console.info("SharedTransition emit action state err: " + JSON.stringify((err as Error).message))
          //   }
          // })

          Text('SharedTransition').width(80).height(80).textAlign(TextAlign.Center)
        }
      }
    }
  }

  onPageShow() {
    console.info('sharedTransition page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 194,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info("sharedTransition page state change called:" + JSON.stringify(eventData));
      const data = eventData.data as Record<String,RecordData>
      if (data['duration'] != null) {
        this.duration = data['duration'] as number
      }
      if (data['delay'] != null) {
        this.delay = data['delay'] as number
      }
      if (data['type'] != null) {
        this.type = data['type'] as SharedTransitionEffectType
      }
    }
  }
}