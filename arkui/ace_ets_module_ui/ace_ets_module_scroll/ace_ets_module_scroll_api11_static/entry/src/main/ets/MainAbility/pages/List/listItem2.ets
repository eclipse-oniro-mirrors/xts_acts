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
import {
  Entry,
  Component,
  Column,
  Flex,
  Row,
  Text,
  Color,
  ListScroller,
  Builder,
  Margin,
  List,
  VisibleListContentInfo,
  ScrollState,
  Button,
  ClickEvent,
  Scroller,
  StickyStyle,
  ListItem,
  ForEach,
  Padding,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct ListItemExample2 {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[];
  @State editFlag: boolean = false;
  @State sticky: StickyStyle = StickyStyle.None;
  @State editMode: boolean = true;

  onPageShow() {
    console.info('[ListItem] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 122,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEventOne: events_emitter.InnerEvent = {
      eventId: 123,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack);
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("[ListItem] page stateChangCallBack");
    if (eventData != null && eventData.data != null) {
      console.info("[ListItem] page state change called:" + JSON.stringify(eventData));
      const data = eventData.data as Record<String,RecordData>
      if (data['sticky'] != null) {
        this.sticky = data['sticky'] as StickyStyle;
      }

      if (data['editMode'] != null) {
        this.editMode = data['editMode'] as boolean;
      }
    }
  }

  build() {
    Column() {
      List({ space: 20, initialIndex: 0 }) {
        ListItem() {
          Text('sticky:Normal , click me edit list')
            .width('100%')
            .height(40)
            .fontSize(12)
            .fontColor(0xFFFFFF)
            .textAlign(TextAlign.Center)
            .backgroundColor(0x696969)
            .onClick((e: ClickEvent) => {
              this.editFlag = !this.editFlag
            })
        }.key('ListItem')

        ForEach(this.arr, (item: number, index: int) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
        }, (item: number) => item.toString())
      }
      .sticky(this.sticky)
      .key('List')
      .width('90%')
    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 } as Padding)
  }
}