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
import { Entry, Component, Row, Text, RowOptions } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from './../../../common/MessageManager';

@Entry
@Component
struct Row_Space_Default {
  @State addSpace1: number = 0;
  @State addSpace2: string = '0';
  messageManager: MessageManager<number|string|undefined|null> = new MessageManager<number|string|undefined|null>();

  onPageShow() {
    console.info('Row_Space_Default onPageShow');
    AppStorage.setOrCreate<MessageManager<number|string|undefined|null>>('messageManager', this.messageManager);
    let callback: Callback<number|string|undefined|null> = (message: Message<number|string|undefined|null>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addSpace1' && message.value != undefined && message.value != null) {
        this.addSpace1 = message.value as number;
      } else if (message.name == 'addSpace2') {
        this.addSpace2 = message.value as string;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Row() {
      Row({ space: this.addSpace1 } as RowOptions) {
        Row() {
          Text('1')
        }.width(50).height(50).backgroundColor(0xF5DEB3).key('Row_Space_Default_011')

        Row() {
          Text('2')
        }.width(100).height(100).backgroundColor(0xD2B48C).key('Row_Space_Default_012')

        Row() {
          Text('3')
        }.width(150).height(150).backgroundColor(0xF5DEB3).key('Row_Space_Default_013')
      }.key('Row_Space_Default_01').width(400).height(400).backgroundColor(0xAFEEEE)

      Row({ space: this.addSpace2 } as RowOptions) {
        Row() {
          Text('1')
        }.width(50).height(50).backgroundColor(0xF5DEB3).key('Row_Space_Default_021')

        Row() {
          Text('2')
        }.width(100).height(100).backgroundColor(0xD2B48C).key('Row_Space_Default_022')

        Row() {
          Text('3')
        }.width(150).height(150).backgroundColor(0xF5DEB3).key('Row_Space_Default_023')
      }.key('Row_Space_Default_02').width(400).height(400).backgroundColor(0xAFEEEE)

    }

  }
}