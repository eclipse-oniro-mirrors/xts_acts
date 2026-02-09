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
import { Entry, Component, Column, Row, RowOptions, Text } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from './../../../common/MessageManager';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct Row_flexBasis_Type {
  @State addflexBasis1: number = 0;
  @State addflexBasis2: string = '0';
  messageManager: MessageManager<number|string> = new MessageManager<number|string>();

  onPageShow() {
    console.info('Row_flexBasis_Type onPageShow');
    AppStorage.setOrCreate<UIContext>('context', this.getUIContext());
    AppStorage.setOrCreate<MessageManager<number|string>>('messageManager', this.messageManager);
    let callback: Callback<number|string> = (message: Message<number|string>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addflexBasis1') {
        this.addflexBasis1 = message.value as number;
      } else if (message.name == 'addflexBasis2') {
        this.addflexBasis2 = message.value as string;
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
        .width(200)
        .height(100)
        .flexBasis(this.addflexBasis1)
        .backgroundColor(0xF5DEB3)
        .key('Row_flexBasis_Type_011')

        Row() {
          Text('2')
        }.width(100).height(100).backgroundColor(0xD2B48C).key('Row_flexBasis_Type_012')

        Row() {
          Text('3')
        }.width(100).height(100).backgroundColor(0xF5DEB3).key('Row_flexBasis_Type_013')
      }.key('Row_flexBasis_Type_01').width(470).height(470).backgroundColor(0xAFEEEE)

      Row({ space: 10 } as RowOptions) {
        Row() {
          Text('1')
        }
        .width(220)
        .height(100)
        .flexBasis(this.addflexBasis2)
        .backgroundColor(0xF5DEB3)
        .key('Row_flexBasis_Type_021')

        Row() {
          Text('2')
        }.width(100).height(100).backgroundColor(0xD2B48C).key('Row_flexBasis_Type_022')

        Row() {
          Text('3')
        }.width(100).height(100).backgroundColor(0xF5DEB3).key('Row_flexBasis_Type_023')
      }.key('Row_flexBasis_Type_02').width(470).height(470).backgroundColor(0xAFEEEE)
    }
  }
}