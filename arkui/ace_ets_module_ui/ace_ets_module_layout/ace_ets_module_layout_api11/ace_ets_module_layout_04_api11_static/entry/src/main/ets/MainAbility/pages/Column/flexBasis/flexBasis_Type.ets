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
struct flexBasis_Type {
  @State addflexBasis1: number = 0
  @State addflexBasis2: string = '0'
  messageManager:MessageManager<number | string> = new MessageManager<number | string>()
  onPageShow() {
    console.info('flexBasis_Type onPageShow');
    AppStorage.setOrCreate<MessageManager<number | string>>("messageManager",  this.messageManager);
    let callback: Callback<number | string> = (message: Message<number | string>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addflexBasis1') {
        this.addflexBasis1 = message.value as number;
      }else if(message.name == 'addflexBasis2'){
        this.addflexBasis2 = message.value as string;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Column(){
      Column({space:10} as ColumnOptions) {
        Column(){Text('1')}.width(300).height(200).flexBasis(this.addflexBasis1).backgroundColor(0xF5DEB3).key('Column_flexBasis_011')
        Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('Column_flexBasis_012')
        Column(){Text('3')}.width(300).height(100).backgroundColor(0xF5DEB3).key('Column_flexBasis_013')
      }.key('Column_flexBasis_01').width(350).height(470).backgroundColor(0xAFEEEE)
      Column({space:10} as ColumnOptions) {
        Column(){Text('1')}.width(300).height(220).flexBasis(this.addflexBasis2).backgroundColor(0xF5DEB3).key('Column_flexBasis_021')
        Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('Column_flexBasis_022')
        Column(){Text('3')}.width(300).height(100).backgroundColor(0xF5DEB3).key('Column_flexBasis_023')
      }.key('Column_flexBasis_02').width(350).height(470).backgroundColor(0xAFEEEE)
    }
  }
}