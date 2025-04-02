/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct Row_flexGrow_Part {
  @State addflexGrow1: number = 0;
  @State addflexGrow2: number = 0;
  @State addflexGrow3: number = 0;
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('Row_flexGrow_Part onPageShow');
    globalThis.value = {
      name: 'messageManager',
      message: this.messageManager
    };
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addflexGrow1') {
        this.addflexGrow1 = message.value;
      } else if (message.name == 'addflexGrow2') {
        this.addflexGrow2 = message.value;
      } else if (message.name == 'addflexGrow3') {
        this.addflexGrow3 = message.value;
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
        .layoutWeight(1)
        .flexGrow(this.addflexGrow1)
        .backgroundColor(0xF5DEB3)
        .key('Row_flexGrow_Part_011')

        Row() {
          Text('2')
        }
        .width(100)
        .height(100)
        .flexGrow(this.addflexGrow2)
        .backgroundColor(0xD2B48C)
        .key('Row_flexGrow_Part_012')

        Row() {
          Text('3')
        }
        .width(100)
        .height(100)
        .flexGrow(this.addflexGrow3)
        .backgroundColor(0xF5DEB3)
        .key('Row_flexGrow_Part_013')
      }.key('Row_flexGrow_Part_01').width(470).height(470).backgroundColor(0xAFEEEE)

      Row({ space: 10 }) {
        Row() {
          Text('1')
        }.width(100).height(100).backgroundColor(0xF5DEB3).key('Row_flexGrow_Part_021')

        Row() {
          Text('2')
        }.width(100).height(100).backgroundColor(0xD2B48C).key('Row_flexGrow_Part_022')

        Row() {
          Text('3')
        }.width(100).height(100).backgroundColor(0xF5DEB3).key('Row_flexGrow_Part_023')
      }.key('Row_flexGrow_Part_02').width(470).height(470).backgroundColor(0xAFEEEE)
    }
  }
}