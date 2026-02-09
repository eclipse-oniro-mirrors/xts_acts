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
  Alignment,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  ForEach,
  Grid,
  GridItem,
  Image,
  ImageSize,
  Padding,
  Position,
  Row,
  RowOptions,
  SizeOptions,
  Text,
  TextAlign,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { Callback, RecordData } from '@ohos.base';

class ContainerInfo {
  label: string = ''
  size: string = ''
}
;

class ChildInfo {
  text: string = ''
  priority: number = 0
}
;

interface PriorityChild {
  text: string;
  priority: number;
}

@Entry
@Component
struct LayoutConstraints {
  @State aspectRatioValue: number = 1.5;
  @State priorityChildren: PriorityChild[] = [
    { text: '1\n(priority:1)', priority: 1 },
    { text: '2\n(priority:2)', priority: 2 },
    { text: '3\n(priority:3)', priority: 3 },
    { text: '4\n(priority:4)', priority: 4 }] as PriorityChild[];
  @State currentIndex: Int = 0;
  private children: string[] = ['1', '2', '3', '4', '5', '6'];
  private container: ContainerInfo[] = [
    { label: 'Big container', size: '97%' },
    { label: 'Small container', size: '30%' }] as ContainerInfo[];

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text('using container: row')
        .fontSize(20)
        .fontColor(Color.Black)
        .width('100%')
      Row({ space: 10 } as RowOptions) {
        ForEach(this.children, (item: string) => {
          Text(item)
            .backgroundColor('0xbbb2cb')
            .fontSize(20)
            .aspectRatio(this.aspectRatioValue)
            .height(60)
          Text(item)
            .backgroundColor('0xbbb2cb')
            .fontSize(20)
            .aspectRatio(this.aspectRatioValue)
            .width(60)
            .key('aspectRatio')
        }, (item: string) => item)
      }
      .size({ width: "100%", height: 100 })
      .backgroundColor('0xd2cab3')
      .clip(true)

      Text('using container: grid')
        .fontSize(20)
        .fontColor(Color.Black)
        .width('100%')
      Grid() {
        ForEach(this.children, (item: string) => {
          GridItem() {
            Text(item)
              .backgroundColor('0xbbb2cb')
              .fontSize(40)
              .aspectRatio(this.aspectRatioValue)
          }
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .size({ width: "100%", height: 165 })
      .backgroundColor('0xd2cab3')

      Text('displayPriority 4')
        .fontSize(20)
        .fontColor(Color.Black)
        .width('100%')
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        ForEach(this.priorityChildren, (item: PriorityChild) => {
          if (item.priority === 1 || item.priority === 5) {
            Text(`1\n(priority:${item.priority})`)
              .width(135)
              .height(60)
              .fontSize(18)
              .textAlign(TextAlign.Center)
              .backgroundColor('0xbbb2cb')
              .displayPriority(item.priority)
              .key('displayPriority')
          } else {
            Text(item.text)
              .width(135)
              .height(60)
              .fontSize(18)
              .textAlign(TextAlign.Center)
              .backgroundColor('0xbbb2cb')
              .displayPriority(item.priority)
          }
        }, (item: PriorityChild) => item.text)
      }
      .width(this.container[this.currentIndex].size)
      .backgroundColor('0xd2cab3')
    }.padding(10)
  }

  onPageShow() {
    let aspectRatioChangeEvent: emitter.InnerEvent = {
      eventId: 20,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(aspectRatioChangeEvent, this.stateChangCallBack);

    let priorityChangeEvent: emitter.InnerEvent = {
      eventId: 21,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(priorityChangeEvent, this.stateChangCallBack);

    let priorityChangeEvent2: emitter.InnerEvent = {
      eventId: 1112,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(priorityChangeEvent2, this.stateChangCallBack);
  }

  stateChangCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
    console.info("LayoutConstraints page stateChangCallBack" + JSON.stringify(eventData));
    if (eventData && eventData.data != undefined) {
      const event: Record<String,RecordData> =
        eventData.data as Record<String,RecordData>
      if (event['aspectRatio'] != null) {
        this.aspectRatioValue = event['aspectRatio'] as number;
      } else if (event['displayPriority'] != null) {
        let priority: PriorityChild[] =
          JSON.parseJsonElement(JSON.stringify(this.priorityChildren)).asArray() as Object as Array<PriorityChild>;
        priority[0].priority = event['displayPriority'] as number;
        this.priorityChildren = [];
        this.priorityChildren = priority;
      }
    }
  } as Callback<emitter.EventData>
}