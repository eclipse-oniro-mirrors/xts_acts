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

class MyTextInputShowErrorModifier implements AttributeModifier<TextInputAttribute> {
  txtErrorInfo: string = "value diff"
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.showError(this.txtErrorInfo)
  }
}



@Entry
@Component
struct TextInputShowError {
  @State mod1: MyTextInputShowErrorModifier = new MyTextInputShowErrorModifier()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("MyTextInputShowErrorModifier page state change called:" + JSON.stringify(eventData));

      if (eventData.data.txtErrorInfo != null) {
        console.info("[MyTextInputShowErrorModifier page] ShowError change data is " + eventData.data.txtErrorInfo);
        this.mod1.txtErrorInfo =  eventData.data.txtErrorInfo;
      }
    }
  }
  

  onPageShow() {

    for( let i = 0; i < 1; i++)
    {
      let eventid = 870 + i;

      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    }

  }

  
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) { 
 
      TextInput({text: 'default value'})
        .fontSize(12).border({ width: 1 }).padding(10)
        .attributeModifier( this.mod1 )
        .key('key_textinput_showerror')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}