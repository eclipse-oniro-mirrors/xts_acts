
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

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  _testType: CopyOptions = CopyOptions.None
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`RichEditor page Test Type ${this._testType}`)
    instance.copyOptions(this._testType);
  }
}

@Entry
@Component
struct RichEditorExample {
  @State _RichEditorModifier: RichEditorModifier = new RichEditorModifier();

  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  private stateChangCallBack = (eventData) => {

    console.info('receive call back')
    if (eventData != null) {
      console.info("RichEditor page state change called:" + JSON.stringify(eventData));
      if (eventData.data.typeValue != null) {
        this._RichEditorModifier._testType = eventData.data.typeValue;      
      }
      else {
        this._RichEditorModifier._testType = 0;    
      }
    }
  }


  onPageShow() {
    var stateChangeEvent01 = {
      eventId: 301,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent01, this.stateChangCallBack);

    var stateChangeEvent02 = {
      eventId: 302,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent02, this.stateChangCallBack);

     var stateChangeEvent03 = {
      eventId: 303,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent03, this.stateChangCallBack);

    var stateChangeEvent04 = {
      eventId: 304,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent04, this.stateChangCallBack);
  }

  build() {
    Column() {
 
      Row() {
        RichEditor(this.options)
        .onReady(() => {
          this.controller.addTextSpan("0123456789")
        })
        .border({ width: 1, color: Color.Red })
        .height(300)
        .width('100%')
        .key('key_RichEditor')
        .attributeModifier(this._RichEditorModifier)          
      }.padding(20)
    }
  }
}