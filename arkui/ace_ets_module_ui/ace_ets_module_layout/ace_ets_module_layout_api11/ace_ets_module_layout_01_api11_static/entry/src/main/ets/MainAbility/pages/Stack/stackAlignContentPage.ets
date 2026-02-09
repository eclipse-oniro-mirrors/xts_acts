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
import {Entry,Component,Column,Text,Flex,Stack,FlexDirection,Alignment,ItemAlign,Margin,TextAlign,TextOverflow,FontWeight,GridRow,FlexAlign,GridCol,AttributeModifier,StackAttribute} from '@ohos.arkui.component'
import {State, Observed} from '@ohos.arkui.stateManagement'
import { RecordData } from '@ohos.base';

@Observed
class MyStackAlignContentModifier implements AttributeModifier<StackAttribute> {
  alignContentValue: Alignment = Alignment.TopStart
  applyNormalAttribute(instance: StackAttribute): void {
    instance.alignContent(this.alignContentValue)
  }
}

@Entry
@Component
struct StackAlignContentExample {
  @State mod1: MyStackAlignContentModifier = new MyStackAlignContentModifier()
  @State alignContentValue: Alignment = Alignment.TopStart
  private stateChangCallBack:(eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    if (eventData != null) {
      console.info("stackAlignContent page state change called:" + JSON.stringify(eventData));
      const data = eventData.data as Record<String,RecordData>
      if (data["alignContentValue"] != null) {
        this.mod1.alignContentValue = data["alignContentValue"] as Alignment;
        //old test
        this.alignContentValue = data["alignContentValue"] as Alignment;
      }
    }
  }

  onPageShow() {
    console.info('StackAlignContent page1 show called')
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 181,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    let stateChangeEvent2 : events_emitter.InnerEvent= {
      eventId: 182,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);
    let stateChangeEvent3: events_emitter.InnerEvent = {
      eventId: 183,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack);
    let stateChangeEvent4: events_emitter.InnerEvent = {
      eventId: 184,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent4, this.stateChangCallBack);
    let stateChangeEvent5: events_emitter.InnerEvent = {
      eventId: 185,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent5, this.stateChangCallBack);
    let stateChangeEvent6: events_emitter.InnerEvent = {
      eventId: 186,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent6, this.stateChangCallBack);
    let stateChangeEvent7: events_emitter.InnerEvent = {
      eventId: 187,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent7, this.stateChangCallBack);
    let stateChangeEvent8: events_emitter.InnerEvent = {
      eventId: 188,
      priority: events_emitter.EventPriority.LOW
    }
     events_emitter.on(stateChangeEvent8, this.stateChangCallBack);
  }

  build() {
    Column() {
      Text('stack-alignContent').fontSize(9).width('90%').fontColor(0xCCCCCC)
      Text('设置子组件在容器内的对齐方式。默认值：Alignment.Center。')
        .fontSize(19)
        .fontColor(0x000000)
        .width('90%')
        .margin({ top: 10 } as Margin)
      Text('update0：TopStart 顶部起始端。')
        .fontSize(19)
        .fontColor(0x000000)
        .width('90%')
        .margin({ top: 10 } as Margin)
      Text('update1：Top 顶部横向居中。')
        .fontSize(19)
        .fontColor(0x000000)
        .width('90%')
        .margin({ top: 10 } as Margin)
      Text('update2：TopEnd 顶部尾端。')
        .fontSize(19)
        .fontColor(0x000000)
        .width('90%')
        .margin({ top: 10, bottom: 10 } as Margin)
      Text('update3： Start  起始端纵向居中。')
        .fontSize(19)
        .fontColor(0x000000)
        .width('90%')
        .margin({ top: 10, bottom: 10 } as Margin)
      Text('update4： Center  横向和纵向居中。')
        .fontSize(19)
        .fontColor(0x000000)
        .width('90%')
        .margin({ top: 10, bottom: 10 } as Margin)
      Text('update5： End  尾端纵向居中。')
        .fontSize(19)
        .fontColor(0x000000)
        .width('90%')
        .margin({ top: 10, bottom: 10 } as Margin)
      Text('update6： BottomStart  底部起始端。')
        .fontSize(19)
        .fontColor(0x000000)
        .width('90%')
        .margin({ top: 10, bottom: 10 } as Margin)
      Text('update7： Bottom  底部横向居中。')
        .fontSize(19)
        .fontColor(0x000000)
        .width('90%')
        .margin({ top: 10, bottom: 10 } as Margin)
      Text('update8： BottomEnd  底部尾端。')
        .fontSize(19)
        .fontColor(0x000000)
        .width('90%')
        .margin({ top: 10, bottom: 10 } as Margin)
      Stack() {
        Text('First child, show in bottom').width('90%').height('100%').backgroundColor(0xffe5ff).align(Alignment.Top)
        Text('Second child, show in top').width('70%').height('60%').backgroundColor(0xef33ff).align(Alignment.Top)
      }.key('keyAlignContent').width('100%').height(150).margin({ top: 5 } as Margin)
      .attributeModifier(this.mod1)

    }
  }
}
