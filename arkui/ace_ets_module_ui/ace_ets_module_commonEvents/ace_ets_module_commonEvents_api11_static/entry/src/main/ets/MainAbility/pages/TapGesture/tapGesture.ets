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

import emitter from '@ohos.events.emitter'
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
  ItemAlign,
  Margin,
  Padding,
  Row,
  TapGesture,
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
struct TapGestureExample {
  @State value: string = ''
  @State onClickValue: boolean = false;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Text('Click twice')
      Text(this.value)
    }
    .height(200)
    .width(300)
    .padding(60)
    .border({ width: 1 })
    .margin(30)
    .gesture(
      TapGesture({ count: 2 })
        .onAction(() => {
          this.value = 'TapGesture onAction'
          this.onClickValue = true;
          try {
            let backData: emitter.EventData = {
              data: {
                "ACTION": this.onClickValue
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 214,
              priority: emitter.EventPriority.LOW
            }
            console.info("click to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err: Error) {
            console.info("click action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
    )
    .key('tapGesture')
  }
}