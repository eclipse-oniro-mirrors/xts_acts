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
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Menu,
  MenuItemGroup,
  MenuItem,
  Toggle,
  TouchEvent,
  Rectangle,
  ToggleType,
  TouchType,
  HitTestMode
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct ResponseRegionExample {
  @State touchableValue: boolean = false;
  @State isTouched: boolean = false;
  @State eventType: string = ''

  onPageShow() {
    let ChangeEvent: emitter.InnerEvent = {
      eventId: 30,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(ChangeEvent, this.ChangCallBack)
  }

  private ChangCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    console.info("[ResponseRegion] ChangCallBack stateChangCallBack");
    if (eventData != null) {
      console.info("[ResponseRegion] ChangCallBack state change called:" + JSON.stringify(eventData));
      const data = eventData.data as Record<String,RecordData>;
      if (data['touchable'] != null) {
        this.touchableValue = data['touchable'] as boolean;
      }
    }
  }

  build() {
    Column() {
      Toggle({ type: ToggleType.Checkbox, isOn: true })
        .selectedColor(0x39a2db)
        .backgroundColor(0xAFEEEE)
        .responseRegion({
          x: 1.0,
          y: 1.0,
          width: 400,
          height: 400
        } as Array<Rectangle> | Rectangle)
        .onChange((isOn: boolean) => {
          console.info('[ResponseRegion] Component status:' + isOn)
        })
    }
    .width('100%')
    .height('100%')
    .margin({ top: 5 } as Margin)
    .key('region')
    // .touchable(this.touchableValue)   // touchable 废弃
    .onTouch((event: TouchEvent) => {
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
      console.info('[ResponseRegion] TouchType:' + this.eventType)
      try {
        let backData: emitter.EventData = {
          data: {
            "ACTION": this.isTouched,
            "EVENT_TYPE": this.eventType
          } as Record<String,RecordData>
        }
        let backEvent: emitter.InnerEvent = {
          eventId: 31,
          priority: emitter.EventPriority.LOW
        }
        console.info("[ResponseRegion] start to emit action state")
        emitter.emit(backEvent, backData)
      } catch (err) {
        console.info("[ResponseRegion] emit action state err: " + JSON.stringify((err as Error)?.message))
      }
    })
  }
}

