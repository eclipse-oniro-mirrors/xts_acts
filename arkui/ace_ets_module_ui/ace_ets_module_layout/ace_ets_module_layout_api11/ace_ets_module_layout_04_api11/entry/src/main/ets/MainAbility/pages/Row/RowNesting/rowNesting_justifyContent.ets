/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

@Entry
@Component
struct rowNesting_justifyContent {
  @State addSpace: string = '10vp';
  messageManager: MessageManager<string> = new MessageManager();

  onPageShow() {
    console.info('rowNesting_justifyContent onPageShow');
    globalThis.value = {
      name: 'messageManager',
      message: this.messageManager
    };
    let callback: Callback<string> = (message: Message<string>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addSpace') {
        this.addSpace = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Row({ space: 30 }) {
      Row({ space: this.addSpace }) {
        Row() {
          Text('1')
        }.width(50).height(50).backgroundColor(0xF5DEB3).key('rowNesting_justifyContent_011')

        Row() {
          Text('2')
        }.width(100).height(100).backgroundColor(0xD2B48C).key('rowNesting_justifyContent_012')

        Row() {
          Text('3')
        }.width(150).height(150).backgroundColor(0xF5DEB3).key('rowNesting_justifyContent_013')
      }
      .key('rowNesting_justifyContent_01')
      .width(400)
      .height(400)
      .backgroundColor(0xAFEEEE)
      .justifyContent(FlexAlign.Start)
    }
    .width(500)
    .height(500)
    .backgroundColor(0xF5DEB3)
    .key('rowNesting_justifyContent_1')
    .justifyContent(FlexAlign.Center)
  }
}