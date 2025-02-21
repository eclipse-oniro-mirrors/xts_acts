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

class TextInputFontWeightModifier  implements AttributeModifier<TextInputAttribute> {
    fontWeight : number | FontWeight | string = 18;
    applyNormalAttribute(instance: TextInputAttribute): void {
      instance.fontWeight( this.fontWeight );
    }
  }


@Entry
@Component
struct TextInputFontWeight {
   
  @State fontWeight?: number | FontWeight | string = 18;
  @State textInputFontWeightModifier: TextInputFontWeightModifier = new TextInputFontWeightModifier()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("TextInputFontWeight page state change called:" + JSON.stringify(eventData));

      if (eventData.data.fontWeight != null) {
        
        console.info("[TextInputFontWeight page] fontweight change data is " + eventData.data.fontWeight); 

        this.fontWeight = eventData.data.fontWeight;
        this.textInputFontWeightModifier.fontWeight =  eventData.data.fontWeight;
       

      }
    }
  }
  

  onPageShow() {

    for( let i = 0; i < 8; i++)
    {
      let eventid = 940 + i;

      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    }

  }

  
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) { 
 
      TextInput({text: 'This is the text with the fontWeight set. This is the text with the fontWeight set.'})
        . border({ width: 1 }).padding(10) 
        .attributeModifier( this.textInputFontWeightModifier )
        .key('key_textinput_fontweight')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}