'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  Component,
  Flex,
  Text,
  TextCase,
  Padding,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  AttributeModifier,
  TextAttribute
} from '@ohos.arkui.component'
import {
  State,
  Observed,
  AppStorage
} from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import { MessageManagerBase, CallbackBase,MessageBase } from '../../common/MessageManager2';

@Observed
class TextCaseModifier  implements AttributeModifier<TextAttribute> {
  textCase: TextCase  = TextCase.Normal;
  applyNormalAttribute(instance: TextAttribute): void {
    instance.textCase(this.textCase);
  }
}

@Entry
@Component
struct TextTextCase {

  @State textCase:TextCase  = TextCase.Normal;
  @State textCaseModifier:TextCaseModifier = new TextCaseModifier();
  messageManagerTextCase:MessageManagerBase<TextCase> = new MessageManagerBase<TextCase>()


  onPageShow() {
    AppStorage.setOrCreate<MessageManagerBase<TextCase>>('messageManagerTextCase', this.messageManagerTextCase)
    let stateChangCallBack: CallbackBase<TextCase> = (message: MessageBase<TextCase>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if(message.name == "textCase"){
        this.textCase = message.value;
        this.textCaseModifier.textCase = message.value;
      }
    }
    this.messageManagerTextCase.registerCallback(stateChangCallBack)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {

      // 设置文本大小写
      Text('This is the text content with textCase.This is the text content with textCase.')
        .fontSize(12).border({ width: 1 }).padding(10)
        .attributeModifier( this.textCaseModifier )
        .width('100%')
        .key('key_text_textCase')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 } as Padding)
  }
}

 