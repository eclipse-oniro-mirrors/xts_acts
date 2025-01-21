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

class TextMinFontSizeModifier  implements AttributeModifier<TextAttribute> {
    minFontSize: number | string | Resource = 18;
    applyNormalAttribute(instance: TextAttribute): void {
      instance.minFontSize(this.minFontSize)
    }
  }

@Entry
@Component
struct TextMinFontSize {   
   
  @State minFontSize: number | string | Resource = 18;
  @State textMinFontSizeModifier: TextMinFontSizeModifier = new TextMinFontSizeModifier();

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("textMinFontSize page state change called:" + JSON.stringify(eventData));

      if (eventData.data.minFontSize != null) {
        let minSize: number | string | Resource  = eventData.data.minFontSize;
        console.info("[TextMinFontSize page] minFontSize change data is " + minSize); 

        if (minSize == 'app.float.minFontSize') {          
            console.info(' minFontSize is: from resource' + minSize);
            minSize = $r('app.float.minFontSize');          
        }
        this.minFontSize = minSize;
        this.textMinFontSizeModifier.minFontSize =  minSize;
      }
    }
  }
  

  onPageShow() {
    for( let i = 0; i < 5; i++){
      let eventid = 1080 + i;
      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    }
  }  
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) { 
 
      // 设置字体列表。
      Text('This is the text content with minFontSize.This is the text content with minFontSize.')
        .attributeModifier(this.textMinFontSizeModifier)
        .border({ width: 1 }).padding(10)         
        .width('100%')        
        .key('key_text_minFontSize')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}

 