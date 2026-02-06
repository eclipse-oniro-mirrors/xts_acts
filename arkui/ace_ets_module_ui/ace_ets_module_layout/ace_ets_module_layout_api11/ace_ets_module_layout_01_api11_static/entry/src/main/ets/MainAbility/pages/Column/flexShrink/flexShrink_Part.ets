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
import { GlobalContext } from '../../../common/GlobalContext';
import { Value1 } from '../../../common/Value';
import { MessageManager, Callback,Message } from '../../../common/MessageManager';
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, Image,ImageFit, Scroller,
  Scroll,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  EdgeEffect,ColumnOptions } from '@ohos.arkui.component';
import {State,

  AppStorage} from '@ohos.arkui.stateManagement';

type MessageData = number

@Entry
@Component
struct flexShrink_Part {
  @State addflexShrink: number = 0
  messageManager:MessageManager<number> = new MessageManager<number>()
  onPageShow() {
    console.info('flexShrink_Part onPageShow');
    let value: Value1<MessageData> = {
      name: 'messageManager', message: this.messageManager
    }
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager)
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addflexShrink') {
        this.addflexShrink = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Column({space:10} as ColumnOptions) {
      Column(){Text('1')}.width(300).height(300).backgroundColor(0xF5DEB3).key('Column_flexShrink_011')
      Column(){Text('2')}.width(300).height(100).flexShrink(this.addflexShrink).backgroundColor(0xD2B48C).key('Column_flexShrink_012')
      Column(){Text('3')}.width(300).height(100).flexShrink(this.addflexShrink).backgroundColor(0xF5DEB3).key('Column_flexShrink_013')
    }.key('Column_flexShrink_01').width(350).height(450).backgroundColor(0xAFEEEE)

  }
}