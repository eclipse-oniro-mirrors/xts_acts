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
  TextAlign,
  TextOverflow,
  Padding,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  TextOverflow,
  Resource
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import { MessageManagerBase, CallbackBase,MessageBase } from '../../common/MessageManager2';
import { AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextExample1 {
  @State textAlign: TextAlign = TextAlign.Center
  @State textOverflow:TextOverflow = TextOverflow.None
  @State maxLines:int = 2
  @State lineHeight: Double|String|Resource|undefined = 30 as Double|String|Resource|undefined

  messageManagerBase:MessageManagerBase<number|int|string> = new MessageManagerBase<number|int|string>()
  messageManagerTextAlign:MessageManagerBase<TextAlign> = new MessageManagerBase<TextAlign>()
  messageManagerTextOverflow:MessageManagerBase<TextOverflow> = new MessageManagerBase<TextOverflow>()

  onPageShow() {
    console.info('text onPageShow')
    AppStorage.setOrCreate<MessageManagerBase<number|int|string>>('messageManager', this.messageManagerBase)
    AppStorage.setOrCreate<MessageManagerBase<TextAlign>>('messageManagerTextAlign', this.messageManagerTextAlign)
    AppStorage.setOrCreate<MessageManagerBase<TextOverflow>>('messageManagerTextOverflow', this.messageManagerTextOverflow)

    let callback: CallbackBase<number|int|string> = (message: MessageBase<number|int|string>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'maxLines') {
          this.maxLines = message.value as int
      }
      if (message.name == 'lineHeightNumber') {
          this.lineHeight = message.value as Double
      }
      if (message.name == 'lineHeightStr') {
        this.lineHeight = message.value as string
      }
      if (message.name == 'textAlign') {
        this.textAlign = message.value as TextAlign
      }
      if (message.name == 'textOverflow') {
        this.textOverflow = message.value as TextOverflow
      }
    }
    let callbackTextAlign: CallbackBase<TextAlign> = (message: MessageBase<TextAlign>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'textAlign') {
        this.textAlign = message.value
        console.log("============================= " + this.textAlign)
      }
    }
    let callbackTextOverflow: CallbackBase<TextOverflow> = (message: MessageBase<TextOverflow>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'textOverflow') {
          this.textOverflow = message.value
      }
    }
    this.messageManagerBase.registerCallback(callback)
    this.messageManagerTextAlign.registerCallback(callbackTextAlign)
    this.messageManagerTextOverflow.registerCallback(callbackTextOverflow)
  }
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      // 文本水平方向对齐方式设置
      // 单行文本
      Text('textAlign').fontSize(9).fontColor('0xCCCCCC')
      Text('TextAlign set to Center.')
        .textAlign(this.textAlign)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('100%')
        .key('text1')
      Text('TextAlign set to Start.')
        .textAlign(TextAlign.Start)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('100%')
      Text('TextAlign set to End.')
        .textAlign(TextAlign.End)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('100%')

      // 多行文本
      Text('This is the text content with textAlign set to Center.')
        .textAlign(this.textAlign)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('100%').key('text2')
      Text('This is the text content with textAlign set to Start.')
        .textAlign(TextAlign.Start)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('100%')
      Text('This is the text content with textAlign set to End.')
        .textAlign(TextAlign.End)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('100%')


      // 文本超长时显示方式
      Text('TextOverflow+maxLines').fontSize(9).fontColor('0xCCCCCC')
      // 超出maxLines截断内容展示
      Text('This is the setting of textOverflow to Clip text content This is the setting of textOverflow to None text content. This is the setting of textOverflow to Clip text content This is the setting of textOverflow to None text content.')
        .textOverflow({ overflow: this.textOverflow})
        .maxLines(this.maxLines)
        .fontSize(12)
        .border({ width: 1 })
        .maxFontSize(18)
        .minFontSize(2)
        .padding(10).key('text4')

      // 超出maxLines展示省略号
      Text('This is set textOverflow to Ellipsis text content This is set textOverflow to Ellipsis text content.'.split('')
        .join('\u200B'))
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)

      Text('lineHeight').fontSize(9).fontColor('0xCCCCCC')
      Text('This is the text with the line height set. This is the text with the line height set.')
        .fontSize(12).border({ width: 1 }).padding(10)
      Text('This is the text with the line height set. This is the text with the line height set.')
        .fontSize(12).border({ width: 1 }).padding(10)
        .lineHeight(this.lineHeight).key('text5')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 } as Padding)
  }
}