// @ts-nocheck
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

class DividerModifier implements AttributeModifier<DividerAttribute> {
  color: ResourceColor = "#FF000000";
  lineCap: LineCapStyle = LineCapStyle.Butt
  strokeWidth: number = 1
  vertical: boolean = false
  applyNormalAttribute(instance: DividerAttribute): void {
    instance.color(this.color);
    instance.lineCap(this.lineCap);
    instance.strokeWidth(this.strokeWidth);
    instance.vertical(this.vertical);
  }
}

@Entry
@Component
struct DividerExample  {
  @State message: string = 'divider'
  @State mod: DividerModifier = new DividerModifier()
  @State color: ResourceColor = "#FF000000";
  @State lineCap: LineCapStyle = LineCapStyle.Butt
  @State strokeWidth: number = 1
  @State vertical: boolean = false
  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("Divider page state change called:" + JSON.stringify(eventData));
      if(eventData.data.typeValue === 0)
      {
        console.info(`Divider.Color=>Color.Black`)
        this.mod.color(Color.Black)
         //old test
        this.color = Color.Black;
      } else if(eventData.data.typeValue === 1){
        console.info(`Divider.Color=>#FF0000FF`)
        this.mod.color("#FF0000FF")
           //old test
        this.color = "#FF0000FF";
      } else if(eventData.data.typeValue === 2){
        console.info(`Divider.Color=>#ff0000`)
        this.mod.color("#ff0000")
      } else if(eventData.data.typeValue === 3){
        console.info(`Divider.color=>rgb(255, 100, 255)`)
        this.mod.color("rgb(255, 100, 255)")
      } else if(eventData.data.typeValue === 4){
        console.info(`Divider.color=>rgba(255, 100, 255, 0.5)`)
        this.mod.color("rgba(255, 100, 255, 0.5)")
      } else if(eventData.data.typeValue === 5){
        console.info(`Divider.lineCap=>LineCapStyle.Butt`)
        this.mod.lineCap(LineCapStyle.Butt)
      } else if(eventData.data.typeValue === 6){
        console.info(`Divider.lineCap=>LineCapStyle.Round`)
        this.mod.lineCap(LineCapStyle.Round)
      } else if(eventData.data.typeValue === 7){
        console.info(`Divider.lineCap=>LineCapStyle.Square`)
        this.mod.lineCap(100)
      } else if(eventData.data.typeValue === 8){
        console.info(`Divider.strokeWidth=>2`)
        this.mod.strokeWidth(2)
      } else if(eventData.data.typeValue === 9){
        console.info(`Divider.strokeWidth=>10px`)
        this.mod.strokeWidth("10px")
      } else if(eventData.data.typeValue === 10){
        console.info(`Divider.vertical=>true`)
        this.mod.vertical(true)
      } else if(eventData.data.typeValue === 11){
        console.info(`Divider.vertical=>false`)
        this.mod.vertical(false)
      }
    }
  }

  onPageShow() {
    console.info('divider page1 show called');
    var stateChangeEvent = {
      eventId: 8501,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    var stateChangeEvent2 = {
      eventId: 8502,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);
    var stateChangeEvent3 = {
      eventId: 8503,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent4, this.stateChangCallBack);
    var stateChangeEvent4 = {
      eventId: 8504,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent5, this.stateChangCallBack);
    var stateChangeEvent5 = {
      eventId: 8505,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent6, this.stateChangCallBack);
    var stateChangeEvent6 = {
      eventId: 8506,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent7, this.stateChangCallBack);
    var stateChangeEvent7 = {
      eventId: 8507,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent8, this.stateChangCallBack);
    var stateChangeEvent8 = {
      eventId: 8508,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent9, this.stateChangCallBack);
    var stateChangeEvent9 = {
      eventId: 8509,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent10, this.stateChangCallBack);
    var stateChangeEvent10 = {
      eventId: 8510,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent5, this.stateChangCallBack);
  }
  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(9).width('90%').fontColor(0xCCCCCC)
        Divider()
        .attributeModifier(this.mod)
        .key('dividerkey')
      }
    }
  }
}