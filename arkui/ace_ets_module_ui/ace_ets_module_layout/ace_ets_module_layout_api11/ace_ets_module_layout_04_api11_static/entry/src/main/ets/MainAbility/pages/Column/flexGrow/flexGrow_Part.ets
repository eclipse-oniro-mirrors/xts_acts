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
import { GlobalContext } from './../../../common/GlobalContext';
import { ValueT } from './../../../common/Value';
import { MessageManager, Callback, Message } from './../../../common/MessageManager';
import { Entry, Component, Column, FlexAlign, ColumnOptions, Text } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct flexGrow_Part {
  @State addflexGrow1: number = 0
  @State addflexGrow2: number = 0
  @State addflexGrow3: number = 0
  messageManager: MessageManager<number> = new MessageManager<number>()
  onPageShow() {
    console.info('flexGrow_Part onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addflexGrow1') {
        this.addflexGrow1 = message.value;
      }else if (message.name == 'addflexGrow2') {
        this.addflexGrow2 = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Column(){
      Column({space:10} as ColumnOptions) {
        Column(){Text('1')}.width(300).height(100).layoutWeight(1).flexGrow(this.addflexGrow1).backgroundColor(0xF5DEB3).key('Column_flexGrow_011')
        Column(){Text('2')}.width(300).height(100).flexGrow(this.addflexGrow2).backgroundColor(0xD2B48C).key('Column_flexGrow_012')
        Column(){Text('3')}.width(300).height(100).flexGrow(this.addflexGrow3).backgroundColor(0xF5DEB3).key('Column_flexGrow_013')
      }.key('Column_flexGrow_01').width(350).height(470).backgroundColor(0xAFEEEE)
      Column({space:10} as ColumnOptions) {
        Column(){Text('1')}.width(300).height(100).backgroundColor(0xF5DEB3).key('Column_flexGrow_021')
        Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('Column_flexGrow_022')
        Column(){Text('3')}.width(300).height(100).backgroundColor(0xF5DEB3).key('Column_flexGrow_023')
      }.key('Column_flexGrow_02').width(350).height(470).backgroundColor(0xAFEEEE)
    }


  }
}