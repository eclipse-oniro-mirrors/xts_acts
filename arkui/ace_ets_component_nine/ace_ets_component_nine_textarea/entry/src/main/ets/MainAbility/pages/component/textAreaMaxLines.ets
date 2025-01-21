
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

class TextAreaMaxLinesModifier implements AttributeModifier<TextAreaAttribute> {
  maxLinesValue: number = 3;
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.maxLines(this.maxLinesValue)
  }
}


@Entry
@Component
struct TextAreaMaxLines {
  @State message : string = 'textarea';
  @State textAreaMaxLinesModifier: TextAreaMaxLinesModifier = new TextAreaMaxLinesModifier();
  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("[maxLines page] state change called: " + JSON.stringify(eventData));
      if (eventData.data.maxLines != null) {
        console.info("[maxLines page] maxLines change data is " + JSON.stringify(eventData.data.maxLines));
        this.textAreaMaxLinesModifier.maxLinesValue =  eventData.data.maxLines;
      }
    }
  }


  onPageShow() {

    var stateChangeEvent01 = {
      eventId: 6801,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent01, this.stateChangCallBack);

  }
 
  build() {
    Column() {
      Text(this.message).fontSize(9).fontColor(0xCCCCCC)
      Row() {
        TextArea({ placeholder: 'input your word...' })
          .width(300)
          .margin({top: 50})
          .style(TextContentStyle.INLINE)
          .attributeModifier(this.textAreaMaxLinesModifier)
          .key('key_textArea_maxLines')
      }.width("100%").justifyContent(FlexAlign.Center)
    }
  }
}