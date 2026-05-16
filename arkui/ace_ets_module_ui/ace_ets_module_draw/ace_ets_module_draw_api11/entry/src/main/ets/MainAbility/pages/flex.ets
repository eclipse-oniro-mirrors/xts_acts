/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

@Entry
@Component
struct FlexExample {
  private theFlexBasis: ESObject = null
  private theFlexGrow: ESObject = null
  private theFlexShrink: ESObject = null
  private theAlignSelf: ItemAlign | null = null
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("Flex page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.flexBasis != null) {
        this.theFlexBasis = eventData.data?.flexBasis;
      }
      if (eventData.data?.flexGrow != null) {
        this.theFlexGrow = eventData.data?.flexGrow;
      }
      if (eventData.data?.flexShrink != null) {
        this.theFlexShrink = eventData.data?.flexShrink;
      }
      if (eventData.data?.alignSelf != null) {
        this.theAlignSelf = eventData.data?.alignSelf;
      }
      switch (eventData.data?.alignSelf) {
        case 'Auto':
          this.theAlignSelf = ItemAlign.Auto;
          break;
        case 'Start':
          this.theAlignSelf = ItemAlign.Start;
          break;
        case 'Center':
          this.theAlignSelf = ItemAlign.Center;
          break;
        case 'End':
          this.theAlignSelf = ItemAlign.End;
          break;
        case 'Stretch':
          this.theAlignSelf = ItemAlign.Stretch;
          break;
        case 'Baseline':
          this.theAlignSelf = ItemAlign.Baseline;
          break;
        default:
          this.theAlignSelf = ItemAlign.Auto;
      }
    }
  }

  onPageShow() {
    console.info('flex page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 8,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Column({ space: 5 }) {
      Text('flexBasis')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
      Flex() {
        Text('flexBasis("auto")')
          .flexBasis('auto')
          .key("flexBasis")
          .width('60%')
          .height(100)
          .lineHeight(70)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
        Text('flexBasis(100)')
          .flexBasis('100')
          .height(100)
          .lineHeight(70)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
      }
      .width('90%')
      .height(120)
      .padding(10)
      .backgroundColor(0xAFEEEE)

      Text('flexGrow')
        .key("flexGrow")
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
      Flex() {
        Text('flexGrow(2)')
          .flexGrow(2)
          .height(100)
          .lineHeight(70)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
        Text('flexGrow(1)')
          .flexGrow(1)
          .height(100)
          .lineHeight(70)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
      }
      .width('90%')
      .height(120)
      .padding(10)
      .backgroundColor(0xAFEEEE)

      Text('flexShrink')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')

      Flex({ direction: FlexDirection.Row }) {
        Text('flexShrink(0)')
          .flexShrink(0)
          .key("flexShrink")
          .width('50%')
          .height(100)
          .lineHeight(70)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
        Text('no flexShrink')
          .width('40%')
          .height(100)
          .lineHeight(70)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
        Text('flexShrink(2)')
          .flexShrink(2)
          .width('40%')
          .height(100)
          .lineHeight(70)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
      }
      .width('90%')
      .height(120)
      .padding(10)
      .backgroundColor(0xAFEEEE)

      Text('alignSelf')
        .key("alignSelf")
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Text('no alignSelf,height:80')
          .width('33%')
          .height(80)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
        Text('alignSelf stretch')
          .alignSelf(ItemAlign.Stretch)
          .width('33%')
          .height(80)
          .lineHeight(70)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
        Text('no alignSelf,height:100')
          .width('34%')
          .height(100)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
      }
      .key('flex')
      .width('90%')
      .height(120)
      .padding(10)
      .backgroundColor(0xAFEEEE)
    }
    .width('100%')
    .margin({ top: 5 })
  }
}