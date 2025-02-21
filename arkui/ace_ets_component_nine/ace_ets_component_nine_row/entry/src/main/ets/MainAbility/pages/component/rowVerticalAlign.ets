
/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

class RowVerticalAlignModifier implements AttributeModifier<RowAttribute> {
    rowAlignItems: VerticalAlign = VerticalAlign.Center;
    applyNormalAttribute(instance: RowAttribute): void {
      instance.alignItems(this.rowAlignItems)     
    }
  }


@Entry
@Component
struct RowVerticalAlign {

  @State rowAlignItems: VerticalAlign = VerticalAlign.Center;
  @State rowVerticalAlignModifier: RowVerticalAlignModifier = new RowVerticalAlignModifier();

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("[VerticalAlign page] state change called: " + JSON.stringify(eventData));

      if (eventData.data.VerticalAlign != null) {         
        console.info("[VerticalAlign page] VerticalAlign change data is " + JSON.stringify(eventData.data.VerticalAlign));
        this.rowAlignItems = eventData.data.VerticalAlign;
        this.rowVerticalAlignModifier.rowAlignItems =  eventData.data.VerticalAlign;
      }
    }
  }

  onPageShow() {

    var stateChangeEvent01 = {
      eventId: 311,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent01, this.stateChangCallBack);


    var stateChangeEvent02 = {
      eventId: 312,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent02, this.stateChangCallBack);

    var stateChangeEvent03 = {
      eventId: 313,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent03, this.stateChangCallBack);
  }

 
  build() {
    Column() {
      Text('Row_VerticalAlign').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space:10 }) {
        Text('1').width(100).height(50).backgroundColor(0xAFEEEE).key('Row_VerticalAlign_Text1')
        Text('2').width(100).height(100).backgroundColor(0x00FFFF).key('Row_VerticalAlign_Text2')
        Text('3').width(100).height(150).backgroundColor(0xAFEEEE).key('Row_VerticalAlign_Text3')
      }
      .key('key_row_VerticalAlign')
      .attributeModifier(this.rowVerticalAlignModifier)
      .width(350)
      .height(200)
      .backgroundColor(0xB05F77)
    }
    .width('100%')
  }
}
