'use static';
/*
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
import events_emitter from '@ohos.events.emitter';
import { Entry, Component, Column, Text, Rating, Margin,ResourceColor, Color, ToggleType, ColumnOptions, Flex, FlexAlign, ItemAlign, Toggle, Padding } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'
import { RecordData } from '@ohos.base';
@Entry
@Component
struct Toggle3Example {
  @State selectedColor: ResourceColor = '#330A59F7';
  @State toggleType: ToggleType = ToggleType.Button;
  @State isOn: boolean = false;

  onPageShow() {
    console.info('[toggle] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 231,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  private stateChangCallBack:(eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    console.info("[toggle] page stateChangCallBack");
    if (eventData != null && eventData.data != null) {
      console.info("[toggle] page state change called:" + JSON.stringify(eventData));
      const data = eventData.data as Record<String,RecordData>                       //需要先获取并声明类型之后  再访问成员属性
      if (data!['selectedColor'] != null) {
        this.selectedColor = data!['selectedColor'] as ResourceColor;
      }
      if (data!['toggleType'] != null) {
        this.toggleType = data!['toggleType'] as ToggleType;
      }
      if (data!['isOn'] != null) {
        this.isOn = data!['isOn'] as boolean;
      }
    }
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('type: Button').fontSize(12).fontColor(0xcccccc).width('90%').key('button')
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
        Toggle({ type: this.toggleType, isOn: this.isOn }) {
          Text('status button').padding({ left: 12, right: 12 } as Padding)
        }
        .key('toggle')
        .selectedColor(this.selectedColor)
        .onChange((isOn: boolean) => {
          console.info('Component status:' + isOn)
        })

        Toggle({ type: ToggleType.Button, isOn: true }) {
          Text('status button').padding({ left: 12, right: 12 } as Padding)
        }
        .selectedColor(0x39a2db)
        .onChange((isOn: boolean) => {
          console.info('Component status:' + isOn)
        })
      }
    }.width('100%').padding(24)
  }
}