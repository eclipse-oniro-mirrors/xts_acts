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

class TextLineHeightModifier  implements AttributeModifier<TextAttribute> {
    lineHeight: string | number | Resource = 30
    applyNormalAttribute(instance: TextAttribute): void {
      instance.lineHeight(this.lineHeight);
    }
  }

@Entry
@Component
struct TextLineHeight {   
   
  @State lineHeight: string | number | Resource = 30
  @State textLineHeightModifier: TextLineHeightModifier = new TextLineHeightModifier()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("TextLineHeight page state change called:" + JSON.stringify(eventData));
      if (eventData.data.lineHeight != null) {
                let lineHeightValue: string | number | Resource  =  eventData.data.lineHeight;        
        console.info("[TextLineHeight page] TextLineHeight change data is " + lineHeightValue);
        if (lineHeightValue === 'app.float.textLineHeight'){
          lineHeightValue = $r('app.float.textLineHeight');
        }         
        this.lineHeight = lineHeightValue;
        this.textLineHeightModifier.lineHeight = lineHeightValue;
      }
    }
  }  

  onPageShow() {

    for( let i = 0; i < 5; i++){  
      let eventid = 510 + i;
      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    }
  } 
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) { 
 
      Text('This is the text with the line height set. This is the text with the line height set.')
        .fontSize(12).border({ width: 1 }).padding(10)
        .attributeModifier( this.textLineHeightModifier )
        .key('key_text_lineHeight')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}