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


class MyTextInputPlaceholderFontModifier implements AttributeModifier<TextInputAttribute> {
font : Font =  {size:16,weight:400 ,family:'Arial, HarmonyOS Sans' ,style:FontStyle.Normal};
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.placeholderFont(this.font)
  }
}


@Entry
@Component
struct TextInputPlaceholderFont {
   
   
  @State mod1: MyTextInputPlaceholderFontModifier = new MyTextInputPlaceholderFontModifier()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("MyTextInputPlaceholderFontModifier page state change called:" + JSON.stringify(eventData));

      if (eventData.data.font != null && eventData.data.font != undefined) {
        console.info("[textCase page] textIndent change data is " + eventData.data.font);

        let fontObj: Font =  JSON.parse( eventData.data.font );
        if (fontObj.family === 'app.string.font_family_regular') {
          fontObj.family = $r('app.string.font_family_regular')
        }
        this.mod1.font =  fontObj;
      }
    }
  }
  

  onPageShow() {

    for( let i = 0; i < 4; i++)
    {
      let eventid = 840 + i;

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
        // .copyOption(this.copyOption)
        .attributeModifier( this.mod1 )
        .key('key_textinput_font')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}