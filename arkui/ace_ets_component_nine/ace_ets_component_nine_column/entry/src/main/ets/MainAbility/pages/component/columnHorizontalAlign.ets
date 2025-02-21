
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

class ColumnHorizontalAlignModifier implements AttributeModifier<ColumnAttribute> {
  columnAlignItems: HorizontalAlign = HorizontalAlign.Center;
  applyNormalAttribute(instance: ColumnAttribute): void {
    instance.alignItems(this.columnAlignItems)     
  }
}

@Entry
@Component
struct ColumnHorizontalAlign {
  @State columnHorizontalAlignModifier: ColumnHorizontalAlignModifier = new ColumnHorizontalAlignModifier();
  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("[HorizontalAlign page] state change called: " + JSON.stringify(eventData));
      if (eventData.data.HorizontalAlign != null) {         
        console.info("[HorizontalAlign page] HorizontalAlign change data is " + JSON.stringify(eventData.data.HorizontalAlign));
        this.columnHorizontalAlignModifier.columnAlignItems =  eventData.data.HorizontalAlign;
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
      Text('Column_HorizontalAlign').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Column({ space:10 }) {
        Text('1').width(100).height(50).backgroundColor(0xAFEEEE).key('Row_HorizontalAlign_Text1')
        Text('2').width(100).height(100).backgroundColor(0x00FFFF).key('Row_HorizontalAlign_Text2')
        Text('3').width(100).height(150).backgroundColor(0xAFEEEE).key('Row_HorizontalAlign_Text3')
      }
      .key('key_column_HorizontalAlign')
      .attributeModifier(this.columnHorizontalAlignModifier)
      .width(350)
      .height(400)
      .backgroundColor(0xB05F77)
    }
    .width('100%')
  }
}