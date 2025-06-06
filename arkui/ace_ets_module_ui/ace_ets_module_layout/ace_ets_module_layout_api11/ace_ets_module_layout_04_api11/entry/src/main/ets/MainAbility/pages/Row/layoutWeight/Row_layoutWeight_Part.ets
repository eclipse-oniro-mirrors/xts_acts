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
struct Row_layoutWeight_Part {
  @State layoutWeight1: string = '0';
  @State layoutWeight2: string = '0';
  messageManager: MessageManager<string> = new MessageManager();

  onPageShow() {
    console.info('layoutWeight_Part onPageShow');
    globalThis.value = {
      name: 'messageManager',
      message: this.messageManager
    };
    let callback: Callback<string> = (message: Message<string>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'layoutWeight1') {
        this.layoutWeight1 = message.value;
      } else if (message.name == 'layoutWeight2') {
        this.layoutWeight2 = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Row() {
      Row({ space: 10 }) {
        Row() {
          Text('1')
        }
        .width(100)
        .height(100)
        .layoutWeight(this.layoutWeight1)
        .backgroundColor(0xF5DEB3)
        .key('Row_layoutWeight_Part_011')

        Row() {
          Text('2')
        }
        .width(100)
        .height(100)
        .layoutWeight(this.layoutWeight2)
        .backgroundColor(0xD2B48C)
        .key('Row_layoutWeight_Part_012')

        Row() {
          Text('3')
        }.width(100).height(100).backgroundColor(0xF5DEB3).key('Row_layoutWeight_Part_013')
      }.key('Row_layoutWeight_Part_01').width(450).height(450).backgroundColor(0xAFEEEE)
    }
  }
}