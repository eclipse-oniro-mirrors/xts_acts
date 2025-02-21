/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { MessageManager, Callback, Message } from '../../../common/MessageManager';

@Entry
@Component
struct Column_Margin_ChangeParent {
  @State testMargin: number = 0
  messageManager: MessageManager<number> = new MessageManager()
  private content: string = "Column_Margin_ChangeParent Page"
  onPageShow() {
    console.info('Column_Margin_ChangeParent page show called');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'margin') {
        this.testMargin = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('Column_Margin_ChangeParent page build done called');
  }

  build() {
    Column({space:30}) {
      Column(){Text('1')}.width(300).height(50).backgroundColor(0xF5DEB3).key('Margin_Test1')
      Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('Margin_Test2')
      Column(){Text('3')}.width(300).height(150).backgroundColor(0xffa500).key('Margin_Test3')
    }.key('ColumnMarginChange1').width(350).height(400).backgroundColor(0xAFEEEE).margin(this.testMargin)
  }
}