
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

class TextAreaSelectionMenuHiddenModifier implements AttributeModifier<TextAreaAttribute> {
  selectionMenuHiddenValue: boolean = false;
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.selectionMenuHidden(this.selectionMenuHiddenValue)
  }
}

@Entry
@Component
struct TextAreaSelectionMenuHidden {
  @State message : string = 'textarea';
  @State textAreaSelectionMenuHiddenModifier: TextAreaSelectionMenuHiddenModifier = new TextAreaSelectionMenuHiddenModifier();
  private stateChangCallBack = (eventData) => {
    if (eventData != null) {
      console.info("[selectionMenuHidden page] state change called: " + JSON.stringify(eventData));
      if (eventData.data.selectionMenuHidden != null) {         
        console.info("[selectionMenuHidden page] selectionMenuHidden change data is " + JSON.stringify(eventData.data.selectionMenuHidden));
        this.textAreaSelectionMenuHiddenModifier.selectionMenuHiddenValue =  eventData.data.selectionMenuHidden;
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
  }
 
  build() {
    Column() {
      Text(this.message).fontSize(9).fontColor(0xCCCCCC)
      Row() {
        TextArea({ placeholder: 'input your word...' })
          .width(300)
          .margin({top: 50})
          .attributeModifier(this.textAreaSelectionMenuHiddenModifier)
          .key('key_textArea_selectionMenuHidden')
      }.width("100%").justifyContent(FlexAlign.Center)
    }
  }
}