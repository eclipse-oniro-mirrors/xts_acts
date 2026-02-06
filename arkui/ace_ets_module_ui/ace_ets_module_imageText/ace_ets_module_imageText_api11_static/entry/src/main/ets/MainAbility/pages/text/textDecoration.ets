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
  Padding,
  AttributeModifier,
  TextAttribute,
  TextDecorationType,
  ResourceColor,
  $r,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Color
} from '@ohos.arkui.component'
import {
  State,
  AppStorage,
  Observed
} from '@ohos.arkui.stateManagement'
import { MessageManagerBase, CallbackBase,MessageBase } from '../../common/MessageManager2';

@Observed
class TextDecorationModifier  implements AttributeModifier<TextAttribute> {
  textDecorationType: TextDecorationType|undefined  = TextDecorationType.LineThrough;
  textDecorationColor: ResourceColor|undefined = '#FFEEAF';

  applyNormalAttribute(instance: TextAttribute): void {
    instance.decoration({type: this.textDecorationType,color:this.textDecorationColor});
  }
}


@Entry
@Component
struct TextDecoration {

  @State textDecorationType: TextDecorationType|undefined  = TextDecorationType.LineThrough
  @State textDecorationColor: ResourceColor|undefined = '#FFEEAF'
  @State textDecorationModifier: TextDecorationModifier = new TextDecorationModifier()
  messageManagerTextDecorationType:MessageManagerBase<TextDecorationType|undefined> = new MessageManagerBase<TextDecorationType|undefined>()
  messageManagerTextDecorationColor:MessageManagerBase<ResourceColor|undefined> = new MessageManagerBase<ResourceColor|undefined>()

  onPageShow() {
    AppStorage.setOrCreate<MessageManagerBase<TextDecorationType|undefined>>('messageManagerTextDecorationType', this.messageManagerTextDecorationType)
    AppStorage.setOrCreate<MessageManagerBase<ResourceColor|undefined>>('messageManagerTextDecorationColor', this.messageManagerTextDecorationColor)
    let callbackType: CallbackBase<TextDecorationType|undefined> = (message: MessageBase<TextDecorationType|undefined>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'textDecorationType') {
        this.textDecorationType = message.value;
        this.textDecorationModifier.textDecorationType = message.value;
      }
    }
    let callbackColor: CallbackBase<ResourceColor|undefined> = (message: MessageBase<ResourceColor|undefined>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if(message.name == "textDecorationColor"){
        this.textDecorationColor = message.value;
        this.textDecorationModifier.textDecorationColor = message.value;
      }
    }
    this.messageManagerTextDecorationType.registerCallback(callbackType)
    this.messageManagerTextDecorationColor.registerCallback(callbackColor)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      Text('decoration').fontSize(9).fontColor(Color.Red)
      Text('This is the text content with the decoration  ')
        .attributeModifier(this.textDecorationModifier)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('100%')
        .key('key_text_textDecoration')
    }.height(700).width(350).padding({ left: 35, right: 35, top: 35 } as Padding)
  }
}