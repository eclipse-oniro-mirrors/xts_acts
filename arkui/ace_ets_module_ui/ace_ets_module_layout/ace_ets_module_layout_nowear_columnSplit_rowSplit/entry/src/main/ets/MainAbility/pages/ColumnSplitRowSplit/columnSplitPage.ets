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
import events_emitter from '@ohos.events.emitter';

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  resizeable: boolean = false;
  divider: ColumnSplitDividerStyle = { startMargin:0, endMargin:0 }
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    instance.resizeable(this.resizeable);
    instance.divider(this.divider);
  }
}

@Entry
@Component
struct ColumnSplitExample  {
  @State message: string = 'ColumnSplit'
  @State mod: ColumnSplitModifier = new ColumnSplitModifier()
  @State resizeable: boolean = false;
  @State divider: ColumnSplitDividerStyle = {startMargin:0, endMargin:0}

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("ColumnSplit page state change called:" + JSON.stringify(eventData));
      if(eventData.data!.typeValue === 0)
      {
        console.info(`ColumnSplit.resizeable=>false`)
        this.mod.resizeable = false
      } else if(eventData.data!.typeValue === 1){
        console.info(`ColumnSplit.divider=>{startMargin:"10px", endMargin:"10px"}`)
        this.mod.divider = {startMargin:"10px", endMargin:"10px"}
      } 
    }
  }

  onPageShow() {
    console.info('ColumnSplit page1 show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 2881,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 2882,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);
  }

  build() {
    Column() {
      ColumnSplit() {
        Text('The secant line can be dragged').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        Text('2').width('100%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        Text('3').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        Text('4').width('100%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        Text('5').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      }
      .width(10)
      .borderWidth(10)
      .attributeModifier(this.mod)
      .key('columnsplitkey')
    }
    .width('100%')
  }
}