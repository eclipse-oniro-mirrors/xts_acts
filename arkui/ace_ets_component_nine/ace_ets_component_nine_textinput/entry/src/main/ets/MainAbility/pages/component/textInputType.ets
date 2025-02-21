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


class MyTextInputTypeModifier implements AttributeModifier<TextInputAttribute> {
  typeValue: number = 0

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.typeValue === 0) {
      instance.type(InputType.Normal)
    } else if (this.typeValue === 1) {
      instance.type(InputType.Password)
    } else if (this.typeValue === 2) {
      instance.type(InputType.Email)
    } else if (this.typeValue === 3) {
      instance.type(InputType.Number)
    }
  }
}

@Entry
@Component
struct TextInputTypeExample {
  @State mod1: MyTextInputTypeModifier = new MyTextInputTypeModifier()
  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("MyTextInputTypeModifier page state change called:" + JSON.stringify(eventData));

      if (eventData.data.typeValue != null) {
        console.info("[MyTextInputTypeModifier page] typeValue change data is " + eventData.data.typeValue);

        if (eventData.data.typeValue === 0) {
          this.mod1.typeValue = 0;
        } else if (eventData.data.typeValue === 1) {
          this.mod1.typeValue = 1;
        } else if (eventData.data.typeValue === 2) {
          this.mod1.typeValue = 2;
        } else if (eventData.data.typeValue === 3) {
          this.mod1.typeValue = 3;
        }

      }
    }
  }


  onPageShow() {

    for (let i = 0; i < 4; i++) {
      let eventid = 100 + i;

      var stateChangeEvent = {
        eventId: eventid,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    }

  }



  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {

      TextInput({ text: 'default value' })
        .fontSize(12).border({ width: 1 }).padding(10)
        // .type(this.typeValue)
        .attributeModifier(this.mod1)
        .key('key_textinput_type')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}