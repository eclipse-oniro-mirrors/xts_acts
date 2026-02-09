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
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  Curve,
  CustomBuilder,
  DragItemInfo,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  HorizontalAlign,
  ItemAlign,
  Margin,
  Padding,
  Row,
  Text,
  TextAlign,
  TextArea,
  TouchType,
  Visibility
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct MotionPathExample {
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State toggle: boolean = true
  @State rotatable: boolean = false
  @State path: string = 'Mstart.x start.y L300 200 L300 500 Lend.x end.y'
  @State fromX: number = 0
  @State toY: number = 1

  build() {
    Column() {
      Button('click me')
        .key('button')
        .motionPath({
          path: this.path,
          from: this.fromX,
          to: this.toY,
          rotatable: this.rotatable
        })
        .onClick((e: ClickEvent) => {
          this.rotatable = true;
          console.info('button rotate current action state is:' + this.rotatable);
          try {
            let backData: emitter.EventData = {
              data: {
                "ACTION": this.rotatable,
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 132,
              priority: emitter.EventPriority.LOW
            }
            console.info("button start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          this.getUIContext().animateTo({ duration: 4000, curve: Curve.Linear }, () => {
            this.toggle = !this.toggle;
          })
        })
        .backgroundColor('0x317aff')
      Button('next')
        .key('button1')
        .onClick((e: ClickEvent) => {
          try {
            let backData: emitter.EventData = {
              data: {
                "fromX": this.fromX,
                "toY": this.toY
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 133,
              priority: emitter.EventPriority.LOW
            }
            console.info("button1 position start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button1 position emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
    }
    .key('motionPath')
    .width('100%').height('100%').alignItems(this.toggle ? HorizontalAlign.Start : HorizontalAlign.Center)
  }

  onPageShow() {
    console.info('motionPath page show called');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 134,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangeCallBack)
  }

  private stateChangeCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    if (eventData != null) {
      const data: Record<String,RecordData> =
        eventData.data as Record<String,RecordData>
      console.info('motionPath page state change called:' + JSON.stringify(eventData));
      if (data['fromX'] != null) {
        this.fromX == data['fromX'] as number;
      }
      if (data['toY'] != null) {
        this.toY == data['toY'] as number;
      }
    }
  }
}

