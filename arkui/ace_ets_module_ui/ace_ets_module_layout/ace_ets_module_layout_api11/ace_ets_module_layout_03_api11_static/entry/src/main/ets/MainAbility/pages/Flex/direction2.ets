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

import events_emitter from '@ohos.events.emitter';
import { Entry, Component, Column,Button,Row,ColumnOptions,Text,Flex,Direction,FlexDirection,Color,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin,Alignment } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';
import { AsyncCallback, BusinessError, Callback, ErrorCallback } from '@ohos.base';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct PositionExample {
  @State sDirection: Direction = Direction.Ltr
  build() {
    Column() {
      Column({space: 10} as ColumnOptions) {
        Text('align').fontSize(9).fontColor(Color.Red).width('90%')
        Text('top start')
          .align(Alignment.TopStart)
          .height(50)
          .width('90%')
          .fontSize(16)
          .backgroundColor(Color.Red)

        Text('direction').fontSize(9).fontColor(Color.Red).width('90%')
        Row() {
          Text('1').height(50).width('25%').fontSize(16).backgroundColor(Color.Red)
          Text('2').height(50).width('25%').fontSize(16).backgroundColor(Color.Red)
          Text('3').height(50).width('25%').fontSize(16).backgroundColor(Color.Red)
          Text('4').height(50).width('25%').fontSize(16).backgroundColor(Color.Red)
        }
        .width('90%')
        .direction(this.sDirection).key('direction_2')
      }
    }
    .width('100%').margin({ top: 5 } as Margin).direction(Direction.Rtl)
  }

  onPageShow() {
    console.info('direction2 page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 1082,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)

    let stateChangeEventOne: events_emitter.InnerEvent = {
      eventId: 1083,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack)
  }

  private stateChangCallBack:Callback<events_emitter.EventData> = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      console.info("direction2 page state change called:" + JSON.stringify(eventData));
      if (data['direction'] != null) {
        if(data['direction'] === 0){
          this.sDirection = Direction.Ltr;
        }else if(data['direction']=== 1){
          this.sDirection = Direction.Rtl;
        }else {
          this.sDirection = Direction.Auto;
        }
      }
    }
  }
}
