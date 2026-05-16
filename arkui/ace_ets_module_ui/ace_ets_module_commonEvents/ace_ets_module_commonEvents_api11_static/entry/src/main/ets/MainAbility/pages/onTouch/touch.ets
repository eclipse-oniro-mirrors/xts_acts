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
  $rawfile,
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  CustomBuilder,
  DragItemInfo,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  ItemAlign,
  Margin,
  Padding,
  Row,
  Text,
  TextAlign,
  TextArea,
  TouchEvent,
  TouchType,
  Visibility
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct TouchExample {
  @State text: string = ''
  @State eventType: string = ''
  @State touchFlag: boolean = false

  onPageShow() {
    console.info('[touch] page show called');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 42,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Button('Touch')
        .backgroundColor('0x2788D9')
        .height(40)
        .width(80)
        .key('touch')
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Down) {
            this.eventType = 'Down'
            console.info("[touch] eventType is Down")
            this.touchFlag = true
          }
          if (event.type === TouchType.Up) {
            this.eventType = 'Up'
            console.info("[touch] eventType is Up")
            this.touchFlag = true
          }
          if (event.type === TouchType.Move) {
            this.eventType = 'Move'
            console.info("[touch] eventType is Move")
            this.touchFlag = true
          }
          console.info('stopPropagation')
          event.stopPropagation()
          console.info('onTouch successful, touchFlag is : ' + this.eventType + ', ' + this.touchFlag)
          console.info(this.text = 'TouchType:' + this.eventType
            + '\nDistance between touch point and touch element:\nx: '
            + event.touches[0].x + '\n' + 'y: ' + event.touches[0].y + '\ncomponent globalPosition：（'
            + event.target.area.globalPosition.x + ',' + event.target.area.globalPosition.y + '）\nwidth:'
            + event.target.area.width + '\nheight：' + event.target.area.height);
          console.log('fang--->A')
          try {
            console.log('fang--->B')
            let backData: emitter.EventData = {
              data: {
                "ACTION": this.touchFlag,
              } as Record<String,RecordData>
            }
            console.log('fang--->C')
            let backEvent: emitter.InnerEvent = {
              eventId: 43,
              priority: emitter.EventPriority.LOW
            }
            console.log('fang--->D')
            console.info("touchFlag start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err: Error) {
            console.info("touchFlag emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
      Text(this.text)
    }
    .height(200)
    .width(350)
  }

  private stateChangCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    console.info("[touch] page stateChangCallBack");
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      console.info("[touch] page state change called:" + JSON.stringify(eventData));
      if (data['text'] != null) {
        this.text = data['text'] as string;
      }
      if (data['eventType'] != null) {
        this.eventType = data['eventType'] as string;
      }
      if (data['touchFlag'] != null) {
        this.touchFlag = data['touchFlag'] as boolean;
      }
    }
  }
}