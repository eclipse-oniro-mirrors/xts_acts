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

class MyTextInputBarStateModifier implements AttributeModifier<TextInputAttribute> {
  barState: BarState = BarState.Auto

  applyNormalAttribute(instance: TextInputAttribute): void {
     instance.barState(this.barState)
  }
}


@Entry
@Component
struct TextInputBarState {
   
   
  @State mod1: MyTextInputBarStateModifier = new MyTextInputBarStateModifier()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("MyTextInputBarStateModifier page state change called:" + JSON.stringify(eventData));

      if (eventData.data.barState != null) {
        this.mod1.barState = eventData.data.barState;
      }
    }
  }
  

  onPageShow() {

    for( let i = 0; i < 4; i++)
    {
      let eventid = 850 + i;

      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    }

  }

  
  
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) { 
 
      TextInput({text: 'default value'})
        .fontSize(12).border({ width: 1 }).padding(10)
        // .copyOption(this.copyOption)
        .attributeModifier( this.mod1 )
        .key('key_textinput_barstate')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}