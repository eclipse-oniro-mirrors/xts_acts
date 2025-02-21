/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {MessageManager,Callback} from '../utils/MessageManager';

@Entry
@Component
struct RichTextPage {
  @State data: string = '<h1 style="text-align: center;">h1标题</h1>' + '<h1 style="text-align: center;"><i>h1斜体</i></h1>' + '<h1 style="text-align: center;"><u>h1下划线</u></h1>' + '<h2 style="text-align: center;">h2标题</h2>' + '<h3 style="text-align: center;">h3标题</h3>' + '<p style="text-align: center;">p常规</p><hr/>' + '<div style="width: 500px;height: 500px;border: 1px solid;margin: 0auto;">' + '<p style="font-size: 35px;text-align: center;font-weight: bold; color: rgb(24,78,228)">字体大小35px,行高45px</p>' + '<p style="background-color: #e5e5e5;line-height: 45px;font-size: 35px;text-indent: 2em;">' + '<p>这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字</p>';
  @State startRun: string = 'startOff'
  @State completeRun: string = 'completeOff'
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('RichTextPage onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'RichTextData') {
        this.data = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center }) {
      RichText(this.data).key('richText')
        .onStart(() => {
          this.startRun = 'startOn'
          console.info('RichText onStart');
        })
        .onComplete(() => {
          this.completeRun = 'completeOn'
          console.info('RichText onComplete');
        })
      Row(){
        Text(this.startRun).key('text1')
        Text(this.completeRun).key('text2')
      }
    }
  }
}