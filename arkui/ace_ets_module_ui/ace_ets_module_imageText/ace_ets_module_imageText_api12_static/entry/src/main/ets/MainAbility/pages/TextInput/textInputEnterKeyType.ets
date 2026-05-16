'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  Entry, Component,
  Column, Text, TextInput, BorderOptions, Padding,
  AttributeModifier, TextInputAttribute, EnterKeyType,
  Flex, FlexDirection, ItemAlign, FlexAlign
} from '@ohos.arkui.component'
import { State,StoragePropRef,Observed } from '@ohos.arkui.stateManagement'
import { RecordData } from '@ohos.base';
@Observed
class TextInputEnterKeyTypeModifier  implements AttributeModifier<TextInputAttribute> {
  enterKeyType: EnterKeyType = EnterKeyType.Go;
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.enterKeyType( this.enterKeyType );
  }
}

@Entry
@Component
struct TextInputEnterKeyType {

  @State textInputEnterKeyTypeModifier: TextInputEnterKeyTypeModifier = new TextInputEnterKeyTypeModifier()

  private stateChangCallBack : (eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    if (eventData != null) {
      let eventD = eventData.data as Record<String,RecordData>
      if (eventD!['enterKeyType'] != null) {
        console.info("[TextInputEnterKeyTypeModifier page] enterKeyType change data is " + eventD!['enterKeyType']);
        this.textInputEnterKeyTypeModifier.enterKeyType =  eventD!['enterKeyType'] as EnterKeyType;
      }
    }
  }

  onPageShow() {

    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 810,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {

      TextInput({text: 'This is the text with the EnterKeyType set. '})
        .fontSize(12).border({ width: 1 } as BorderOptions).padding(10)
        .attributeModifier( this.textInputEnterKeyTypeModifier )
        .key('key_textinput_enterkeytype')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 } as Padding)
  }
}