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
  GestureEvent,
  HitTestMode,
  ItemAlign,
  Margin,
  Padding,
  PanDirection,
  PanGesture,
  PanGestureHandlerOptions,
  PanGestureOptions,
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
import emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct PanGestureExample {
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State touchableValue: boolean = true;
  @State isTouched: boolean = false;
  @State eventType: string = '';

  onPageShow() {
    let ChangeEvent: emitter.InnerEvent = {
      eventId: 23,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(ChangeEvent, this.ChangCallBack)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Text('PanGesture offset:\nX: ' + this.offsetX + '\n' + 'Y: ' + this.offsetY)
    }
    .height(300)
    .width(300)
    .padding(20)
    .border({ width: 1 })
    .margin(80)
    .key('PanGesture')
    .translate({ x: this.offsetX, y: this.offsetY, z: 5 })
    .hitTestBehavior(HitTestMode.Default)
    .gesture(
      PanGesture({ fingers: 1, direction: PanDirection.All, distance: 1 } as PanGestureHandlerOptions)
        .onActionStart((event: GestureEvent) => {
          console.info('Pan start')
          console.log('PanGesture globalX ' + event.fingerList[0]?.globalX);
          console.log('PanGesture globalY ' + event.fingerList[0]?.globalY);
          console.log('PanGesture localX ' + event.fingerList[0]?.localX);
          console.log('PanGesture localY ' + event.fingerList[0]?.localY);
          console.log('PanGesture fingerList ' + JSON.stringify(event.fingerList));
          console.log('PanGesture speed ' + event.speed);
          console.log('PanGesture pinchCenterX ' + event.pinchCenterX);
          console.log('PanGesture pinchCenterY ' + event.pinchCenterY);
        })
        .onActionUpdate((event: GestureEvent) => {
          this.offsetX = event.offsetX
          this.offsetY = event.offsetY
        })
        .onActionEnd(() => {
          console.info('Pan end')
        })
    )
    .onTouch((event: TouchEvent) => {
      console.log('[PanGesture] TouchType start');
      this.isTouched = true
      if (event.type === TouchType.Down) {
        this.eventType = 'Down'
      }
      if (event.type === TouchType.Up) {
        this.eventType = 'Up'
      }
      if (event.type === TouchType.Move) {
        this.eventType = 'Move'
      }
      console.info('[PanGesture] TouchType:' + this.eventType)
      try {
        let backData: emitter.EventData = {
          data: {
            "ACTION": this.isTouched,
            "EVENT_TYPE": this.eventType
          } as Record<String,RecordData>
        }
        let backEvent: emitter.InnerEvent = {
          eventId: 24,
          priority: emitter.EventPriority.LOW
        }
        console.info("[PanGesture] start to emit action state")
        emitter.emit(backEvent, backData)
      } catch (err) {
        console.info("[PanGesture] emit action state err: " + JSON.stringify((err as Error)?.message))
      }
    })
  }

  private ChangCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    console.info("[PanGesture] ChangCallBack stateChangCallBack");
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      console.info("[PanGesture] ChangCallBack state change called:" + JSON.stringify(eventData));
      if (data['touchable'] != null) {
        this.touchableValue = data['touchable'] as boolean;
      }
    }
  }
}