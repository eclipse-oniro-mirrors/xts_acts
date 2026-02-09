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
struct layoutWeight_flexGrow {
  @State addLayoutWeight: number = 0
  messageManager: MessageManager<number> = new MessageManager<number>()
  onPageShow() {
    console.info('layoutWeight_flexGrow onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addLayoutWeight') {
        this.addLayoutWeight = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Column({space:10} as ColumnOptions) {
      Column(){Text('1')}.width(300).height(100).flexGrow(1).layoutWeight(this.addLayoutWeight).backgroundColor(0xF5DEB3).key('Column_layoutWeight_011')
      Column(){Text('2')}.width(300).height(100).flexGrow(2).layoutWeight(this.addLayoutWeight).backgroundColor(0xD2B48C).key('Column_layoutWeight_012')
      Column(){Text('3')}.width(300).height(100).flexGrow(1).layoutWeight(this.addLayoutWeight).backgroundColor(0xF5DEB3).key('Column_layoutWeight_013')
    }.key('Column_layoutWeight_01').width(350).height(470).backgroundColor(0xAFEEEE)
  }
}