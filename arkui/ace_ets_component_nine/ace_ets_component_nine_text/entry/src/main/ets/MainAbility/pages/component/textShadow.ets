
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

class TextShadowModifier  implements AttributeModifier<TextAttribute> { 
  shadowOption: ShadowOptions =  { radius:0 };
  applyNormalAttribute(instance: TextAttribute): void {
    instance.textShadow(this.shadowOption); 
  }
}


@Entry
@Component
struct TextShadow {
 
  @State shadowOption: ShadowOptions =  { radius:0 };
  @State message: string = "hello text";
  @State textShadowModifier: TextShadowModifier = new TextShadowModifier();

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("TextShadow page state change called:" + JSON.stringify(eventData));

      if (eventData.data.textShadow != null) {
        console.info("[TextShadow page] shadowOption change data is " + JSON.stringify(eventData.data.textShadow));

        this.shadowOption  = JSON.parse( eventData.data.textShadow);
        if ( eventData.data.hasOwnProperty('isResource') && eventData.data.isResource === 1)
	      {
		       this.shadowOption.offsetX = $r('app.float.textShadowOffset');
           this.shadowOption.offsetY = $r('app.float.textShadowOffset');
	      }   
        this.textShadowModifier.shadowOption =this.shadowOption;         
      }
    }
  }
  onPageShow() {
    for( let i = 1; i < 25; i++){
      let eventid = 210 + i;
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
        .key('key_Text_TextShadow')
        .height(20)
        .attributeModifier(this.textShadowModifier)
    }
    .width('100%')
  }
}
