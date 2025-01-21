
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

class TextAreaPlaceholderFontModifier implements AttributeModifier<TextAreaAttribute> {
  placeholderFontValue: Font = {
    size: "20",
    weight: 900,
    family: 'HarmonyOS Sans',
    style: FontStyle.Italic
  }
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.placeholderFont(this.placeholderFontValue)
  }
}

@Entry
@Component
struct TextAreaPlaceholderFont {
  @State message : string = 'textarea';
  @State textAreaPlaceholderFontModifier: TextAreaPlaceholderFontModifier = new TextAreaPlaceholderFontModifier();
  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("[placeholderFont page] state change called: " + JSON.stringify(eventData));
      if (eventData.data.placeholderFont != null) {
        console.info("[placeholderFont page] placeholderFont change data is " + JSON.stringify(eventData.data.placeholderFont));
        if (eventData.data.placeholderFont == 'app.float.length_df') {
          this.textAreaPlaceholderFontModifier.placeholderFontValue = {size: $r('app.float.length_df')};
        } else {
          this.textAreaPlaceholderFontModifier.placeholderFontValue =  JSON.parse(eventData.data.placeholderFont);
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
          .attributeModifier(this.textAreaPlaceholderFontModifier)
          .key('key_textArea_placeholderFont')
      }.width("100%").justifyContent(FlexAlign.Center)
    }
  }
}