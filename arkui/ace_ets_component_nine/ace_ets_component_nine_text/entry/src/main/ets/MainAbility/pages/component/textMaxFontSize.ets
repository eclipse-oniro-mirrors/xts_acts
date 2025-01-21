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

class TextMaxFontSizeModifier  implements AttributeModifier<TextAttribute> {
    maxFontSize: number | string | Resource = 18;
    applyNormalAttribute(instance: TextAttribute): void {
      instance.maxFontSize(this.maxFontSize)
    }
  }

@Entry
@Component
struct TextMaxFontSize {
      
  @State maxFontSize: number | string | Resource = 18;
  @State textMaxFontSizeModifier: TextMaxFontSizeModifier = new TextMaxFontSizeModifier();

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("textMaxFontSize page state change called:" + JSON.stringify(eventData));
        if (eventData.data.maxFontSize != null) {
        let minSize: number | string | Resource  = eventData.data.maxFontSize;
        console.info("[textMaxFontSize page] maxFontSize change data is " + minSize); 
        if (minSize == 'app.float.maxFontSize') {          
            console.info(' maxFontSize is: from resource' + minSize);
            minSize = $r('app.float.maxFontSize');          
        }
        this.maxFontSize = minSize;
        this.textMaxFontSizeModifier.maxFontSize = minSize;
      }
    }
  }  

  onPageShow() {
    for( let i = 0; i < 5; i++){
      let eventid = 1070 + i;
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
      Text('This is the text content with maxFontSize.This is the text content with maxFontSize.')
        .attributeModifier(this.textMaxFontSizeModifier)
        .border({ width: 1 }).padding(10)
        .width('100%')        
        .key('key_text_maxFontSize')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}

 