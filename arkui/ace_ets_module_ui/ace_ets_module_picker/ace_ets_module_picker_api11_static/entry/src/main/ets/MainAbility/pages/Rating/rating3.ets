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
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis,
  Margin,
  PickerTextStyle, CalendarAlign, CalendarPicker,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,FlexAlign,Rating
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct RatingExample {
  @State rating: double = 1
  @State indicator: boolean = false
  private stateChangCallBack:(eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    console.info("rating page stateChangCallBack");
    if (eventData != null && eventData.data != null) {
      console.info("rating page state change called:" + JSON.stringify(eventData));
      const data = eventData.data as Record<String,RecordData> 
      if (data!['rating'] != null) {
        this.rating = data!['rating'] as double;
      }
    }
  }

  onPageShow() {
    console.info('rating page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 173,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Text('current score is ' + this.rating).fontSize(20)
      Rating({ rating: this.rating, indicator: this.indicator })
        .stars(5).key('Rating')
        .stepSize(0.5)
        .onChange((value: number):void => {
          this.rating = value
        })
    }.width(350).height(200).padding(35)
  }
}
