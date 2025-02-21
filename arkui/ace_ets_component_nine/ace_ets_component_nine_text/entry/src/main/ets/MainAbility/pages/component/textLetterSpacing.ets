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

class TextLetterSpacingModifier  implements AttributeModifier<TextAttribute> {
  letterSpacing: number | string= 0
    applyNormalAttribute(instance: TextAttribute): void {
      instance.letterSpacing(this.letterSpacing);
    }
  }

@Entry
@Component
struct TextLineHeight {   
   
  @State letterSpacing: number | string = 0
  @State textLetterSpacingModifier: TextLetterSpacingModifier = new TextLetterSpacingModifier()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("TextLetterSpacing page state change called:" + JSON.stringify(eventData));

      if (eventData.data.letterSpacing != null) {
        console.info("[TextLetterSpacing page] LetterSpacing change data is " + eventData.data.letterSpacing);
        this.letterSpacing = eventData.data.letterSpacing;
        this.textLetterSpacingModifier.letterSpacing =  eventData.data.letterSpacing;
      }
    }
  }
  

  onPageShow() {
    for( let i = 1; i < 5; i++){
      let eventid = 910 + i;
      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    }
  }  
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) { 
 
      // 文本字符间距
      Text('This is the text content with letterSpacing.This is the text content with letterSpacing.')
        .fontSize(12).border({ width: 1 }).padding(10)
        .attributeModifier( this.textLetterSpacingModifier )
        .width('100%')
        .key('key_text_letterSpacing')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}

 