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

class TextInputEnterKeyTypeModifier  implements AttributeModifier<TextInputAttribute> {
    enterKeyType: EnterKeyType | undefined = undefined;
    applyNormalAttribute(instance: TextInputAttribute): void {
      instance.enterKeyType( this.enterKeyType );
    }
  }

@Entry
@Component
struct TextInputEnterKeyType {   
   
  @State  enterKeyType: EnterKeyType | undefined = undefined;
  @State textInputEnterKeyTypeModifier: TextInputEnterKeyTypeModifier = new TextInputEnterKeyTypeModifier()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("TextInputEnterKeyTypeModifier page state change called:" + JSON.stringify(eventData));

      if (eventData.data.enterKeyType != null) {
        console.info("[TextInputEnterKeyTypeModifier page] enterKeyType change data is " + eventData.data.enterKeyType);
        this.enterKeyType = eventData.data.enterKeyType;
        this.textInputEnterKeyTypeModifier.enterKeyType =  eventData.data.enterKeyType;
      }
    }
  }  

  onPageShow() {

    for( let i = 0; i < 5; i++)
    {
      let eventid = 810 + i;

      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    }
  }  
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) { 
 
      TextInput({text: 'This is the text with the EnterKeyType set. '})
        .fontSize(12).border({ width: 1 }).padding(10)
        .attributeModifier( this.textInputEnterKeyTypeModifier )
        .key('key_textinput_enterkeytype')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}