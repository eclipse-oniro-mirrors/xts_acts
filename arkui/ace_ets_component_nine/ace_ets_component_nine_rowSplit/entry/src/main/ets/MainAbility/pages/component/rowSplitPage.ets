
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

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  resizeable:  boolean = false;
  applyNormalAttribute(instance: RowSplitAttribute): void {
    instance.resizeable(this.resizeable)
  }
}

@Entry
@Component
struct RowSplitExample {
  @State _RowSplitModifier: RowSplitModifier = new RowSplitModifier();
  @State _resizeable:  boolean = false;
  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("RowSplit page state change called:" + JSON.stringify(eventData));
      if (eventData.data.resizeable != null) {
        this._RowSplitModifier.resizeable = eventData.data.resizeable;
        this._resizeable = eventData.data.resizeable;

        console.info('this. resizeable value is:' + this._resizeable)
      } 
    }
  }


  onPageShow() {

    var stateChangeEvent01 = {
      eventId: 3501,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent01, this.stateChangCallBack);


    var stateChangeEvent02 = {
      eventId: 3502,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent02, this.stateChangCallBack);

  }

   build() {
    Column() {
      Text('The second line can be dragged').fontSize(9).fontColor(0xCCCCCC).width('90%')
      RowSplit() {
        Text('1').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        Text('2').width('10%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        Text('3').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        Text('4').width('10%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        Text('5').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      }
      .attributeModifier(this._RowSplitModifier)  
      .key('rowSplit')
      .width('90%').height(100)
    }.width('100%').margin({ top: 5 })
  }
}
