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
import { Entry, Component, Row, FlexAlign, Margin, Column, ColumnOptions, Text, Flex, FlexDirection, Color,ResourceColor } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct flexDirectionExample {
  @State sWidth: string = '20%'
  @State sHeight: string = '40'
  @State sBackgroundColor: ResourceColor = Color.Red

  build() {
    Column() {
      Column({ space: 5 } as ColumnOptions) {
        Text('direction:Row').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction:FlexDirection.Row }) {
          Text('1').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          Text('2').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          Text('3').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          Text('4').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          .key('flexDirection')
        }.height(70).width('90%').padding(10).backgroundColor(0xAFEEEE)

        Text('direction:Column').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.Column }) {
          Text('1').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          Text('2').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          Text('3').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          Text('4').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          .key('Column')
        }
        .height(160)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('direction:ColumnReverse').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.ColumnReverse }) {
          Text('1').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          Text('2').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          Text('3').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          Text('4').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          .key('ColumnReverse')
        }
        .height(160)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)
      }.width('100%').margin({ top: 5 } as Margin)
    }.width('100%')
  }
  onPageShow() {
    console.info('flexDirection page show called');
    let stateChangeEvent1: events_emitter.InnerEvent = {
      eventId: 97,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent1, this.stateChangCallBack)
    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 98,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack)
    let stateChangeEvent3: events_emitter.InnerEvent = {
      eventId: 99,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack)
  }

  private stateChangCallBack:(eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      console.info("swiper page state change called:" + JSON.stringify(eventData));
      if (data['width'] != null) {
        this.sWidth = data['width'] as string;
      }
      if (data['height'] != null) {
        this.sHeight = data['height'] as string;
      }
      if (data['backgroundColor'] != null) {
        this.sBackgroundColor = data['backgroundColor'] as ResourceColor;
      }
    }
  }
}