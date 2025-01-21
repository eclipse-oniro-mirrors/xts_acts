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

class TextInputMaxLengthModifier  implements AttributeModifier<TextInputAttribute> {
    maxLength: number  = 0;
    applyNormalAttribute(instance: TextInputAttribute): void {      
      instance.maxLength(this.maxLength);
    }
  }


@Entry
@Component
struct TextMaxLength {   
   
  @State  maxLength: number  = 0;
  @State textInputMaxLengthModifier: TextInputMaxLengthModifier = new TextInputMaxLengthModifier();

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("textInputMaxLengthModifier page state change called:" + JSON.stringify(eventData));

      if (eventData.data.maxLength != null) {
        console.info("[textInputMaxLengthModifier page] maxLength change data is " + eventData.data.maxLength);
        this.maxLength = eventData.data.maxLength;
        this.textInputMaxLengthModifier.maxLength =  eventData.data.maxLength;
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
 
      // 设置文本的最大输入字符数。
      TextInput({text: 'This is the text with the maxLength set.  '})
        .fontSize(12).border({ width: 1 }).padding(10)        
        .attributeModifier( this.textInputMaxLengthModifier )
        .width('100%')
        .style(TextContentStyle.INLINE)      
        .key('key_textinput_maxlength')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}

 