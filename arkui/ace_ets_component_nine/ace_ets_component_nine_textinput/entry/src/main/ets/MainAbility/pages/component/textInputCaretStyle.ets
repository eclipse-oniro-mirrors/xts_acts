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

class MyTextInputCaretStyleModifier implements AttributeModifier<TextInputAttribute> {
  caretStyleValue: any = { width: 20 }

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.caretStyle(this.caretStyleValue)
  }
}


@Entry
@Component
struct TextInputCaretStyle {
  @State mod1: MyTextInputCaretStyleModifier = new MyTextInputCaretStyleModifier()

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("MyTextInputCaretStyleModifier page state change called:" + JSON.stringify(eventData));

      if (eventData.data.caretStyleValue != null) {
        console.info("[MyTextInputCaretStyleModifier page] CopyOption change data is " + eventData.data.caretStyleValue);
        let objCaretStyle :any = JSON.parse( eventData.data.caretStyleValue );
       if(objCaretStyle.width === "app.float.length_xl"){
        objCaretStyle.width = $r('app.float.length_xl');
       }
        this.mod1.caretStyleValue =  objCaretStyle;
      }
    }
  }
  

  onPageShow() {

    for( let i = 0; i < 4; i++)
    {
      let eventid = 890 + i;

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
        .attributeModifier( this.mod1 )
        .key('key_textinput_caretstyle')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}