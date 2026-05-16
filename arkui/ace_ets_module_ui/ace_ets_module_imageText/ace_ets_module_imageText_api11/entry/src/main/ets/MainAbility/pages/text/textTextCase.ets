/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

class TextCaseModifier  implements AttributeModifier<TextAttribute> {
    textCase: TextCase  = TextCase.Normal;
    applyNormalAttribute(instance: TextAttribute): void {
      instance.textCase(this.textCase);
    }
  }

@Entry
@Component
struct TextTextCase {   
   
  @State textCase:TextCase  = TextCase.Normal;
  @State textCaseModifier:TextCaseModifier = new TextCaseModifier();

  private stateChangCallBack = (eventData:events_emitter.EventData) => {
    if (eventData != null) {
      console.info("textCase page state change called:" + JSON.stringify(eventData));

      if (eventData.data?.textCase != null) {
        console.info("[textCase page] textIndent change data is " + eventData.data?.textCase);
        this.textCase = eventData.data?.textCase;
        this.textCaseModifier.textCase =  eventData.data?.textCase;
      }
    }
  }
  

  onPageShow() {
    for( let i = 1; i < 5; i++){
      let eventid = 1030 + i;
      let stateChangeEvent: events_emitter.InnerEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    }
  } 
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) { 
 
      // 设置文本大小写
      Text('This is the text content with textCase.This is the text content with textCase.')
        .fontSize(12).border({ width: 1 }).padding(10)
        .attributeModifier( this.textCaseModifier )
        .width('100%')        
        .key('key_text_textCase')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}

 