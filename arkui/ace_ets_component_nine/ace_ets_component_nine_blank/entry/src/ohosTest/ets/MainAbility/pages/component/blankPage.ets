
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

class BlankModifier implements AttributeModifier<BlankAttribute> {
  _testType: number = 0
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`Blank page Test Type ${this._testType}`)
    if(this._testType === 0)
    {
      console.info(`Blank init`)
      instance.visibility(Visibility.Visible)
    } else if(this._testType === 1){
      console.info(`Blank.color=>Color.Red`)
      instance.color(Color.Red)
    } else if(this._testType === 2){
      console.info(`Blank.color=>Color.Black`)
      instance.color(Color.Black)
    } else if(this._testType === 3){
      console.info(`Blank.color=>Color.White`)
      instance.color(Color.White)
    }
  }
}

@Entry
@Component
struct BlankExample {  
  @State _BlankModifier: BlankModifier = new BlankModifier()
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("Blank page state change called:" + JSON.stringify(eventData));
      if (eventData.data!.typeValue != null) {
        this._BlankModifier._testType = eventData.data!.typeValue;      
      }
      else {
        this._BlankModifier._testType = 0;    
      }
    }
  }

  onPageShow() {
    console.info('Blank page1 show called');
    let stateChangeEvent01: events_emitter.InnerEvent = {
      eventId: 601,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent01, this.stateChangCallBack);

    let stateChangeEvent02: events_emitter.InnerEvent = {
      eventId: 602,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent02, this.stateChangCallBack);
  }

  build() {
    Column() {
      Row() {
        Text('Bluetooth').fontSize(18)
        Blank().attributeModifier(this._BlankModifier).key('blank')
        Toggle({ type: ToggleType.Switch })
      }.width('100%')
      .backgroundColor(0xFFFFFF)
      .borderRadius(15)
      .padding({ left: 12 })
    }.backgroundColor(0xEFEFEF).padding(20)
  }
}