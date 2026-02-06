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
import {
  Entry,
  Component,
  Flex,
  Text,
  Button,
  Margin,
  ClickEvent,
  Color,
  TextClockController,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  TextClock,
  ResourceColor

} from '@ohos.arkui.component'
import {
  State,
  StoragePropRef
} from '@ohos.arkui.stateManagement'
import emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct Second {
  @State accumulateTime: number = 0;
  @StoragePropRef('fontSize') fontSize: number = 20;
  @StoragePropRef('fontColor') fontColor: ResourceColor = Color.Red;
  @StoragePropRef('format') format: string = "hhmmss";
  @StoragePropRef('onActionCalled') onActionCalled: boolean = false;
  @State onActionCalledOne: boolean = false;
  controller: TextClockController = new TextClockController();

  onPageShow() {
    console.info('swiper page show called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('current milliseconds is' + this.accumulateTime)
        .fontSize(this.fontSize)
        .fontColor(this.fontColor)
      TextClock({ timeZoneOffset: -8, controller: this.controller })
        .key('textClock')
        .format(this.format)
        .fontSize(this.fontSize)
        .fontColor(this.fontColor)
        .onDateChange((value: long) => {
          this.accumulateTime = value
          this.onActionCalled = true;
          console.info('onChange current action state is: ' + this.onActionCalled);
          try {
            let backData: emitter.EventData = {
              data: {
                "ACTION": this.onActionCalled,
              } as Record<String,RecordData>
            } as emitter.EventData
            let backEvent: emitter.InnerEvent = {
              eventId: 223,
              priority: emitter.EventPriority.LOW
            }
            console.info("onChange start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("onChange emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .margin(20)
        .fontSize(30)
      Button("start TextClock")
        .margin({ bottom: 10 } as Margin)
        .onClick((e:ClickEvent) => {
          this.controller.start()
        })
      Button("stop TextClock")
        .key('button')
        .onClick((e:ClickEvent) => {
          this.controller.stop()
          this.onActionCalledOne = true;
          console.info('button2 current action state is: ' + this.onActionCalledOne);
          try {
            let backData: emitter.EventData = {
              data: {
                "ACTION": this.onActionCalledOne,
              } as Record<String,RecordData>
            } as emitter.EventData
            let backEvent: emitter.InnerEvent = {
              eventId: 224,
              priority: emitter.EventPriority.LOW
            }
            console.info("button2 start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button2 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}