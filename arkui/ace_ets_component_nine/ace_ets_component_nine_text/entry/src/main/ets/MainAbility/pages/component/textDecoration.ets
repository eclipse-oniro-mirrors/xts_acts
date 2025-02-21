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

class TextDecorationModifier  implements AttributeModifier<TextAttribute> {
  textDecorationType: TextDecorationType = TextDecorationType.LineThrough;
  textDecorationColor: ResourceColor= '#FFEEAF';

    applyNormalAttribute(instance: TextAttribute): void {
      instance.decoration({type: this.textDecorationType,color:this.textDecorationColor});
    }
}

@Entry
@Component
struct TextDecoration {   
  
  @State textDecorationType: TextDecorationType = TextDecorationType.LineThrough
  @State textDecorationColor: ResourceColor = '#FFEEAF'
  @State textDecorationModifier: TextDecorationModifier = new TextDecorationModifier()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("TextDecoration page state change called:" + JSON.stringify(eventData));
      if (eventData.data.textDecoration != null) {
        console.info("[TextDecoration page] TextDecoration type change data is " + eventData.data.textDecoration);

        let textDecoration =  JSON.parse( eventData.data.textDecoration )        
        if (textDecoration.Color === 'app.color.color_D90013_red') {
          textDecoration.Color = $r('app.color.color_D90013_red')
        }
        this.textDecorationType = textDecoration.type;
        this.textDecorationColor = textDecoration.color;        
        this.textDecorationModifier.textDecorationType = textDecoration.type ;
        this.textDecorationModifier.textDecorationColor = textDecoration.color; 
      }
    }
  }  

  onPageShow() {
    for( let i = 0; i < 5; i++){
      let eventid = 610 + i;
      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    }
  }  
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      Text('decoration').fontSize(9).fontColor(0xCCCCCC)
      Text('This is the text content with the decoration  ')
        .attributeModifier(this.textDecorationModifier)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('100%')
        .key('key_text_textDecoration')
     }.height(700).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}