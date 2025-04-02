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

class TextFontModifier  implements AttributeModifier<TextAttribute> {
    font: Font = {size:16,weight:400 ,family:'Arial, HarmonyOS Sans' ,style:FontStyle.Normal};
    applyNormalAttribute(instance: TextAttribute): void {
      instance.font(this.font);
    }
  }

@Entry
@Component
struct TextFont {   
   
  @State font: Font = {size:16,weight:400 ,family:'Arial, HarmonyOS Sans' ,style:FontStyle.Normal};
  @State textFontModifier: TextFontModifier = new TextFontModifier();

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("textCase page state change called:" + JSON.stringify(eventData));

      if (eventData.data.font != null) {
        console.info("[textCase page] textIndent change data is " + eventData.data.font);

        let fontObj: Font =  JSON.parse( eventData.data.font );
        if (fontObj.family === 'app.string.font_family_regular') {
          fontObj.family = $r('app.string.font_family_regular')
        }
        this.font = fontObj;
        this.textFontModifier.font =  fontObj;
      }
    }
  }  

  onPageShow() {
    for( let i = 0; i < 5; i++){
      let eventid = 1050 + i;
      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    }
  }  
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) { 
 
      // 设置文本样式。
      Text('This is the text content with font.This is the text content with font.')
      .font({size:16,weight:400 ,family:'Arial, HarmonyOS Sans' ,style:FontStyle.Normal})
        //.font(this.font)
        .border({ width: 1 }).padding(10) 
        .attributeModifier( this.textFontModifier )
        .width('100%')        
        .key('key_text_font')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}

 