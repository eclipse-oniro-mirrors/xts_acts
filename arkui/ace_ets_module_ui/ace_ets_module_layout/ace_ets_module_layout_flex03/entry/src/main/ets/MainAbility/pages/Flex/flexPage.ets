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
      console.info('Flex page state change called:' + JSON.stringify(eventData));
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
      Flex() {
        Text('auto')
          .flexBasis('auto')
          .key('flexBasis')
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
        Text('100')
          .flexBasis('100')
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
      }
      .width('90%')
      .height('20%')
      .padding(2)
      .backgroundColor(0xAFEEEE)

      Flex() {
        Text('no')
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
          .key('flexGrow')
        Text('2')
          .flexGrow(2)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
        Text('1')
          .flexGrow(1)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
      }
      .width('90%')
      .height('20%')
      .padding(2)
      .backgroundColor(0xAFEEEE)

      Flex({ direction: FlexDirection.Row }) {
        Text('0')
          .flexShrink(0)
          .key('flexShrink')
          .width('50%')
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
        Text('no')
          .width('40%')
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
        Text('2')
          .flexShrink(2)
          .width('40%')
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
      }
      .width('90%')
      .height('20%')
      .padding(2)
      .backgroundColor(0xAFEEEE)

      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Text('no')
          .width('50%')
          .key('alignSelf')
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
        Text('stretch')
          .alignSelf(ItemAlign.Stretch)
          .width('50%')
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
      }
      .key('FlexJsunitTest2_flex')
      .width('90%')
      .height('20%')
      .padding(2)
      .backgroundColor(0xAFEEEE)
    }
    .width('100%')
    .margin({ top: 5 })
  }
}