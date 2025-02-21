
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

class TextHeightAdaptivePolicyModifier  implements AttributeModifier<TextAttribute> { 
  textHeightAdaptivePolicy: TextHeightAdaptivePolicy =  TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST;
  applyNormalAttribute(instance: TextAttribute): void {
    instance.heightAdaptivePolicy(this.textHeightAdaptivePolicy); 
  }
}


@Entry
@Component
struct TextHeightAdaptivePolicyPage { 
   
  @State textHeightAdaptivePolicy: TextHeightAdaptivePolicy =  TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST;
  @State textHeightAdaptivePolicyModifier: TextHeightAdaptivePolicyModifier = new TextHeightAdaptivePolicyModifier();
  @State message: string = 'This is the setting of TextHeightAdaptivePolicy to Clip text content .' +
  'This is the setting of TextHeightAdaptivePolicy to Clip text content . '

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("TextHeightAdaptivePolicy page state change called:" + JSON.stringify(eventData));

      if (eventData.data.heightAdaptivePolicy != null) {
        console.info("[TextHeightAdaptivePolicy page] TextHeightAdaptivePolicy change data is " + eventData.data.heightAdaptivePolicy);
        this.textHeightAdaptivePolicy = eventData.data.heightAdaptivePolicy;
        this.textHeightAdaptivePolicyModifier.textHeightAdaptivePolicy =  eventData.data.heightAdaptivePolicy;         
      }
    }
  }


  onPageShow() {
    for( let i = 0; i < 5; i++){
      let eventid = 410 + i;
      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    } 
  }

  build() {
    Column() {

      Text(this.message)
        .key('key_Text_TextOverFlow')
        .height(20)
        .minFontSize(10)
        .maxFontSize(20)
        .maxLines(1)
        .attributeModifier(this.textHeightAdaptivePolicyModifier )     
    }
    .width('100%')
  }
}
