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
import { Entry, Component, Row, RowOptions, Column, ColumnOptions, Text, VerticalAlign, FlexAlign, BorderOptions } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct RowTest2 {
  @State alignItems: VerticalAlign = VerticalAlign.Center
  @State justifyContent: FlexAlign = FlexAlign.Start

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("row page stateChangCallBack");
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      console.info("row page state change called:" + JSON.stringify(eventData));
      if(data['alignItems'] != null) {
        this.alignItems = data['alignItems'] as VerticalAlign;
      }
      if(data['justifyContent'] != null) {
        this.justifyContent = data['justifyContent'] as FlexAlign;
      }
    }
  }

  onPageShow() {
    console.info('row page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 182,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('space').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 5 } as RowOptions) {
        Row().width('30%').height(50).backgroundColor(0xAFEEEE)
        Row().width('30%').height(50).backgroundColor(0x00FFFF)
      }.width('90%').height(107).border({ width: 1 } as BorderOptions).key('Row')

      Text('alignItems(Top)').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row() {
        Row().width('30%').height(50).backgroundColor(0xAFEEEE)
        Row().width('30%').height(50).backgroundColor(0x00FFFF)
      }.alignItems(VerticalAlign.Top).height('15%').border({ width: 1 } as BorderOptions)

      Text('alignItems(Center)').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row() {
        Row().width('30%').height(50).backgroundColor(0xAFEEEE)
        Row().width('30%').height(50).backgroundColor(0x00FFFF)
      }.alignItems(VerticalAlign.Center).height('15%').border({ width: 1 } as BorderOptions)

      Text('justifyContent(End)').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row() {
        Row().width('30%').height(50).backgroundColor(0xAFEEEE)
        Row().width('30%').height(50).backgroundColor(0x00FFFF)
      }.width('90%').border({ width: 1 } as BorderOptions).alignItems(VerticalAlign.Bottom).justifyContent(FlexAlign.End)

      Text('justifyContent(Center)').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row() {
        Row().width('30%').height(50).backgroundColor(0xAFEEEE)
        Row().width('30%').height(49).backgroundColor(0x00FFFF)
      }.width('90%').border({ width: 1 } as BorderOptions).alignItems(VerticalAlign.Center).justifyContent(FlexAlign.Center)
    }.width('100%')
  }
}