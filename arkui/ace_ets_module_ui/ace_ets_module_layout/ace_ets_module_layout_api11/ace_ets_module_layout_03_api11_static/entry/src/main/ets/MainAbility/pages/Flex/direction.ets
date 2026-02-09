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
import { Entry, Component, Column,Button,ColumnOptions,Color,Text,Flex,Direction,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';
import { AsyncCallback, BusinessError, Callback, ErrorCallback } from '@ohos.base';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct Index {
  @State sDirection: FlexDirection = FlexDirection.Column
  build() {
    Flex({ direction: this.sDirection, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center } as FlexOptions) {
      Text('Hello World')
        .fontSize(60)
        .fontWeight(500)
      Button('Next')
        .fontSize(40)
        .fontWeight(500)
        .width(280)
        .height(60)
    }
    .key('direction')
    .width('100%')
    .height('100%')
  }

  onPageShow() {
    console.info('direction page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 84,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  private stateChangCallBack:Callback<events_emitter.EventData> = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      console.info("direction page state change called:" + JSON.stringify(eventData));
      if (data['direction'] != null) {
        if(data['direction'] === 0){
          this.sDirection = FlexDirection.Row;
        }else if(data['direction'] === 1){
          this.sDirection = FlexDirection.Column;
        }else if(data['direction'] === 2){
          this.sDirection = FlexDirection.RowReverse;
        }else {
          this.sDirection = FlexDirection.ColumnReverse;
        }
      }
    }
  }
}