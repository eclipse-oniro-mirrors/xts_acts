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

class TextIndentModifier  implements AttributeModifier<TextAttribute> {
  textIndent: number | string = 0;
    applyNormalAttribute(instance: TextAttribute): void {
      instance.textIndent(this.textIndent);
    }
  }

@Entry
@Component
struct TextLineHeight {   
   
  @State textIndent: number | string = 0;
  @State textIndentModifier: TextIndentModifier = new TextIndentModifier();

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("TextLineHeight page state change called:" + JSON.stringify(eventData));

      if (eventData.data.textIndent != null) {
        console.info("[TextLineHeight page] textIndent change data is " + eventData.data.textIndent);
        this.textIndent = eventData.data.textIndent;
        this.textIndentModifier.textIndent =  eventData.data.textIndent;
      }
    }
  }
  

  onPageShow() {
    for( let i = 1; i < 5; i++){
      let eventid = 1010 + i;
      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    }
  }  
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) { 
 
      // 设置首行文本缩进，默认值0。
      Text('This is the text content with textIndent.This is the text content with textIndent.')
        .fontSize(12).border({ width: 1 }).padding(10)
        .textIndent(this.textIndent);
        .width('100%')
        .key('key_text_textIndent')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}

 