'use static';
// /**
//  * Copyright (c) 2025 Huawei Device Co., Ltd.
//  * Licensed under the Apache License, Version 2.0 (the "License");
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  *
//  *     http://www.apache.org/licenses/LICENSE-2.0
//  *
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an "AS IS" BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  */
import {
  Entry,
  Component,
  Column,
  Text,
  Color,
  FontStyle,
  TextAlign
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import { MessageManagerBase, CallbackBase, MessageBase } from '../../common/MessageManager2';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct TextStyle1 {
  @State fontColor: Color = Color.Red;
  @State fontSize: number = 20;
  @State fontStyle: FontStyle = FontStyle.Italic;
  @State fontWeight: int = 700;
  @State fontFamily: string = 'sans-serif';

  build() {
    Column() {
      Text('default text').fontSize(10).height('10%').textAlign(TextAlign.Center)

      Text(`text font color ${this.fontColor}`)
        .fontColor('error')
        .fontSize(10)
        .key('fontColor').height('10%').textAlign(TextAlign.Center)

      Text(`text font size ${this.fontSize}`)
        .fontSize('error')
        .key('fontSize').height('10%').textAlign(TextAlign.Center)

      Text(`text font style ${this.fontStyle}`)
        .fontStyle(this.fontStyle)
        .fontSize(10)
        .key('fontStyle').height('10%').textAlign(TextAlign.Center)

      Text(`text fontWeight ${this.fontWeight}`)
        .fontWeight(this.fontWeight)
        .fontSize(10)
        .key('fontWeight').height('10%').textAlign(TextAlign.Center)

      Text(`text fontFamily ${this.fontFamily}`)
        .fontFamily(this.fontFamily)
        .fontSize(10)
        .key('fontFamily').height('10%').textAlign(TextAlign.Center)

      Text('red 20 Italic bold cursive text')
        .fontColor(Color.Red)
        .fontSize(10)
        .fontStyle(FontStyle.Italic)
        .fontWeight(700)
        .fontFamily('cursive')
        .textAlign(TextAlign.Center)
        .width('90%').height('10%').textAlign(TextAlign.Center)

      Text('Orange 18 Normal source-sans-pro text')
        .fontColor(Color.Orange)
        .fontSize(10)
        .fontStyle(FontStyle.Normal)
        .fontWeight(400)
        .fontFamily('source-sans-pro,cursive,sans-serif')
        .height('10%').textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
  messageManagerFontStyle: MessageManagerBase<FontStyle> = new MessageManagerBase<FontStyle>()
  messageManagerColor: MessageManagerBase<Color> = new MessageManagerBase<Color>()
  messageManager: MessageManagerBase<number|int|string> = new MessageManagerBase<number|int|string>()


  onPageShow() {
    AppStorage.setOrCreate<MessageManagerBase<FontStyle>>('messageManagerFontStyle', this.messageManagerFontStyle);
    AppStorage.setOrCreate<MessageManagerBase<Color>>('messageManagerColor', this.messageManagerColor);
    AppStorage.setOrCreate<MessageManagerBase<number|int|string>>('messageManager', this.messageManager);
    let callbackFontStyle: CallbackBase<FontStyle> = (message: MessageBase<FontStyle>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'fontStyle') {
        this.fontStyle = message.value
      }
    }
    let callbackColor: CallbackBase<Color> = (message: MessageBase<Color>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'Color') {
        this.fontColor = message.value
      }
    }
    let callback: CallbackBase<number|int|string> = (message: MessageBase<number|int|string>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'fontSize') {
        this.fontSize = message.value as number
      }
      if (message.name == 'fontWeight') {
        this.fontWeight = message.value as int
        console.log("================================== this.fontWeight" + this.fontWeight)
      }
      if (message.name == 'fontFamily') {
        this.fontFamily = message.value as string
      }
    }
    this.messageManagerFontStyle.registerCallback(callbackFontStyle)
    this.messageManagerColor.registerCallback(callbackColor)
    this.messageManager.registerCallback(callback)
  }
}