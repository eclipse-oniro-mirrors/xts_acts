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
import { MessageManager, Callback,Message } from '../../../common/MessageManager';
import {Entry,Component,Column,Text,HorizontalAlign,ColumnOptions,Padding,Visibility,FlexAlign} from '@ohos.arkui.component'
import {State,AppStorage} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct columnNesting_Space {
  @State addSpace: string = '10vp'
  messageManager:MessageManager<string> = new MessageManager<string>()
  onPageShow() {
    console.info('columnNesting_Space onPageShow');
    AppStorage.setOrCreate<MessageManager<string>>("messageManager",  this.messageManager);
    let callback: Callback<string> = (message: Message<string>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addSpace') {
        this.addSpace = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Column({space:30} as ColumnOptions){
      Column({space:this.addSpace} as ColumnOptions) {
        Column(){Text('1')}.width(300).height(50).backgroundColor(0xF5DEB3).key('columnNesting_Space_011')
        Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('columnNesting_Space_012')
        Column(){Text('3')}.width(300).height(150).backgroundColor(0xF5DEB3).key('columnNesting_Space_013')
      }.key('columnNesting_Space_01').width(350).height(400).backgroundColor(0xAFEEEE)
      Column({space:this.addSpace} as ColumnOptions) {
        Column(){Text('1')}.width(300).height(50).backgroundColor(0xF5DEB3).key('columnNesting_Space_021')
        Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('columnNesting_Space_022')
        Column(){Text('3')}.width(300).height(150).backgroundColor(0xF5DEB3).key('columnNesting_Space_023')
      }.key('columnNesting_Space_02').width(350).height(400).backgroundColor(0xAFEEEE)
    }.width(300).height(1000).backgroundColor(0xF5DEB3).key('columnNesting_Space_1')
  }
}