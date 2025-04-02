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
import { MessageManager, Callback } from '../../common/MessageManager';
@Entry
@Component
struct TextExample1 {
  @State textAlign: TextAlign = TextAlign.Center
  @State textOverflow:TextOverflow = TextOverflow.None
  @State maxLines:number = 2
  @State lineHeight:number = 30

  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('text onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'textAlign') {
          this.textAlign = message.value
      }
      if (message.name == 'textOverflow') {
          this.textOverflow = message.value
      }
      if (message.name == 'maxLines') {
          this.maxLines = message.value
      }
      if (message.name == 'lineHeight') {
          this.lineHeight = message.value
      }

    }
    this.messageManager.registerCallback(callback)
  }
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      // 文本水平方向对齐方式设置
      // 单行文本
      Text('textAlign').fontSize(9).fontColor(0xCCCCCC)
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
      Text('TextOverflow+maxLines').fontSize(9).fontColor(0xCCCCCC)
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

      Text('lineHeight').fontSize(9).fontColor(0xCCCCCC)
      Text('This is the text with the line height set. This is the text with the line height set.')
        .fontSize(12).border({ width: 1 }).padding(10)
      Text('This is the text with the line height set. This is the text with the line height set.')
        .fontSize(12).border({ width: 1 }).padding(10)
        .lineHeight(this.lineHeight).key('text5')
    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}