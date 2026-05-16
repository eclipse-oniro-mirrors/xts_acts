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
import events_emitter from '@ohos.events.emitter'


import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, Image,ImageFit, Scroller,
  Scroll,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  Flex,FlexOptions,Margin,FlexWrap,ItemAlign,FlexDirection,HorizontalAlign,Alignment,FlexAlign,Position,
  ColumnOptions
} from '@ohos.arkui.component'
import { Router } from '@ohos.arkui.UIContext';
import {
  State,


  AppStorage
} from '@ohos.arkui.stateManagement'
import { RecordData } from '@ohos.base';
@Entry
@Component
struct FlexWrapExample {
  @State sWidth: string = '20%'
  @State sHeight: number = 40
  @State sBackgroundColor: Color = Color.White

  build() {
    Column() {
      Column({ space: 5 } as ColumnOptions) {
        Text('WrapReverse').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ wrap: FlexWrap.WrapReverse, direction: FlexDirection.Row } as FlexOptions) {
          Text('1').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          Text('2').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
          Text('3').width(this.sWidth).height(this.sHeight).backgroundColor(this.sBackgroundColor)
            .key('WrapReverse')
        }
        .width('90%')
        .height(120)
        .padding(10)
        .backgroundColor(0xAFEEEE)
      }.width('100%').margin({ top: 5 } as Margin)
    }.width('100%')
  }
  onPageShow() {
    console.info('flexDirection page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 100,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }
  private stateChangCallBack:(eventData: events_emitter.EventData)=>void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      console.info("swiper page state change called:" + JSON.stringify(eventData));
      if (data['width'] != null) {
        this.sWidth = data['width'] as string;
      }
      if (data['height']!= null) {
        this.sHeight = data['height'] as number;
      }
      if (data['backgroundColor'] != null) {
        this.sBackgroundColor = data['backgroundColor'] as Color;
      }
    }
  }
}