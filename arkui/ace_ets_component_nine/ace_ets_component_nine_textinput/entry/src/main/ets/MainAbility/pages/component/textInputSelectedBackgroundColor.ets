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

class MyTextInputSelectedBackgroundColorModifier implements AttributeModifier<TextInputAttribute> {
    selectedBackgroundColor?: ResourceColor = 0xCCCCCC;
    applyNormalAttribute(instance: TextInputAttribute): void {
        instance.selectedBackgroundColor(this.selectedBackgroundColor)
    }
}


@Entry
@Component
struct TextInputFontColor {
    @State mod1: MyTextInputSelectedBackgroundColorModifier = new MyTextInputSelectedBackgroundColorModifier()

  private stateChangCallBack = (eventData) => {
        if (eventData != null) {
            console.info("TextInputFontColor page state change called:" + JSON.stringify(eventData));

            if (eventData.data.selectedBackgroundColor != null) {
                console.info("[TextInputFontColor page] fontColor change data is " + eventData.data.selectedBackgroundColor);

                if ('app.color.color_D90013_red' === eventData.data.selectedBackgroundColor) {
                    this.mod1.selectedBackgroundColor = $r('app.color.color_D90013_red');
                } else {
                    this.mod1.selectedBackgroundColor = eventData.data.selectedBackgroundColor;
                }
            }
        }
    }


    onPageShow() {

        for (let i = 0; i < 2; i++) {
            let eventid = 910 + i;

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
                .attributeModifier(this.mod1)
                .key('key_textinput_selectedbackgroundcolor')
        }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
    }
}