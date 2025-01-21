
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

class TextAreaPlaceholderColorModifier implements AttributeModifier<TextAreaAttribute> {
  placeholderColorValue: ResourceColor = '#007DFF';
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.placeholderColor(this.placeholderColorValue)
  }
}

@Entry
@Component
struct TextAreaPlaceholderColor {
  @State message : string = 'textarea';
  @State textAreaPlaceholderColorModifier: TextAreaPlaceholderColorModifier = new TextAreaPlaceholderColorModifier();

  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("[placeholderColor page] state change called: " + JSON.stringify(eventData));

      if (eventData.data.placeholderColor != null) {
        console.info("[placeholderColor page] placeholderColor change data is " + JSON.stringify(eventData.data.placeholderColor));
        if (eventData.data.placeholderColor == 'app.color.color_D90013_red') {
          this.textAreaPlaceholderColorModifier.placeholderColorValue = $r('app.color.color_D90013_red');
        } else {
          this.textAreaPlaceholderColorModifier.placeholderColorValue =  eventData.data.placeholderColor;
        }
      }
    }
  }

  onPageShow() {
    var stateChangeEvent01 = {
      eventId: 6801,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent01, this.stateChangCallBack);
    var stateChangeEvent02 = {
      eventId: 6802,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent02, this.stateChangCallBack);
    var stateChangeEvent03 = {
      eventId: 6803,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent03, this.stateChangCallBack);
    var stateChangeEvent04 = {
      eventId: 6804,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent04, this.stateChangCallBack);
  }
 
  build() {
    Column() {
      Text(this.message).fontSize(9).fontColor(0xCCCCCC)
      Row() {
        TextArea({ placeholder: 'input your word...' })
          .width(300)
          .margin({top: 50})
          .attributeModifier(this.textAreaPlaceholderColorModifier)
          .key('key_textArea_placeholderColor')
      }.width("100%").justifyContent(FlexAlign.Center)
    }
  }
}