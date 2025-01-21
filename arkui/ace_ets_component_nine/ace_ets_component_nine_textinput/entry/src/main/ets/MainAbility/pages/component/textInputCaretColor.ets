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
 
class TextInputCaretColorModifier  implements AttributeModifier<TextInputAttribute> {
    color?: ResourceColor = 0xCCCCCC;
    applyNormalAttribute(instance: TextInputAttribute): void {
      instance.caretColor( this.color );
    }
  }

@Entry
@Component
struct TextInputCaretColor {   
   
  @State color?: ResourceColor = 0xCCCCCC;
  @State textInputCaretColorModifier: TextInputCaretColorModifier = new TextInputCaretColorModifier()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("TextInputCaretColor page state change called:" + JSON.stringify(eventData));

      if (eventData.data.color != null) {
        console.info("[TextInputCaretColor page] placeholderColor change data is " + eventData.data.color);

        if ( 'app.color.color_D90013_red' ===  eventData.data.color){
            this.color = $r('app.color.color_D90013_red');
            this.textInputCaretColorModifier.color =  $r('app.color.color_D90013_red');
        } else {
          this.color = eventData.data.color;
          this.textInputCaretColorModifier.color =  eventData.data.color;
        }
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
 
      TextInput({text: 'This is the text with the caretColor set. '})
        .fontSize(12).border({ width: 1 }).padding(10)
    
        .attributeModifier( this.textInputCaretColorModifier )
        .key('key_textinput_caretcolor')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}