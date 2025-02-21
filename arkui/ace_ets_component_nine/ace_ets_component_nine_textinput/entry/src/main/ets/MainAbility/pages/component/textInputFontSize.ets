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

class TextInputFontSizeModifier  implements AttributeModifier<TextInputAttribute> {
    fontSize?: Length = 18;
    applyNormalAttribute(instance: TextInputAttribute): void {
      instance.fontSize( this.fontSize );
    }
  }


@Entry
@Component
struct TextInputFontSize {
   
   
  @State fontSize?: Length = 18;
  @State textInputFontSizeModifier: TextInputFontSizeModifier = new TextInputFontSizeModifier()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("TextInputFontSize page state change called:" + JSON.stringify(eventData));

      if (eventData.data.fontSize != null) {
        let fSize: Length  = eventData.data.fontSize;
        if (fSize === 'app.float.font_size') {
            fSize = $r('app.float.font_size');
        }
        console.info("[TextInputFontSize page] fontSize change data is " + fSize); 

        this.fontSize = fSize;
        this.textInputFontSizeModifier.fontSize =  fSize;
       

      }
    }
  }
  

  onPageShow() {

    for( let i = 0; i < 5; i++)
    {
      let eventid = 920 + i;

      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    }

  }

  
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) { 
 
      TextInput({text: 'This is the text with the fontSize set. This is the text with the fontSize set.'})
        . border({ width: 1 }).padding(10) 
        .attributeModifier( this.textInputFontSizeModifier )
        .key('key_textinput_fontsize')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}