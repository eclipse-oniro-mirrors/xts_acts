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
import { State, AppStorage  } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from './../../../common/MessageManager';

@Entry
@Component
struct Row_layoutWeight_flexShrink {
  @State addlayoutWeight: number = 0;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('Row_layoutWeight_flexShrink onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>('messageManager', this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addlayoutWeight') {
        this.addlayoutWeight = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Row() {
      Row({ space: 10 } as RowOptions) {
        Row() {
          Text('1')
        }
        .width(100)
        .height(100)
        .flexShrink(1)
        .layoutWeight(this.addlayoutWeight)
        .backgroundColor(0xF5DEB3)
        .key('Row_layoutWeight_flexShrink_011')

        Row() {
          Text('2')
        }
        .width(100)
        .height(100)
        .flexShrink(2)
        .layoutWeight(this.addlayoutWeight)
        .backgroundColor(0xD2B48C)
        .key('Row_layoutWeight_flexShrink_012')

        Row() {
          Text('3')
        }
        .width(100)
        .height(100)
        .flexShrink(2)
        .layoutWeight(this.addlayoutWeight)
        .backgroundColor(0xF5DEB3)
        .key('Row_layoutWeight_flexShrink_013')
      }.key('Row_layoutWeight_flexShrink_01').width(470).height(470).backgroundColor(0xAFEEEE)
    }
  }
}