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

class TextInputFontColorModifier  implements AttributeModifier<TextInputAttribute> {
    fontColor?: ResourceColor = 0xCCCCCC;
    applyNormalAttribute(instance: TextInputAttribute): void {
      instance.fontColor( this.fontColor );
    }
  }


@Entry
@Component
struct TextInputFontColor {
   
   
  @State fontColor?: ResourceColor = 0xCCCCCC;
  @State textInputFontColorModifier: TextInputFontColorModifier = new TextInputFontColorModifier()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("TextInputFontColor page state change called:" + JSON.stringify(eventData));

      if (eventData.data.fontColor != null) {
        console.info("[TextInputFontColor page] fontColor change data is " + eventData.data.fontColor);

        if ( 'app.color.color_D90013_red' ===  eventData.data.fontColor){
            this.fontColor = $r('app.color.color_D90013_red');
            this.textInputFontColorModifier.fontColor =  $r('app.color.color_D90013_red');
        } else {
          this.fontColor = eventData.data.fontColor;
          this.textInputFontColorModifier.fontColor =  eventData.data.fontColor;
        }
       
       

      }
    }
  }
  

  onPageShow() {

    for( let i = 0; i < 2; i++)
    {
      let eventid =900 + i;

      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    }

  }
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) { 
 
      TextInput({text: 'This is the text with the fontColor set. This is the text with the fontColor set.'})
        .fontSize(12).border({ width: 1 }).padding(10)
   
        // .fontColor(this.copyOption)
        .attributeModifier( this.textInputFontColorModifier )
        .key('key_textinput_fontcolor')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}