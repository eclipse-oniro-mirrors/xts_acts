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
  Area,
  ClickEvent,
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
  ItemAlign,
  Margin,
  Padding,
  Row,
  Text,
  TextAlign,
  TextArea,
  TouchType,
  Visibility
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct AreaExample {
  @State value: string = 'Text';
  @State sizeValue: string = '';
  @State onActionCalled: boolean = false;

  build() {
    Column() {
      Text(this.value)
        .key('text1')
        .backgroundColor(Color.Green)
        .margin(30)
        .fontSize(20)
        .onClick((e: ClickEvent) => {
          this.value = this.value + 'Text'
          try {
            let backData: emitter.EventData = {
              data: {
                "value": this.value,
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 61,
              priority: emitter.EventPriority.LOW
            }
            console.info("onClick start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err: Error) {
            console.info("onClick emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .onAreaChange((oldValue: Area, newValue: Area) => {
          console.info(`Ace: on area change, oldValue is ${JSON.stringify(oldValue)} newvalue is ${JSON.stringify(newValue)}`)
          this.sizeValue = JSON.stringify(newValue)
          this.onActionCalled = true;
          console.info('onAreaChange current action state is: ' + this.onActionCalled);
          try {
            let backData1: emitter.EventData = {
              data: {
                "ACTION": this.onActionCalled,
              } as Record<String,RecordData>
            }
            let backEvent1: emitter.InnerEvent = {
              eventId: 62,
              priority: emitter.EventPriority.LOW
            }
            console.info("onAreaChange start to emit action state")
            emitter.emit(backEvent1, backData1)
          } catch (err: Error) {
            console.info("onAreaChange emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
      Text('new area is: \n' + this.sizeValue)
        .key('text2')
        .margin({ right: 30, left: 30 } as Margin)
    }
    .width('100%')
    .height('100%')
    .margin({ top: 30 } as Margin)
  }
}