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
import { MessageManager, Callback, Message } from './../../../common/MessageManager';
import { Entry, Component, Column, FlexAlign, ColumnOptions, Text } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Column_WidthHeight_ChangeParent {
  @State testHeight: number = 150
  @State testWidth: number = 450
  messageManager: MessageManager<number> = new MessageManager<number>()
  private content: string = "Column_WidthHeight_ChangeParent Page"

  onPageShow() {
    console.info('Column_WidthHeight_ChangeParent page show called');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'height') {
        this.testHeight = message.value;
      }
      if (message.name == 'width') {
        this.testWidth = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('Column_WidthHeight_ChangeParent page build done called');
  }

  build() {
    Column({space:30} as ColumnOptions) {
      Column(){Text('1')}.width(300).height(50).backgroundColor(0xF5DEB3).key('WidthHeight_Test1')
      Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('WidthHeight_Test2')
      Column(){Text('3')}.width(300).height(150).backgroundColor(0xffa500).key('WidthHeight_Test3')
    }.key('ColumnWidthHeightChange1').width(this.testWidth).height(this.testHeight).backgroundColor(0xAFEEEE)
  }
}