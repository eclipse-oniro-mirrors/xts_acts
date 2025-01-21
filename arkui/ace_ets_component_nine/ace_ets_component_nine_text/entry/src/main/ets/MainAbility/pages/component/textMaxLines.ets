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

class TextMaxLinesModifier  implements AttributeModifier<TextAttribute> {
    maxLines: number  = 0;
    applyNormalAttribute(instance: TextAttribute): void {

      console.info('maxlines modifier is: ' +this.maxLines)
      instance.maxLines(this.maxLines);
    }
  }

@Entry
@Component
struct TextMaxLines {   
   
  @State maxLines: number  = 0;
  @State textMaxLinesModifier: TextMaxLinesModifier = new TextMaxLinesModifier();

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("maxLines page state change called:" + JSON.stringify(eventData));

      if (eventData.data.maxLines != null) {
        console.info("[maxLines page] textIndent change data is " + eventData.data.maxLines);
        this.maxLines = eventData.data.maxLines;
        this.textMaxLinesModifier.maxLines =  eventData.data.maxLines;
      }
    }
  }
  

  onPageShow() {
    for( let i = 0; i < 5; i++){
      let eventid = 1020 + i;
      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    }
  }  
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) { 
 
      // 设置文本的最大行数。。
      Text('This is the text content with maxLines.This is the text content with maxLines.')
        .fontSize(12).border({ width: 1 }).padding(10)
        .attributeModifier( this.textMaxLinesModifier)
        .width('100%')
        .textOverflow({ overflow: TextOverflow.Clip })        
        .key('key_text_maxLines')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}

 