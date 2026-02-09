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
import events_emitter from '@ohos.events.emitter'
import {
  Entry,
  Component,
  Margin,
  BarPosition,
  BarMode,
  TabsController,
  Column,
  ClickEvent,
  Tabs,
  TabContent,
  Color
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct Tabs3Example {
  @State barPosition: BarPosition = BarPosition.Start
  @State index: int = 0
  @State vertical: boolean = true
  @State scrollable: boolean = true
  @State barMode: BarMode = BarMode.Fixed
  @State barWidth: number = 70
  @State barHeight: number = 150
  @State animationDuration: number = 400
  @State onActionCalled: boolean = false
  private controller: TabsController = new TabsController()

  build() {
    Column() {
      Tabs({ barPosition: this.barPosition, controller: this.controller, index: this.index }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('pink').key('tabContent1')
        .onClick((e: ClickEvent) => {
          this.onActionCalled = true;
          console.info('tabContent1 current action state is: ' + this.onActionCalled);
          try {
            let backData: events_emitter.EventData = {
              data: {
                "ACTION": this.onActionCalled,
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 212,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("tabContent1 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("tabContent1 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar('yellow')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('blue')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('green')
      }
      .vertical(this.vertical)
      .scrollable(this.scrollable)
      .barMode(this.barMode)
      .barWidth(70)
      .barHeight(150)
      .animationDuration(400)
      .key('tabs')
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .width('90%')
      .backgroundColor(0xF5F5F5)
    }
    .width('100%')
    .height(150)
    .margin({ top: 5 } as Margin)
  }

  onPageShow() {
    console.info('tabs page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 213,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)

    let stateChangeEventOne: events_emitter.InnerEvent = {
      eventId: 214,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack)

    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 215,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack)
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      console.info("tabs page state change called:" + JSON.stringify(eventData));
      const data = eventData.data as Record<String,RecordData>;
      if (data['index'] != null) {
        this.index = parseInt(data['index'] as string).toInt();
      }
      if (data['barPosition'] != null) {
        this.barPosition = data['barPosition'] as BarPosition;
      }
      if (data['vertical'] != null) {
        if (typeof data['vertical'] === "boolean") {
          this.vertical = data['vertical'] as boolean;
        } else {
          this.vertical = false
        }
      }
      if (data['scrollable'] != null) {
        if (typeof data['scrollable'] === "boolean") {
          this.scrollable = data['scrollable'] as boolean;
        } else {
          this.scrollable = false
        }
      }
      if (data['barMode'] != null) {
        // this.barMode = data['barMode'] as BarMode;
      }
      if (data['barWidth'] != null) {
        this.barWidth = parseInt(data['barWidth'] as string);
      }
      if (data['barHeight'] != null) {
        this.barHeight = parseInt(data['barHeight'] as string);
      }
      if (data['animationDuration'] != null) {
        this.animationDuration = parseInt(data['animationDuration'] as string);
      }
    }
  }
}