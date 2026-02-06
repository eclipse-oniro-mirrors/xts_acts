'use static';
/*
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

import {
  Entry,
  Component,
  SwiperController,
  Column,
  Text,
  LazyForEach,
  Margin,
  IDataSource,
  DataChangeListener,
  DotIndicator,
  ColumnOptions,
  Swiper,
  TextAlign,
  Color,
  EdgeEffect,
  Visibility,
  ClickEvent,
  SwiperDisplayMode,
  SwiperAnimationEvent,
  Row,
  RowOptions,
  Button,
  Curve,
  SwiperAnimationEvent,
  HorizontalAlign
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message, GlobalMessage } from '../../../common/MessageManager1';

@Entry
@Component
struct SwiperItemSpaceTest {
  @State test_itemspace: number = 0;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('SwiperItemSpace onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>('messageManager', this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'itemspace') {
        this.test_itemspace = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Swiper() {
        Column() {
          Text('1')
        }.width('100%').height('100%').backgroundColor('0xF5DEB3').key('itemspacekey01')

        Column() {
          Text('2')
        }.width('100%').height('100%').backgroundColor('0xD2B48C').key('itemspacekey02')

        Column() {
          Text('3')
        }.width('100%').height('100%').backgroundColor('0xF5DEB3').key('itemspacekey03')

        Column() {
          Text('4')
        }.width('100%').height('100%').backgroundColor('0xD2B48C').key('itemspacekey04')

        Column() {
          Text('5')
        }.width('100%').height('100%').backgroundColor('0xF5DEB3').key('itemspacekey05')

        Column() {
          Text('6')
        }.width('100%').height('100%').backgroundColor('0xD2B48C').key('itemspacekey06')
      }
      .key('itemspacekey')
      .index(0)
      .height(300)
      .width(300)
      .indicator(true)
      .loop(true)
      .itemSpace(this.test_itemspace)
      .displayCount(2)
    }.margin({ top: 5 } as Margin).alignItems(HorizontalAlign.Start)
  }
}